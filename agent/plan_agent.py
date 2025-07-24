import json
import re
import sys
import os
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
            "description": "高亮潜在的缺陷位置"
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
        
        # 只记录日志，但不修改工具序列，严格遵循LLM的推理顺序
        if missing_required_tools:
            self.add_message("plan_warning", f"注意：必需的工具 {', '.join(missing_required_tools)} 未在LLM计划中，但仍将严格按照LLM推理顺序执行工具链")
        
        # 按照计划顺序执行工具
        for tool_name, tool_params in tool_sequence:
            print("tool_name:"+tool_name)
            if tool_name not in self.TOOL_CONFIG:
                self.add_message("plan_warning", f"未知工具 {tool_name}，已跳过")
                continue
                
            tool_config = self.TOOL_CONFIG[tool_name]
            # 添加调试信息
            if tool_name == "Read_Write_Analyzer":
                print(f"[DEBUG] Read_Write_Analyzer 配置: use_mcp={tool_config.get('use_mcp', False)}, mcp_module={tool_config.get('mcp_module', 'None')}, mcp_function={tool_config.get('mcp_function', 'None')}")
            out_path = "input.c".replace('.c', tool_config["output_suffix"])
            
            # 单独处理MCP工具
            if tool_name == "Read_Write_Analyzer" and tool_config.get("use_mcp", False):
                # 在主try-except块外处理MCP工具
                print("[DEBUG] 在主try-except块外处理MCP工具")
                
                try:
                    # 使用MCP装饰器方式调用工具
                    import importlib.util
                    import sys
                    import os
                    
                    # 构建模块路径
                    module_path = os.path.abspath(os.path.join(tool_config["path"], f"{tool_config['mcp_module']}.py"))
                    print(f"[Read_Write_Analyzer MCP] 加载模块: {module_path}")
                    print(f"[DEBUG] 模块文件是否存在: {os.path.exists(module_path)}")
                    
                    # 检查当前工作目录
                    print(f"[DEBUG] 当前工作目录: {os.getcwd()}")
                    
                    # 检查模块所在目录
                    module_dir = os.path.dirname(module_path)
                    print(f"[DEBUG] 模块所在目录: {module_dir}")
                    print(f"[DEBUG] 模块所在目录是否存在: {os.path.exists(module_dir)}")
                    
                    # 列出模块所在目录的文件
                    if os.path.exists(module_dir):
                        print(f"[DEBUG] 模块所在目录文件列表: {os.listdir(module_dir)}")
                    
                    # 检查模块文件是否存在
                    if not os.path.exists(module_path):
                        print(f"[Read_Write_Analyzer MCP] 错误: 模块文件不存在: {module_path}")
                        self.add_message("plan_error", f"MCP模块文件不存在: {module_path}")
                        raise Exception(f"MCP模块文件不存在: {module_path}")
                    
                    # 动态加载模块
                    print(f"[DEBUG] 尝试加载模块: {module_path}")
                    spec = importlib.util.spec_from_file_location(tool_config['mcp_module'], module_path)
                    if spec is None:
                        print(f"[DEBUG] 无法创建spec，模块路径可能有问题: {module_path}")
                        raise ImportError(f"无法创建spec，模块路径可能有问题: {module_path}")
                    module = importlib.util.module_from_spec(spec)
                    sys.modules[tool_config['mcp_module']] = module
                    print(f"[DEBUG] 执行模块: {module}")
                    spec.loader.exec_module(module)
                    
                    # 检查模块是否包含指定的函数
                    func_name = tool_config['mcp_function']
                    print(f"[DEBUG] 检查模块是否包含函数: {func_name}")
                    if hasattr(module, func_name):
                        print(f"[DEBUG] 模块包含函数: {func_name}")
                    else:
                        print(f"[DEBUG] 模块不包含函数: {func_name}")
                        print(f"[DEBUG] 模块的属性: {dir(module)}")
                        raise AttributeError(f"模块不包含函数: {func_name}")
                    
                    # 获取函数
                    mcp_function = getattr(module, tool_config['mcp_function'])
                    
                    # 检查函数是否有MCP装饰器
                    if hasattr(mcp_function, 'is_mcp_tool') and mcp_function.is_mcp_tool:
                        print(f"[Read_Write_Analyzer MCP] 调用MCP函数: {tool_config['mcp_function']}")
                        self.add_message("plan_info", f"调用MCP函数: {tool_config['mcp_function']}")
                        
                        # 创建临时C文件来保存代码内容
                        import tempfile
                        
                        # 设置正确的文件路径
                        if self.original_file_name:
                            # 如果传入了原始文件名，优先使用传入的
                            original_file_name = self.original_file_name
                        else:
                            # 尝试从代码内容中提取文件名
                            file_pattern = r'svp_\w+_\d+_\d+'
                            file_match = re.search(file_pattern, code)
                            if file_match:
                                file_base = file_match.group(0)
                                # 构建完整路径
                                original_file_name = f"/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/{file_base[:11]}/{file_base}.c"
                                print(f"[LLVM处理] 从代码内容提取文件名: {file_base}")
                            else:
                                # 如果无法提取，使用默认路径
                                original_file_name = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/svp_simple_005_001.c"
                                print(f"[LLVM处理] 使用默认文件路径")
                        
                        # 确保使用绝对路径
                        original_file_name = os.path.abspath(original_file_name)
                        
                        # 检查LLVM IR文件是否存在于Racebench_2.1目录中
                        racebench_dir = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1"
                        file_base = os.path.basename(original_file_name).replace('.c', '')
                        
                        # 检查文件名是否符合svp_simple_XXX_YYY格式
                        if file_base.startswith('svp_simple_'):
                            # 提取svp_simple_XXX部分
                            prefix = 'svp_simple_' + file_base.split('_')[2]
                            file_dir = os.path.join(racebench_dir, prefix)
                        else:
                            # 使用默认目录
                            file_dir = os.path.join(racebench_dir, 'svp_simple_005')
                            
                        print(f"[LLVM处理] 使用目录: {file_dir}")
                        
                        ll_file_in_racebench = os.path.join(file_dir, f"{file_base}.ll")
                        opt_ll_file_in_racebench = os.path.join(file_dir, f"{file_base}-opt.ll")
                        
                        print(f"[LLVM处理] 检查Racebench_2.1目录中的LLVM IR文件: {ll_file_in_racebench}")
                        found_llvm_ir = False
                        if os.path.exists(ll_file_in_racebench):
                            print(f"[LLVM处理] 在Racebench_2.1目录中找到LLVM IR文件: {ll_file_in_racebench}")
                            ll_file = ll_file_in_racebench
                            
                            # 检查优化后的LLVM IR文件
                            if os.path.exists(opt_ll_file_in_racebench):
                                print(f"[LLVM处理] 在Racebench_2.1目录中找到优化后的LLVM IR文件: {opt_ll_file_in_racebench}")
                                opt_ll_file = opt_ll_file_in_racebench
                            else:
                                print(f"[LLVM处理] 在Racebench_2.1目录中未找到优化后的LLVM IR文件，使用未优化的文件")
                                opt_ll_file = ll_file_in_racebench
                            
                            # 使用找到的LLVM IR文件
                            print(f"[LLVM处理] 使用找到的LLVM IR文件: {opt_ll_file}")
                            found_llvm_ir = True
                        
                        # 如果在Racebench_2.1目录中找到了LLVM IR文件，直接使用它
                        if found_llvm_ir:
                            # 调用MCP函数
                            # 使用绝对路径
                            abs_out_path = os.path.abspath(out_path)
                            print(f"[DEBUG] 调用MCP函数: {mcp_function.__name__}({opt_ll_file}, {abs_out_path})")
                            result = mcp_function(opt_ll_file, abs_out_path)
                            print(f"[DEBUG] MCP函数返回结果: {result}")
                            
                            # 检查结果
                            if result['status'] == 'success':
                                print(f"[Read_Write_Analyzer MCP] MCP函数执行成功")
                                self.add_message("plan_success", f"MCP函数执行成功")
                                
                                # 检查输出文件是否存在
                                if os.path.exists(abs_out_path):
                                    with open(abs_out_path, 'r') as f:
                                        outputs[tool_config["output_key"]] = json.load(f)
                                    actual_used_tools.append(tool_name)
                                    self.add_message("plan_success", f"{tool_name} 执行成功")
                                else:
                                    print(f"[Read_Write_Analyzer MCP] 警告: 输出文件不存在: {abs_out_path}")
                                    self.add_message("plan_warning", f"输出文件不存在: {abs_out_path}")
                                    outputs[tool_config["output_key"]] = self._create_default_output(code)
                                    actual_used_tools.append(tool_name)
                                
                                # 跳过后续处理
                                continue
                            else:
                                print(f"[Read_Write_Analyzer MCP] MCP函数执行失败: {result.get('message', '')}")
                                self.add_message("plan_warning", f"MCP函数执行失败: {result.get('message', '')}")
                                raise Exception(f"MCP函数执行失败: {result.get('message', '')}")
                        
                        # 如果在Racebench_2.1目录中没有找到LLVM IR文件，尝试使用原始文件路径
                        opt_ll_file = original_file_name.replace('.c', '-opt.ll')
                        
                        # 检查优化后的LLVM IR文件是否存在
                        if not os.path.exists(opt_ll_file):
                            print(f"[Read_Write_Analyzer MCP] 警告: 优化后的LLVM IR文件不存在: {opt_ll_file}")
                            # 尝试使用未优化的LLVM IR文件
                            ll_file = original_file_name.replace('.c', '.ll')
                            if not os.path.exists(ll_file):
                                print(f"[Read_Write_Analyzer MCP] 警告: LLVM IR文件不存在，尝试生成: {ll_file}")
                                
                                # 尝试生成LLVM IR文件
                                try:
                                    # 确保原始C文件存在
                                    if not os.path.exists(original_file_name):
                                        print(f"[Read_Write_Analyzer MCP] 错误: 原始C文件不存在: {original_file_name}")
                                        self.add_message("plan_error", f"原始C文件不存在: {original_file_name}")
                                        raise Exception(f"原始C文件不存在: {original_file_name}")
                                    
                                    # 生成临时C文件
                                    import tempfile
                                    with tempfile.NamedTemporaryFile(suffix='.c', delete=False) as tmp_file:
                                        # 确保写入的是纯C代码，去掉可能的行号
                                        clean_code = code
                                        # 检查是否包含行号（如"1: "这样的格式）
                                        if re.search(r'^\d+:\s', code.split('\n')[0]):
                                            # 去掉行号
                                            clean_code = '\n'.join([line.split(':', 1)[1].lstrip() if ':' in line and line.split(':', 1)[0].strip().isdigit() else line for line in code.split('\n')])
                                        tmp_file.write(clean_code.encode('utf-8'))
                                        tmp_c_file = tmp_file.name
                                    
                                    print(f"[Read_Write_Analyzer MCP] 创建临时C文件: {tmp_c_file}")
                                    
                                    # 使用clang生成LLVM IR
                                    import subprocess
                                    clang_cmd = ["clang", "-O0", "-g", "-emit-llvm", "-S", tmp_c_file, "-o", ll_file]
                                    print(f"[Read_Write_Analyzer MCP] 执行命令: {' '.join(clang_cmd)}")
                                    
                                    result = subprocess.run(clang_cmd, capture_output=True, text=True)
                                    if result.returncode == 0:
                                        print(f"[Read_Write_Analyzer MCP] 成功生成LLVM IR文件: {ll_file}")
                                    else:
                                        print(f"[Read_Write_Analyzer MCP] 生成LLVM IR文件失败: {result.stderr}")
                                        self.add_message("plan_error", f"生成LLVM IR文件失败: {result.stderr}")
                                        raise Exception(f"生成LLVM IR文件失败: {result.stderr}")
                                    
                                    # 使用opt优化LLVM IR
                                    opt_cmd = ["opt", "-O2", ll_file, "-S", "-o", opt_ll_file]
                                    print(f"[Read_Write_Analyzer MCP] 执行命令: {' '.join(opt_cmd)}")
                                    
                                    result = subprocess.run(opt_cmd, capture_output=True, text=True)
                                    if result.returncode == 0:
                                        print(f"[Read_Write_Analyzer MCP] 成功优化LLVM IR文件: {opt_ll_file}")
                                    else:
                                        print(f"[Read_Write_Analyzer MCP] 优化LLVM IR文件失败: {result.stderr}")
                                        self.add_message("plan_warning", f"优化LLVM IR文件失败: {result.stderr}")
                                        # 如果优化失败，使用未优化的LLVM IR
                                        opt_ll_file = ll_file
                                    
                                    # 清理临时文件
                                    os.unlink(tmp_c_file)
                                except Exception as e:
                                    print(f"[Read_Write_Analyzer MCP] 生成LLVM IR文件异常: {str(e)}")
                                    self.add_message("plan_error", f"生成LLVM IR文件异常: {str(e)}")
                                    raise Exception(f"生成LLVM IR文件异常: {str(e)}")
                            else:
                                # 使用未优化的LLVM IR
                                opt_ll_file = ll_file
                        
                        # 调用MCP函数
                        print(f"[DEBUG] 调用MCP函数: {mcp_function.__name__}({opt_ll_file}, {out_path})")
                        result = mcp_function(opt_ll_file, out_path)
                        print(f"[DEBUG] MCP函数返回结果: {result}")
                        
                        # 检查结果
                        if result['status'] == 'success':
                            print(f"[Read_Write_Analyzer MCP] MCP函数执行成功")
                            self.add_message("plan_success", f"MCP函数执行成功")
                            
                            # 检查输出文件是否存在
                            if os.path.exists(out_path):
                                with open(out_path, 'r') as f:
                                    outputs[tool_config["output_key"]] = json.load(f)
                                actual_used_tools.append(tool_name)
                                self.add_message("plan_success", f"{tool_name} 执行成功")
                            else:
                                print(f"[Read_Write_Analyzer MCP] 警告: 输出文件不存在: {out_path}")
                                self.add_message("plan_warning", f"输出文件不存在: {out_path}")
                                outputs[tool_config["output_key"]] = self._create_default_output(code)
                                actual_used_tools.append(tool_name)
                            
                            # 跳过后续处理
                            continue
                        else:
                            print(f"[Read_Write_Analyzer MCP] MCP函数执行失败: {result.get('message', '')}")
                            self.add_message("plan_warning", f"MCP函数执行失败: {result.get('message', '')}")
                            raise Exception(f"MCP函数执行失败: {result.get('message', '')}")
                    else:
                        print(f"[Read_Write_Analyzer MCP] 警告: 函数没有MCP装饰器")
                        self.add_message("plan_warning", f"函数没有MCP装饰器")
                except Exception as e:
                    print(f"[Read_Write_Analyzer MCP] 加载模块异常: {str(e)}")
                    self.add_message("plan_error", f"加载MCP模块异常: {str(e)}")
                    import traceback
                    print(f"[DEBUG] 异常堆栈: {traceback.format_exc()}")
                
                # 如果MCP方式失败，回退到原始方式
                print(f"[Read_Write_Analyzer MCP] 回退到原始方式")
                self.add_message("plan_warning", f"回退到原始方式")
                
            elif tool_name == "Control_flow_Analyzer" and tool_config.get("use_mcp", False):
                # 在主try-except块外处理MCP工具
                print("[DEBUG] 在主try-except块外处理Control_flow_Analyzer MCP工具")
                
                try:
                    # 使用MCP装饰器方式调用工具
                    import importlib.util
                    import sys
                    import os
                    
                    # 构建模块路径
                    module_path = os.path.abspath(os.path.join(tool_config["path"], f"{tool_config['mcp_module']}.py"))
                    print(f"[{tool_name} MCP] 加载模块: {module_path}")
                    print(f"[DEBUG] 模块文件是否存在: {os.path.exists(module_path)}")
                    
                    # 检查当前工作目录
                    print(f"[DEBUG] 当前工作目录: {os.getcwd()}")
                    
                    # 检查模块所在目录
                    module_dir = os.path.dirname(module_path)
                    print(f"[DEBUG] 模块所在目录: {module_dir}")
                    print(f"[DEBUG] 模块所在目录是否存在: {os.path.exists(module_dir)}")
                    
                    # 列出模块所在目录的文件
                    if os.path.exists(module_dir):
                        print(f"[DEBUG] 模块所在目录文件列表: {os.listdir(module_dir)}")
                    
                    # 检查模块文件是否存在
                    if not os.path.exists(module_path):
                        print(f"[{tool_name} MCP] 错误: 模块文件不存在: {module_path}")
                        self.add_message("plan_error", f"MCP模块文件不存在: {module_path}")
                        raise Exception(f"MCP模块文件不存在: {module_path}")
                    
                    # 动态加载模块
                    print(f"[DEBUG] 尝试加载模块: {module_path}")
                    spec = importlib.util.spec_from_file_location(tool_config['mcp_module'], module_path)
                    if spec is None:
                        print(f"[DEBUG] 无法创建spec，模块路径可能有问题: {module_path}")
                        raise ImportError(f"无法创建spec，模块路径可能有问题: {module_path}")
                    module = importlib.util.module_from_spec(spec)
                    sys.modules[tool_config['mcp_module']] = module
                    print(f"[DEBUG] 执行模块: {module}")
                    spec.loader.exec_module(module)
                    
                    # 检查模块是否包含指定的函数
                    func_name = tool_config['mcp_function']
                    print(f"[DEBUG] 检查模块是否包含函数: {func_name}")
                    if hasattr(module, func_name):
                        print(f"[DEBUG] 模块包含函数: {func_name}")
                    else:
                        print(f"[DEBUG] 模块不包含函数: {func_name}")
                        print(f"[DEBUG] 模块的属性: {dir(module)}")
                        raise AttributeError(f"模块不包含函数: {func_name}")
                    
                    # 获取函数
                    mcp_function = getattr(module, tool_config['mcp_function'])
                    
                    # 检查函数是否有MCP装饰器
                    if hasattr(mcp_function, 'is_mcp_tool') and mcp_function.is_mcp_tool:
                        print(f"[{tool_name} MCP] 调用MCP函数: {tool_config['mcp_function']}")
                        self.add_message("plan_info", f"调用MCP函数: {tool_config['mcp_function']}")
                        
                        # 直接使用原始文件
                        is_temp_file = False  # 标记是否是临时文件
                        if self.original_file_name and os.path.exists(self.original_file_name):
                            c_file = self.original_file_name
                            print(f"[{tool_name} MCP] 使用原始C文件: {c_file}")
                        else:
                            # 如果没有原始文件，则创建临时文件
                            import tempfile
                            
                            # 创建临时文件保存C代码
                            with tempfile.NamedTemporaryFile(suffix='.c', delete=False) as tmp_file:
                                # 确保写入的是纯C代码，去掉可能的行号
                                clean_code = code
                                # 检查是否包含行号（如"1: "这样的格式）
                                if re.search(r'^\d+:\s', code.split('\n')[0]):
                                    # 去掉行号
                                    clean_code = '\n'.join([line.split(':', 1)[1].lstrip() if ':' in line and line.split(':', 1)[0].strip().isdigit() else line for line in code.split('\n')])
                                tmp_file.write(clean_code.encode('utf-8'))
                                c_file = tmp_file.name
                                is_temp_file = True  # 标记为临时文件
                            
                            print(f"[{tool_name} MCP] 创建临时C文件: {c_file}")
                        
                        # 确保输出目录存在
                        abs_out_path = os.path.abspath(out_path)
                        os.makedirs(os.path.dirname(abs_out_path), exist_ok=True)
                        
                        # 调用MCP函数
                        print(f"[DEBUG] 调用MCP函数: {mcp_function.__name__}({c_file}, {abs_out_path})")
                        result = mcp_function(c_file, abs_out_path)
                        print(f"[DEBUG] MCP函数返回结果: {result}")
                        
                        # 检查结果
                        if result['status'] == 'success':
                            print(f"[{tool_name} MCP] MCP函数执行成功")
                            self.add_message("plan_success", f"MCP函数执行成功")
                            
                            # 检查输出文件是否存在
                            if os.path.exists(abs_out_path):
                                with open(abs_out_path, 'r') as f:
                                    outputs[tool_config["output_key"]] = json.load(f)
                                actual_used_tools.append(tool_name)
                                self.add_message("plan_success", f"{tool_name} 执行成功")
                            else:
                                print(f"[{tool_name} MCP] 警告: 输出文件不存在: {abs_out_path}")
                                self.add_message("plan_warning", f"输出文件不存在: {abs_out_path}")
                                outputs[tool_config["output_key"]] = self._create_default_output(code)
                                actual_used_tools.append(tool_name)
                            
                            # 清理临时文件
                            if is_temp_file:
                                try:
                                    os.unlink(c_file)
                                    print(f"[{tool_name} MCP] 删除临时文件: {c_file}")
                                except Exception as e:
                                    print(f"[{tool_name} MCP] 删除临时文件失败: {str(e)}")
                            
                            # 跳过后续处理
                            continue
                        else:
                            print(f"[{tool_name} MCP] MCP函数执行失败: {result.get('message', '')}")
                            self.add_message("plan_warning", f"MCP函数执行失败: {result.get('message', '')}")
                            
                            # 清理临时文件
                            if is_temp_file:
                                try:
                                    os.unlink(c_file)
                                    print(f"[{tool_name} MCP] 删除临时文件: {c_file}")
                                except Exception as e:
                                    print(f"[{tool_name} MCP] 删除临时文件失败: {str(e)}")
                            
                            raise Exception(f"MCP函数执行失败: {result.get('message', '')}")
                    else:
                        print(f"[{tool_name} MCP] 警告: 函数没有MCP装饰器")
                        self.add_message("plan_warning", f"函数没有MCP装饰器")
                except Exception as e:
                    print(f"[{tool_name} MCP] 加载模块异常: {str(e)}")
                    self.add_message("plan_error", f"加载MCP模块异常: {str(e)}")
                    import traceback
                    print(f"[DEBUG] 异常堆栈: {traceback.format_exc()}")
                
                # 如果MCP方式失败，回退到原始方式
                print(f"[{tool_name} MCP] 回退到原始方式")
                self.add_message("plan_warning", f"回退到原始方式")
                
            elif tool_name == "Code_Extractor" and tool_config.get("use_mcp", False):
                # 在主try-except块外处理MCP工具
                print("[DEBUG] 在主try-except块外处理Code_Extractor MCP工具")
                
                try:
                    # 使用MCP装饰器方式调用工具
                    import importlib.util
                    import sys
                    import os
                    
                    # 构建模块路径
                    module_path = os.path.abspath(os.path.join(tool_config["path"], f"{tool_config['mcp_module']}.py"))
                    print(f"[{tool_name} MCP] 加载模块: {module_path}")
                    print(f"[DEBUG] 模块文件是否存在: {os.path.exists(module_path)}")
                    
                    # 检查当前工作目录
                    print(f"[DEBUG] 当前工作目录: {os.getcwd()}")
                    
                    # 检查模块所在目录
                    module_dir = os.path.dirname(module_path)
                    print(f"[DEBUG] 模块所在目录: {module_dir}")
                    print(f"[DEBUG] 模块所在目录是否存在: {os.path.exists(module_dir)}")
                    
                    # 列出模块所在目录的文件
                    if os.path.exists(module_dir):
                        print(f"[DEBUG] 模块所在目录文件列表: {os.listdir(module_dir)}")
                    
                    # 检查模块文件是否存在
                    if not os.path.exists(module_path):
                        print(f"[{tool_name} MCP] 错误: 模块文件不存在: {module_path}")
                        self.add_message("plan_error", f"MCP模块文件不存在: {module_path}")
                        raise Exception(f"MCP模块文件不存在: {module_path}")
                    
                    # 动态加载模块
                    print(f"[DEBUG] 尝试加载模块: {module_path}")
                    spec = importlib.util.spec_from_file_location(tool_config['mcp_module'], module_path)
                    if spec is None:
                        print(f"[DEBUG] 无法创建spec，模块路径可能有问题: {module_path}")
                        raise ImportError(f"无法创建spec，模块路径可能有问题: {module_path}")
                    module = importlib.util.module_from_spec(spec)
                    sys.modules[tool_config['mcp_module']] = module
                    print(f"[DEBUG] 执行模块: {module}")
                    spec.loader.exec_module(module)
                    
                    # 检查模块是否包含指定的函数
                    func_name = tool_config['mcp_function']
                    print(f"[DEBUG] 检查模块是否包含函数: {func_name}")
                    if hasattr(module, func_name):
                        print(f"[DEBUG] 模块包含函数: {func_name}")
                    else:
                        print(f"[DEBUG] 模块不包含函数: {func_name}")
                        print(f"[DEBUG] 模块的属性: {dir(module)}")
                        raise AttributeError(f"模块不包含函数: {func_name}")
                    
                    # 获取函数
                    mcp_function = getattr(module, tool_config['mcp_function'])
                    
                    # 检查函数是否有MCP装饰器
                    if hasattr(mcp_function, 'is_mcp_tool') and mcp_function.is_mcp_tool:
                        print(f"[{tool_name} MCP] 调用MCP函数: {tool_config['mcp_function']}")
                        self.add_message("plan_info", f"调用MCP函数: {tool_config['mcp_function']}")
                        
                        # 直接使用原始文件
                        is_temp_file = False  # 标记是否是临时文件
                        if self.original_file_name and os.path.exists(self.original_file_name):
                            c_file = self.original_file_name
                            print(f"[{tool_name} MCP] 使用原始C文件: {c_file}")
                        else:
                            # 如果没有原始文件，则创建临时文件
                            import tempfile
                            
                            # 创建临时文件保存C代码
                            with tempfile.NamedTemporaryFile(suffix='.c', delete=False) as tmp_file:
                                # 确保写入的是纯C代码，去掉可能的行号
                                clean_code = code
                                # 检查是否包含行号（如"1: "这样的格式）
                                if re.search(r'^\d+:\s', code.split('\n')[0]):
                                    # 去掉行号
                                    clean_code = '\n'.join([line.split(':', 1)[1].lstrip() if ':' in line and line.split(':', 1)[0].strip().isdigit() else line for line in code.split('\n')])
                                tmp_file.write(clean_code.encode('utf-8'))
                                c_file = tmp_file.name
                                is_temp_file = True  # 标记为临时文件
                            
                            print(f"[{tool_name} MCP] 创建临时C文件: {c_file}")
                        
                        # 确保输出目录存在
                        abs_out_path = os.path.abspath(out_path)
                        os.makedirs(os.path.dirname(abs_out_path), exist_ok=True)
                        
                        # 调用MCP函数
                        print(f"[DEBUG] 调用MCP函数: {mcp_function.__name__}({c_file}, {abs_out_path})")
                        result = mcp_function(c_file, abs_out_path)
                        print(f"[DEBUG] MCP函数返回结果: {result}")
                        
                        # 检查结果
                        if result['status'] == 'success':
                            print(f"[{tool_name} MCP] MCP函数执行成功")
                            self.add_message("plan_success", f"MCP函数执行成功")
                            
                            # 检查输出文件是否存在
                            if os.path.exists(abs_out_path):
                                # 尝试加载JSON
                                try:
                                    with open(abs_out_path, 'r') as f:
                                        outputs[tool_config["output_key"]] = json.load(f)
                                except json.JSONDecodeError:
                                    # 如果不是JSON，则读取为文本并包装为JSON
                                    with open(abs_out_path, 'r') as f:
                                        content = f.read()
                                        outputs[tool_config["output_key"]] = {
                                            "snippets": content,
                                            "status": "success"
                                        }
                                actual_used_tools.append(tool_name)
                                self.add_message("plan_success", f"{tool_name} 执行成功")
                            else:
                                print(f"[{tool_name} MCP] 警告: 输出文件不存在: {abs_out_path}")
                                self.add_message("plan_warning", f"输出文件不存在: {abs_out_path}")
                                outputs[tool_config["output_key"]] = self._create_default_output(code)
                                actual_used_tools.append(tool_name)
                            
                            # 清理临时文件
                            if is_temp_file:
                                try:
                                    os.unlink(c_file)
                                    print(f"[{tool_name} MCP] 删除临时文件: {c_file}")
                                except Exception as e:
                                    print(f"[{tool_name} MCP] 删除临时文件失败: {str(e)}")
                            
                            # 跳过后续处理
                            continue
                        else:
                            print(f"[{tool_name} MCP] MCP函数执行失败: {result.get('message', '')}")
                            self.add_message("plan_warning", f"MCP函数执行失败: {result.get('message', '')}")
                            
                            # 清理临时文件
                            if is_temp_file:
                                try:
                                    os.unlink(c_file)
                                    print(f"[{tool_name} MCP] 删除临时文件: {c_file}")
                                except Exception as e:
                                    print(f"[{tool_name} MCP] 删除临时文件失败: {str(e)}")
                            
                            raise Exception(f"MCP函数执行失败: {result.get('message', '')}")
                    else:
                        print(f"[{tool_name} MCP] 警告: 函数没有MCP装饰器")
                        self.add_message("plan_warning", f"函数没有MCP装饰器")
                except Exception as e:
                    print(f"[{tool_name} MCP] 加载模块异常: {str(e)}")
                    self.add_message("plan_error", f"加载MCP模块异常: {str(e)}")
                    import traceback
                    print(f"[DEBUG] 异常堆栈: {traceback.format_exc()}")
                
                # 如果MCP方式失败，回退到原始方式
                print(f"[{tool_name} MCP] 回退到原始方式")
                self.add_message("plan_warning", f"回退到原始方式")
            
            try:
                self.add_message("plan", f"Running {tool_name} on code")
                # 使用MCP方式调用工具，可能带有参数
                args = [code, out_path]
                if tool_params:
                    args.extend(tool_params)
                
                # 特殊处理Control_flow_Analyzer工具
                if tool_name == "Control_flow_Analyzer":
                    # 创建临时C文件来保存代码内容
                    import tempfile
                    import os
                    
                    # 创建临时文件保存C代码
                    with tempfile.NamedTemporaryFile(suffix='.c', delete=False) as tmp_file:
                        # 确保写入的是纯C代码，去掉可能的行号
                        clean_code = code
                        # 检查是否包含行号（如"1: "这样的格式）
                        if re.search(r'^\d+:\s', code.split('\n')[0]):
                            # 去掉行号
                            clean_code = '\n'.join([line.split(':', 1)[1].lstrip() if ':' in line and line.split(':', 1)[0].strip().isdigit() else line for line in code.split('\n')])
                        tmp_file.write(clean_code.encode('utf-8'))
                        tmp_c_file = tmp_file.name
                    
                    print(f"[Control_flow_Analyzer] 创建临时C文件: {tmp_c_file}")
                    
                    # 确保输出目录存在
                    output_dir = os.path.dirname(out_path)
                    os.makedirs(output_dir, exist_ok=True)
                    
                    # 使用修改后的run.sh脚本调用工具
                    run_script = os.path.join(tool_config["path"], "run.sh")
                    if not os.path.exists(run_script):
                        print(f"[Control_flow_Analyzer] 错误: 运行脚本不存在: {run_script}")
                        self.add_message("plan_error", f"运行脚本不存在: {run_script}")
                        # 创建基本的调用图
                        self._create_basic_callgraph(out_path, code)
                        continue
                    
                    # 确保run.sh有执行权限
                    try:
                        os.chmod(run_script, 0o755)
                        print(f"[Control_flow_Analyzer] 已设置run.sh执行权限")
                    except Exception as e:
                        print(f"[Control_flow_Analyzer] 设置执行权限失败: {str(e)}")
                    
                    # 构建命令参数
                    basename = os.path.basename(tmp_c_file)
                    name_without_ext = os.path.splitext(basename)[0]
                    json_file = os.path.join(output_dir, f"{name_without_ext}_callgraph.json")
                    
                    cmd = [run_script, "-o", output_dir, tmp_c_file]
                    print(f"[Control_flow_Analyzer] 执行命令: {' '.join(cmd)}")
                    
                    try:
                        # 执行分析命令
                        result = subprocess.run(cmd, capture_output=True, text=True)
                        
                        if result.returncode == 0:
                            print(f"[Control_flow_Analyzer] 分析成功")
                            if result.stdout:
                                print(f"[Control_flow_Analyzer] 输出: {result.stdout[:200]}...")
                            
                            # 检查生成的JSON文件是否存在
                            if os.path.exists(json_file):
                                # 复制到预期的输出路径
                                import shutil
                                shutil.copy2(json_file, out_path)
                                print(f"[Control_flow_Analyzer] 复制结果文件: {json_file} -> {out_path}")
                            else:
                                print(f"[Control_flow_Analyzer] 警告: 未找到生成的JSON文件: {json_file}")
                                # 尝试查找其他可能的输出文件
                                potential_files = glob.glob(os.path.join(output_dir, "*_callgraph.json"))
                                if potential_files:
                                    # 使用找到的第一个文件
                                    found_file = potential_files[0]
                                    shutil.copy2(found_file, out_path)
                                    print(f"[Control_flow_Analyzer] 找到并复制替代文件: {found_file} -> {out_path}")
                                else:
                                    # 使用直接分析C代码的方法
                                    print(f"[Control_flow_Analyzer] 使用直接分析C代码的方法")
                                    self._create_basic_callgraph(out_path, code)
                        else:
                            print(f"[Control_flow_Analyzer] 分析失败: {result.stderr}")
                            # 使用直接分析C代码的方法
                            print(f"[Control_flow_Analyzer] 使用直接分析C代码的方法")
                            self._create_basic_callgraph(out_path, code)
                    except Exception as e:
                        print(f"[Control_flow_Analyzer] 执行异常: {str(e)}")
                        # 使用直接分析C代码的方法
                        print(f"[Control_flow_Analyzer] 使用直接分析C代码的方法")
                        self._create_basic_callgraph(out_path, code)
                    
                    # 清理临时文件
                    try:
                        os.unlink(tmp_c_file)
                        print(f"[Control_flow_Analyzer] 删除临时文件: {tmp_c_file}")
                    except Exception as e:
                        print(f"[Control_flow_Analyzer] 删除临时文件失败: {str(e)}")
                    
                    # 跳过后续的工具调用
                    continue
                elif tool_name == "Read_Write_Analyzer" and not tool_config.get("use_mcp", False):
                    # 创建临时文件保存C代码、LLVM IR和优化后的LLVM IR
                    import tempfile
                    import subprocess
                    
                    # 设置正确的文件路径
                    if self.original_file_name:
                        # 如果传入了原始文件名，优先使用传入的
                        original_file_name = self.original_file_name
                    else:
                        # 尝试从代码内容中提取文件名
                        file_pattern = r'svp_\w+_\d+_\d+'
                        file_match = re.search(file_pattern, code)
                        if file_match:
                            file_base = file_match.group(0)
                            # 构建完整路径
                            original_file_name = f"/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/{file_base[:11]}/{file_base}.c"
                            print(f"[LLVM处理] 从代码内容提取文件名: {file_base}")
                        else:
                            # 如果无法提取，使用默认路径
                            original_file_name = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/svp_simple_005_001.c"
                            print(f"[LLVM处理] 使用默认文件路径")
                    
                    # 确保使用绝对路径
                    original_file_name = os.path.abspath(original_file_name)
                    original_dir = os.path.dirname(original_file_name)
                    print(f"[LLVM处理] 原始文件的绝对路径: {original_file_name}")
                    print(f"[LLVM处理] 原始文件所在目录: {original_dir}")
                    
                    # 在原始文件所在目录创建临时文件，确保目录真的存在
                    import uuid
                    tmp_file_name = f"temp_{uuid.uuid4().hex[:8]}.c"
                    
                    # 直接使用原始C文件，不创建临时文件
                    c_file = original_file_name
                    print(f"[LLVM处理] 直接使用原始C文件: {c_file}")
                    
                    # 确保原始文件存在
                    if not os.path.exists(c_file):
                        print(f"[LLVM处理] 警告: 原始文件不存在: {c_file}")
                        
                        # 尝试其他可能的路径
                        possible_paths = []
                        
                        # 提取文件名
                        file_base = os.path.basename(c_file)
                        file_name = os.path.splitext(file_base)[0]
                        
                        # 构建可能的路径
                        possible_paths.append(f"/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/{file_name[:11]}/{file_name}.c")
                        possible_paths.append(f"/Users/hehang03/code/clover/dataset/c-src/{file_name}.c")
                        possible_paths.append(f"/Users/hehang03/code/clover/{file_name}.c")
                        possible_paths.append(f"./dataset/c-src/Racebench_2.1/{file_name[:11]}/{file_name}.c")
                        possible_paths.append(f"./dataset/c-src/{file_name}.c")
                        
                        # 检查每个路径
                        for path in possible_paths:
                            if os.path.exists(path):
                                c_file = path
                                print(f"[LLVM处理] 找到文件: {c_file}")
                                break
                        
                        # 如果仍然找不到文件，则创建一个临时文件
                        if not os.path.exists(c_file):
                            print(f"[LLVM处理] 无法找到原始文件，创建临时文件")
                            
                            # 创建临时文件
                            import uuid
                            tmp_dir = os.path.join(os.getcwd(), "dataset/c-src/Racebench_2.1/svp_simple_005")
                            
                            # 确保目录存在
                            os.makedirs(tmp_dir, exist_ok=True)
                    
                            # 创建临时文件
                            tmp_file = os.path.join(tmp_dir, f"temp_{uuid.uuid4().hex[:8]}.c")
                            with open(tmp_file, 'w') as f:
                                # 确保写入的是纯C代码，去掉可能的行号
                                clean_code = code
                                # 检查是否包含行号（如"1: "这样的格式）
                                if re.search(r'^\d+:\s', code.split('\n')[0]):
                                    # 去掉行号
                                    clean_code = '\n'.join([line.split(':', 1)[1].lstrip() if ':' in line and line.split(':', 1)[0].strip().isdigit() else line for line in code.split('\n')])
                                f.write(clean_code)
                            
                            c_file = tmp_file
                            print(f"[LLVM处理] 创建临时文件: {c_file}")
                    
                    print(f"[LLVM处理] 使用文件: {c_file}")
                    
                    # 检查common.h是否存在于上级目录
                    common_h_path = os.path.join(os.path.dirname(original_dir), "common.h")
                    if not os.path.exists(common_h_path):
                        print(f"[LLVM处理] 警告: ../common.h 文件不存在: {common_h_path}")
                        # 尝试查找其他位置的common.h
                        other_paths = [
                            os.path.join(os.path.dirname(os.path.dirname(original_dir)), "common.h"),
                            os.path.join(os.getcwd(), "dataset/c-src", "common.h")
                        ]
                        for path in other_paths:
                            if os.path.exists(path):
                                print(f"[LLVM处理] 找到common.h文件: {path}")
                                # 创建符号链接到原始目录的上级目录
                                try:
                                    target_dir = os.path.dirname(original_dir)
                                    target_path = os.path.join(target_dir, "common.h")
                                    if not os.path.exists(target_path):
                                        os.symlink(path, target_path)
                                        print(f"[LLVM处理] 创建符号链接: {path} -> {target_path}")
                                except Exception as e:
                                    print(f"[LLVM处理] 创建符号链接失败: {str(e)}")
                    
                    # 打印原始C文件内容
                    try:
                        with open(c_file, 'r') as f:
                            file_content = f.read()
                            print(f"[LLVM处理] 原始C文件内容 ({c_file}):")
                            print("-" * 50)
                            print(file_content)
                            print("-" * 50)
                            # 也保存到日志中
                            self.add_message("plan_debug", f"原始C文件内容:\n{file_content[:500]}..." if len(file_content) > 500 else file_content)
                    except Exception as e:
                        print(f"[LLVM处理] 读取原始C文件失败: {str(e)}")
                    
                    # 创建LLVM IR文件名，保持在原始文件所在目录
                    ll_file = c_file.replace('.c', '.ll')
                    opt_ll_file = c_file.replace('.c', '-opt.ll')
                    
                    print(f"[LLVM处理] 原始文件所在目录: {os.path.dirname(c_file)}")
                    print(f"[LLVM处理] 当前工作目录: {os.getcwd()}")
                    print(f"[LLVM处理] LLVM IR文件: {ll_file}")
                    print(f"[LLVM处理] 优化后LLVM IR文件: {opt_ll_file}")
                    
                    # 调用clang 10.0.0生成LLVM IR
                    self.add_message("plan_info", f"调用clang 10.0.0生成LLVM IR: {c_file} -> {ll_file}")
                    # 尝试不同可能的clang-10路径
                    clang10_paths = [
                        # Linux路径
                        "/usr/bin/clang-10",
                        "/usr/local/bin/clang-10",
                        # macOS Homebrew路径
                        "/opt/homebrew/bin/clang-10",
                        "/opt/homebrew/opt/llvm@10/bin/clang",
                        "/usr/local/opt/llvm@10/bin/clang",
                        "/usr/local/Cellar/llvm@10/10.0.0/bin/clang",
                        # 其他常见路径
                        "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang-10",
                        # 使用which查找
                        subprocess.run(["which", "clang-10"], capture_output=True, text=True).stdout.strip() if subprocess.run(["which", "clang-10"], capture_output=True).returncode == 0 else ""
                    ]
                    # 过滤掉空路径
                    clang10_paths = [p for p in clang10_paths if p]
                    
                    # 寻找可用的clang-10
                    clang_cmd = None
                    clang_path = None
                    for path in clang10_paths:
                        if os.path.exists(path):
                            clang_path = path
                            print(f"[LLVM处理] 找到clang-10: {path}")
                            break
                    
                    # 如果找到clang-10，使用它，否则使用默认的clang并发出警告
                    if clang_path:
                        # 简化编译命令，使用原始C文件
                        clang_cmd = [
                            clang_path, 
                            "-O0", 
                            "-g", 
                            "-emit-llvm", 
                            "-S", 
                            c_file, 
                            "-o", 
                            ll_file
                        ]
                        
                        # 打印所有包含路径
                        print(f"[LLVM处理] 添加头文件搜索路径:")
                        # 检查clang版本
                        try:
                            version_cmd = [clang_path, "--version"]
                            version_result = subprocess.run(version_cmd, capture_output=True, text=True)
                            if version_result.returncode == 0:
                                print(f"[LLVM处理] Clang版本信息: {version_result.stdout.splitlines()[0]}")
                        except Exception as e:
                            print(f"[LLVM处理] 获取clang版本失败: {str(e)}")
                    else:
                        print("[LLVM处理] 警告: 未找到clang-10，使用默认clang")
                        self.add_message("plan_warning", "未找到clang-10，使用默认clang")
                        # 简化编译命令，使用原始C文件
                        clang_cmd = [
                            "clang", 
                            "-O0", 
                            "-g", 
                            "-emit-llvm", 
                            "-S", 
                            c_file, 
                            "-o", 
                            ll_file
                        ]
                        # 检查默认clang版本
                        try:
                            version_cmd = ["clang", "--version"]
                            version_result = subprocess.run(version_cmd, capture_output=True, text=True)
                            if version_result.returncode == 0:
                                print(f"[LLVM处理] 默认Clang版本信息: {version_result.stdout.splitlines()[0]}")
                        except Exception as e:
                            print(f"[LLVM处理] 获取默认clang版本失败: {str(e)}")
                    print(f"[LLVM处理] 执行命令: {' '.join(clang_cmd)}")
                    clang_result = subprocess.run(clang_cmd, capture_output=True, text=True)
                    
                    # 打印clang执行结果
                    if clang_result.returncode == 0:
                        print(f"[LLVM处理] clang命令执行成功")
                        # 检查生成的文件是否存在
                        if os.path.exists(ll_file):
                            abs_path = os.path.abspath(ll_file)
                            print(f"[LLVM处理] 成功生成LLVM IR文件: {ll_file}")
                            print(f"[LLVM处理] 文件绝对路径: {abs_path}")
                            print(f"[LLVM处理] 文件大小: {os.path.getsize(ll_file)} 字节")
                            
                            # 复制文件到预期位置
                            expected_path = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/svp_simple_005_001.ll"
                            if ll_file != expected_path and os.path.basename(ll_file).startswith("svp_simple_005_001"):
                                try:
                                    import shutil
                                    # 确保目标目录存在
                                    os.makedirs(os.path.dirname(expected_path), exist_ok=True)
                                    # 复制文件
                                    shutil.copy2(ll_file, expected_path)
                                    print(f"[LLVM处理] 已复制文件到预期位置: {expected_path}")
                                except Exception as e:
                                    print(f"[LLVM处理] 复制文件失败: {str(e)}")
                            
                            # 打印LLVM IR文件内容
                            try:
                                with open(ll_file, 'r') as f:
                                    ll_content = f.read()
                                    # 只打印前100行和后100行，以免输出过多
                                    ll_lines = ll_content.splitlines()
                                    if len(ll_lines) > 200:
                                        print(f"[LLVM处理] LLVM IR文件内容前100行 ({ll_file}):")
                                        print("-" * 50)
                                        print('\n'.join(ll_lines[:100]))
                                        print(f"\n... (省略中间 {len(ll_lines)-200} 行) ...\n")
                                        print('\n'.join(ll_lines[-100:]))
                                        print("-" * 50)
                                    else:
                                        print(f"[LLVM处理] LLVM IR文件内容 ({ll_file}):")
                                        print("-" * 50)
                                        print(ll_content)
                                        print("-" * 50)
                            except Exception as e:
                                print(f"[LLVM处理] 读取LLVM IR文件失败: {str(e)}")
                        else:
                            print(f"[LLVM处理] 错误: LLVM IR文件未生成: {ll_file}")
                    else:
                        print(f"[LLVM处理] clang命令执行失败，返回码: {clang_result.returncode}")
                        print(f"[LLVM处理] 错误输出: {clang_result.stderr}")
                        self.add_message("plan_warning", f"clang命令失败: {clang_result.stderr}")
                        raise Exception(f"clang命令失败: {clang_result.stderr}")
                            
                    # 调用opt 10.0.0优化LLVM IR
                    self.add_message("plan_info", f"调用opt 10.0.0优化LLVM IR: {ll_file} -> {opt_ll_file}")
                    print(f"[LLVM处理] 开始优化LLVM IR: {ll_file} -> {opt_ll_file}")
                    
                    # 检查LLVM IR文件是否存在
                    if not os.path.exists(ll_file):
                        print(f"[LLVM处理] 警告: LLVM IR文件不存在，无法优化: {ll_file}")
                        # 跳过优化步骤
                        opt_ll_file = ll_file
                        print(f"[LLVM处理] 使用未优化的LLVM IR: {opt_ll_file}")
                    else:
                        # 尝试不同可能的opt-10路径
                        opt10_paths = [
                            # Linux路径
                            "/usr/bin/opt-10",
                            "/usr/local/bin/opt-10",
                            # macOS Homebrew路径
                            "/opt/homebrew/bin/opt-10",
                            "/opt/homebrew/opt/llvm@10/bin/opt",
                            "/usr/local/opt/llvm@10/bin/opt",
                            "/usr/local/Cellar/llvm@10/10.0.0/bin/opt",
                            # 使用which查找
                            subprocess.run(["which", "opt-10"], capture_output=True, text=True).stdout.strip() if subprocess.run(["which", "opt-10"], capture_output=True).returncode == 0 else "",
                            # 使用clang-10同目录的opt
                            os.path.join(os.path.dirname(clang_path), "opt") if 'clang_path' in locals() and clang_path else "",
                            # 使用clang同目录的opt
                            os.path.join(os.path.dirname(subprocess.run(["which", "clang"], capture_output=True, text=True).stdout.strip()), "opt") if subprocess.run(["which", "clang"], capture_output=True).returncode == 0 else "",
                            # 其他可能的路径
                            "/Users/hehang03/llvm10/clang+llvm-10.0.0-x86_64-apple-darwin/bin/opt",
                            "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/opt"
                        ]
                        # 过滤掉空路径
                        opt10_paths = [p for p in opt10_paths if p]
                        
                        print(f"[LLVM处理] 搜索opt工具，可能的路径: {opt10_paths}")
                    
                    # 寻找可用的opt-10
                    opt_cmd = None
                    opt_path = None
                    for path in opt10_paths:
                        if os.path.exists(path):
                            opt_path = path
                            print(f"[LLVM处理] 找到opt工具: {path}")
                            break
                    
                    # 如果找到opt，使用它，否则使用默认的opt并发出警告
                    if opt_path:
                        opt_cmd = [opt_path, "-O2", ll_file, "-S", "-o", opt_ll_file]
                        # 检查opt版本
                        try:
                            version_cmd = [opt_path, "--version"]
                            print(f"[LLVM处理] 检查opt版本: {' '.join(version_cmd)}")
                            version_result = subprocess.run(version_cmd, capture_output=True, text=True)
                            if version_result.returncode == 0:
                                version_info = version_result.stdout.splitlines()[0] if version_result.stdout else '无输出'
                                print(f"[LLVM处理] Opt版本信息: {version_info}")
                            else:
                                print(f"[LLVM处理] 获取opt版本失败，返回码: {version_result.returncode}")
                                print(f"[LLVM处理] 错误输出: {version_result.stderr}")
                        except Exception as e:
                            print(f"[LLVM处理] 获取opt版本失败: {str(e)}")
                    else:
                        print("[LLVM处理] 警告: 未找到opt工具，尝试使用系统默认opt")
                        self.add_message("plan_warning", "未找到opt工具，尝试使用系统默认opt")
                        opt_cmd = ["opt", "-O2", ll_file, "-S", "-o", opt_ll_file]
                        # 检查默认opt版本
                        try:
                            version_cmd = ["opt", "--version"]
                            print(f"[LLVM处理] 检查默认opt版本: {' '.join(version_cmd)}")
                            version_result = subprocess.run(version_cmd, capture_output=True, text=True)
                            if version_result.returncode == 0:
                                version_info = version_result.stdout.splitlines()[0] if version_result.stdout else '无输出'
                                print(f"[LLVM处理] 默认Opt版本信息: {version_info}")
                            else:
                                print(f"[LLVM处理] 获取默认opt版本失败，返回码: {version_result.returncode}")
                                print(f"[LLVM处理] 错误输出: {version_result.stderr}")
                        except Exception as e:
                            print(f"[LLVM处理] 获取默认opt版本失败: {str(e)}")
                        
                    # 执行opt命令
                    print(f"[LLVM处理] 执行命令: {' '.join(opt_cmd)}")
                    try:
                        opt_result = subprocess.run(opt_cmd, capture_output=True, text=True)
                        
                        # 打印opt执行结果
                        if opt_result.returncode == 0:
                            print(f"[LLVM处理] opt命令执行成功")
                            # 检查生成的文件是否存在
                            if os.path.exists(opt_ll_file):
                                abs_path = os.path.abspath(opt_ll_file)
                                print(f"[LLVM处理] 成功生成优化LLVM IR文件: {opt_ll_file}")
                                print(f"[LLVM处理] 文件绝对路径: {abs_path}")
                                print(f"[LLVM处理] 文件大小: {os.path.getsize(opt_ll_file)} 字节")
                                
                                # 复制文件到预期位置
                                expected_path = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005/svp_simple_005_001-opt.ll"
                                if opt_ll_file != expected_path and os.path.basename(opt_ll_file).startswith("svp_simple_005_001"):
                                    try:
                                        import shutil
                                        # 确保目标目录存在
                                        os.makedirs(os.path.dirname(expected_path), exist_ok=True)
                                        # 复制文件
                                        shutil.copy2(opt_ll_file, expected_path)
                                        print(f"[LLVM处理] 已复制文件到预期位置: {expected_path}")
                                    except Exception as e:
                                        print(f"[LLVM处理] 复制文件失败: {str(e)}")
                                
                                # 打印优化后的LLVM IR文件内容
                                try:
                                    with open(opt_ll_file, 'r') as f:
                                        opt_content = f.read()
                                        # 只打印前100行和后100行，以免输出过多
                                        opt_lines = opt_content.splitlines()
                                        if len(opt_lines) > 200:
                                            print(f"[LLVM处理] 优化后LLVM IR文件内容前100行 ({opt_ll_file}):")
                                            print("-" * 50)
                                            print('\n'.join(opt_lines[:100]))
                                            print(f"\n... (省略中间 {len(opt_lines)-200} 行) ...\n")
                                            print('\n'.join(opt_lines[-100:]))
                                            print("-" * 50)
                                        else:
                                            print(f"[LLVM处理] 优化后LLVM IR文件内容 ({opt_ll_file}):")
                                            print("-" * 50)
                                            print(opt_content)
                                            print("-" * 50)
                                except Exception as e:
                                    print(f"[LLVM处理] 读取优化后LLVM IR文件失败: {str(e)}")
                            else:
                                print(f"[LLVM处理] 错误: 优化LLVM IR文件未生成: {opt_ll_file}")
                        else:
                            print(f"[LLVM处理] opt命令执行失败，返回码: {opt_result.returncode}")
                            print(f"[LLVM处理] 错误输出: {opt_result.stderr}")
                            # 如果opt失败，使用未优化的LLVM IR
                            opt_ll_file = ll_file
                            print(f"[LLVM处理] 使用未优化的LLVM IR: {opt_ll_file}")
                    except Exception as e:
                        print(f"[LLVM处理] 执行opt命令异常: {str(e)}")
                        # 如果opt异常，使用未优化的LLVM IR
                        opt_ll_file = ll_file
                        print(f"[LLVM处理] 使用未优化的LLVM IR: {opt_ll_file}")
                    
                    # 使用llvm_api_demo工具分析优化后的LLVM IR文件
                    print(f"[Read_Write_Analyzer] 开始使用llvm_api_demo分析LLVM IR文件: {opt_ll_file}")
                    self.add_message("plan_info", f"调用llvm_api_demo分析LLVM IR文件: {opt_ll_file}")
                    
                    # 构建llvm_api_demo工具路径
                    llvm_api_demo_path = os.path.join(tool_config["path"], "llvm_api_demo")
                    if not os.path.exists(llvm_api_demo_path):
                        print(f"[Read_Write_Analyzer] 错误: llvm_api_demo工具不存在: {llvm_api_demo_path}")
                        self.add_message("plan_error", f"llvm_api_demo工具不存在: {llvm_api_demo_path}")
                        raise Exception(f"llvm_api_demo工具不存在: {llvm_api_demo_path}")
                    
                    # 确保llvm_api_demo有执行权限
                    try:
                        os.chmod(llvm_api_demo_path, 0o755)
                        print(f"[Read_Write_Analyzer] 已设置llvm_api_demo执行权限")
                    except Exception as e:
                        print(f"[Read_Write_Analyzer] 设置执行权限失败: {str(e)}")
                    
                    # 构建输出JSON文件路径
                    analysis_output = out_path
                    print(f"[Read_Write_Analyzer] 分析结果输出路径: {analysis_output}")
                    
                    # 执行llvm_api_demo工具
                    try:
                        # 构建参数列表，传递优化后的LLVM IR文件和输出文件路径
                        args = [opt_ll_file, analysis_output]
                        print(f"[Read_Write_Analyzer] 执行命令: {llvm_api_demo_path} {' '.join(args)}")
                        
                        # 使用MCP方式调用工具，第一个参数是llvm_api_demo的路径，第二个参数是传递给工具的参数列表
                        result = run_tool_mcp(llvm_api_demo_path, args)
                        
                        # 检查工具执行结果
                        if result['result'] == 'success':
                            print(f"[Read_Write_Analyzer] llvm_api_demo执行成功")
                            if 'stdout' in result and result['stdout']:
                                print(f"[Read_Write_Analyzer] 标准输出: {result['stdout'][:200]}...")
                            self.add_message("plan_success", f"llvm_api_demo分析成功")
                        else:
                            print(f"[Read_Write_Analyzer] llvm_api_demo执行失败: {result.get('stderr', '')}")
                            self.add_message("plan_warning", f"llvm_api_demo执行失败: {result.get('stderr', '')}")
                            raise Exception(f"llvm_api_demo执行失败: {result.get('stderr', '')}")
                        
                    except Exception as e:
                        print(f"[Read_Write_Analyzer] 执行llvm_api_demo异常: {str(e)}")
                        self.add_message("plan_error", f"执行llvm_api_demo异常: {str(e)}")
                        raise Exception(f"执行llvm_api_demo异常: {str(e)}")
                else:
                    # 其他工具正常调用
                    print(f"[工具调用] 执行工具 {tool_name}, 路径: {tool_config['path']}")
                    print(f"[工具调用] 参数: {args}")
                    result = run_tool_mcp(tool_config["path"], args)
                    
                    # 检查工具执行结果
                    if result['result'] == 'success':
                        print(f"[工具调用] {tool_name} 执行成功")
                        if 'stdout' in result and result['stdout']:
                            print(f"[工具调用] 标准输出: {result['stdout'][:200]}...")
                    else:
                        print(f"[工具调用] {tool_name} 执行失败: {result.get('stderr', '')}")
                        self.add_message("plan_warning", f"工具 {tool_name} 执行失败: {result.get('stderr', '')}")
                
                # 检查输出文件是否存在
                if os.path.exists(out_path):
                    with open(out_path, 'r') as f:
                        outputs[tool_config["output_key"]] = json.load(f)
                    actual_used_tools.append(tool_name)
                    self.add_message("plan_success", f"{tool_name} 执行成功")
                else:
                    # 输出文件不存在，检查是否有模拟输出文件
                    simulated_path = f"{out_path}.simulated.json"
                    if os.path.exists(simulated_path):
                        self.add_message("plan_warning", f"{tool_name} 输出文件不存在，使用模拟输出")
                        with open(simulated_path, 'r') as f:
                            outputs[tool_config["output_key"]] = json.load(f)
                        actual_used_tools.append(tool_name)
                    else:
                        self.add_message("plan_error", f"{tool_name} 输出文件不存在: {out_path}")
                        # 无论是否必需，都创建默认输出继续执行下一个工具
                        self.add_message("plan_info", f"工具 {tool_name} 创建默认输出")
                        outputs[tool_config["output_key"]] = self._create_default_output(code)
                        actual_used_tools.append(tool_name)
                
                # 不清理生成的文件，保留它们供后续使用
                if tool_name == "Read_Write_Analyzer":
                    print("[LLVM处理] 保留所有生成的文件")
                    self.add_message("plan_info", f"保留生成的文件: {ll_file}, {opt_ll_file}")
                    
                    # 检查文件是否真的存在
                    target_dir = "/Users/hehang03/code/clover/dataset/c-src/Racebench_2.1/svp_simple_005"
                    print(f"[LLVM处理] 检查目标目录: {target_dir}")
                    
                    # 列出目录内容
                    try:
                        if os.path.exists(target_dir):
                            files = os.listdir(target_dir)
                            print(f"[LLVM处理] 目录内容: {files}")
                            
                            # 检查特定文件
                            for file_name in ["svp_simple_005_001.ll", "svp_simple_005_001-opt.ll"]:
                                file_path = os.path.join(target_dir, file_name)
                                if os.path.exists(file_path):
                                    print(f"[LLVM处理] 文件存在: {file_path}, 大小: {os.path.getsize(file_path)} 字节")
                                else:
                                    print(f"[LLVM处理] 文件不存在: {file_path}")
                        else:
                            print(f"[LLVM处理] 目标目录不存在: {target_dir}")
                    except Exception as e:
                        print(f"[LLVM处理] 检查文件异常: {str(e)}")
                
            except Exception as e:
                self.add_message("plan_error", f"{tool_name} failed: {str(e)}")
                # 无论是否必需，都记录失败信息但继续执行下一个工具
                self.add_message("plan_info", f"工具 {tool_name} 输出文件不存在，创建默认输出")
                outputs[tool_config["output_key"]] = self._create_default_output(code)
                actual_used_tools.append(tool_name)

        # === 3. 融合工具输出 ===
        # fusion_prompt = self._build_llm_fusion_prompt(outputs)
        # self.add_message("plan_fusion_prompt", fusion_prompt)
        
        # # 使用基类的通用异步处理方法
        # system_prompt = "You are the Plan Agent."
        # resp = await self.process_async(self.api_client, self.model, system_prompt, fusion_prompt)
        
        # # 打印LLM输出
        # print(f"[PlanAgent LLM输出]:\n{resp}\n")
        # self.add_message("plan_llm_output", f"LLM输出: {resp[:200]}...")

        # try:
        #     llm_json_start = resp.find("{")
        #     llm_json = resp[llm_json_start:] if llm_json_start >= 0 else resp
        #     facts = json.loads(llm_json).get("facts", {})
        # except Exception as e:
        #     self.add_message("plan_error", f"LLM fusion facts parse failed: {str(e)}. Returning raw tool outputs.")
        #     facts = outputs  # fallback

        # 直接使用工具输出作为facts
        facts = outputs
        
        # # === 4. 规划后续expert-judge工作 ===
        # expert_judge_plan = self._plan_expert_judges(facts, outputs.get("Read_Write_Analyzer", {}))
        
        # 创建空的expert_judge_plan
        expert_judge_plan = []
        
        # 确保used_tools与tool_sequence保持一致，只包含LLM计划的工具
        planned_tool_names = [t[0] for t in tool_sequence]
        
        # 输出调试信息
        self.add_message("plan_debug", f"LLM计划的工具: {planned_tool_names}")
        self.add_message("plan_debug", f"实际执行的工具: {actual_used_tools}")
        
        if len(actual_used_tools) != len(planned_tool_names):
            self.add_message("plan_warning", f"工具执行数量({len(actual_used_tools)})与计划数量({len(planned_tool_names)})不一致")
        
        return {
            "facts": facts, 
            "used_tools": planned_tool_names,  # 使用LLM计划的工具列表，确保与显示一致
            "actual_used_tools": actual_used_tools,  # 保留实际使用的工具列表
            "tool_sequence": planned_tool_names,  # 记录工具执行顺序
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