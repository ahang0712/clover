import time
import os
import re
import json
import asyncio
import argparse
from config import *  # 引入所有配置
from utils import read_file, read_json, add_line_numbers, add_line_numbers_with_original_mapping
from defect_patterns import PATTERN_REGEX, PATTERNS
from code_parser import extract_variable_operations, annotate_code, extract_function_calls_with_lines
from api_client import APIClient
from thinking_config import get_config  # 导入thinking配置
# 导入代码过滤模块
try:
    from tool.Highlight.code_filter import filter_code_file as highlight_filter_code_file
except ImportError:
    highlight_filter_code_file = None
try:
    from tool.Operation_Analyzer.code_filter import filter_code_file as operation_filter_code_file
except ImportError:
    operation_filter_code_file = None
# 只在本地模型模式下导入LocalModel
if MODEL_TYPE == "local":
    from model_loader import LocalModel
from output import save_response
from tqdm import tqdm
try:
    import torch
except ImportError:
    torch = None
from agent.conversation_manager import ConversationManager
from agent.plan_agent import PlanAgent  # 添加PlanAgent导入
from agent.workflow_manager import WorkflowManager, create_workflow_manager  # 添加WorkflowManager导入

def filter_code_for_analysis(code_lines, input_file_path, strict_mode=True):
    """
    为分析过滤代码，优先使用Operation_Analyzer模块的过滤器
    
    Args:
        code_lines: 原始代码行列表
        input_file_path: 输入文件路径
        strict_mode: 是否使用严格模式过滤
        
    Returns:
        tuple: (过滤后的代码行列表, 行号映射字典), 如果过滤失败则返回(原始代码, None)
    """
    try:
        # 创建临时文件用于过滤
        import tempfile
        with tempfile.NamedTemporaryFile(mode='w', suffix='.c', delete=False) as temp_input:
            temp_input.write('\n'.join(code_lines))
            temp_input_path = temp_input.name
        
        with tempfile.NamedTemporaryFile(mode='r', suffix='_filtered.c', delete=False) as temp_output:
            temp_output_path = temp_output.name
        
        # 优先使用Operation_Analyzer的过滤器
        filter_func = operation_filter_code_file or highlight_filter_code_file
        
        if filter_func:
            print(f"[Debug] 使用代码过滤器进行过滤，严格模式: {strict_mode}")
            result = filter_func(temp_input_path, temp_output_path, strict_mode=strict_mode)
            
            if result.get('status') == 'success':
                with open(temp_output_path, 'r', encoding='utf-8') as f:
                    filtered_lines = f.read().splitlines()
                
                print(f"[Debug] 代码过滤成功: {result['original_lines']} -> {result['filtered_lines']} 行")
                
                # 获取行号映射信息
                line_mapping_info = result.get('line_mapping', {})
                # 提取实际的映射字典
                line_mapping = line_mapping_info.get('original_to_filtered', {}) if line_mapping_info else {}
                
                # 清理临时文件
                os.unlink(temp_input_path)
                os.unlink(temp_output_path)
                
                return filtered_lines, line_mapping
            else:
                print(f"[Warning] 代码过滤失败: {result.get('message', 'Unknown error')}")
        else:
            print("[Warning] 代码过滤器不可用，使用原始代码")
            
    except Exception as e:
        print(f"[Error] 代码过滤过程中出现异常: {str(e)}")
        # 清理临时文件
        try:
            if 'temp_input_path' in locals():
                os.unlink(temp_input_path)
            if 'temp_output_path' in locals():
                os.unlink(temp_output_path)
        except:
            pass
    
    # 如果过滤失败，返回原始代码和None映射
    return code_lines, None

def generate_project_analysis_report(project_structure, dependency_analysis, plan_result, args):
    """生成项目级别分析报告"""
    report = f"""# Project Analysis Report

## Project Information
- **Project Path**: {args.project_path}
- **Merge Strategy**: {args.merge_strategy}
- **Analysis Date**: {time.strftime('%Y-%m-%d %H:%M:%S')}

## Project Structure Summary
- **Total Files**: {len(project_structure['c_files']) + len(project_structure['h_files'])}
- **C Source Files**: {len(project_structure['c_files'])}
- **Header Files**: {len(project_structure['h_files'])}
- **Total Size**: {project_structure['total_size']} bytes
- **Main Function Files**: {len(project_structure['main_files'])}

### Largest Files
"""
    
    for file_path, size in project_structure['largest_files'][:5]:
        rel_path = os.path.relpath(file_path, args.project_path)
        report += f"- {rel_path}: {size} bytes\n"
    
    if project_structure['main_files']:
        report += f"\n### Main Function Files\n"
        for main_file in project_structure['main_files']:
            rel_path = os.path.relpath(main_file, args.project_path)
            report += f"- {rel_path}\n"
    
    # 依赖分析部分
    report += f"""
## Cross-File Dependency Analysis
- **Global Variables Found**: {len(dependency_analysis['symbol_table']['globals'])}
- **Functions Defined**: {len(dependency_analysis['symbol_table']['functions'])}
- **Cross-File Race Risks**: {len(dependency_analysis['cross_file_race_risks'])}

### Potential Race Conditions
"""
    
    for risk in dependency_analysis['cross_file_race_risks'][:10]:  # 最多显示10个
        report += f"- **{risk['variable']}** ({risk['risk_level']} Risk): {risk['description']}\n"
    
    # Plan Agent分析结果
    report += f"""
## Plan Agent Analysis Results
- **Tools Used**: {', '.join(plan_result['used_tools'])}
- **Tool Execution Sequence**: {', '.join(plan_result['tool_sequence'])}

### Analysis Facts
"""
    
    if 'facts' in plan_result and plan_result['facts']:
        for tool_name, facts in plan_result['facts'].items():
            if isinstance(facts, dict) and facts:
                report += f"\n#### {tool_name} Results\n"
                # 简化显示facts内容
                for key, value in list(facts.items())[:3]:  # 只显示前3个键值对
                    if isinstance(value, (str, int, float)):
                        report += f"- {key}: {value}\n"
                    elif isinstance(value, list) and len(value) < 10:
                        report += f"- {key}: {len(value)} items\n"
    
    report += f"""
## Recommendations

Based on the analysis results:

1. **Code Structure**: The project contains {len(project_structure['c_files'])} C files with {len(dependency_analysis['cross_file_race_risks'])} potential race conditions detected.

2. **Tool Usage**: The analysis used {len(plan_result['used_tools'])} static analysis tools in the following order: {' → '.join(plan_result['tool_sequence'])}.

3. **Risk Assessment**: 
   - HIGH risk variables: {len([r for r in dependency_analysis['cross_file_race_risks'] if r['risk_level'] == 'HIGH'])}
   - MEDIUM risk variables: {len([r for r in dependency_analysis['cross_file_race_risks'] if r['risk_level'] == 'MEDIUM'])}

4. **Next Steps**: Review the highlighted race conditions and consider adding proper synchronization mechanisms.

---
*Report generated by Clover Project Analysis Tool*
"""
    
    return report

# 异步处理单个缺陷模式任务（使用ConversationManager）
async def handle_pattern_task(defect_mode, context, api_client, model, start_time):
    print(f"[Debug] 进入handle_pattern_task: defect_mode={defect_mode}")
    print(f"[Debug] context keys: {list(context.keys())}")
    print(f"[Debug] context中是否有defects_data: {'defects_data' in context}")
    print(f"[Debug] context中是否有variables_text: {'variables_text' in context}")
    
    # 添加缺陷过滤逻辑，只显示当前任务相关的缺陷
    if "defects_data" in context and "variables_text" in context:
        task_vars = context["variables_text"].split(", ")
        all_defects = context["defects_data"]
        
        print(f"[Debug] handle_pattern_task过滤缺陷: 总缺陷数={len(all_defects)}, 任务模式={defect_mode}, 任务变量={task_vars}")
        task_defects = []
        
        for defect in all_defects:
            shared_variable = defect.get("sharedVariable", "")
            defect_type = defect.get("type", "")
            print(f"[Debug] handle_pattern_task检查缺陷: 变量={shared_variable}, 类型={defect_type}")
            # 只选择匹配当前任务变量AND缺陷模式的defect
            if shared_variable in task_vars and defect_type == defect_mode:
                print(f"[Debug] handle_pattern_task缺陷匹配: 添加到task_defects")
                task_defects.append(defect)
            else:
                print(f"[Debug] handle_pattern_task缺陷不匹配: 跳过")
        
        print(f"[Debug] handle_pattern_task过滤结果: 匹配缺陷数={len(task_defects)}")
        
        # 格式化defect信息
        if task_defects:
            defect_lines = ["Defect Highlight Results for assigned variables:"]
            for j, defect in enumerate(task_defects, 1):
                variable = defect.get("sharedVariable", "unknown")
                defect_type = defect.get("type", "unknown")
                access_pattern = defect.get("accessPattern", [])
                lines = defect.get("lines", [])
                is_array_access = defect.get("isArrayAccess", [])
                array_info = defect.get("arrayInfo", [])
                
                defect_lines.append(f"  Defect {j}:")
                defect_lines.append(f"    Variable: {variable}")
                defect_lines.append(f"    Type: {defect_type}")
                defect_lines.append(f"    Access Pattern: {' -> '.join(access_pattern)}")
                defect_lines.append(f"    Line Numbers: {', '.join(map(str, lines))}")
                
                # 添加数组索引信息
                if is_array_access and array_info and len(is_array_access) == len(array_info):
                    array_indices = []
                    for k, (is_array, info) in enumerate(zip(is_array_access, array_info)):
                        if is_array and info and info.strip():
                            # 解析数组信息格式 "dim][index" -> "array[dim][index"
                            if '][' in info:
                                array_indices.append(f"{variable}[{info}")
                            else:
                                array_indices.append(f"{variable}[{info}]")
                        else:
                            array_indices.append("-")
                    
                    if any(idx != "-" for idx in array_indices):
                        defect_lines.append(f"    Array Indices: {', '.join(array_indices)}")
                
                defect_lines.append("")
            
            context["defects_text"] = "\n".join(defect_lines)
        else:
            context["defects_text"] = "No specific defects highlighted for the assigned variables."
    
    # 创建对话管理器
    conversation_manager = ConversationManager(api_client, model)
    
    # 使用对话管理器运行对话
    return await conversation_manager.run_conversation(defect_mode, context, start_time)

