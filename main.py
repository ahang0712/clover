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

# 异步处理单个缺陷模式任务（使用ConversationManager）
async def handle_pattern_task(defect_mode, context, api_client, model, start_time):
    print(f"[Debug] 进入handle_pattern_task: defect_mode={defect_mode}")
    
    # 创建对话管理器
    conversation_manager = ConversationManager(api_client, model)
    
    # 使用对话管理器运行对话
    return await conversation_manager.run_conversation(defect_mode, context, start_time)

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

            # 异步处理所有缺陷模式任务
            tasks = []
            print(f"[Debug] 开始创建异步任务，数量={len(found_defect_modes)}，单个任务超时限制: 10000秒")
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