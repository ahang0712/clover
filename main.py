import time
import os
import re
import json
import asyncio
from config import *  # 引入所有配置
from utils import read_file, read_json, add_line_numbers
from defect_patterns import PATTERN_REGEX, PATTERNS
from code_parser import extract_variable_operations, annotate_code
from api_client import APIClient
from model_loader import LocalModel  # 恢复这个导入，api_client.py需要它
from output import save_response
from tqdm import tqdm
import torch
from agent.conversation_manager import ConversationManager
from agent.plan_agent import PlanAgent  # 添加PlanAgent导入

# 异步处理单个缺陷模式任务（使用ConversationManager）
async def handle_pattern_task(defect_mode, context, api_client, model, start_time):
    print(f"[Debug] 进入handle_pattern_task: defect_mode={defect_mode}")
    
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
async def handle_plan_task(code_str, api_client, model):
    print(f"[Debug] 进入handle_plan_task: 使用Plan Agent分析代码")
    
    # 创建Plan Agent
    plan_agent = PlanAgent(api_client, model)
    
    # 使用Plan Agent分析代码
    plan_result = await plan_agent.decide_tools(code_str)
    
    # 输出Plan Agent分析结果
    print(f"[Debug] Plan Agent分析完成，使用了 {len(plan_result['used_tools'])} 个工具")
    print(f"[Debug] 工具执行顺序: {', '.join(plan_result.get('tool_sequence', []))}")
    
    # 提取工具使用计划
    tool_plan = plan_result.get("tool_plan_output", "")
    tool_pattern = r"<tool>(.*?)</tool>"
    tool_matches = re.findall(tool_pattern, tool_plan, re.DOTALL)
    tool_plan_text = f"<tool>\n{tool_matches[0]}\n</tool>" if tool_matches else "<tool>\n未找到工具计划\n</tool>"
    
    # 从plan_result中提取expert-judge计划的JSON格式
    expert_judge_json = ""
    for message in plan_agent.messages:
        if message[0] == "expert_judge_plan_json":
            expert_judge_json = message[1]
            break
    
    # 解析expert-judge计划，获取任务数量和变量数量
    try:
        expert_judge_data = json.loads(expert_judge_json)
        expert_judge_tasks = expert_judge_data.get("expert_judge_tasks", [])
        var_count = sum(len(task.get("sharedVariables", [])) for task in expert_judge_tasks)
        print(f"[Debug] Plan Agent安排了 {len(expert_judge_tasks)} 个expert-judge任务，涉及 {var_count} 个共享变量")
    except Exception as e:
        print(f"[Debug] 无法解析expert-judge计划: {str(e)}")
    
    # 将两轮输出保存到单独的文件中
    plan_result["tool_plan_text"] = tool_plan_text
    plan_result["expert_judge_json"] = expert_judge_json
    
    return plan_result

