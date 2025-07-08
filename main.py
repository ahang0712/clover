import time
import os
import re
import json
import concurrent.futures
from openai import OpenAI
from config import *
from utils import read_file, read_json, add_line_numbers, load_prompt
from defect_patterns import PATTERN_REGEX, PATTERNS
from code_parser import extract_variable_operations, annotate_code
from api_client import APIClient
from agent.expert_agent import ExpertAgent
from agent.judge_agent import JudgeAgent
from output import save_response

messages = []  # 初始化会话历史记录列表

# 处理缺陷模式任务的函数
def handle_pattern_task(defect_mode, context, api_client, model):
    """
    Handles expert/judge analysis for a specific defect pattern,
    including multi-turn dialogue until Expert Agent returns "Abstain" or rounds exceed max_rounds.
    If Expert Agent returns "No defects.", the process ends early.
    """
    pattern_info = PATTERNS.get(defect_mode)
    if not pattern_info:
        print(f"[Warning] Pattern info not found: {defect_mode}")
        return

    # 加载各种prompt和范例
    system_prompt = load_prompt("prompt/common/system_message.md")
    task_objective = load_prompt("prompt/expert/task_objective.md", pattern_name=pattern_info['pattern_name'])
    detection_rules = load_prompt("prompt/expert/detection_rules.md")
    domain_knowledge_md_file = pattern_info['domain_knowledge']
    domain_knowledge = load_prompt(f"prompt/domain_knowledge/{domain_knowledge_md_file}")
    example_md_file = pattern_info['pattern_example']
    pattern_example = load_prompt(f"prompt/expert/{example_md_file}")
    output_format = load_prompt("prompt/expert/output_format.md",
                                pattern_name=pattern_info['pattern_name'],
                                pattern_example=pattern_example,
                                access_pattern=pattern_info['access_pattern']
                                )

    expert_prompt = (
        f"<think>\n"
        f"{task_objective}\n\n"
        f"{domain_knowledge}\n\n"
        f"{detection_rules}\n\n"
        f"{output_format}\n\n"
        f"---\n\n"
        f"Global Variables to Focus on:\n[{context['variables_text']}]\n\n"
        f"The global variable read/write operations, line numbers, and function information are as follows:\n{context['operations_text']}\n"
        f"\nThe code to analyze is:\n```c\n{context['code_str']}\n```\n"
        f"</think>"
    )

    # 加载Judge部分的prompt
    judge_example_1 = load_prompt("prompt/judge/judge_example_1.md")
    judge_example_2 = load_prompt("prompt/judge/judge_example_2.md")
    judge_example_3 = load_prompt("prompt/judge/judge_example_3.md")
    judge_example_4 = load_prompt("prompt/judge/judge_example_4.md")

    judge_prompt = load_prompt(
        "prompt/judge/judge_steps.md",
        judge_example_1=judge_example_1,
        judge_example_2=judge_example_2,
        judge_example_3=judge_example_3,
        judge_example_4=judge_example_4,
    )

    # 初始化API客户端和代理
    api_client = APIClient()
    expert_agent = ExpertAgent(api_client, model)
    judge_agent = JudgeAgent(api_client, model)

    max_rounds = 3
    round_id = 1
    all_responses = ""
    start_time = time.time()

    # 第一轮Expert Agent分析
    response_expert = expert_agent.analyze(system_prompt, expert_prompt)
    api_client.add_message("user", expert_prompt)  # 将 Expert Agent 输入加入信息池
    api_client.add_message("assistant", response_expert)  # 将 Expert Agent 输出加入信息池
    all_responses += f"[Expert Agent Response - Round {round_id}]\n{response_expert}\n\n"

    # 如果Expert Agent返回 "No defects."，直接结束对话
    if "No defects." in response_expert:
        all_responses += "[Expert Agent] No defects found. Ending the conversation.\n"
        save_response(context['response_file_path'], all_responses, time.time() - start_time)
        return (defect_mode, all_responses)

    def is_abstain(text):
        return 'abstain' in text.strip().lower()

    # 循环处理Expert Agent和Judge Agent的对话
    while not is_abstain(response_expert) and round_id < max_rounds:
        # 将Judge Agent 输入加入信息池
        api_client.add_message("user", response_expert)
        # 拼接 Judge Agent 的消息
        judge_msg = "\n".join([msg["content"] for msg in messages]) + "\n" + judge_prompt
        response_judge = judge_agent.judge(judge_msg)
        api_client.add_message("assistant", response_judge)  # 将 Judge Agent 输出加入信息池
        all_responses += f"[Judge Agent Response - Round {round_id}]\n{response_judge}\n\n"

        # Expert Agent 再分析，prompt给judge的完整回复+pattern名说明
        expert_followup_prompt = f"""
### You are tasked with reviewing the revised report's code, specifically examining read and write operations on global variables.
Focus on identifying any defects related to the specific pattern: {pattern_info['pattern_name']}.
If you find any additional defects of this pattern, list them in the JSON format previously provided.
If no additional defects are found, simply output the word "Abstain".
"""
        round_id += 1
        response_expert = expert_agent.analyze(system_prompt, response_judge + "\n" + expert_followup_prompt)
        api_client.add_message("user", response_judge)  # 将 Judge Agent 输入加入信息池
        api_client.add_message("assistant", response_expert)  # 将 Expert Agent 输出加入信息池
        all_responses += f"[Expert Agent Response - Round {round_id}]\n{response_expert}\n\n"

        if is_abstain(response_expert):
            break

    save_response(context['response_file_path'], all_responses, time.time() - start_time)
    return (defect_mode, all_responses)

