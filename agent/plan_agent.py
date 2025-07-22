import json
import re
from typing import Any, Dict, Optional, List, Tuple
from agent.agent_base import AgentBase
from tool.runner import run_tool_mcp
from utils import load_prompt

class PlanAgent(AgentBase):
    """
    PlanAgent:
      - 按照固定顺序调用必要的静态分析工具
      - 使用MCP方式调用工具
      - 融合工具输出生成统一的代码分析结果
      - 根据分析结果规划后续expert-judge工作
    """

    # === 固定原子性违规模式 ===
    known_patterns = [
        "<Read, Write, Write>",
        "<Read, Write, Read>",
        "<Write, Write, Read>",
        "<Write, Read, Write>"
    ]

    # 工具配置
    TOOL_CONFIG = {
        "Code_Extractor": {
            "path": "./tool/Code_Extractor",
            "output_suffix": "-snippets.json",
            "output_key": "Code_Extractor",
            "required": False,
            "description": "提取相关代码片段进行分析"
        },
        "Read_Write_Analyzer": {
            "path": "./tool/Read_Write_Analyzer",
            "output_suffix": "-analysis.json",
            "output_key": "Read_Write_Analyzer",
            "required": True,
            "description": "分析共享变量的读写操作"
        },
        "Control_flow_Analyzer": {
            "path": "./tool/Control_flow_Analyzer",
            "output_suffix": "-calls.json",
            "output_key": "Control_flow_Analyzer",
            "required": False,
            "description": "分析函数调用关系和控制流"
        },
        "Defect_Highlight": {
            "path": "./tool/Highlight",
            "output_suffix": "-highlight.json",
            "output_key": "Defect_Highlight",
            "required": False,
            "description": "高亮潜在的缺陷位置"
        }
    }

    # 缺陷变量和缺陷数量阈值
    DEFECT_VAR_THRESHOLD = 3  # 每个模式的潜在缺陷变量数量阈值
    DEFECT_COUNT_THRESHOLD = 5  # 每个变量的潜在缺陷数量阈值

    def __init__(self, api_client, model, name: str = "PlanAgent"):
        super().__init__(name)
        if not api_client or not model:
            raise ValueError("PlanAgent requires api_client and model.")
        self.api_client = api_client
        self.model = model
        # 加载计划提示词
        self.plan_prompt = load_prompt("prompt/plan/plan.md")
        self.facts_fusion_prompt = load_prompt("prompt/plan/facts_fusion.md")
        self.expert_judge_plan_prompt = load_prompt("prompt/plan/expert_judge_plan.md")

    async def decide_tools(self, code: str) -> Dict[str, Any]:
        """
        根据代码分析决定需要调用哪些工具及其顺序，然后按照该顺序调用工具
        Returns plan_result: {"facts": {...}, "used_tools": [...], "expert_judge_plan": [...]}
        """
        # === 1. 获取工具使用计划 ===
        tool_plan = await self._get_tool_plan(code)
        tool_sequence = self._extract_tool_sequence(tool_plan)
        self.add_message("plan_tools", f"计划使用工具: {', '.join([t for t, _ in tool_sequence])}")
        
        # === 2. 按照计划顺序运行工具链 ===
        outputs = {}
        actual_used_tools = []
        
        # 先确保必需的工具在计划中
        required_tools = [name for name, config in self.TOOL_CONFIG.items() if config["required"]]
        planned_tool_names = [t for t, _ in tool_sequence]
        for tool_name in required_tools:
            if tool_name not in planned_tool_names:
                self.add_message("plan_warning", f"必需的工具 {tool_name} 未在计划中，已自动添加")
                tool_sequence.append((tool_name, None))  # 添加到序列末尾
        
        # 按照计划顺序执行工具
        for tool_name, tool_params in tool_sequence:
            if tool_name not in self.TOOL_CONFIG:
                self.add_message("plan_warning", f"未知工具 {tool_name}，已跳过")
                continue
                
            tool_config = self.TOOL_CONFIG[tool_name]
            out_path = "input.c".replace('.c', tool_config["output_suffix"])
            
            try:
                self.add_message("plan", f"Running {tool_name} on code")
                # 使用MCP方式调用工具，可能带有参数
                args = [code, out_path]
                if tool_params:
                    args.extend(tool_params)
                    
                run_tool_mcp(tool_config["path"], args)
                
                with open(out_path, 'r') as f:
                    outputs[tool_config["output_key"]] = json.load(f)
                actual_used_tools.append(tool_name)
                
                self.add_message("plan_success", f"{tool_name} 执行成功")
            except Exception as e:
                self.add_message("plan_error", f"{tool_name} failed: {str(e)}")
                if tool_config["required"]:
                    raise RuntimeError(f"Required tool {tool_name} failed")
                outputs[tool_config["output_key"]] = {}

        # === 3. 融合工具输出 ===
        fusion_prompt = self._build_llm_fusion_prompt(outputs)
        self.add_message("plan_fusion_prompt", fusion_prompt)
        
        # 使用基类的通用异步处理方法
        system_prompt = "You are the Plan Agent."
        resp = await self.process_async(self.api_client, self.model, system_prompt, fusion_prompt)

        try:
            llm_json_start = resp.find("{")
            llm_json = resp[llm_json_start:] if llm_json_start >= 0 else resp
            facts = json.loads(llm_json).get("facts", {})
        except Exception as e:
            self.add_message("plan_error", f"LLM fusion facts parse failed: {str(e)}. Returning raw tool outputs.")
            facts = outputs  # fallback

        # === 4. 规划后续expert-judge工作 ===
        expert_judge_plan = self._plan_expert_judges(facts, outputs.get("Read_Write_Analyzer", {}))
        
        return {
            "facts": facts, 
            "used_tools": actual_used_tools,
            "tool_sequence": [t[0] for t in tool_sequence],  # 记录工具执行顺序
            "expert_judge_plan": expert_judge_plan,
            "tool_plan_output": tool_plan
        }

    async def _get_tool_plan(self, code: str) -> str:
        """
        获取工具使用计划，以<tool></tool>格式输出
        """
        # 准备提示词，添加可用工具的描述
        tool_descriptions = []
        for tool_name, config in self.TOOL_CONFIG.items():
            tool_descriptions.append(f"- **{tool_name}**: {config['description']}")
        
        tool_descriptions_str = "\n".join(tool_descriptions)
        
        prompt = self.plan_prompt.format(
            code=code,
            known_patterns=", ".join(self.known_patterns),
            available_tools=tool_descriptions_str
        )
        
        # 调用模型获取工具使用计划
        system_prompt = "You are the Plan Agent responsible for analyzing code and planning tool usage."
        response = await self.process_async(self.api_client, self.model, system_prompt, prompt)
        
        # 返回原始响应，包含<tool></tool>标签
        return response

    def _extract_tool_sequence(self, plan_text: str) -> List[Tuple[str, Optional[List[str]]]]:
        """
        从计划文本中提取工具名称和执行顺序
        返回: [(工具名, 参数列表), ...]
        """
        # 使用正则表达式提取<tool>标签中的内容
        tool_pattern = r"<tool>(.*?)</tool>"
        matches = re.findall(tool_pattern, plan_text, re.DOTALL)
        
        if not matches:
            # 如果没有找到工具标签，返回所有必须的工具
            return [(name, None) for name, config in self.TOOL_CONFIG.items() if config["required"]]
            
        # 提取工具名称列表和顺序
        tools_text = matches[0]
        # 分割工具名称，保持顺序
        raw_tools = [t.strip() for t in re.split(r'[,\n]', tools_text) if t.strip()]
        
        # 解析工具名称和可能的参数
        tool_sequence = []
        for raw_tool in raw_tools:
            # 检查是否包含参数
            if '(' in raw_tool and ')' in raw_tool:
                tool_name = raw_tool.split('(')[0].strip()
                params_str = raw_tool.split('(')[1].split(')')[0]
                params = [p.strip() for p in params_str.split(',')]
                if tool_name in self.TOOL_CONFIG:
                    tool_sequence.append((tool_name, params))
            else:
                tool_name = raw_tool.strip()
                if tool_name in self.TOOL_CONFIG:
                    tool_sequence.append((tool_name, None))
        
        return tool_sequence

    def _build_llm_fusion_prompt(self, outputs: dict) -> str:
        """构建融合工具输出的提示词"""
        prompt = (
            "Given the following outputs from static code analysis tools, please fuse them into a single structured JSON object named 'facts', "
            "containing only information needed for atomicity violation reasoning (omit unnecessary or redundant fields):\n\n"
        )
        
        # 按工具输出添加到提示词中
        for tool_name, config in self.TOOL_CONFIG.items():
            output_key = config["output_key"]
            if output_key in outputs:
                prompt += f"{output_key} (from {tool_name}):\n{json.dumps(outputs[output_key], ensure_ascii=False, indent=2)}\n\n"
        
        return prompt
        
    def _plan_expert_judges(self, facts: Dict[str, Any], rw_analysis: Dict[str, Any]) -> List[Dict[str, Any]]:
        """
        根据Read_Write_Analyzer结果规划后续expert-judge工作
        
        新的规划规则:
        1. 首先按照缺陷模式分配任务
        2. 对于每个缺陷模式，如果其关联的变量数量 >= 3 或任一变量的缺陷次数 > 5，则为每个变量创建单独的任务
        
        返回expert-judge计划列表，每个元素包含:
        - sharedVariables: 共享变量名列表
        - accessPattern: 访问模式，如["Read", "Write", "Read"]
        """
        expert_judge_tasks = []
        
        # 1. 提取潜在缺陷模式和相关变量
        defect_patterns = self.known_patterns  # 默认使用所有已知模式
        defect_vars_by_pattern = {}  # 每个模式涉及的变量
        var_access_counts = {}  # 每个变量的访问次数
        
        # 从facts中提取变量访问信息
        for access in facts.get("variable_accesses", []):
            var_name = access.get("variable")
            if var_name:
                var_access_counts[var_name] = var_access_counts.get(var_name, 0) + 1
        
        # 尝试从facts中提取缺陷模式信息（如果有）
        if "defect_patterns" in facts:
            defect_patterns = facts.get("defect_patterns")
        
        # 尝试从facts中提取每个模式的变量信息（如果有）
        if "defect_vars_by_pattern" in facts:
            defect_vars_by_pattern = facts.get("defect_vars_by_pattern")
        else:
            # 如果没有明确的模式-变量映射，根据变量访问构建
            # 这里简化处理，假设所有共享变量都可能涉及所有模式
            shared_vars = set()
            if "global_variables_to_detect" in facts:
                shared_vars.update(facts.get("global_variables_to_detect", []))
            else:
                # 从Read_Write_Analyzer中提取共享变量
                for var_info in rw_analysis.get("shared_variables", []):
                    var_name = var_info.get("name")
                    if var_name:
                        shared_vars.add(var_name)
            
            # 为每个模式分配所有共享变量
            for pattern in defect_patterns:
                defect_vars_by_pattern[pattern] = list(shared_vars)
        
        self.add_message("plan_info", f"Found {len(defect_patterns)} defect patterns and {len(var_access_counts)} potential defect variables")
        
        # 2. 为每个缺陷模式创建任务
        for pattern in defect_patterns:
            # 获取该模式涉及的变量
            pattern_vars = defect_vars_by_pattern.get(pattern, [])
            
            # 解析模式字符串，转换为访问操作列表
            # 例如: "<Read, Write, Read>" -> ["Read", "Write", "Read"]
            access_pattern = self._parse_pattern_to_access_list(pattern)
            
            # 检查是否需要为该模式创建变量任务
            if len(pattern_vars) >= self.DEFECT_VAR_THRESHOLD:
                self.add_message("plan_info", f"Pattern {pattern} has {len(pattern_vars)} variables, creating variable tasks")
                
                # 按访问频率对变量进行分组
                high_freq_vars = []
                normal_vars = []
                
                for var_name in pattern_vars:
                    if var_access_counts.get(var_name, 0) > self.DEFECT_COUNT_THRESHOLD:
                        high_freq_vars.append(var_name)
                    else:
                        normal_vars.append(var_name)
                
                # 为高频变量创建单独的任务
                for var_name in high_freq_vars:
                    expert_judge_tasks.append({
                        "sharedVariables": [var_name],
                        "accessPattern": access_pattern
                    })
                
                # 如果有普通频率的变量，将它们分组
                if normal_vars:
                    # 每组最多包含3个变量
                    for i in range(0, len(normal_vars), 3):
                        group = normal_vars[i:i+3]
                        expert_judge_tasks.append({
                            "sharedVariables": group,
                            "accessPattern": access_pattern
                        })
            else:
                # 变量数量较少，将它们放在一个任务中
                if pattern_vars:
                    expert_judge_tasks.append({
                        "sharedVariables": pattern_vars,
                        "accessPattern": access_pattern
                    })
        
        # 生成expert-judge计划的JSON格式输出
        plan_json = self._generate_expert_judge_json(expert_judge_tasks)
        self.add_message("expert_judge_plan_json", plan_json)
        
        return expert_judge_tasks
    
    def _parse_pattern_to_access_list(self, pattern: str) -> List[str]:
        """
        将模式字符串解析为访问操作列表
        例如: "<Read, Write, Read>" -> ["Read", "Write", "Read"]
        """
        # 移除尖括号和空格，然后按逗号分割
        if pattern.startswith("<") and pattern.endswith(">"):
            pattern = pattern[1:-1]
        
        return [op.strip() for op in pattern.split(",")]
        
    def _generate_expert_judge_json(self, expert_judge_tasks: List[Dict[str, Any]]) -> str:
        """
        生成expert-judge计划的JSON格式输出
        """
        # 构建JSON对象
        expert_judge_json = {
            "expert_judge_tasks": expert_judge_tasks
        }
        
        # 转换为JSON字符串，保持缩进格式
        return json.dumps(expert_judge_json, indent=2, ensure_ascii=False)

        # 移除尖括号和空格，然后按逗号分割
        if pattern.startswith("<") and pattern.endswith(">"):
            pattern = pattern[1:-1]
        
        return [op.strip() for op in pattern.split(",")]
        
    def _generate_expert_judge_json(self, expert_judge_tasks: List[Dict[str, Any]]) -> str:
        """
        生成expert-judge计划的JSON格式输出
        """
        # 构建JSON对象
        expert_judge_json = {
            "expert_judge_tasks": expert_judge_tasks
        }
        
        # 转换为JSON字符串，保持缩进格式
        return json.dumps(expert_judge_json, indent=2, ensure_ascii=False)

        # 移除尖括号和空格，然后按逗号分割
        if pattern.startswith("<") and pattern.endswith(">"):
            pattern = pattern[1:-1]
        
        return [op.strip() for op in pattern.split(",")]
        
    def _generate_expert_judge_json(self, expert_judge_tasks: List[Dict[str, Any]]) -> str:
        """
        生成expert-judge计划的JSON格式输出
        """
        # 构建JSON对象
        expert_judge_json = {
            "expert_judge_tasks": expert_judge_tasks
        }
        
        # 转换为JSON字符串，保持缩进格式
        return json.dumps(expert_judge_json, indent=2, ensure_ascii=False)