async def main():
    torch.cuda.empty_cache()
    print(f"[Debug] 开始执行main函数")
    results = []
    max_time = 0
    log_file_path = os.path.join(RESPONSE_PATH, "max_time_log.txt")
    
    # 创建响应目录
    os.makedirs(RESPONSE_PATH, exist_ok=True)
    print(f"[Debug] 响应目录已创建: {RESPONSE_PATH}")
    
    # 初始化API客户端
    print(f"[Debug] 开始初始化API客户端")
    api_client = APIClient()
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
        for i in range(5,32):
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

            # 提取缺陷模式和变量信息
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
            annotated_code = annotate_code(code_with_lines, unique_operations)
            code_str = "\n".join(annotated_code)

            context_base = {
                "variables_text": variables_text,
                "operations_text": operations_text,
                "code_str": code_str
            }

            # 记录任务开始时间
            start_time = time.time()
            
            # 首先调用Plan Agent进行代码分析和任务规划
            print(f"[Debug] 开始调用Plan Agent进行代码分析和任务规划")
            try:
                plan_result = await handle_plan_task(code_str, api_client, local_model)
                
                # 将Plan Agent的分析结果添加到上下文中
                context_base["plan_facts"] = plan_result["facts"]
                try:
                    expert_judge_data = json.loads(plan_result["expert_judge_json"])
                    context_base["expert_judge_tasks"] = expert_judge_data.get("expert_judge_tasks", [])
                    
                    # 打印任务信息
                    task_count = len(context_base["expert_judge_tasks"])
                    var_count = sum(len(task.get("sharedVariables", [])) for task in context_base["expert_judge_tasks"])
                    print(f"[Debug] 加载了 {task_count} 个expert-judge任务，涉及 {var_count} 个共享变量")
                except Exception as e:
                    print(f"[Warning] 解析expert-judge任务失败: {str(e)}")
                    context_base["expert_judge_tasks"] = []
                
                # 保存Plan Agent的分析结果到文件
                plan_result_file = response_file_base.replace(".txt", "-plan.json")
                with open(plan_result_file, "w") as f:
                    json.dump(plan_result, f, indent=2, ensure_ascii=False)
                    
                # 单独保存两轮输出到文件
                tool_plan_file = response_file_base.replace(".txt", "-tool-plan.xml")
                with open(tool_plan_file, "w") as f:
                    f.write(plan_result["tool_plan_text"])
                    
                expert_judge_file = response_file_base.replace(".txt", "-expert-judge-plan.json")
                with open(expert_judge_file, "w") as f:
                    f.write(plan_result["expert_judge_json"])
                    
                print(f"[Debug] Plan Agent分析结果已保存到: {plan_result_file}")
                print(f"[Debug] 工具计划已保存到: {tool_plan_file}")
                print(f"[Debug] Expert-Judge计划已保存到: {expert_judge_file}")
            except Exception as e:
                print(f"[Error] Plan Agent分析失败: {str(e)}")
                import traceback
                print(traceback.format_exc())
                # 继续执行，但不使用Plan Agent的结果

            # 异步处理所有缺陷模式任务
            tasks = []
            print(f"[Debug] 开始创建异步任务，数量={len(found_defect_modes)}，单个任务超时限制: 10000秒")
            
            # 启用批量处理模式
            batch_processing = True if api_client.model_type == "local" and len(found_defect_modes) > 1 else False
            
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
                batch_task = handle_batch_tasks(all_defect_modes, all_tasks_contexts, api_client, local_model, start_time)
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
                    base_task = handle_pattern_task(defect_mode, context, api_client, local_model, start_time)
                    
                    # 先将协程包装为任务，再设置超时和名称
                    task = asyncio.create_task(base_task)
                    task.set_name(f"task_{defect_mode}")
                    
                    # 对任务应用超时控制
                    timeout_task = asyncio.wait_for(task, timeout=10000)
                    tasks.append(timeout_task)

            # 等待所有任务完成
            print(f"[Debug] 等待{len(tasks)}个任务完成...")
            for task in asyncio.as_completed(tasks):
                try:
                    result = await task
                    if result:
                        results.append(result)
                        print(f"[Completed] Defect mode: {result[0]}")
                except asyncio.TimeoutError:
                    # 超时由任务内部的CancelledError处理，此处仅记录
                    print(f"[Timeout] 任务已超时，结果已保存")
                except Exception as e:
                    print(f"[Critical Error] 任务失败: {str(e)}")
                    import traceback
                    print(traceback.format_exc())

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
                print(f"[Debug] 本地模型资源已释放")
            except Exception as e:
                print(f"[Error] 释放模型资源失败: {str(e)}")

    print(f"[All tasks completed] Max time: {max_time:.2f}s")
    with open(log_file_path, "a") as log_file:
        log_file.write(f"Maximum time across all tasks: {max_time:.2f}s\n")

if __name__ == "__main__":
    print(f"[Debug] 程序开始执行，Python版本={__import__('sys').version}")
    asyncio.run(main())
                print(f"[Debug] 本地模型资源已释放")
            except Exception as e:
                print(f"[Error] 释放模型资源失败: {str(e)}")

    print(f"[All tasks completed] Max time: {max_time:.2f}s")
    with open(log_file_path, "a") as log_file:
        log_file.write(f"Maximum time across all tasks: {max_time:.2f}s\n")

if __name__ == "__main__":
    print(f"[Debug] 程序开始执行，Python版本={__import__('sys').version}")
    asyncio.run(main())