import time
import concurrent.futures

import time
import concurrent.futures

def main():
    results = []
    max_time = 0  # Variable to track the latest time
    log_file_path = "/Users/hehang03/code/clover/dataset/c-src/response-1/qwen3-235b/max_time_log.txt"
    # Iterate over i (from 1 to 31)
    for i in range(7, 32):
        j = 1  # Assuming `j` is constant for now, you can adjust as needed
        file_template = f'{BASE_SRC_PATH}/Racebench_2.1/svp_simple_{{:03d}}/svp_simple_{{:03d}}_{{:03d}}'
        defect_file_path = file_template.format(i, i, j) + '-output_defects.txt'
        json_file_path = file_template.format(i, i, j) + '-output.json'
        code_file_path = file_template.format(i, i, j) + '.c'
        response_file_name = os.path.basename(code_file_path).replace('.c', '-response.txt')
        response_file_base = os.path.join(RESPONSE_PATH, response_file_name)

        # === Load all data ===
        content = read_file(defect_file_path)
        json_data = read_json(json_file_path)
        code_lines = read_file(code_file_path).splitlines()
        code_with_lines = add_line_numbers(code_lines)

        # === Extract variable operations & patterns ===
        reports = content.split('---')
        all_variables = set()
        all_operations = {}
        found_defect_modes = set()

        for report in reports:
            matches = re.findall(PATTERN_REGEX, report)
            for match in matches:
                defect_mode, variable, location = match
                all_variables.add(variable)
                found_defect_modes.add(defect_mode)
                operations = extract_variable_operations(variable, json_data)
                all_operations.setdefault(variable, []).extend(operations)

        if not found_defect_modes:
            print(f"[Info] No defects found for i={i}.")
            continue

        variables_text = ", ".join(sorted(all_variables))
        unique_operations = []
        for var in sorted(all_variables):
            unique_operations.extend(list(dict.fromkeys(all_operations.get(var, []))))
        operations_text = "\n".join(unique_operations)
        annotated_code = annotate_code(code_with_lines, unique_operations)
        code_str = "\n".join(annotated_code)

        context_base = {
            'variables_text': variables_text,
            'operations_text': operations_text,
            'code_str': code_str
        }

        # === Shared api_client/model for all tasks ===
        api_client = APIClient()
        model = API_MODEL

        # Track the time for each task
        start_time = time.time()

        # Run tasks in parallel for the defect modes
        with concurrent.futures.ThreadPoolExecutor() as executor:
            futures = []
            for defect_mode in found_defect_modes:
                pattern_response_file = response_file_base.replace('.txt', f'-{defect_mode}.txt')
                context = context_base.copy()
                context['response_file_path'] = pattern_response_file
                fut = executor.submit(handle_pattern_task, defect_mode, context, api_client, model)
                futures.append(fut)

            for fut in concurrent.futures.as_completed(futures):
                result = fut.result()
                if result:
                    results.append(result)
                    print(f"Task result: {result[0]} Expert and Judge results written.")

        end_time = time.time()  # Record the time after the parallel tasks are completed
        time_taken = end_time - start_time
        max_time = max(max_time, time_taken)  # Track the latest time

        print(f"Iteration {i} completed. Time taken: {time_taken:.2f} seconds.")
        # 每次迭代时将最大时间写入文件
        with open(log_file_path, "a") as log_file:
            log_file.write(f"Iteration {i}: Time taken: {time_taken:.2f} seconds. Max time so far: {max_time:.2f} seconds.\n")

    print(f"Max time for all iterations: {max_time:.2f} seconds.")

    # Record max_time to a file
    with open(log_file_path, "a") as log_file:
        log_file.write(f"Maximum time for all iterations: {max_time:.2f} seconds.\n")

if __name__ == "__main__":
    main()


