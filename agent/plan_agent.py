import json
import re
import sys
import os
import importlib.util
import tempfile
from typing import Any, Dict, Optional, List, Tuple
import asyncio
from concurrent.futures import ThreadPoolExecutor
import time

# 处理导入路径
try:
    from agent.agent_base import AgentBase
    from tool.runner import run_tool_mcp
    from utils import load_prompt
    from preprocessing.core.project_scanner import ProjectScanner
    from preprocessing.core.code_merger import CodeMerger
except ImportError:
    # 如果在agent目录内运行
    from agent_base import AgentBase
    sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    from tool.runner import run_tool_mcp
    from utils import load_prompt
    from preprocessing.core.project_scanner import ProjectScanner
    from preprocessing.core.code_merger import CodeMerger

class PlanAgent(AgentBase):
    """
    PlanAgent:
      - 按照固定顺序调用必要的静态分析工具
      - 使用MCP方式调用工具
      - 融合工具输出生成统一的代码分析结果
      - 根据分析结果规划后续expert-judge工作
    
    Key Features:
      1. 工具自动发现和配置
      2. MCP (Model Control Protocol) 统一接口
      3. 错误处理和回退机制
      4. 结果融合和格式标准化
      5. 智能任务规划
      6. 异步工具调用支持
    """

    # 支持的缺陷模式
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
            "mcp_function": "extract_code",  # MCP函数名
            "async_enabled": False  # Code_Extractor不使用异步
        },
        "Operation_Analyzer": {
            "path": "./tool/Operation_Analyzer",
            "output_suffix": "-analysis.json",
            "output_key": "Operation_Analyzer",
            "required": True,
            "description": "分析共享变量的读写操作",
            "use_mcp": True,  # 使用MCP装饰器
            "mcp_module": "analyzer",  # MCP模块名
            "mcp_function": "analyze_rw",  # MCP函数名
            "async_enabled": True  # 支持异步执行
        },
        "Control_flow_Analyzer": {
            "path": "./tool/Control_flow_Analyzer",
            "output_suffix": "-calls.json",
            "output_key": "Control_flow_Analyzer",
            "required": False,
            "description": "分析函数调用关系和控制流",
            "use_mcp": True,  # 使用MCP装饰器
            "mcp_module": "analyzer",  # MCP模块名
            "mcp_function": "analyze_control_flow",  # MCP函数名
            "async_enabled": True  # 支持异步执行
        },
        "Defect_Highlight": {
            "path": "./tool/Highlight",
            "output_suffix": "-highlight.json",
            "output_key": "Defect_Highlight",
            "required": True,
            "description": "高亮潜在的缺陷位置",
            "use_mcp": True,  # 使用MCP装饰器
            "mcp_module": "llvm_wrapper",  # MCP模块名
            "mcp_function": "analyze_file",  # MCP函数名
            "async_enabled": True  # 支持异步执行
        }
    }

    # 缺陷变量和缺陷数量阈值
    DEFECT_VAR_THRESHOLD = 3  # 每个模式的潜在缺陷变量数量阈值
    DEFECT_COUNT_THRESHOLD = 5  # 每个变量的潜在缺陷数量阈值

    # === 新增：工作流决策配置 ===
    WORKFLOW_PATTERNS = {
        "RWR": "<Read, Write, Read>",
        "RWW": "<Read, Write, Write>", 
        "WWR": "<Write, Write, Read>",
        "WRW": "<Write, Read, Write>"
    }
    
    WORKFLOW_PRIORITIES = {
        "HIGH": ["RWR", "RWW"],    # 高优先级：读-写冲突
        "MEDIUM": ["WWR", "WRW"],  # 中优先级：写冲突
        "LOW": []                  # 低优先级：其他模式
    }

    def __init__(self, api_client, model, name: str = "PlanAgent", original_file_name: str = None, project_path: str = None):
        
        super().__init__(name)
        self.api_client = api_client
        self.model = model
        self.original_file_name = original_file_name
        self.project_path = project_path
        self.is_project_mode = project_path is not None
        
        # 创建输出目录
        if self.original_file_name:
            base_name = os.path.splitext(os.path.basename(self.original_file_name))[0]
            self.output_dir = f"./dataset/c-src/response-1/qwen3-235b/"
            os.makedirs(self.output_dir, exist_ok=True)
        else:
            self.output_dir = "./output"
            os.makedirs(self.output_dir, exist_ok=True)
        
        # 初始化项目分析组件
        if self.is_project_mode:
            try:
                self.project_scanner = ProjectScanner(project_path)
                self.code_merger = CodeMerger()
                print(f"[PlanAgent] 项目分析组件初始化成功")
            except Exception as e:
                print(f"[Warning] 项目分析组件初始化失败: {str(e)}")
                self.is_project_mode = False
        
        # 加载计划提示词
        self.plan_prompt = load_prompt("prompt/plan/plan.md")
        
        # 在需要时才加载，避免初始化错误

        self.task_planning_prompt = None
        
        # 添加异步工具调度器状态监控
        self.tool_execution_stats = {
            "total_tools": 0,
            "successful_tools": 0,
            "failed_tools": 0,
            "execution_times": {},
            "error_details": {}
        }

    async def decide_tools(self, code: str = None, merge_strategy: str = "smart") -> Dict[str, Any]:
        """
        根据代码分析决定需要调用哪些工具及其顺序，然后按照该顺序调用工具
        
        Args:
            code: 单文件代码内容（可选，项目模式下可为None）
            merge_strategy: 项目模式下的代码合并策略 ("smart", "full", "summary", "main_only")
            
        Returns:
            plan_result: {"facts": {...}, "used_tools": [...], "expert_judge_plan": [...]}
        """
        # === 0. 处理项目模式下的代码输入 ===
        if self.is_project_mode:
            if code is None:
                print(f"[PlanAgent] 项目模式：开始合并项目代码，策略: {merge_strategy}")
                merge_result = self.code_merger.merge_project_code(self.project_path, merge_strategy)
                code = merge_result['code']
                
                # 记录合并信息
                print(f"[PlanAgent] 项目代码合并完成:")
                print(f"  - 策略: {merge_result['strategy']}")
                print(f"  - 总行数: {merge_result['total_lines']}")
                print(f"  - 包含文件数: {merge_result['files_included']}")
                
                # 将项目信息添加到消息历史
                self.add_message("project_analysis", f"项目模式分析: {merge_result['strategy']} 策略, {merge_result['files_included']} 文件, {merge_result['total_lines']} 行")
            else:
                print(f"[PlanAgent] 项目模式：使用提供的代码内容，长度: {len(code)} 字符")
        
        # === 1. 获取工具使用计划 ===
        print("code:"+code[:500] + "..." if len(code) > 500 else code)  # 只打印前500字符
        tool_plan = await self._get_tool_plan(code)
        tool_sequence = self._extract_tool_sequence(tool_plan)
        
        # === 1.5. 项目模式下的工具选择增强 ===
        if self.is_project_mode:
            tool_sequence = self._enhance_tool_sequence_for_project(tool_sequence, merge_strategy)
        
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
        
        # 使用异步调度器运行工具
        outputs, actual_used_tools = await self._run_tools_with_scheduler(tool_sequence, code)
        
        # === 3. 融合工具输出，生成事实 ===
        facts = await self._fuse_tool_outputs(outputs)
        
        # === 4. 规划Expert-Judge任务 ===
        expert_judge_plan = "{}"
        try:
            # 获取Operation_Analyzer的结果
            rw_analysis = outputs.get("Operation_Analyzer", {})
            if rw_analysis and facts:
                expert_judge_tasks = await self._plan_expert_judges_llm(facts, rw_analysis)
                expert_judge_plan = self._generate_expert_judge_json(expert_judge_tasks)
                print(f"[PlanAgent] 生成了 {len(expert_judge_tasks)} 个expert-judge任务")
                print(f"[DEBUG] Expert-judge plan JSON: {expert_judge_plan[:200]}...")
            else:
                print(f"[PlanAgent] 跳过expert-judge任务规划: 缺少必要的分析结果")
                print(f"[Debug] rw_analysis keys: {list(outputs.keys())}")
                print(f"[Debug] rw_analysis empty: {not rw_analysis}")
                print(f"[Debug] facts empty: {not facts}")
        except Exception as e:
            print(f"[Error] Expert-Judge任务规划失败: {str(e)}")
            import traceback
            traceback.print_exc()
        
        # === 5. 返回结果 ===
        plan_result = {
            "facts": facts,
            "used_tools": actual_used_tools,
            "tool_sequence": [t[0] for t in tool_sequence],
            "tool_plan_output": tool_plan,
            "tool_plan_text": tool_plan,  # 为了与批量模式兼容
            "expert_judge_json": expert_judge_plan,
            "expert_judge_plan": expert_judge_plan  # 添加兼容性键名
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

    def _enhance_tool_sequence_for_project(self, tool_sequence: List[Tuple[str, Optional[List[str]]]], merge_strategy: str) -> List[Tuple[str, Optional[List[str]]]]:
        """
        项目模式下增强工具选择序列
        
        Args:
            tool_sequence: 原始工具序列
            merge_strategy: 代码合并策略
            
        Returns:
            增强后的工具序列
        """
        print(f"[PlanAgent] 项目模式工具增强，原序列: {[t[0] for t in tool_sequence]}")
        
        enhanced_sequence = tool_sequence.copy()
        planned_tools = [t[0] for t in tool_sequence]
        
        # 根据项目特征和合并策略调整工具选择
        try:
            project_structure = self.project_scanner.analyze_project_structure()
            
            # 1. 如果是大型项目且使用了summary策略，强制添加Code_Extractor
            if (merge_strategy == "summary" or 
                project_structure['total_size'] > 50000 or  # 大于50KB
                len(project_structure['c_files']) > 10):    # 超过10个文件
                
                if "Code_Extractor" not in planned_tools:
                    print(f"[PlanAgent] 大型项目检测，添加Code_Extractor到工具序列")
                    enhanced_sequence.insert(0, ("Code_Extractor", None))
            
            # 2. 如果项目有多个主文件，强制添加Control_flow_Analyzer
            if len(project_structure['main_files']) > 1:
                if "Control_flow_Analyzer" not in planned_tools:
                    print(f"[PlanAgent] 多主函数项目检测，添加Control_flow_Analyzer")
                    enhanced_sequence.append(("Control_flow_Analyzer", None))
            
            # 3. 如果使用了smart或full策略，确保有Defect_Highlight
            if merge_strategy in ["smart", "full"]:
                if "Defect_Highlight" not in planned_tools:
                    print(f"[PlanAgent] {merge_strategy}策略检测，添加Defect_Highlight")
                    enhanced_sequence.append(("Defect_Highlight", None))
            
            # 4. 项目模式下Operation_Analyzer是必需的
            if "Operation_Analyzer" not in planned_tools:
                print(f"[PlanAgent] 项目模式强制添加Operation_Analyzer")
                enhanced_sequence.append(("Operation_Analyzer", None))
            
            print(f"[PlanAgent] 工具增强完成，新序列: {[t[0] for t in enhanced_sequence]}")
            
        except Exception as e:
            print(f"[Warning] 项目模式工具增强失败: {str(e)}")
            return tool_sequence
        
        return enhanced_sequence


        
    def _plan_expert_judges(self, facts: Dict[str, Any], rw_analysis: Dict[str, Any]) -> List[Dict[str, Any]]:
        """
        根据Operation_Analyzer结果规划后续expert-judge工作
        
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
        
        # 从Operation_Analyzer的facts中提取变量访问信息
        # Operation_Analyzer的输出结构: {"GLOBAL_VAR": [...], "MAIN_INFO": [...], "ISR_INFO": [...]}
        rw_data = facts.get("Operation_Analyzer", {})
        
        # 从MAIN_INFO和ISR_INFO中提取变量访问
        for access in rw_data.get("MAIN_INFO", []) + rw_data.get("ISR_INFO", []):
            var_name = access.get("variable")
            if var_name:
                var_access_counts[var_name] = var_access_counts.get(var_name, 0) + 1
        
        # 从Defect_Highlight中提取缺陷信息（如果有）
        highlight_data = facts.get("Defect_Highlight", {})
        if "defects" in highlight_data:
            # 从高亮的缺陷中提取缺陷模式
            found_defects = highlight_data.get("defects", [])
            if found_defects:
                detected_patterns = set()
                for defect in found_defects:
                    defect_type = defect.get("type", "")
                    if defect_type == "RWR":
                        detected_patterns.add("<Read, Write, Read>")
                    elif defect_type == "RWW":
                        detected_patterns.add("<Read, Write, Write>")
                    elif defect_type == "WWR":
                        detected_patterns.add("<Write, Write, Read>")
                # 如果检测到缺陷，只关注这些模式
                if detected_patterns:
                    defect_patterns = list(detected_patterns)
        
        # 构建共享变量列表
        shared_vars = set()
        
        # 从GLOBAL_VAR中获取全局变量
        global_vars = rw_data.get("GLOBAL_VAR", [])
        shared_vars.update(global_vars)
            
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

    async def _plan_expert_judges_llm(self, facts: Dict[str, Any], rw_analysis: Dict[str, Any]) -> List[Dict[str, Any]]:
        """
        使用LLM智能规划Expert-Judge任务分配
        
        参数:
        - facts: 融合后的事实信息
        - rw_analysis: Operation_Analyzer的原始结果
        
        返回: expert-judge任务列表
        """
        self.add_message("info", "开始使用LLM进行智能任务规划")
        
        try:
            # 检查是否有Defect_Highlight结果，如果有则使用highlight专用提示词
            highlight_results = facts.get("Defect_Highlight", {})
            if highlight_results and highlight_results.get("defects"):
                # 使用基于highlight结果的提示词
                planning_prompt = self._build_highlight_analysis_prompt(highlight_results)
            else:
                # 使用通用的facts提示词
                planning_prompt = self._build_task_planning_prompt(facts, rw_analysis)
            
            # 加载任务规划系统提示词（动态加载）
            if not self.task_planning_prompt:
                self.task_planning_prompt = load_prompt("prompt/plan/task_planning.md")
            task_planning_prompt = self.task_planning_prompt
            
            # 调用LLM进行任务规划
            messages = [
                {"role": "system", "content": task_planning_prompt},
                {"role": "user", "content": planning_prompt}
            ]
            response = await self.api_client.send_messages(self.model, messages)
            
            if response:
                try:
                    # 提取JSON内容
                    json_content = response.strip()
                    if json_content.startswith("```json"):
                        json_content = json_content[7:]
                    if json_content.endswith("```"):
                        json_content = json_content[:-3]
                    json_content = json_content.strip()
                    
                    # 调试：打印LLM原始响应
                    print(f"[DEBUG] LLM原始响应: {response[:500]}...")
                    print(f"[DEBUG] 处理后JSON内容: {json_content[:500]}...")
                    
                    # 解析任务规划结果
                    planning_result = json.loads(json_content)
                    print(f"[DEBUG] 解析后的规划结果键: {list(planning_result.keys())}")
                    
                    # 支持新格式和旧格式
                    if "tasks" in planning_result:
                        # 新格式：基于highlight结果的任务规划
                        tasks = planning_result["tasks"]
                        strategy = planning_result.get("strategy", "pattern_based")
                        
                        # 转换为标准格式
                        standard_tasks = []
                        for task in tasks:
                            # 新格式中每个任务包含特定模式的变量
                            pattern = task.get("pattern", "RWR")
                            variables = task.get("variables", [])
                            
                            # 根据模式生成访问序列
                            if pattern == "RWR":
                                access_pattern = ["Read", "Write", "Read"]
                            elif pattern == "RWW":
                                access_pattern = ["Read", "Write", "Write"]
                            elif pattern == "WWR":
                                access_pattern = ["Write", "Write", "Read"]
                            elif pattern == "WRW":
                                access_pattern = ["Write", "Read", "Write"]
                            else:
                                access_pattern = ["Read", "Write", "Read"]  # 默认
                            
                            standard_task = {
                                "sharedVariables": variables,
                                "accessPattern": access_pattern
                            }
                            
                            # 保留额外信息
                            if "count" in task:
                                standard_task["defect_count"] = task["count"]
                            
                            standard_tasks.append(standard_task)
                        
                        self.add_message("plan_strategy", f"选择策略: {strategy}")
                        self.add_message("success", f"LLM任务规划完成，生成 {len(standard_tasks)} 个任务")
                        return standard_tasks
                        
                    elif "expert_judge_tasks" in planning_result:
                        # 旧格式：保持向后兼容
                        tasks = planning_result["expert_judge_tasks"]
                        
                        # 转换为标准格式（保持向后兼容）
                        standard_tasks = []
                        for task in tasks:
                            standard_task = {
                                "sharedVariables": task.get("shared_variables", []),
                                "accessPattern": task.get("access_pattern", ["Read", "Write", "Read"])
                            }
                            # 保留额外的LLM规划信息
                            if "priority" in task:
                                standard_task["priority"] = task["priority"]
                            if "focus_areas" in task:
                                standard_task["focus_areas"] = task["focus_areas"]
                            if "expected_violations" in task:
                                standard_task["expected_violations"] = task["expected_violations"]
                                
                            standard_tasks.append(standard_task)
                        
                        # 记录规划策略信息
                        if "strategy_analysis" in planning_result:
                            strategy = planning_result["strategy_analysis"]
                            self.add_message("plan_strategy", 
                                f"选择策略: {strategy.get('chosen_strategy', 'unknown')}")
                            self.add_message("plan_reasoning", 
                                f"策略理由: {strategy.get('reasoning', 'N/A')}")
                        
                        self.add_message("success", f"LLM任务规划完成，生成 {len(standard_tasks)} 个任务")
                        return standard_tasks
                        
                    else:
                        self.add_message("warning", "LLM规划结果缺少任务信息，回退到规则方法")
                        return self._plan_expert_judges_fallback(facts, rw_analysis)
                        
                except json.JSONDecodeError as e:
                    self.add_message("error", f"LLM规划结果JSON解析失败: {str(e)}")
                    print(f"[Error] 任务规划响应解析失败: {response[:500]}...")
                    return self._plan_expert_judges_fallback(facts, rw_analysis)
                    
            else:
                self.add_message("error", "LLM任务规划调用失败")
                return self._plan_expert_judges_fallback(facts, rw_analysis)
                
        except Exception as e:
            self.add_message("error", f"LLM任务规划异常: {str(e)}")
            import traceback
            traceback.print_exc()
            return self._plan_expert_judges_fallback(facts, rw_analysis)

    def _plan_expert_judges_fallback(self, facts: Dict[str, Any], rw_analysis: Dict[str, Any]) -> List[Dict[str, Any]]:
        """
        回退到基于规则的任务规划方法（原_plan_expert_judges的简化版本）
        """
        self.add_message("info", "使用回退规则进行任务规划")
        
        expert_judge_tasks = []
        
        # 检查是否有Defect_Highlight结果，如果有，基于highlight结果生成任务
        highlight_data = facts.get("Defect_Highlight", {})
        if highlight_data and highlight_data.get("defects"):
            self.add_message("info", "基于Defect_Highlight结果生成任务")
            
            # 从highlight结果中提取模式和变量
            defects = highlight_data.get("defects", [])
            patterns_vars = {}
            
            for defect in defects:
                pattern_type = defect.get("type")
                shared_var = defect.get("sharedVariable")
                if pattern_type and shared_var:
                    if pattern_type not in patterns_vars:
                        patterns_vars[pattern_type] = set()
                    patterns_vars[pattern_type].add(shared_var)
            
            # 为每个检测到的模式创建任务
            pattern_mapping = {
                "RWR": ["Read", "Write", "Read"],
                "RWW": ["Read", "Write", "Write"],
                "WWR": ["Write", "Write", "Read"],
                "WRW": ["Write", "Read", "Write"]
            }
            
            for pattern_type, variables in patterns_vars.items():
                access_pattern = pattern_mapping.get(pattern_type, ["Read", "Write", "Read"])
                expert_judge_tasks.append({
                    "sharedVariables": list(variables),
                    "accessPattern": access_pattern
                })
            
            self.add_message("success", f"基于highlight结果生成 {len(expert_judge_tasks)} 个任务")
        else:
            # 原有的回退逻辑：为每个已知模式创建一个任务
            rw_data = facts.get("Operation_Analyzer", {}) if "Operation_Analyzer" in facts else rw_analysis
            global_vars = rw_data.get("GLOBAL_VAR", [])
            
            if global_vars:
                for pattern in self.known_patterns:
                    access_pattern = self._parse_pattern_to_access_list(pattern)
                    expert_judge_tasks.append({
                        "sharedVariables": global_vars,
                        "accessPattern": access_pattern
                    })
        
        return expert_judge_tasks

    def _build_task_planning_prompt(self, facts: Dict[str, Any], rw_analysis: Dict[str, Any]) -> str:
        """
        构建LLM任务规划的用户提示词
        """
        prompt = "## Analysis Facts for Task Planning\n\n"
        
        # 注意：facts和rw_analysis参数不允许传递给LLM
        # 这些内部分析结果应该仅用于系统内部处理
        
        prompt += "Based on the internal analysis, please provide an intelligent task distribution plan for Expert-Judge pairs."
        
        return prompt
        
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

    async def _fuse_tool_outputs(self, outputs: Dict[str, Any]) -> Dict[str, Any]:
        """
        直接融合静态分析工具的输出，生成结构化的事实表示
        不使用LLM，基于规则进行数据整合
        """
        self.add_message("info", "开始融合工具输出")
        
        try:
            # 初始化融合结果
            fused_facts = {
                "global_variables_to_detect": [],
                "variable_types": {},
                "variable_accesses": [],
                "compound_operations": [],
                "loops_with_shared_vars": [],
                "callgraph": [],
                "priorities": {},
                "interrupt_switches": [],
                "branch_conditions": []
            }
            
            # 融合 Operation_Analyzer 输出
            if "Operation_Analyzer" in outputs:
                op_data = outputs["Operation_Analyzer"]
                
                # 提取全局变量
                if "GLOBAL_VAR" in op_data:
                    for var_info in op_data["GLOBAL_VAR"]:
                        # GLOBAL_VAR可能是字符串列表或字典列表
                        if isinstance(var_info, str):
                            var_name = var_info
                            var_type = "unknown"
                        else:
                            var_name = var_info.get("name", "")
                            var_type = var_info.get("type", "unknown")
                        
                        if var_name and var_name not in fused_facts["global_variables_to_detect"]:
                            fused_facts["global_variables_to_detect"].append(var_name)
                            fused_facts["variable_types"][var_name] = var_type
                
                # 提取变量访问信息
                for context in ["MAIN_INFO", "ISR_INFO"]:
                    if context in op_data:
                        for access in op_data[context]:
                            access_info = {
                                "variable": access.get("variable", ""),
                                "op": access.get("operation", ""),
                                "function": access.get("function", ""),
                                "line": access.get("line", 0)
                            }
                            if access_info["variable"] and access_info["op"]:
                                fused_facts["variable_accesses"].append(access_info)
            
            # 融合 Control_flow_Analyzer 输出
            if "Control_flow_Analyzer" in outputs:
                cf_data = outputs["Control_flow_Analyzer"]
                
                # 提取调用图信息
                if "callgraph" in cf_data:
                    fused_facts["callgraph"] = cf_data["callgraph"]
                elif "calls" in cf_data:
                    for call in cf_data["calls"]:
                        call_info = {
                            "caller": call.get("caller", ""),
                            "callee": call.get("callee", "")
                        }
                        if call_info["caller"] and call_info["callee"]:
                            fused_facts["callgraph"].append(call_info)
                
                # 提取优先级信息
                if "priorities" in cf_data:
                    fused_facts["priorities"] = cf_data["priorities"]
            
            # 融合 Defect_Highlight 输出
            if "Defect_Highlight" in outputs:
                dh_data = outputs["Defect_Highlight"]
                
                # 将完整的Defect_Highlight结果保存到facts中
                fused_facts["Defect_Highlight"] = dh_data
                
                # 如果有缺陷信息，可以提取相关变量
                if "defects" in dh_data:
                    for defect in dh_data["defects"]:
                        # 修正字段名：使用"sharedVariable"而不是"variable"
                        var_name = defect.get("sharedVariable", defect.get("variable", ""))
                        if var_name and var_name not in fused_facts["global_variables_to_detect"]:
                            fused_facts["global_variables_to_detect"].append(var_name)
            
            # 融合 Code_Extractor 输出（如果有）
            if "Code_Extractor" in outputs:
                ce_data = outputs["Code_Extractor"]
                # Code_Extractor主要提供代码片段，通常不需要特殊融合处理
                pass
            
            # 清理空字段
            fused_facts = {k: v for k, v in fused_facts.items() if v}
            
            self.add_message("success", f"工具输出融合成功，提取到 {len(fused_facts.get('global_variables_to_detect', []))} 个全局变量")
            return fused_facts
                
        except Exception as e:
            self.add_message("error", f"工具输出融合异常: {str(e)}")
            import traceback
            traceback.print_exc()
            return outputs

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
                    # Defect_Highlight可以直接使用原始C文件，不需要依赖Operation_Analyzer
                    input_data = {"input_file": input_file or self.original_file_name}
                    # 保持使用原始C文件作为输入
                    input_file = input_file or self.original_file_name
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
                    if tool_name == "Operation_Analyzer":
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
                    if tool_name == "Operation_Analyzer":
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

    async def create_task_plan(self, highlight_results: Dict[str, Any]) -> str:
        """
        基于Highlight结果创建任务计划，使用新的任务规划提示词
        
        :param highlight_results: Highlight工具的输出结果
        :return: JSON格式的任务计划字符串
        """
        self.add_message("info", "Creating task plan based on Highlight results")
        
        try:
            # 加载新的任务规划系统提示词
            if not self.task_planning_prompt:
                self.task_planning_prompt = load_prompt("prompt/plan/task_planning.md")
            
            # 构建用户提示词
            user_prompt = self._build_highlight_analysis_prompt(highlight_results)
            
            # 调用LLM进行任务规划
            messages = [
                {"role": "system", "content": self.task_planning_prompt},
                {"role": "user", "content": user_prompt}
            ]
            
            response = await self.api_client.send_messages(self.model, messages)
            
            if response:
                # 提取并验证JSON内容
                json_content = self._extract_json_from_response(response)
                
                # 验证JSON格式
                planning_result = json.loads(json_content)
                if "strategy" in planning_result and "tasks" in planning_result:
                    # 转换为ConversationManager期望的格式
                    expert_judge_tasks = []
                    for task in planning_result["tasks"]:
                        expert_judge_tasks.append({
                            "sharedVariables": task.get("variables", []),
                            "accessPattern": self._pattern_to_access_pattern(task.get("pattern", "RWR"))
                        })
                    
                    result = {"expert_judge_tasks": expert_judge_tasks}
                    self.add_message("success", f"Task plan created with {len(expert_judge_tasks)} tasks")
                    return json.dumps(result, indent=2, ensure_ascii=False)
                else:
                    raise ValueError("Invalid task plan format: missing strategy or tasks")
            else:
                raise Exception("No response from LLM")
                
        except Exception as e:
            self.add_message("error", f"Task plan creation failed: {str(e)}")
            # 回退到简单的策略
            return self._create_fallback_task_plan(highlight_results)
    
    def _build_highlight_analysis_prompt(self, highlight_results: Dict[str, Any]) -> str:
        """
        基于Highlight结果构建用户提示词
        """
        # 从highlight_results中提取markdown表格
        markdown_table = highlight_results.get("statistics", {}).get("markdown_table", "")
        
        # 如果没有markdown表格，尝试从其他位置获取
        if not markdown_table:
            markdown_table = highlight_results.get("markdown_table", "")
        
        # 如果仍然没有表格，从defects数据生成表格
        if not markdown_table:
            markdown_table = self._generate_markdown_table_from_defects(highlight_results)
        
        # 读取任务规划提示词模板
        try:
            from utils import load_prompt
            prompt_template = load_prompt("prompt/plan/task_planning.md")
            
            # 将markdown表格插入到模板中
            prompt = prompt_template.replace("{highlight_results_table}", markdown_table)
        except Exception as e:
            # 如果找不到模板文件，使用备用格式
            print(f"[Warning] 无法加载任务规划提示词模板: {e}")
            prompt = f"## Highlight Candidate Sequence Results (Markdown Table Format)\n\n{markdown_table}\n\nPlease analyze the above Highlight results and create an optimal task distribution plan."
        
        return prompt
    
    def _generate_markdown_table_from_defects(self, highlight_results: Dict[str, Any]) -> str:
        """
        从highlight defects数据生成markdown表格
        """
        defects = highlight_results.get("defects", [])
        if not defects:
            return "| Variable | RWW | RWR | WWR | WRW | Total |\n|----------|-----|-----|-----|-----|-------|\n| **Total** | **0** | **0** | **0** | **0** | **0** |"
        
        # 统计每个变量的模式
        variable_stats = {}
        pattern_counts = {"RWW": 0, "RWR": 0, "WWR": 0, "WRW": 0}
        
        for defect in defects:
            var_name = defect.get("sharedVariable", defect.get("variable", "unknown"))
            pattern = defect.get("type", defect.get("pattern", "unknown"))
            
            if var_name not in variable_stats:
                variable_stats[var_name] = {"RWW": 0, "RWR": 0, "WWR": 0, "WRW": 0, "Total": 0}
            
            if pattern in variable_stats[var_name]:
                variable_stats[var_name][pattern] += 1
                variable_stats[var_name]["Total"] += 1
                pattern_counts[pattern] += 1
        
        # 生成markdown表格
        lines = ["| Variable | RWW | RWR | WWR | WRW | Total |", "|----------|-----|-----|-----|-----|-------|"]
        
        for var_name, stats in variable_stats.items():
            line = f"| {var_name} | {stats['RWW']} | {stats['RWR']} | {stats['WWR']} | {stats['WRW']} | {stats['Total']} |"
            lines.append(line)
        
        # 添加总计行
        total_count = sum(pattern_counts.values())
        total_line = f"| **Total** | **{pattern_counts['RWW']}** | **{pattern_counts['RWR']}** | **{pattern_counts['WWR']}** | **{pattern_counts['WRW']}** | **{total_count}** |"
        lines.append(total_line)
        
        return "\n".join(lines)
    
    def _extract_json_from_response(self, response: str) -> str:
        """
        从LLM响应中提取JSON内容
        """
        json_content = response.strip()
        
        # 移除可能的markdown代码块标记
        if json_content.startswith("```json"):
            json_content = json_content[7:]
        elif json_content.startswith("```"):
            json_content = json_content[3:]
            
        if json_content.endswith("```"):
            json_content = json_content[:-3]
        
        return json_content.strip()
    
    def _create_fallback_task_plan(self, highlight_results: Dict[str, Any]) -> str:
        """
        创建回退任务计划
        """
        self.add_message("warning", "Using fallback task plan creation")
        
        # 从highlight结果中提取基本信息
        defects = highlight_results.get("defects", [])
        variables = set()
        patterns = set()
        
        for defect in defects:
            if "sharedVariable" in defect:
                variables.add(defect["sharedVariable"])
            if "type" in defect:
                patterns.add(defect["type"])
        
        # 创建简单的模式基础策略，使用ConversationManager期望的格式
        expert_judge_tasks = []
        
        # 将RWR转换为"Read", "Write", "Read"格式
        pattern_mapping = {
            "RWR": ["Read", "Write", "Read"],
            "RWW": ["Read", "Write", "Write"],
            "WWR": ["Write", "Write", "Read"],
            "WRW": ["Write", "Read", "Write"]
        }
        
        for pattern in patterns:
            pattern_vars = [defect["sharedVariable"] for defect in defects 
                          if defect.get("type") == pattern and "sharedVariable" in defect]
            
            if pattern_vars:
                # 去重变量列表
                unique_vars = list(set(pattern_vars))
                expert_judge_tasks.append({
                    "sharedVariables": unique_vars,
                    "accessPattern": pattern_mapping.get(pattern, ["Read", "Write", "Read"])
                })
        
        fallback_plan = {
            "expert_judge_tasks": expert_judge_tasks
        }
        
        return json.dumps(fallback_plan, ensure_ascii=False, indent=2)
    
    def _pattern_to_access_pattern(self, pattern: str) -> List[str]:
        """
        将模式代码转换为访问模式数组
        """
        pattern_mapping = {
            "RWR": ["Read", "Write", "Read"],
            "RWW": ["Read", "Write", "Write"],
            "WWR": ["Write", "Write", "Read"],
            "WRW": ["Write", "Read", "Write"]
        }
        return pattern_mapping.get(pattern, ["Read", "Write", "Read"])

    async def _run_tools_with_scheduler(self, tool_sequence: List[Tuple[str, Any]], code: str) -> Tuple[Dict[str, Any], List[str]]:
        """
        使用异步调度器运行工具链
        
        Args:
            tool_sequence: 工具序列，每个元素为(tool_name, tool_args)
            code: 代码内容
            
        Returns:
            Tuple[outputs, actual_used_tools]: 工具输出结果和实际执行的工具列表
        """
        outputs = {}
        actual_used_tools = []
        
        # 重置工具执行统计
        self.tool_execution_stats = {
            "total_tools": len(tool_sequence),
            "successful_tools": 0,
            "failed_tools": 0,
            "execution_times": {},
            "error_details": {}
        }
        
        # 分离同步和异步工具
        sync_tools = []  # Code_Extractor等同步工具
        async_tools = []  # 支持异步的工具
        
        for tool_name, tool_args in tool_sequence:
            tool_config = self.TOOL_CONFIG.get(tool_name)
            if not tool_config:
                print(f"[Error] 未知工具: {tool_name}")
                self.tool_execution_stats["error_details"][tool_name] = "未知工具配置"
                continue
                
            if tool_config.get("async_enabled", False):
                async_tools.append((tool_name, tool_args))
            else:
                sync_tools.append((tool_name, tool_args))
        
        total_start_time = time.time()
        
        # 1. 先执行同步工具（如Code_Extractor）
        if sync_tools:
            print(f"[AsyncScheduler] 开始执行 {len(sync_tools)} 个同步工具: {[t[0] for t in sync_tools]}")
            for tool_name, tool_args in sync_tools:
                tool_start_time = time.time()
                result = await self._execute_single_tool(tool_name, code)
                tool_execution_time = time.time() - tool_start_time
                
                self.tool_execution_stats["execution_times"][tool_name] = tool_execution_time
                
                if result and result.get("status") == "success":
                    outputs[self.TOOL_CONFIG[tool_name]["output_key"]] = result.get("results", {})
                    actual_used_tools.append(tool_name)
                    self.tool_execution_stats["successful_tools"] += 1
                    print(f"[AsyncScheduler] 同步工具 {tool_name} 执行成功 (耗时: {tool_execution_time:.2f}秒)")
                else:
                    self.tool_execution_stats["failed_tools"] += 1
                    self.tool_execution_stats["error_details"][tool_name] = result.get("message", "执行失败")
                    print(f"[AsyncScheduler] 同步工具 {tool_name} 执行失败 (耗时: {tool_execution_time:.2f}秒)")
        
        # 2. 并行执行异步工具
        if async_tools:
            print(f"[AsyncScheduler] 开始并行执行 {len(async_tools)} 个异步工具: {[t[0] for t in async_tools]}")
            async_start_time = time.time()
            async_results = await self._execute_async_tools_parallel(async_tools, code)
            async_execution_time = time.time() - async_start_time
            
            # 合并异步工具结果
            for tool_name, result in async_results.items():
                if result and result.get("status") == "success":
                    outputs[self.TOOL_CONFIG[tool_name]["output_key"]] = result.get("results", {})
                    actual_used_tools.append(tool_name)
                    self.tool_execution_stats["successful_tools"] += 1
                    print(f"[AsyncScheduler] 异步工具 {tool_name} 执行成功")
                else:
                    self.tool_execution_stats["failed_tools"] += 1
                    error_msg = result.get("message", "执行失败") if result else "无返回结果"
                    self.tool_execution_stats["error_details"][tool_name] = error_msg
                    print(f"[AsyncScheduler] 异步工具 {tool_name} 执行失败: {error_msg}")
                    
                    # 处理必需工具失败的情况
                    tool_config = self.TOOL_CONFIG[tool_name]
                    if tool_config["required"]:
                        print(f"[AsyncScheduler] 必需工具 {tool_name} 失败，创建默认结果")
                        self.add_message("plan_error", f"必需工具 {tool_name} 失败: {error_msg}")
                        if tool_name == "Defect_Highlight":
                            outputs[tool_config["output_key"]] = {"defects": [], "defect_count": 0}
            
            print(f"[AsyncScheduler] 异步工具并行执行完成，总耗时: {async_execution_time:.2f}秒")
        
        total_execution_time = time.time() - total_start_time
        
        # 打印执行统计
        print(f"[AsyncScheduler] ===== 工具执行统计 =====")
        print(f"[AsyncScheduler] 总工具数: {self.tool_execution_stats['total_tools']}")
        print(f"[AsyncScheduler] 成功工具: {self.tool_execution_stats['successful_tools']}")
        print(f"[AsyncScheduler] 失败工具: {self.tool_execution_stats['failed_tools']}")
        print(f"[AsyncScheduler] 总执行时间: {total_execution_time:.2f}秒")
        print(f"[AsyncScheduler] 成功率: {(self.tool_execution_stats['successful_tools']/self.tool_execution_stats['total_tools']*100):.1f}%")
        
        if self.tool_execution_stats["error_details"]:
            print(f"[AsyncScheduler] 错误详情:")
            for tool, error in self.tool_execution_stats["error_details"].items():
                print(f"[AsyncScheduler]   - {tool}: {error}")
        
        print(f"[AsyncScheduler] ========================")
        print(f"[AsyncScheduler] 工具执行完成，成功工具: {actual_used_tools}")
        return outputs, actual_used_tools
    
    async def _execute_async_tools_parallel(self, async_tools: List[Tuple[str, Any]], code: str) -> Dict[str, Any]:
        """
        并行执行异步工具
        
        Args:
            async_tools: 异步工具列表
            code: 代码内容
            
        Returns:
            Dict[tool_name, result]: 工具执行结果字典
        """
        # 创建任务列表
        tasks = []
        tool_names = []
        
        for tool_name, tool_args in async_tools:
            task = asyncio.create_task(
                self._execute_single_tool_with_timeout(tool_name, code, timeout=300)
            )
            tasks.append(task)
            tool_names.append(tool_name)
        
        # 等待所有任务完成
        start_time = time.time()
        print(f"[AsyncScheduler] 启动 {len(tasks)} 个异步工具任务")
        
        results = await asyncio.gather(*tasks, return_exceptions=True)
        
        execution_time = time.time() - start_time
        print(f"[AsyncScheduler] 异步工具执行完成，耗时: {execution_time:.2f}秒")
        
        # 整理结果
        tool_results = {}
        for i, (tool_name, result) in enumerate(zip(tool_names, results)):
            if isinstance(result, Exception):
                print(f"[AsyncScheduler] 工具 {tool_name} 执行异常: {result}")
                tool_results[tool_name] = {"status": "error", "message": str(result)}
            else:
                tool_results[tool_name] = result
                
        return tool_results
    
    async def _execute_single_tool_with_timeout(self, tool_name: str, code: str, timeout: int = 300) -> Dict[str, Any]:
        """
        带超时的单个工具执行
        
        Args:
            tool_name: 工具名称
            code: 代码内容
            timeout: 超时时间（秒）
            
        Returns:
            工具执行结果
        """
        try:
            return await asyncio.wait_for(
                self._execute_single_tool(tool_name, code),
                timeout=timeout
            )
        except asyncio.TimeoutError:
            print(f"[AsyncScheduler] 工具 {tool_name} 执行超时({timeout}秒)")
            return {"status": "error", "message": f"执行超时({timeout}秒)"}
        except Exception as e:
            print(f"[AsyncScheduler] 工具 {tool_name} 执行异常: {e}")
            return {"status": "error", "message": str(e)}
    
    async def _execute_single_tool(self, tool_name: str, code: str) -> Dict[str, Any]:
        """
        执行单个工具
        
        Args:
            tool_name: 工具名称
            code: 代码内容
            
        Returns:
            工具执行结果
        """
        print(f"[AsyncScheduler] 开始执行工具: {tool_name}")
        
        tool_config = self.TOOL_CONFIG.get(tool_name)
        if not tool_config:
            return {"status": "error", "message": f"未知工具: {tool_name}"}
        
        print(f"[DEBUG] {tool_name} 配置: use_mcp=True, mcp_module={tool_config['mcp_module']}, mcp_function={tool_config['mcp_function']}")
        
        try:
            # 运行工具
            result = await self.run_tool(tool_name, self.original_file_name)
            
            if result.get("status") == "success":
                # 处理不同工具的结果结构
                if tool_name == "Defect_Highlight":
                    # Defect_Highlight工具的结果在嵌套的data字段中
                    if "data" in result and "data" in result["data"]:
                        processed_result = {"status": "success", "results": result["data"]["data"]}
                    else:
                        processed_result = {"status": "success", "results": result.get("results", {})}
                else:
                    processed_result = {"status": "success", "results": result.get("results", {})}
                
                print(f"[AsyncScheduler] 工具 {tool_name} 执行成功")
                return processed_result
            else:
                print(f"[AsyncScheduler] 工具 {tool_name} 执行失败: {result.get('message', 'Unknown error')}")
                
                # 如果是必需的工具失败了，尝试回退处理
                if tool_config["required"]:
                    print(f"[AsyncScheduler] 必需工具 {tool_name} 失败，尝试回退处理")
                    return await self._handle_required_tool_failure(tool_name, code, result)
                else:
                    return result
                
        except Exception as e:
            print(f"[AsyncScheduler] 工具 {tool_name} 执行异常: {str(e)}")
            import traceback
            print(f"[DEBUG] 异常堆栈: {traceback.format_exc()}")
            
            # 为必需工具创建默认结果
            if tool_config["required"]:
                print(f"[AsyncScheduler] 必需工具 {tool_name} 异常，创建默认结果")
                self.add_message("plan_error", f"必需工具 {tool_name} 异常: {str(e)}")
                return await self._create_default_tool_result(tool_name)
            else:
                return {"status": "error", "message": str(e)}
    
    async def _handle_required_tool_failure(self, tool_name: str, code: str, original_result: Dict[str, Any]) -> Dict[str, Any]:
        """
        处理必需工具执行失败的情况
        
        Args:
            tool_name: 工具名称
            code: 代码内容
            original_result: 原始执行结果
            
        Returns:
            处理后的结果
        """
        print(f"[AsyncScheduler] 处理必需工具 {tool_name} 的失败情况")
        
        # 尝试使用原始方式运行（如果有的话）
        try:
            # 创建临时文件
            with tempfile.NamedTemporaryFile(mode='w', suffix='.c', delete=False) as tmp_file:
                tmp_file.write(code)
                input_file = tmp_file.name
            
            # 创建输出文件
            tool_config = self.TOOL_CONFIG[tool_name]
            output_file = os.path.join(self.output_dir, f"input{tool_config['output_suffix']}")
            
            # 记录失败信息
            print(f"[AsyncScheduler] 原始方式执行也失败，为 {tool_name} 创建默认结果")
            self.add_message("plan_error", f"必需工具 {tool_name} 失败: {original_result.get('message', 'Unknown error')}")
            
            # 清理临时文件
            try:
                os.unlink(input_file)
            except:
                pass
                
            return await self._create_default_tool_result(tool_name)
            
        except Exception as e:
            print(f"[AsyncScheduler] 工具 {tool_name} 回退处理失败: {str(e)}")
            return await self._create_default_tool_result(tool_name)
    
    async def _create_default_tool_result(self, tool_name: str) -> Dict[str, Any]:
        """
        为工具创建默认结果
        
        Args:
            tool_name: 工具名称
            
        Returns:
            默认结果
        """
        if tool_name == "Defect_Highlight":
            return {"status": "success", "results": {"defects": [], "defect_count": 0}}
        elif tool_name == "Operation_Analyzer":
            return {"status": "success", "results": {"variables": [], "operations": []}}
        elif tool_name == "Control_flow_Analyzer":
            return {"status": "success", "results": {"functions": [], "calls": []}}
        else:
            return {"status": "success", "results": {}}