# 异步处理批量缺陷模式任务（使用ConversationManager）
async def handle_batch_tasks(defect_modes, contexts, api_client, model, start_time):
    print(f"[Debug] 进入handle_batch_tasks: 批量处理 {len(defect_modes)} 个缺陷模式任务")
    
    # 创建对话管理器
    conversation_manager = ConversationManager(api_client, model)
    
    # 使用对话管理器运行对话
    return await conversation_manager.run_batch_conversation(defect_modes, contexts, start_time)

# 异步处理Plan Agent任务
async def handle_plan_task(code_str, api_client, model, input_file_name="input.c", force_local_tools=False):
    print(f"[Debug] 进入handle_plan_task: 使用Plan Agent分析代码")
    
    try:
        # 创建Plan Agent
        # 确保api_client和model都不为空
        if not api_client:
            raise ValueError("api_client不能为空")
        
        # 如果model为None，使用api_client默认模型
        if model is None and api_client.model_type == "online":
            # 使用为Plan Agent配置的模型
            model = AGENT_MODELS.get("plan", api_client.model)
            
        # 确定原始文件名，确保使用绝对路径
        original_file_name = os.path.abspath(input_file_name) if input_file_name else None
        
        # 检查文件是否存在
        if original_file_name and not os.path.exists(original_file_name):
            print(f"[Warning] 文件不存在: {original_file_name}")
            # 尝试其他可能的路径
            possible_paths = [
                os.path.join(os.getcwd(), input_file_name),
                os.path.join(BASE_SRC_PATH, os.path.basename(input_file_name)),
                # Racebench 2.1 数据集结构（保留备用）
                os.path.join(BASE_SRC_PATH, "Racebench_2.1", f"svp_simple_{os.path.basename(input_file_name).split('_')[2]}", os.path.basename(input_file_name)),
                # SV-COMP-2022-Benchmark 数据集结构（保留备用）
                # os.path.join("./dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/", os.path.basename(input_file_name))
                # os.path.join("./dataset/c-src/SV-COMP-2022-Benchmark/pthread/", os.path.basename(input_file_name))
                # os.path.join("./dataset/c-src/SV-COMP-2022-Benchmark/goblint-regression/", os.path.basename(input_file_name))
                # RWIP 数据集结构（当前使用）
                # os.path.join("./dataset/c-src/RWIP/blink/", os.path.basename(input_file_name)),
                # os.path.join("./dataset/c-src/RWIP/brake/", os.path.basename(input_file_name)),
                # os.path.join("./dataset/c-src/RWIP/i2c_pca_isa/", os.path.basename(input_file_name)),
                # os.path.join("./dataset/c-src/RWIP/i8xx_tco/", os.path.basename(input_file_name)),
                # os.path.join("./dataset/c-src/RWIP/logger/", os.path.basename(input_file_name)),
                # os.path.join("./dataset/c-src/RWIP/wdt/", os.path.basename(input_file_name))
                # SV-COMP-2022-Benchmark 数据集结构（保留备用）
                # os.path.join(".dataset/c-src/SV-COMP-2022-Benchmark/Idv-races/", os.path.basename(input_file_name))
            ]
            
            for path in possible_paths:
                if os.path.exists(path):
                    original_file_name = path
                    print(f"[Debug] 找到文件: {original_file_name}")
                    break
        
        print(f"[Debug] 使用原始文件名: {original_file_name}")
            
        plan_agent = PlanAgent(api_client, model or "default_model", original_file_name=original_file_name)
        
        # 使用Plan Agent分析代码
        plan_result = await plan_agent.decide_tools(code_str)
        
        # 输出Plan Agent分析结果
        print(f"[Debug] Plan Agent分析完成，使用了 {len(plan_result['used_tools'])} 个工具")
        print(f"[Debug] 工具执行顺序: {', '.join(plan_result.get('tool_sequence', []))}")
        
        # 先检查Plan Agent是否已经生成了有效的expert计划
        existing_expert_json = plan_result.get("expert_json", "{}")
        expert_json = existing_expert_json
        
        # 解析现有的任务数量
        existing_task_count = 0
        try:
            if existing_expert_json and existing_expert_json != "{}":
                existing_data = json.loads(existing_expert_json)
                existing_task_count = len(existing_data.get("expert_tasks", []))
        except:
            existing_task_count = 0
        
        # 如果Plan Agent没有生成有效任务且有Defect_Highlight结果，尝试新的任务规划方法
        highlight_results = plan_result.get("facts", {}).get("Defect_Highlight", {})
        if existing_task_count == 0 and highlight_results and highlight_results.get("defects"):
            print(f"[Debug] Plan Agent未生成任务且检测到Defect_Highlight结果，使用新的任务规划方法")
            try:
                # 使用新的create_task_plan方法
                new_expert_json = await plan_agent.create_task_plan(highlight_results)
                # 验证新方法是否生成了有效任务
                new_data = json.loads(new_expert_json)
                new_task_count = len(new_data.get("expert_tasks", []))
                if new_task_count > 0:
                    expert_json = new_expert_json
                    print(f"[Debug] 新任务规划方法成功生成{new_task_count}个expert任务")
                else:
                    print(f"[Debug] 新任务规划方法未生成有效任务，保持原有结果")
            except Exception as e:
                print(f"[Warning] 新任务规划方法失败，保持原有结果: {str(e)}")
        elif existing_task_count > 0:
            print(f"[Debug] Plan Agent已生成{existing_task_count}个expert任务，使用现有结果")
        else:
            print(f"[Debug] 未检测到Defect_Highlight结果，将使用传统方法生成expert计划")
        
        # 提取工具使用计划
        tool_plan = plan_result.get("tool_plan_output", "")
        # 记录原始工具计划
        print(f"[Debug] 原始工具计划: {tool_plan[:100]}...")
        
        # 增强提取工具计划的能力
        tool_plan_text = "<tool>\n未能获取工具计划\n</tool>"
        try:
            # 如果工具计划已经是格式化的，直接使用
            if tool_plan and "<tool>" in tool_plan and "</tool>" in tool_plan:
                tool_plan_text = tool_plan
                print(f"[Debug] 使用原始工具计划")
            else:
                # 尝试多种模式提取工具计划
                tool_patterns = [
                    r"<tool>(.*?)</tool>",  # 标准格式
                    r"```(?:xml|html)?\s*<tool>(.*?)</tool>\s*```",  # 代码块中的格式
                    r"<tool>\s*([\s\S]*?)\s*</tool>"  # 更宽松的匹配
                ]
                
                for pattern in tool_patterns:
                    tool_matches = re.findall(pattern, tool_plan, re.DOTALL)
                    if tool_matches:
                        tool_plan_text = f"<tool>\n{tool_matches[0].strip()}\n</tool>"
                        print(f"[Debug] 成功提取工具计划，使用模式: {pattern}")
                        break
            
            # 检查是否成功提取了工具计划
            if tool_plan_text == "<tool>\n未能获取工具计划\n</tool>":
                # 检查plan_result中是否有tool_sequence
                if "tool_sequence" in plan_result and plan_result["tool_sequence"]:
                    tool_sequence = plan_result["tool_sequence"]
                    tool_plan_text = "<tool>\n" + "\n".join(tool_sequence) + "\n</tool>"
                    print(f"[Debug] 从tool_sequence生成工具计划: {tool_plan_text}")
                else:
                    print(f"[Debug] 无法从原始工具计划中提取内容，使用默认文本")
        except Exception as e:
            print(f"[Error] 提取工具计划失败: {str(e)}")
        
        # 将工具计划保存到plan_result
        plan_result["tool_plan_text"] = tool_plan_text
        
        # 如果仍然没有有效的expert计划，从plan_result中提取
        current_task_count = 0
        try:
            if expert_json and expert_json != "{}":
                current_data = json.loads(expert_json)
                current_task_count = len(current_data.get("expert_tasks", []))
        except:
            current_task_count = 0
            
        if current_task_count == 0:
            try:
                # 尝试从plan_result中获取expert计划
                if "expert_plan" in plan_result and plan_result["expert_plan"]:
                    expert_json = plan_result["expert_plan"]
                    print(f"[Debug] 从plan_result中提取expert计划")
                else:
                    # 如果没有expert计划，使用空对象
                    expert_data = {"expert_tasks": []}
                    expert_json = json.dumps(expert_data, indent=2, ensure_ascii=False)
                    print(f"[Debug] 未找到任何expert计划，使用空任务列表")
            except Exception as e:
                print(f"[Debug] 无法解析expert计划: {str(e)}")
                print(f"[Warning] 解析expert任务失败: {str(e)}")
                expert_json = "{}"
        
        # 解析expert计划，获取任务数量和变量数量
        try:
            expert_data = json.loads(expert_json)
            expert_tasks = expert_data.get("expert_tasks", [])
            var_count = sum(len(task.get("sharedVariables", [])) for task in expert_tasks)
            print(f"[Debug] 加载了 {len(expert_tasks)} 个expert任务，涉及 {var_count} 个共享变量")
        except Exception as e:
            print(f"[Debug] 无法解析expert计划: {str(e)}")
            expert_json = "{}"  # 重置为空JSON对象
        
        # 将两轮输出保存到单独的文件中
        plan_result["tool_plan_text"] = tool_plan_text
        plan_result["expert_json"] = expert_json
        
        return plan_result
    except Exception as e:
        print(f"[Error] Plan Agent分析失败: {str(e)}")
        # 返回一个空的结果，避免程序崩溃
        return {
            "facts": {},
            "used_tools": [],
            "tool_sequence": [],
            "tool_plan_text": "<tool>\n未能获取工具计划\n</tool>",
            "expert_json": "{}"
        }

