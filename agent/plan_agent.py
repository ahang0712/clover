import json
import re
import sys
import os
import importlib.util
import tempfile
from typing import Any, Dict, Optional, List, Tuple

# 处理导入路径
try:
    from agent.agent_base import AgentBase
    from tool.runner import run_tool_mcp
    from utils import load_prompt
except ImportError:
    # 如果在agent目录内运行
    from agent_base import AgentBase
    sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
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
            "output_suffix": "-snippets.c",
            "output_key": "Code_Extractor",
            "required": False,
            "description": "提取相关代码片段进行分析",
            "use_mcp": True,  # 使用MCP装饰器
            "mcp_module": "extractor",  # MCP模块名
            "mcp_function": "extract_code"  # MCP函数名
        },
        "Read_Write_Analyzer": {
            "path": "./tool/Read_Write_Analyzer",
            "output_suffix": "-analysis.json",
            "output_key": "Read_Write_Analyzer",
            "required": True,
            "description": "分析共享变量的读写操作",
            "use_mcp": True,  # 使用MCP装饰器
            "mcp_module": "analyzer",  # MCP模块名
            "mcp_function": "analyze_rw"  # MCP函数名
        },
        "Control_flow_Analyzer": {
            "path": "./tool/Control_flow_Analyzer",
            "output_suffix": "-calls.json",
            "output_key": "Control_flow_Analyzer",
            "required": False,
            "description": "分析函数调用关系和控制流",
            "use_mcp": True,  # 使用MCP装饰器
            "mcp_module": "analyzer",  # MCP模块名
            "mcp_function": "analyze_control_flow"  # MCP函数名
        },
        "Defect_Highlight": {
            "path": "./tool/Highlight",
            "output_suffix": "-highlight.json",
            "output_key": "Defect_Highlight",
            "required": False,
            "description": "高亮潜在的缺陷位置",
            "use_mcp": True,  # 使用MCP装饰器
            "mcp_module": "pattern",  # MCP模块名
            "mcp_function": "detect_defects"  # MCP函数名
        }
    }

    # 缺陷变量和缺陷数量阈值
    DEFECT_VAR_THRESHOLD = 3  # 每个模式的潜在缺陷变量数量阈值
    DEFECT_COUNT_THRESHOLD = 5  # 每个变量的潜在缺陷数量阈值

    def __init__(self, api_client, model, name: str = "PlanAgent", original_file_name: str = None):
        super().__init__(name)
        if not api_client or not model:
            raise ValueError("PlanAgent requires api_client and model.")
        self.api_client = api_client
        self.model = model
        # 保存原始文件名
        self.original_file_name = original_file_name
        print(f"[PlanAgent] 初始化使用原始文件名: {original_file_name}")
        
        # 设置输出目录为config中定义的RESPONSE_PATH
        from config import RESPONSE_PATH
        self.output_dir = RESPONSE_PATH
        os.makedirs(self.output_dir, exist_ok=True)
        print(f"[PlanAgent] 输出目录: {self.output_dir}")
        
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
        print("code:"+code)
        tool_plan = await self._get_tool_plan(code)
        tool_sequence = self._extract_tool_sequence(tool_plan)
        self.add_message("plan_tools", f"计划使用工具: {', '.join([t for t, _ in tool_sequence])}")
        
        # === 2. 严格按照LLM推理的计划顺序运行工具链 ===
        outputs = {}
        actual_used_tools = []
        
        # 记录必需但未在计划中的工具
        required_tools = [name for name, config in self.TOOL_CONFIG.items() if config["required"]]
        planned_tool_names = [t for t, _ in tool_sequence]
        missing_required_tools = [tool_name for tool_name in required_tools if tool_name not in planned_tool_names]
        
        # 如果缺少必需的工具，将其添加到计划中
        if missing_required_tools:
            print(f"[Warning] 缺少必需的工具: {missing_required_tools}")
            for tool_name in missing_required_tools:
                tool_sequence.append((tool_name, None))
        
        # 运行工具链
        for tool_name, _ in tool_sequence:
            print(f"tool_name:{tool_name}")
            
            # 获取工具配置
            tool_config = self.TOOL_CONFIG.get(tool_name)
            if not tool_config:
                print(f"[Error] 未知工具: {tool_name}")
                continue
                
            print(f"[DEBUG] {tool_name} 配置: use_mcp=True, mcp_module={tool_config['mcp_module']}, mcp_function={tool_config['mcp_function']}")
            
            try:
                # 运行工具
                result = await self.run_tool(tool_name, self.original_file_name)
                
                if result.get("status") == "success":
                    actual_used_tools.append(tool_name)
                    outputs[tool_config["output_key"]] = result.get("results", {})
                else:
                    print(f"[Error] 工具 {tool_name} 执行失败: {result.get('message', 'Unknown error')}")
                    
                    # 如果是必需的工具失败了，尝试使用原始方式运行
                    if tool_config["required"]:
                        print(f"[Warning] 必需工具 {tool_name} 失败，尝试使用原始方式")
                        try:
                            # 创建临时文件
                            with tempfile.NamedTemporaryFile(mode='w', suffix='.c', delete=False) as tmp_file:
                                tmp_file.write(code)
                                input_file = tmp_file.name
                            
                            # 创建输出文件
                            output_file = os.path.join(self.output_dir, f"input{tool_config['output_suffix']}")
                            
                            # 运行工具
                            print(f"[工具调用] 执行工具 {tool_name}, 路径: {tool_config['path']}")
                            print(f"[工具调用] 参数: [{code}, {output_file}]")
                            
                            # 这里应该调用工具的具体实现
                            # TODO: 实现工具的原始调用方式
                            print(f"[工具调用] {tool_name} 执行失败: ")
                            
                            # 清理临时文件
                            try:
                                os.unlink(input_file)
                            except:
                                pass
                                
                        except Exception as e:
                            print(f"[Error] 工具 {tool_name} 原始方式执行失败: {str(e)}")
                            import traceback
                            print(traceback.format_exc())
                
            except Exception as e:
                print(f"[Error] 工具 {tool_name} 执行异常: {str(e)}")
                import traceback
                print(traceback.format_exc())
        
        # === 3. 融合工具输出，生成事实 ===
        # TODO: 暂时注释掉融合步骤
        # facts = self._fuse_tool_outputs(outputs)
        facts = outputs
        
        # === 4. 规划Expert-Judge任务 ===
        # TODO: 暂时注释掉规划步骤
        # expert_judge_plan = await self._plan_expert_judge_tasks(facts)
        expert_judge_plan = "{}"
        
        # === 5. 返回结果 ===
        plan_result = {
            "facts": facts,
            "used_tools": actual_used_tools,
            "tool_sequence": [t[0] for t in tool_sequence],
            "tool_plan_output": tool_plan,
            "expert_judge_json": expert_judge_plan
        }
        
        return plan_result

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
        print("Planner:"+response)
        
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
        
        print("tool_sequence:"+str(tool_sequence))
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

    def _create_default_output(self, code: str) -> Dict[str, Any]:
        """
        创建一个默认的输出字典，当工具执行失败或输出文件不存在时使用。
        """
        return {
            "status": "failed",
            "message": "工具执行失败或输出文件不存在，已创建默认输出。",
            "code": code,
            "variable_accesses": [],
            "shared_variables": [],
            "global_variables_to_detect": [],
            "defect_patterns": [],
            "defect_vars_by_pattern": {}
        }

    async def run_tool(self, tool_name: str, input_file: str = None) -> Dict[str, Any]:
        """
        运行指定的工具
        """
        tool_config = self.TOOL_CONFIG.get(tool_name)
        if not tool_config:
            raise ValueError(f"Unknown tool: {tool_name}")
            
        # 获取输出文件路径
        base_name = os.path.splitext(os.path.basename(input_file or self.original_file_name))[0]
        output_file = os.path.join(self.output_dir, f"{base_name}{tool_config['output_suffix']}")
        
        if tool_config["use_mcp"]:
            try:
                print(f"tool_name:{tool_name}")
                # 使用MCP装饰器运行工具
                module_path = os.path.join(tool_config["path"], f"{tool_config['mcp_module']}.py")
                
                # 确保输出目录存在
                os.makedirs(os.path.dirname(output_file), exist_ok=True)
                
                # 准备MCP函数的参数
                input_data = None
                if tool_name == "Defect_Highlight":
                    # 对于Defect_Highlight，需要读取Read_Write_Analyzer的输出
                    rw_output = os.path.join(self.output_dir, f"{base_name}-analysis.json")
                    if os.path.exists(rw_output):
                        try:
                            with open(rw_output, 'r') as f:
                                input_data = json.load(f)
                            # 使用Read_Write_Analyzer的输出作为输入文件
                            input_file = rw_output
                        except Exception as e:
                            print(f"[{tool_name} MCP] 警告: 无法读取Read_Write_Analyzer输出文件: {str(e)}")
                            return {"status": "error", "message": f"Failed to read input file: {str(e)}"}
                    else:
                        print(f"[{tool_name} MCP] 警告: Read_Write_Analyzer输出文件不存在: {rw_output}")
                        return {"status": "error", "message": "Required input file not found"}
                else:
                    input_data = {"input_file": input_file or self.original_file_name}
                
                # 运行MCP函数
                try:
                    result = await self._run_mcp_function(
                        module_path,
                        tool_config["mcp_function"],
                        input_file or self.original_file_name,
                        output_file,
                        input_data
                    )
                    
                    # 检查LLVM IR相关错误
                    if tool_name == "Read_Write_Analyzer":
                        if "Error running llvm_api_demo" in str(result):
                            print(f"[{tool_name} MCP] LLVM API调用失败: {result}")
                            self.add_message("plan_error", f"LLVM API调用失败: {result}")
                            raise Exception(f"LLVM API调用失败: {result}")
                        
                        if "Mod is null" in str(result):
                            print(f"[{tool_name} MCP] LLVM模块为空: {result}")
                            self.add_message("plan_error", f"LLVM模块为空: {result}")
                            raise Exception(f"LLVM模块为空: {result}")
                            
                        if "Failed to generate LLVM IR" in str(result):
                            print(f"[{tool_name} MCP] 生成LLVM IR失败: {result}")
                            self.add_message("plan_error", f"生成LLVM IR失败: {result}")
                            raise Exception(f"生成LLVM IR失败: {result}")
                    
                    return result
                    
                except Exception as e:
                    if tool_name == "Read_Write_Analyzer":
                        if "LLVM IR" in str(e):
                            print(f"[{tool_name} MCP] 生成LLVM IR文件异常: {str(e)}")
                            self.add_message("plan_error", f"生成LLVM IR文件异常: {str(e)}")
                            raise Exception(f"生成LLVM IR文件异常: {str(e)}")
                        elif "llvm_api_demo" in str(e):
                            print(f"[{tool_name} MCP] LLVM API调用异常: {str(e)}")
                            self.add_message("plan_error", f"LLVM API调用异常: {str(e)}")
                            raise Exception(f"LLVM API调用异常: {str(e)}")
                    raise e
                    
            except Exception as e:
                print(f"[{tool_name} MCP] 加载模块异常: {str(e)}")
                import traceback
                print(f"[DEBUG] 异常堆栈: {traceback.format_exc()}")
                print(f"[{tool_name} MCP] 回退到原始方式")
                return {"status": "error", "message": str(e)}
        else:
            # 原始方式运行工具
            pass  # 保持原有的工具运行逻辑不变

    async def _run_mcp_function(self, module_path: str, function_name: str, input_file: str, output_file: str, input_data: Dict = None) -> Dict[str, Any]:
        """
        运行MCP函数
        """
        print(f"[DEBUG] 在主try-except块外处理{os.path.basename(os.path.dirname(module_path))} MCP工具")
        
        try:
            # 加载模块
            print(f"[{os.path.basename(os.path.dirname(module_path))} MCP] 加载模块: {module_path}")
            
            # 检查模块文件是否存在
            print(f"[DEBUG] 模块文件是否存在: {os.path.exists(module_path)}")
            
            # 获取当前工作目录和模块所在目录
            current_dir = os.getcwd()
            module_dir = os.path.dirname(module_path)
            print(f"[DEBUG] 当前工作目录: {current_dir}")
            print(f"[DEBUG] 模块所在目录: {module_dir}")
            print(f"[DEBUG] 模块所在目录是否存在: {os.path.exists(module_dir)}")
            print(f"[DEBUG] 模块所在目录文件列表: {os.listdir(module_dir)}")
            
            # 尝试加载模块
            print(f"[DEBUG] 尝试加载模块: {module_path}")
            spec = importlib.util.spec_from_file_location("module", module_path)
            module = importlib.util.module_from_spec(spec)
            spec.loader.exec_module(module)
            print(f"[DEBUG] 执行模块: {module}")
            
            # 检查函数是否存在
            print(f"[DEBUG] 检查模块是否包含函数: {function_name}")
            if not hasattr(module, function_name):
                raise ValueError(f"Module does not contain function: {function_name}")
            print(f"[DEBUG] 模块包含函数: {function_name}")
            
            # 获取函数对象
            func = getattr(module, function_name)
            print(f"[{os.path.basename(os.path.dirname(module_path))} MCP] 调用MCP函数: {function_name}")
            
            # 如果是原始C文件，打印路径
            if input_file and input_file.endswith('.c'):
                print(f"[{os.path.basename(os.path.dirname(module_path))} MCP] 使用原始C文件: {input_file}")
            
            # 准备临时输入文件（如果需要）
            tmp_input = None
            if input_data:
                # 创建临时目录（如果不存在）
                tmp_dir = os.path.join(self.output_dir, "tmp")
                os.makedirs(tmp_dir, exist_ok=True)
                
                # 在临时目录中创建临时文件
                tmp_input = os.path.join(tmp_dir, f"input_{os.path.basename(input_file)}.json")
                with open(tmp_input, 'w', encoding='utf-8') as f:
                    json.dump(input_data, f, ensure_ascii=False, indent=2)
            
            print(f"[DEBUG] 调用MCP函数: {function_name}({input_file}, {output_file})")
            print(f"[DEBUG] 输入文件: {input_file}")
            print(f"[DEBUG] 输出文件: {output_file}")
            print(f"[DEBUG] 临时文件: {tmp_input}")
            
            # 确保输出目录存在
            os.makedirs(os.path.dirname(output_file), exist_ok=True)
            
            # 调用函数（所有工具都只需要两个参数）
            result = func(input_file, output_file)
            
            # 清理临时文件
            if tmp_input and os.path.exists(tmp_input):
                try:
                    os.remove(tmp_input)
                except:
                    pass
                try:
                    os.rmdir(os.path.dirname(tmp_input))
                except:
                    pass
            
            print(f"[DEBUG] MCP函数返回结果: {result}")
            print(f"[{os.path.basename(os.path.dirname(module_path))} MCP] MCP函数执行成功")
            
            # 检查输出文件是否存在
            if not os.path.exists(output_file):
                print(f"[{os.path.basename(os.path.dirname(module_path))} MCP] 警告: 输出文件不存在: {output_file}")
            
            return result
            
        except Exception as e:
            print(f"[{os.path.basename(os.path.dirname(module_path))} MCP] 执行异常: {str(e)}")
            import traceback
            print(f"[DEBUG] 异常堆栈: {traceback.format_exc()}")
            raise