async def main():
    # 解析命令行参数
    parser = argparse.ArgumentParser(description="Clover - 代码分析工具")
    parser.add_argument("--force-local-tools", action="store_true", help="强制使用本地工具而不是模拟输出")
    parser.add_argument("--project-path", type=str, help="项目目录路径（用于项目级别分析）")
    parser.add_argument("--merge-strategy", type=str, choices=["smart", "full", "summary", "main_only"], 
                       default="smart", help="项目模式下的代码合并策略")
    parser.add_argument("--single-file", type=str, help="单文件分析路径")
    parser.add_argument("--max-lines", type=int, default=5000, help="单文件分析最大行数限制（默认5000行）")
    parser.add_argument("--max-total-lines", type=int, default=10000, help="项目模式合并代码最大总行数（默认10000行）")
    args = parser.parse_args()
    
    # 清理GPU缓存（如果torch可用的话）
    if torch is not None and torch.cuda.is_available():
        torch.cuda.empty_cache()
    print(f"[Debug] 程序开始执行，Python版本={os.sys.version}")
    print(f"[Debug] 开始执行main函数")
    if args.force_local_tools:
        print(f"[Debug] 强制使用本地工具模式已启用")
    
    # 检查运行模式
    if args.project_path:
        print(f"[Debug] 项目模式启用，项目路径: {args.project_path}")
        print(f"[Debug] 代码合并策略: {args.merge_strategy}")
        return await handle_project_mode(args)
    elif args.single_file:
        print(f"[Debug] 单文件模式启用，文件路径: {args.single_file}")
        return await handle_single_file_mode(args)
    else:
        print(f"[Debug] 默认批量模式启用")
        return await handle_batch_mode(args)

async def handle_project_mode(args):
    """处理项目模式分析"""
    from preprocessing.core.project_scanner import ProjectScanner
    from preprocessing.analyzers.cross_file_analyzer import CrossFileAnalyzer
    from preprocessing.core.code_merger import CodeMerger
    
    try:
        # 验证项目路径
        if not os.path.exists(args.project_path):
            print(f"[Error] 项目路径不存在: {args.project_path}")
            return
        
        if not os.path.isdir(args.project_path):
            print(f"[Error] 项目路径不是目录: {args.project_path}")
            return
        
        print(f"[Debug] 开始项目级别分析")
        
        # 初始化API客户端（暂时禁用thinking，待API提供商支持后启用）
        api_client = APIClient(thinking_config=get_config("disabled"))
        if args.force_local_tools:
            api_client.set_force_local_tools(True)
        
        # 获取模型
        local_model = api_client.local_model if api_client.model_type == "local" else None
        plan_model = AGENT_MODELS.get("plan", api_client.model) if api_client.model_type == "online" else local_model
        
        # 创建输出目录
        project_name = os.path.basename(args.project_path.rstrip('/'))
        project_response_path = os.path.join(RESPONSE_PATH, f"project_{project_name}")
        os.makedirs(project_response_path, exist_ok=True)
        
        # 1. 项目扫描和依赖分析
        print(f"[Debug] 开始项目扫描和依赖分析")
        scanner = ProjectScanner(args.project_path)
        cross_analyzer = CrossFileAnalyzer(args.project_path)
        
        # 创建代码合并器（使用用户指定的行数限制）
        merger = CodeMerger(max_total_lines=args.max_total_lines)
        
        # 保存项目结构分析
        project_structure = scanner.analyze_project_structure()
        structure_file = os.path.join(project_response_path, "project_structure.json")
        with open(structure_file, "w", encoding='utf-8') as f:
            json.dump(project_structure, f, indent=2, ensure_ascii=False)
        
        # 保存跨文件依赖分析
        dependency_analysis = cross_analyzer.analyze_project_dependencies()
        dependency_file = os.path.join(project_response_path, "dependency_analysis.json")
        with open(dependency_file, "w", encoding='utf-8') as f:
            json.dump(dependency_analysis, f, indent=2, ensure_ascii=False)
        
        # 生成依赖报告
        dependency_report = cross_analyzer.get_dependency_report()
        report_file = os.path.join(project_response_path, "dependency_report.md")
        with open(report_file, "w", encoding='utf-8') as f:
            f.write(dependency_report)
        
        print(f"[Debug] 项目分析完成，结果保存到: {project_response_path}")
        print(f"  - C文件数量: {len(project_structure['c_files'])}")
        print(f"  - 头文件数量: {len(project_structure['h_files'])}")
        print(f"  - 总大小: {project_structure['total_size']} 字节")
        print(f"  - 主函数文件: {len(project_structure['main_files'])}")
        
        # 2. 使用Plan Agent进行项目级别分析
        print(f"[Debug] 开始Plan Agent项目级别分析")
        plan_agent = PlanAgent(api_client, plan_model, 
                              original_file_name=None, 
                              project_path=args.project_path)
        
        # 执行项目级别工具决策（代码会在PlanAgent内部自动合并）
        plan_result = await plan_agent.decide_tools(code=None, merge_strategy=args.merge_strategy)
        
        # 保存Plan Agent分析结果
        plan_result_file = os.path.join(project_response_path, "plan_analysis.json")
        with open(plan_result_file, "w", encoding='utf-8') as f:
            json.dump(plan_result, f, indent=2, ensure_ascii=False)
        
        print(f"[Debug] Plan Agent分析完成")
        print(f"  - 使用工具: {', '.join(plan_result['used_tools'])}")
        print(f"  - 工具序列: {', '.join(plan_result['tool_sequence'])}")
        
        # 3. 生成项目级别分析报告
        final_report = generate_project_analysis_report(
            project_structure, dependency_analysis, plan_result, args
        )
        
        final_report_file = os.path.join(project_response_path, "project_analysis_report.md")
        with open(final_report_file, "w", encoding='utf-8') as f:
            f.write(final_report)
        
        print(f"[Success] 项目级别分析完成，所有结果保存到: {project_response_path}")
        return plan_result
        
    except Exception as e:
        print(f"[Error] 项目模式分析失败: {str(e)}")
        import traceback
        traceback.print_exc()

async def handle_single_file_mode(args):
    """处理单文件模式分析"""
    # 记录开始时间
    analysis_start_time = time.time()
    
    try:
        if not os.path.exists(args.single_file):
            print(f"[Error] 文件不存在: {args.single_file}")
            return
        
        print(f"[Debug] 开始单文件分析: {args.single_file}")
        
        # 读取文件内容
        code_content = read_file(args.single_file)
        code_lines = code_content.splitlines()
        
        # 检查文件大小并应用行数限制
        total_lines = len(code_lines)
        max_lines = args.max_lines
        
        if total_lines > max_lines:
            print(f"[Warning] 文件过大({total_lines}行)，将截取前{max_lines}行进行分析")
            code_lines = code_lines[:max_lines]
            # 添加截取说明
            code_lines.append(f"")
            code_lines.append(f"// [CLOVER_TRUNCATED] 文件被截取，原始文件总共{total_lines}行，此处只显示前{max_lines}行")
        else:
            print(f"[Debug] 文件大小适中({total_lines}行)，进行完整分析")
        
        # 应用代码过滤
        code_lines, line_mapping = filter_code_for_analysis(code_lines, args.single_file, strict_mode=True)
        
        # 使用原始行号添加行号标记
        if line_mapping:
            code_with_lines = add_line_numbers_with_original_mapping(code_lines, line_mapping)
            print(f"[Debug] 使用原始行号，映射关系: {len(line_mapping)} 行")
        else:
            code_with_lines = add_line_numbers(code_lines)
            print(f"[Debug] 使用连续行号")
        
        # 初始化API客户端（暂时禁用thinking，待API提供商支持后启用）
        api_client = APIClient(thinking_config=get_config("disabled"))
        if args.force_local_tools:
            api_client.set_force_local_tools(True)
        
        # 获取模型
        local_model = api_client.local_model if api_client.model_type == "local" else None
        plan_model = AGENT_MODELS.get("plan", api_client.model) if api_client.model_type == "online" else local_model
        
        # 使用Plan Agent分析（先用原始代码获取操作信息）
        initial_code_str = "\n".join(code_with_lines)
        plan_agent = PlanAgent(api_client, plan_model, original_file_name=args.single_file)
        plan_result = await plan_agent.decide_tools(initial_code_str)
        
        # 提取操作信息并为代码添加注释
        operations_list = []
        try:
            # 从Plan Agent的Operation_Analyzer原始输出中提取操作信息
            print(f"[Debug] plan_result keys: {list(plan_result.keys()) if plan_result else 'None'}")
            outputs = plan_result.get("outputs", {})
            print(f"[Debug] outputs keys: {list(outputs.keys()) if outputs else 'None'}")
            operation_analyzer_output = outputs.get("Operation_Analyzer", {})
            print(f"[Debug] operation_analyzer_output keys: {list(operation_analyzer_output.keys()) if operation_analyzer_output else 'None'}")
            
            # Operation_Analyzer的输出结构是直接包含MAIN_INFO和ISR_INFO
            # 不需要再通过'results'键访问
            operation_data = operation_analyzer_output
            print(f"[Debug] operation_data keys: {list(operation_data.keys()) if operation_data else 'None'}")
            print(f"[Debug] operation_data MAIN_INFO: {operation_data.get('MAIN_INFO', [])}")
            print(f"[Debug] operation_data ISR_INFO: {operation_data.get('ISR_INFO', [])}")
            
            # 收集所有操作信息
            for main_info in operation_data.get("MAIN_INFO", []):
                var_name = main_info.get("variable", "")
                line_num = main_info.get("line", 0)
                operation = "Write" if main_info.get("operation") == "store" else "Read"
                function = main_info.get("function", "")
                operations_list.append(f'{var_name}: line {line_num}, {operation} Operation, {function}')
            
            for isr_info in operation_data.get("ISR_INFO", []):
                var_name = isr_info.get("variable", "")
                line_num = isr_info.get("line", 0)
                operation = "Write" if isr_info.get("operation") == "store" else "Read"
                function = isr_info.get("function", "")
                operations_list.append(f'{var_name}: line {line_num}, {operation} Operation, {function}')
            
            print(f"[Debug] 提取到 {len(operations_list)} 个变量操作，暂不添加注释，等待Plan Agent完成后再添加")
            
            # 暂时使用原始代码，注释将在Plan Agent完成后添加
            code_str = initial_code_str
                
        except Exception as e:
            print(f"[Warning] 添加代码注释失败，使用原始代码: {str(e)}")
            code_str = initial_code_str
        
        # 添加文件分析元数据
        plan_result["file_metadata"] = {
            "original_file": args.single_file,
            "total_lines": total_lines,
            "analyzed_lines": len(code_lines) - (2 if total_lines > max_lines else 0),  # 减去添加的说明行
            "truncated": total_lines > max_lines,
            "max_lines_limit": max_lines,
            "file_size_bytes": os.path.getsize(args.single_file)
        }
        
        # 保存Plan Agent结果
        file_name = os.path.basename(args.single_file)
        plan_response_file = os.path.join(RESPONSE_PATH, f"{file_name}_plan_analysis.json")
        with open(plan_response_file, "w", encoding='utf-8') as f:
            json.dump(plan_result, f, indent=2, ensure_ascii=False)
        
        print(f"[Debug] Plan Agent分析完成，结果保存到: {plan_response_file}")
        
        # 检查是否有expert任务需要执行
        expert_tasks = []
        try:
            # 尝试从expert_judge_json获取（新格式）
            expert_json_data = plan_result.get("expert_judge_json")
            if not expert_json_data:
                # 回退到expert_json（旧格式兼容）
                expert_json_data = plan_result.get("expert_json")
            
            if expert_json_data:
                expert_data = json.loads(expert_json_data)
                expert_tasks = expert_data.get("expert_tasks", [])
                # 如果没有expert_tasks，尝试expert_judge_tasks
                if not expert_tasks:
                    expert_tasks = expert_data.get("expert_judge_tasks", [])
        except Exception as e:
            print(f"[Warning] 解析expert任务失败: {str(e)}")
        
        # 保存expert计划文件（如果有任务的话）
        if expert_tasks:
            expert_plan_file = os.path.join(RESPONSE_PATH, f"{file_name}_expert-plan.json")
            try:
                # 使用相同的逻辑获取expert数据
                expert_json_data = plan_result.get("expert_judge_json") or plan_result.get("expert_json")
                if expert_json_data:
                    expert_plan_data = json.loads(expert_json_data)
                    with open(expert_plan_file, "w", encoding='utf-8') as f:
                        json.dump(expert_plan_data, f, indent=2, ensure_ascii=False)
                    print(f"[Debug] Expert-judge计划保存到: {expert_plan_file}")
            except Exception as e:
                print(f"[Warning] 保存expert计划失败: {str(e)}")
        
        # === 检查是否发现缺陷，如果没有则直接结束 ===
        defects_found = False
        if plan_result and plan_result.get("facts", {}).get("Defect_Highlight", {}).get("defects"):
            defects_found = len(plan_result["facts"]["Defect_Highlight"]["defects"]) > 0
            
        if not defects_found:
            print("[INFO] Defect Highlight没有发现任何缺陷")
            print("No defects.")
            
            # 计算执行时间
            total_execution_time = time.time() - analysis_start_time
            
            # 保存简单的结果到响应文件，包含时间信息
            simple_result = f"No defects.\nExecution time: {total_execution_time:.2f} seconds"
            response_file = os.path.join(RESPONSE_PATH, f"{file_name}_analysis_result.txt")
            with open(response_file, "w", encoding='utf-8') as f:
                f.write(simple_result)
            print(f"[Info] 分析结果已保存到: {response_file}")
            
            print(f"[Debug] 单文件分析完成，没有发现缺陷，总耗时: {total_execution_time:.2f}秒")
            return
            
        print(f"[INFO] Defect Highlight发现 {len(plan_result['facts']['Defect_Highlight']['defects'])} 个缺陷，继续进行Expert分析")
        
        # 如果有expert任务，执行Expert对话
        expert_results = {}
        task_timings = []  # 初始化任务时间统计
        parallel_total_time = 0  # 初始化并行总时间
        if expert_tasks:
            print(f"[Debug][消融实验] 发现 {len(expert_tasks)} 个expert任务，开始执行Expert对话")
            
            # 为Expert和Judge Agent选择模型
            expert_model = None
            if api_client.model_type == "online":
                expert_model = AGENT_MODELS.get("plan", api_client.model)
            else:
                expert_model = local_model
            
            # 从expert_tasks中提取焦点变量，只对焦点变量添加注释
            # 先初始化all_variables用于后备逻辑
            all_variables = set()
            # 从operation_data提取所有变量
            operation_data = plan_result["facts"].get("Operation_Analyzer", {})
            for item in operation_data.get("MAIN_INFO", []) + operation_data.get("ISR_INFO", []):
                all_variables.add(item.get("variable", ""))
            
            focus_variables = set()
            print(f"[Debug] plan_result存在: {plan_result is not None}")
            print(f"[Debug] expert_json存在: {plan_result.get('expert_json') if plan_result else None}")
            if plan_result and plan_result.get("expert_json"):
                try:
                    expert_data = json.loads(plan_result["expert_json"])
                    print(f"[Debug] expert_data: {expert_data}")
                    tasks = expert_data.get("tasks", []) or expert_data.get("expert_tasks", [])
                    print(f"[Debug] tasks: {tasks}")
                    for task in tasks:
                        task_vars = task.get("sharedVariables", []) or task.get("variables", [])
                        print(f"[Debug] task_vars: {task_vars}")
                        focus_variables.update(task_vars)
                    print(f"[Debug] 从expert_tasks提取的焦点变量: {focus_variables}")
                except Exception as e:
                    print(f"[Warning] 解析expert_tasks失败，使用所有变量作为焦点变量: {str(e)}")
                    focus_variables = set(all_variables)
            else:
                # 如果没有expert_tasks，使用所有变量作为焦点变量
                print(f"[Debug] 没有expert_json，使用所有变量作为焦点变量")
                focus_variables = set(all_variables)
            
            print(f"[Debug] 最终焦点变量: {focus_variables}")
            
            all_variables = set()
            all_operations = {}
            
            # 处理MAIN_INFO
            for item in operation_data.get("MAIN_INFO", []):
                var = item["variable"]
                line = item["line"]
                operation = item["operation"]
                all_variables.add(var)
                if var not in all_operations:
                    all_operations[var] = []
                all_operations[var].append(f"Line {line}: {operation} {var}")
            
            # 处理ISR_INFO
            for item in operation_data.get("ISR_INFO", []):
                var = item["variable"]
                line = item["line"]
                operation = item["operation"]
                all_variables.add(var)
                if var not in all_operations:
                    all_operations[var] = []
                all_operations[var].append(f"Line {line}: {operation} {var}")
            
            # 构建unique_operations列表，格式化为annotate_code函数期望的格式
            unique_operations = []
            for var in sorted(all_variables):
                var_operations = all_operations.get(var, [])
                for op in list(dict.fromkeys(var_operations)):
                    # 将 "Line 23: load svp_simple_003_001_global_var2" 转换为
                    # "svp_simple_003_001_global_var2: line 23, load, function"
                    parts = op.split(": ")
                    if len(parts) >= 2:
                        line_part = parts[0]  # "Line 23"
                        operation_var = parts[1]  # "load svp_simple_003_001_global_var2"
                        op_parts = operation_var.split(" ", 1)
                        if len(op_parts) >= 2:
                            operation = op_parts[0]  # "load"
                            variable = op_parts[1]   # "svp_simple_003_001_global_var2"
                            # 格式化为annotate_code期望的格式
                            formatted_op = f"{variable}: {line_part.lower()}, {operation}, function"
                            unique_operations.append(formatted_op)
            
            print(f"[Debug] 格式化后的unique_operations前5个: {unique_operations[:5]}")
            
            # 提取函数调用信息
            control_flow_data = plan_result["facts"].get("control_flow_data", {})
            target_functions = ["disable_isr", "enable_isr", "init", "idlerun"]  # 需要注释的函数
            function_calls = extract_function_calls_with_lines(code_with_lines, target_functions)
            print(f"[Debug] 提取到 {len(function_calls)} 个函数调用")
            
            annotated_code = annotate_code(code_with_lines, unique_operations, focus_variables, function_calls)
            annotated_code_str = "\n".join(annotated_code)  # 更新为注释后的代码
            
            # 构建分析上下文
            context_base = {
                "variables_text": "",  # 将在任务循环中设置
                "operations_text": "",  # 将在任务循环中设置
                "code_str": annotated_code_str,  # 使用带注释的代码
                "plan_facts": plan_result["facts"],
                "expert_tasks": expert_tasks,
                "control_flow_data": plan_result["facts"].get("control_flow_data", {}),  # 添加control flow数据
                "defects_data": plan_result["facts"].get("Defect_Highlight", {}).get("defects", [])  # 添加缺陷数据
            }
            
            # 记录任务开始时间
            start_time = time.time()
            
            # 为每个任务创建缺陷模式分析 - 改为并行执行
            if expert_tasks:
                print(f"[Debug][消融实验] 发现 {len(expert_tasks)} 个expert任务，开始并行执行")
                
                # 自动检测并配置最适合的并发模式
                try:
                    capability = await api_client.auto_configure_concurrency()
                    print(f"[Debug] API并发能力检测结果: {capability}")
                except Exception as e:
                    print(f"[Warning] 并发能力检测失败，使用安全模式: {str(e)}")
                    api_client.set_safe_mode()
                
                print(f"[Debug] API池信息: {api_client.get_api_pool_info()}")
                
                # 创建所有任务的协程
                task_coroutines = []
                
                # 创建一个同步事件，确保所有任务同时开始
                start_event = asyncio.Event()
                
                # 修改任务函数，添加同步启动机制和详细时间记录
                async def run_expert_task_with_sync(i, task):
                    """同步启动的并行任务执行，包含详细时间记录"""
                    task_prepare_time = time.time()
                    print(f"[Timestamp] 任务 {i+1} 准备完成: {time.strftime('%H:%M:%S.%f')[:-3]}")
                    print(f"[Timestamp] 任务 {i+1} 等待同步启动信号: {time.strftime('%H:%M:%S.%f')[:-3]}")
                    
                    # 等待所有任务都准备好
                    await start_event.wait()
                    
                    task_real_start_time = time.time()
                    prepare_wait_time = task_real_start_time - task_prepare_time
                    print(f"[Timestamp] 任务 {i+1} 🚀 真正开始执行: {time.strftime('%H:%M:%S.%f')[:-3]} (等待耗时: {prepare_wait_time:.3f}s)")
                    
                    # 直接在这里实现任务逻辑，不调用外部函数
                    try:
                        # 从任务的accessPattern推断缺陷模式代码
                        access_pattern = task.get("accessPattern", [])
                        if access_pattern == ["Read", "Write", "Read"]:
                            defect_mode = "RWR"
                        elif access_pattern == ["Read", "Write", "Write"]:
                            defect_mode = "RWW"
                        elif access_pattern == ["Write", "Write", "Read"]:
                            defect_mode = "WWR"
                        elif access_pattern == ["Write", "Read", "Write"]:
                            defect_mode = "WRW"
                        else:
                            defect_mode = "RWR"  # 默认使用RWR模式
                        
                        task_id = f"expert_task_{i+1}"
                        pattern_response_file = os.path.join(RESPONSE_PATH, f"{file_name}_{task_id}_response.txt")
                        context = context_base.copy()
                        context["response_file_path"] = pattern_response_file
                        
                        # 将任务信息添加到上下文中，让Expert Agent知道要分析的变量
                        # 兼容新旧两种任务格式
                        task_vars = task.get("sharedVariables", [])  # 传统格式
                        if not task_vars:
                            task_vars = task.get("variables", [])  # 新格式
                        
                        if task_vars:
                            context["variables_text"] = ", ".join(task_vars)
                            # 从Operation_Analyzer结果中筛选出相关的操作信息
                            relevant_operations = []
                            rw_data = plan_result.get("facts", {}).get("Operation_Analyzer", {})
                            for access in rw_data.get("MAIN_INFO", []) + rw_data.get("ISR_INFO", []):
                                if access.get("variable") in task_vars:
                                    operation_type = "Write" if access.get("operation") == "store" else "Read"
                                    relevant_operations.append(f"Line {access.get('line')}: {operation_type} {access.get('variable')} in {access.get('function')}")
                            context["operations_text"] = "\n".join(relevant_operations)
                            
                            # 从Defect_Highlight结果中筛选出相关的defect信息
                            defect_data = plan_result.get("facts", {}).get("Defect_Highlight", {})
                            all_defects = defect_data.get("defects", [])
                            task_defects = []
                            
                            print(f"[Debug] 过滤缺陷: 总缺陷数={len(all_defects)}, 任务模式={defect_mode}, 任务变量={task_vars}")
                            for defect in all_defects:
                                shared_variable = defect.get("sharedVariable", "")
                                defect_type = defect.get("type", "")
                                print(f"[Debug] 检查缺陷: 变量={shared_variable}, 类型={defect_type}")
                                # 只选择匹配当前任务变量AND缺陷模式的defect
                                if shared_variable in task_vars and defect_type == defect_mode:
                                    print(f"[Debug] 缺陷匹配: 添加到task_defects")
                                    task_defects.append(defect)
                                else:
                                    print(f"[Debug] 缺陷不匹配: 跳过")
                            print(f"[Debug] 过滤结果: 匹配缺陷数={len(task_defects)}")
                            
                            # 格式化defect信息
                            if task_defects:
                                defect_lines = ["Defect Highlight Results for assigned variables:"]
                                for j, defect in enumerate(task_defects, 1):
                                    variable = defect.get("sharedVariable", "unknown")
                                    defect_type = defect.get("type", "unknown")
                                    access_pattern = defect.get("accessPattern", [])
                                    lines = defect.get("lines", [])
                                    is_array_access = defect.get("isArrayAccess", [])
                                    array_info = defect.get("arrayInfo", [])
                                    
                                    defect_lines.append(f"  Defect {j}:")
                                    defect_lines.append(f"    Variable: {variable}")
                                    defect_lines.append(f"    Type: {defect_type}")
                                    defect_lines.append(f"    Access Pattern: {' -> '.join(access_pattern)}")
                                    defect_lines.append(f"    Line Numbers: {', '.join(map(str, lines))}")
                                    
                                    # 添加数组索引信息
                                    if is_array_access and array_info and len(is_array_access) == len(array_info):
                                        array_indices = []
                                        for k, (is_array, info) in enumerate(zip(is_array_access, array_info)):
                                            if is_array and info and info.strip():
                                                # 解析数组信息格式 "dim][index" -> "array[dim][index"
                                                if '][' in info:
                                                    array_indices.append(f"{variable}[{info}")
                                                else:
                                                    array_indices.append(f"{variable}[{info}]")
                                            else:
                                                array_indices.append("-")
                                        
                                        if any(idx != "-" for idx in array_indices):
                                            defect_lines.append(f"    Array Indices: {', '.join(array_indices)}")
                                    
                                    defect_lines.append("")
                                
                                context["defects_text"] = "\n".join(defect_lines)
                            else:
                                context["defects_text"] = "No specific defects highlighted for the assigned variables."
                        
                        # 🚀 关键改动：为每个任务创建完全独立的API客户端
                        print(f"[Debug][消融实验] 🚀 并行任务 {i+1}/{len(expert_tasks)}: {defect_mode} for variables {task_vars}")
                        print(f"[Debug] ⚡ 创建独立API客户端，确保真正并行执行")
                        print(f"[Timestamp] 任务 {i+1} 开始时间: {time.strftime('%H:%M:%S.%f')[:-3]}")
                        
                        # 创建独立的API客户端（使用不同的起始密钥避免冲突）
                        from api_client import APIClient
                        task_api_client = APIClient(thinking_config=get_config("disabled"))
                        
                        # 为每个任务设置不同的起始API密钥，避免冲突
                        task_api_client.current_key_index = i % len(task_api_client.api_keys)
                        
                        # 配置专门为Expert优化的并发模式  
                        task_api_client.set_concurrency_profile("expert_optimized")
                        
                        if args.force_local_tools:
                            task_api_client.set_force_local_tools(True)
                        
                        # 为每个任务创建独立的ConversationManager
                        from agent.conversation_manager import ConversationManager
                        task_conversation_manager = ConversationManager(task_api_client, expert_model)
                        
                        # ⚡ 使用超级优化的对话方法
                        conversation_start_time = time.time()
                        result = await task_conversation_manager.run_conversation_ultra_fast(defect_mode, context, conversation_start_time)
                        
                        task_end_time = time.time()
                        conversation_duration = task_end_time - conversation_start_time
                        total_task_duration = task_end_time - task_real_start_time
                        
                        print(f"[Timestamp] 任务 {i+1} ✅ 完成时间: {time.strftime('%H:%M:%S.%f')[:-3]}")
                        print(f"[Performance] 任务 {i+1} ({defect_mode}) 性能统计:")
                        print(f"  📊 对话耗时: {conversation_duration:.2f}s")
                        print(f"  📊 总任务耗时: {total_task_duration:.2f}s")
                        print(f"  📊 任务变量: {task_vars}")
                        print(f"  💾 结果保存到: {pattern_response_file}")
                        
                        # 返回详细的任务结果，包含时间信息
                        task_result_with_timing = {
                            "result": result,
                            "timing": {
                                "prepare_time": task_prepare_time,
                                "real_start_time": task_real_start_time,
                                "end_time": task_end_time,
                                "prepare_wait_duration": prepare_wait_time,
                                "conversation_duration": conversation_duration,
                                "total_task_duration": total_task_duration
                            },
                            "task_info": {
                                "defect_mode": defect_mode,
                                "variables": task_vars,
                                "access_pattern": task.get("accessPattern", [])
                            }
                        }
                        
                        return task_id, task_result_with_timing
                        
                    except Exception as e:
                        task_id = f"expert_task_{i+1}"
                        print(f"[Error] Expert-judge任务 {i+1} 执行失败: {str(e)}")
                        return task_id, {"error": str(e)}
                
                for i, task in enumerate(expert_tasks):
                    task_coro = run_expert_task_with_sync(i, task)
                    task_coroutines.append(task_coro)
                
                # 并行执行所有expert任务
                print(f"[Debug] 开始并行执行 {len(task_coroutines)} 个expert任务")
                print(f"[Debug] 🚀 真正并行模式：每个任务独立运行，预期总时间约等于最长单任务时间")
                
                # 添加时间戳验证机制
                print(f"[Timestamp] 并行启动时间: {time.strftime('%H:%M:%S.%f')[:-3]}")
                
                parallel_start_time = time.time()
                try:
                    # 使用asyncio.gather并行执行所有任务
                    print(f"[Debug] ⚡ 启动asyncio.gather，任务数量: {len(task_coroutines)}")
                    
                    # 🚀 创建并启动所有任务
                    running_tasks = [asyncio.create_task(coro) for coro in task_coroutines]
                    
                    # 等待短暂时间，确保所有任务都到达等待状态
                    await asyncio.sleep(0.1)
                    
                    # 发送同步启动信号，让所有任务同时开始
                    print(f"[Timestamp] 发送同步启动信号: {time.strftime('%H:%M:%S.%f')[:-3]}")
                    start_event.set()
                    
                    # 等待所有任务完成
                    task_results = await asyncio.gather(*running_tasks, return_exceptions=True)
                    
                    parallel_total_time = time.time() - parallel_start_time
                    print(f"[Timestamp] 并行完成时间: {time.strftime('%H:%M:%S.%f')[:-3]}")
                    
                    # 统计各任务的实际耗时
                    successful_tasks = 0
                    failed_tasks = 0
                    
                    # 收集所有任务的时间统计
                    task_timings = []
                    all_start_times = []
                    all_end_times = []
                    
                    # 处理结果并收集时间信息
                    for result in task_results:
                        if isinstance(result, Exception):
                            print(f"[Error] Expert-judge任务执行过程中发生异常: {str(result)}")
                            failed_tasks += 1
                        else:
                            task_id, task_result_with_timing = result
                            
                            # 提取实际的任务结果和时间信息
                            actual_task_result = task_result_with_timing["result"]
                            timing_info = task_result_with_timing["timing"]
                            task_info = task_result_with_timing["task_info"]
                            
                            expert_results[task_id] = actual_task_result
                            successful_tasks += 1
                            
                            # 收集时间统计
                            task_timings.append({
                                "task_id": task_id,
                                "defect_mode": task_info["defect_mode"],
                                "variables": task_info["variables"],
                                "timing": timing_info
                            })
                            
                            all_start_times.append(timing_info["real_start_time"])
                            all_end_times.append(timing_info["end_time"])
                    
                    efficiency_ratio = 0
                    if len(expert_tasks) > 1:
                        # 计算并行效率：理想情况下，总时间应该接近最长单任务时间
                        # 如果任务是串行的，总时间会是所有任务时间的总和
                        estimated_serial_time = 23.63 + 19.21  # 基于您的需求
                        efficiency_ratio = estimated_serial_time / parallel_total_time if parallel_total_time > 0 else 0
                    
                    print(f"[Success][消融实验] 所有 {len(expert_tasks)} 个expert任务并行执行完成")
                    print(f"[Performance] 📊 并行性能分析:")
                    print(f"  ⏱️  总耗时: {parallel_total_time:.2f}s")
                    print(f"  ✅ 成功任务: {successful_tasks}")
                    print(f"  ❌ 失败任务: {failed_tasks}")
                    print(f"  🔧 API池利用率: {len(expert_tasks)/api_client.max_concurrent_requests*100:.1f}%")
                    
                    # 📊 详细的任务时间统计分析
                    if task_timings:
                        print(f"\n[Detailed Timing] 📋 详细任务时间统计:")
                        print(f"{'='*80}")
                        
                        # 按完成时间排序显示每个任务
                        task_timings_sorted = sorted(task_timings, key=lambda x: x["timing"]["end_time"])
                        
                        for i, task_timing in enumerate(task_timings_sorted, 1):
                            timing = task_timing["timing"]
                            task_info = task_timing["task_id"]
                            defect_mode = task_timing["defect_mode"]
                            variables = task_timing["variables"]
                            
                            # 格式化时间戳
                            start_time_str = time.strftime('%H:%M:%S.%f', time.localtime(timing["real_start_time"]))[:-3]
                            end_time_str = time.strftime('%H:%M:%S.%f', time.localtime(timing["end_time"]))[:-3]
                            
                            print(f"  [{i:2d}] {task_info} ({defect_mode})")
                            print(f"       🎯 变量: {variables}")
                            print(f"       🚀 开始: {start_time_str}")
                            print(f"       ✅ 完成: {end_time_str}")
                            print(f"       ⏱️  等待: {timing['prepare_wait_duration']:.3f}s")
                            print(f"       💬 对话: {timing['conversation_duration']:.2f}s")
                            print(f"       📊 总计: {timing['total_task_duration']:.2f}s")
                            print()
                        
                        # 🚀 并行效率分析
                        if all_start_times and all_end_times:
                            actual_parallel_start = min(all_start_times)
                            actual_parallel_end = max(all_end_times)
                            actual_parallel_duration = actual_parallel_end - actual_parallel_start
                            
                            # 计算各种时间指标
                            total_conversation_time = sum(t["timing"]["conversation_duration"] for t in task_timings)
                            avg_conversation_time = total_conversation_time / len(task_timings)
                            max_conversation_time = max(t["timing"]["conversation_duration"] for t in task_timings)
                            min_conversation_time = min(t["timing"]["conversation_duration"] for t in task_timings)
                            
                            serial_estimated_time = total_conversation_time
                            parallel_efficiency = serial_estimated_time / actual_parallel_duration if actual_parallel_duration > 0 else 0
                            
                            print(f"[Parallel Analysis] 🚀 并行效率深度分析:")
                            print(f"{'='*80}")
                            print(f"  📈 理论串行总时间: {serial_estimated_time:.2f}s")
                            print(f"  ⚡ 实际并行总时间: {actual_parallel_duration:.2f}s")
                            print(f"  🎯 并行加速比: {parallel_efficiency:.2f}x")
                            print(f"  📊 平均对话时间: {avg_conversation_time:.2f}s")
                            print(f"  📊 最长对话时间: {max_conversation_time:.2f}s")
                            print(f"  📊 最短对话时间: {min_conversation_time:.2f}s")
                            
                            # 判断并行效果
                            if parallel_efficiency >= 2.5:
                                print(f"  🎉 并行效果: 优秀 (>2.5x)")
                            elif parallel_efficiency >= 1.8:
                                print(f"  ✅ 并行效果: 良好 (>1.8x)")
                            elif parallel_efficiency >= 1.2:
                                print(f"  ⚠️  并行效果: 一般 (>1.2x)")
                            else:
                                print(f"  ❌ 并行效果: 需要优化 (<1.2x)")
                            
                            print(f"{'='*80}")
                    else:
                        print(f"[Warning] 未收集到任务时间统计信息")
                    
                except Exception as e:
                    print(f"[Error] 并行执行expert任务失败: {str(e)}")
                    import traceback
                    traceback.print_exc()
        else:
            print(f"[Info] 没有发现expert任务，跳过Expert对话")
        
        # 合并所有结果
        final_result = {
            "plan_analysis": plan_result,
            "expert_results": expert_results,
            "file_metadata": plan_result["file_metadata"]
        }
        
        # 保存最终结果（包含时间统计）
        final_response_file = os.path.join(RESPONSE_PATH, f"{file_name}_complete_analysis.json")
        
        # 添加时间统计到最终结果中
        if 'expert_results' in final_result and any('timing' in str(result) for result in final_result['expert_results'].values()):
            # 重新提取时间统计信息（如果之前保存在expert_results中）
            timing_summary = []
            for task_id, result in final_result['expert_results'].items():
                if isinstance(result, dict) and 'timing' in str(result):
                    # 这里的result是实际的对话结果，时间信息在外层处理时已丢失
                    # 我们需要在更早的地方保存时间信息
                    pass
            
        with open(final_response_file, "w", encoding='utf-8') as f:
            json.dump(final_result, f, indent=2, ensure_ascii=False)
        
        # 单独保存时间统计文件（如果有的话）
        if 'task_timings' in locals() and task_timings:
            timing_stats_file = os.path.join(RESPONSE_PATH, f"{file_name}_timing_statistics.json")
            timing_stats = {
                "summary": {
                    "total_tasks": len(task_timings),
                    "total_parallel_time": parallel_total_time,
                    "average_conversation_time": sum(t["timing"]["conversation_duration"] for t in task_timings) / len(task_timings),
                    "max_conversation_time": max(t["timing"]["conversation_duration"] for t in task_timings),
                    "min_conversation_time": min(t["timing"]["conversation_duration"] for t in task_timings),
                    "parallel_efficiency": serial_estimated_time / actual_parallel_duration if 'actual_parallel_duration' in locals() and actual_parallel_duration > 0 else 0
                },
                "task_details": task_timings,
                "timestamps": {
                    "parallel_start": parallel_start_time,
                    "actual_parallel_start": min(all_start_times) if all_start_times else None,
                    "actual_parallel_end": max(all_end_times) if all_end_times else None
                }
            }
            
            with open(timing_stats_file, "w", encoding='utf-8') as f:
                json.dump(timing_stats, f, indent=2, ensure_ascii=False)
            
            print(f"[Debug] 时间统计信息保存到: {timing_stats_file}")
        
        # 输出分析摘要
        print(f"[Success] 单文件完整分析完成，结果保存到: {final_response_file}")
        print(f"  - 原始文件: {args.single_file}")
        print(f"  - 文件大小: {plan_result['file_metadata']['file_size_bytes']} 字节")
        print(f"  - 总行数: {total_lines}")
        print(f"  - 分析行数: {plan_result['file_metadata']['analyzed_lines']}")
        print(f"  - Expert任务[消融实验]: {len(expert_tasks)} 个")
        if plan_result['file_metadata']['truncated']:
            print(f"  - 状态: 文件被截取（超过{max_lines}行限制）")
        else:
            print(f"  - 状态: 完整分析")
        
        return final_result
        
    except Exception as e:
        print(f"[Error] 单文件模式分析失败: {str(e)}")
        import traceback
        traceback.print_exc()

async def handle_batch_mode(args):
    """处理批量模式分析（原有逻辑）"""
    results = []
    max_time = 0
    log_file_path = os.path.join(RESPONSE_PATH, "max_time_log.txt")
    
    # 创建响应目录
    os.makedirs(RESPONSE_PATH, exist_ok=True)
    print(f"[Debug] 响应目录已创建: {RESPONSE_PATH}")
    
    # 初始化API客户端（暂时禁用thinking，待API提供商支持后启用）
    print(f"[Debug] 开始初始化API客户端")
    api_client = APIClient(thinking_config=get_config("disabled"))
    
    # 设置是否强制使用本地工具
    if args.force_local_tools:
        api_client.set_force_local_tools(True)
        
    print(f"[Debug] API客户端初始化完成，模型类型={api_client.model_type}")
    
    # 打印API密钥状态
    if api_client.model_type == "online":
        api_client.print_api_keys_status()
    
    # 获取本地模型
    local_model = api_client.local_model if api_client.model_type == "local" else None
    if local_model:
        # 测试模型是否能响应简单提示词
        print(f"[Debug] 开始测试模型基本功能")
        test_prompt = "Hello, this is a test prompt. Please respond with one sentence."
        try:
            test_response = await local_model.generate_responses(
                prompt=test_prompt, 
                max_tokens=50
            )
            print(f"[Debug] 模型测试成功，响应: {str(test_response)[:100]}...")
        except Exception as e:
            print(f"[Error] 模型测试失败: {str(e)}")
    else:
        print(f"[Debug] 未使用本地模型")

    try:
        # 处理案例（示例：i=1）
        for i in range(300,305):
            j = 1
            file_template = f"{BASE_SRC_PATH}/Racebench_2.1/svp_simple_{{:03d}}/svp_simple_{{:03d}}_{{:03d}}"
            defect_file_path = file_template.format(i, i, j) + "-output_defects.txt"
            json_file_path = file_template.format(i, i, j) + "-output.json"
            code_file_path = file_template.format(i, i, j) + ".c"
            response_file_name = os.path.basename(code_file_path).replace(".c", "-response.txt")
            response_file_base = os.path.join(RESPONSE_PATH, response_file_name)

            # 读取文件内容
            try:
                print(f"[Debug] 开始读取文件内容")
                content = read_file(defect_file_path)
                json_data = read_json(json_file_path)
                code_lines = read_file(code_file_path).splitlines()
                print(f"[Debug] 文件读取成功: 缺陷内容长度={len(content)}, 代码行数={len(code_lines)}")
            except Exception as e:
                print(f"[Critical Error] 读取文件失败 (i={i}): {str(e)}")
                continue

            # 应用代码过滤
            code_lines, line_mapping = filter_code_for_analysis(code_lines, code_file_path, strict_mode=True)

            # 提取缺陷模式和变量信息
            # 使用原始行号添加行号标记
            if line_mapping:
                code_with_lines = add_line_numbers_with_original_mapping(code_lines, line_mapping)
            else:
                code_with_lines = add_line_numbers(code_lines)
            reports = content.split("---")
            all_variables = set()
            all_operations = {}
            found_defect_modes = set()
            
            print(f"[Debug] 开始提取缺陷模式，报告数量={len(reports)}")
            for report in reports:
                matches = re.findall(PATTERN_REGEX, report)
                for match in matches:
                    defect_mode, variable, location = match
                    all_variables.add(variable)
                    found_defect_modes.add(defect_mode)
                    operations = extract_variable_operations(variable, json_data)
                    all_operations.setdefault(variable, []).extend(operations)
            
            print(f"[Debug] 缺陷模式提取完成: {found_defect_modes}")
            if not found_defect_modes:
                print(f"[Info] No defect modes found (i={i})")
                continue

            # 构建分析上下文
            variables_text = ", ".join(sorted(all_variables))
            unique_operations = []
            for var in sorted(all_variables):
                unique_operations.extend(list(dict.fromkeys(all_operations.get(var, []))))
            operations_text = "\n".join(unique_operations)
            
            # 先创建基础上下文，不包含注释的代码
            context_base = {
                "variables_text": variables_text,
                "operations_text": operations_text,
                "code_str": "\n".join(code_with_lines)  # 使用原始代码，稍后会更新
            }

            # 记录任务开始时间
            start_time = time.time()
            
            # 首先调用Plan Agent进行代码分析和任务规划
            print(f"[Debug] 开始调用Plan Agent进行代码分析和任务规划")
            try:
                # 传递完整的文件路径，而不仅仅是文件名
                input_file_name = code_file_path  # 使用完整路径
                # 使用为Plan Agent配置的模型
                plan_model = AGENT_MODELS.get("plan", api_client.model) if api_client.model_type == "online" else local_model
                plan_result = await handle_plan_task(code_str, api_client, plan_model, input_file_name, args.force_local_tools)
                
                # 将Plan Agent的分析结果添加到上下文中
                context_base["plan_facts"] = plan_result["facts"]
                context_base["control_flow_data"] = plan_result["facts"].get("control_flow_data", {})  # 添加control flow数据
                context_base["defects_data"] = plan_result["facts"].get("Defect_Highlight", {}).get("defects", [])  # 添加缺陷数据
                

                
                # 添加统计信息到上下文
                if "statistics" in plan_result:
                    context_base["statistics"] = plan_result["statistics"]
                    stats = plan_result["statistics"]
                    print(f"[Debug] 加载了缺陷统计信息: {stats.get('total_defects', 0)} 个缺陷，涉及 {stats.get('total_variables', 0)} 个变量")
                
                try:
                    expert_data = json.loads(plan_result["expert_json"])
                    context_base["expert_tasks"] = expert_data.get("expert_tasks", [])
                    
                    # 打印任务信息
                    task_count = len(context_base["expert_tasks"])
                    var_count = sum(len(task.get("sharedVariables", [])) for task in context_base["expert_tasks"])
                    print(f"[Debug] 加载了 {task_count} 个expert任务，涉及 {var_count} 个共享变量")
                except Exception as e:
                    print(f"[Warning] 解析expert任务失败: {str(e)}")
                    context_base["expert_tasks"] = []
                
                # 保存Plan Agent的分析结果到文件
                plan_result_file = response_file_base.replace(".txt", "-plan.json")
                with open(plan_result_file, "w") as f:
                    json.dump(plan_result, f, indent=2, ensure_ascii=False)
                    
                # 单独保存两轮输出到文件
                tool_plan_file = response_file_base.replace(".txt", "-tool-plan.xml")
                with open(tool_plan_file, "w") as f:
                    f.write(plan_result["tool_plan_text"])
                    
                expert_file = response_file_base.replace(".txt", "-expert-plan.json")
                with open(expert_file, "w") as f:
                    f.write(plan_result["expert_json"])
                    
                print(f"[Debug] Plan Agent分析结果已保存到: {plan_result_file}")
                print(f"[Debug] 工具计划已保存到: {tool_plan_file}")
                print(f"[Debug] Expert计划已保存到: {expert_file}")
            except Exception as e:
                print(f"[Error] Plan Agent分析失败: {str(e)}")
                import traceback
                print(traceback.format_exc())
                # 继续执行，但不使用Plan Agent的结果

            # === 检查是否发现缺陷，如果没有则直接结束当前文件处理 ===
            defects_found = False
            if plan_result and plan_result.get("facts", {}).get("Defect_Highlight", {}).get("defects"):
                defects_found = len(plan_result["facts"]["Defect_Highlight"]["defects"]) > 0
                
            if not defects_found:
                print("[INFO] Defect Highlight没有发现任何缺陷")
                print("No defects.")
                
                # 计算执行时间
                total_execution_time = time.time() - start_time
                
                # 保存简单的结果到响应文件，包含时间信息
                simple_result = f"No defects.\nExecution time: {total_execution_time:.2f} seconds"
                with open(response_file_base, "w", encoding='utf-8') as f:
                    f.write(simple_result)
                print(f"[Info] 分析结果已保存到: {response_file_base}")
                
                # 完成这个文件的处理
                print(f"\n文件 {code_file_path} 分析完成，总耗时: {total_execution_time:.2f}秒")
                continue  # 继续处理下一个文件

            print(f"[INFO] Defect Highlight发现 {len(plan_result['facts']['Defect_Highlight']['defects'])} 个缺陷，继续进行Expert分析")

            # 检查是否有有效的expert任务需要执行
            use_workflow_manager = False
            workflow_tasks = []
            
            try:
                if plan_result and plan_result.get("expert_json"):
                    expert_data = json.loads(plan_result["expert_json"])
                    # 检查两种可能的任务键名：tasks（WorkflowManager期望）和expert_tasks（PlanAgent生成）
                    workflow_tasks = expert_data.get("tasks", [])
                    if not workflow_tasks:
                        workflow_tasks = expert_data.get("expert_tasks", [])
                    
                    # 检查任务是否有效（非空且有必要的字段）
                    valid_tasks = []
                    for task in workflow_tasks:
                        # 检查任务是否有必要的字段
                        if (task.get("pattern") and task.get("variables")) or \
                           (task.get("accessPattern") and task.get("sharedVariables")):
                            valid_tasks.append(task)
                    
                    if valid_tasks:
                        use_workflow_manager = True
                        print(f"[Debug] 发现 {len(valid_tasks)} 个有效的expert任务，使用WorkflowManager执行")
                    else:
                        print(f"[Debug] 没有发现有效的expert任务，回退到传统缺陷模式处理")
                        print(f"[Debug] 任务数据: {workflow_tasks}")
                else:
                    print(f"[Debug] Plan Agent未生成expert任务，回退到传统缺陷模式处理")
            except Exception as e:
                print(f"[Warning] 解析expert任务失败: {str(e)}，回退到传统缺陷模式处理")
                use_workflow_manager = False

            # 选择执行路径：强制使用 ConversationManager 进行多轮对话
            if use_workflow_manager:
                # === 强制使用 ConversationManager 执行 expert 任务（多轮对话） ===
                print(f"[Debug] 发现有效任务，但强制使用ConversationManager进行多轮对话")
                use_workflow_manager = False  # 强制使用ConversationManager
            
            if False:  # 禁用WorkflowManager路径
                # === 使用 WorkflowManager 执行 expert 任务 ===
                print(f"[Debug] 开始使用WorkflowManager执行expert任务")
                
                try:
                    # 为Expert和Judge Agent选择模型
                    expert_model = None
                    if api_client.model_type == "online":
                        expert_model = AGENT_MODELS.get("plan", api_client.model)
                    else:
                        expert_model = local_model
                    
                    # 创建WorkflowManager
                    workflow_manager = create_workflow_manager(api_client, expert_model)
                    
                    # 设置workflow
                    allocated_tasks = workflow_manager.setup_workflow(plan_result["expert_json"])
                    print(f"[Debug] WorkflowManager已分配 {len(allocated_tasks)} 个任务")
                    
                    # 准备执行上下文
                    execution_context = {
                        "code": code_str,
                        "operations": context_base.get("operations", {}),
                        "facts": context_base.get("plan_facts", {}),
                        "file_path": code_file_path
                    }
                    
                    # 执行所有任务
                    print(f"[Debug] 开始并行执行所有expert任务")
                    workflow_result = await workflow_manager.execute_all_tasks(execution_context)
                    
                    # 保存WorkflowManager执行结果
                    workflow_result_file = response_file_base.replace(".txt", "-workflow-result.json")
                    workflow_result_data = {
                        "total_tasks": workflow_result.total_tasks,
                        "completed_tasks": workflow_result.completed_tasks,
                        "failed_tasks": workflow_result.failed_tasks,
                        "results": workflow_result.results,
                        "errors": workflow_result.errors
                    }
                    
                    with open(workflow_result_file, "w", encoding='utf-8') as f:
                        json.dump(workflow_result_data, f, indent=2, ensure_ascii=False)
                    
                    print(f"[Debug] WorkflowManager执行完成:")
                    print(f"  - 总任务数: {workflow_result.total_tasks}")
                    print(f"  - 完成任务数: {workflow_result.completed_tasks}")
                    print(f"  - 失败任务数: {workflow_result.failed_tasks}")
                    print(f"  - 结果保存到: {workflow_result_file}")
                    
                    # 跳过传统的缺陷模式处理
                    tasks = []
                    
                except Exception as e:
                    print(f"[Error] WorkflowManager执行失败: {str(e)}")
                    import traceback
                    print(traceback.format_exc())
                    print(f"[Debug] 回退到传统缺陷模式处理")
                    use_workflow_manager = False
            
            if not use_workflow_manager:
                # === 传统缺陷模式处理 ===
                # 异步处理所有缺陷模式任务
                tasks = []
                print(f"[Debug] 开始创建异步任务，数量={len(found_defect_modes)}，单个任务超时限制: 10000秒")
                
                # 启用批量处理模式
                batch_processing = True if api_client.model_type == "local" and len(found_defect_modes) > 1 else False
                
                # 为Expert和Judge Agent选择模型
                expert_model = None
                if api_client.model_type == "online":
                    # 使用为Expert和Judge配置的模型
                    expert_model = AGENT_MODELS.get("expert", api_client.model)
                    judge_model = AGENT_MODELS.get("judge", api_client.model)
                    expert_model = expert_model  # 使用expert模型作为主要模型
                    # 自动检测并配置最适合的并发模式
                    try:
                        capability = await api_client.auto_configure_concurrency()
                        print(f"[Debug] API并发能力检测结果: {capability}")
                    except Exception as e:
                        print(f"[Warning] 并发能力检测失败，使用安全模式: {str(e)}")
                        api_client.set_safe_mode()
                    print(f"[Debug] Expert并发配置完成，API池信息: {api_client.get_api_pool_info()}")
                else:
                    expert_model = local_model
                
                if batch_processing:
                    print(f"[Debug] 启用批量处理模式，将 {len(found_defect_modes)} 个缺陷模式分析任务批量提交")
                    # 批量处理模式
                    # 准备所有任务的上下文
                    all_tasks_contexts = []
                    all_defect_modes = []
                    
                    for defect_mode in found_defect_modes:
                        pattern_response_file = response_file_base.replace(".txt", f"-{defect_mode}.txt")
                        context = context_base.copy()
                        context["response_file_path"] = pattern_response_file
                        all_tasks_contexts.append(context)
                        all_defect_modes.append(defect_mode)
                    
                    # 创建批量处理任务
                    batch_task = handle_batch_tasks(all_defect_modes, all_tasks_contexts, api_client, expert_model, start_time)
                    task = asyncio.create_task(batch_task)
                    task.set_name(f"batch_tasks_{len(found_defect_modes)}")
                    timeout_task = asyncio.wait_for(task, timeout=10000)
                    tasks.append(timeout_task)
                else:
                    # 原有的单任务处理模式
                    for defect_mode in found_defect_modes:
                        pattern_response_file = response_file_base.replace(".txt", f"-{defect_mode}.txt")
                        context = context_base.copy()
                        context["response_file_path"] = pattern_response_file
                        
                        # 创建基础任务
                        base_task = handle_pattern_task(defect_mode, context, api_client, expert_model, start_time)
                        
                        # 先将协程包装为任务，再设置超时和名称
                        task = asyncio.create_task(base_task)
                        task.set_name(f"task_{defect_mode}")
                        
                        # 对任务应用超时控制
                        timeout_task = asyncio.wait_for(task, timeout=10000)
                        tasks.append(timeout_task)

                # 等待所有任务完成
                print(f"[Debug] 等待{len(tasks)}个任务完成...")
                parallel_start_time = time.time()
                completed_count = 0
                
                for task in asyncio.as_completed(tasks):
                    try:
                        result = await task
                        if result:
                            results.append(result)
                            completed_count += 1
                            elapsed = time.time() - parallel_start_time
                            print(f"[Completed {completed_count}/{len(tasks)}] Defect mode: {result[0]}, 并行耗时: {elapsed:.2f}s")
                    except asyncio.TimeoutError:
                        # 超时由任务内部的CancelledError处理，此处仅记录
                        print(f"[Timeout] 任务已超时，结果已保存")
                    except Exception as e:
                        print(f"[Error] 处理任务时发生错误: {str(e)}")
                        import traceback
                        print(traceback.format_exc())
                
                parallel_total_time = time.time() - parallel_start_time
                print(f"[Performance] 所有{len(tasks)}个expert任务并行执行完成，总耗时: {parallel_total_time:.2f}s")
            else:
                # 如果使用WorkflowManager，确保tasks为空列表以避免后续处理错误
                tasks = []

            # 计算耗时并更新日志
            time_taken = time.time() - start_time
            max_time = max(max_time, time_taken)
            print(f"[Iteration completed] i={i}, 耗时: {time_taken:.2f}s")
            
            # 打印API密钥状态
            if api_client.model_type == "online":
                api_client.print_api_keys_status()
            
            with open(log_file_path, "a") as log_file:
                log_file.write(f"Iteration i={i}: Time taken {time_taken:.2f}s, Max time {max_time:.2f}s\n")

    finally:
        # 释放模型资源
        if local_model:
            print(f"[Debug] 释放模型资源")
            try:
                await local_model.close()
                print(f"[Debug] 本地模型资源已释放")
            except Exception as e:
                print(f"[Error] 释放模型资源失败: {str(e)}")

    print(f"[All tasks completed] Max time: {max_time:.2f}s")
    with open(log_file_path, "a") as log_file:
        log_file.write(f"Maximum time across all tasks: {max_time:.2f}s\n")

if __name__ == "__main__":
    print(f"[Debug] 程序开始执行，Python版本={__import__('sys').version}")
    asyncio.run(main())