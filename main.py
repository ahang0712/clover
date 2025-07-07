import time
import os
import re
import concurrent.futures

from config import *
from utils import read_file, read_json, add_line_numbers, load_prompt
from defect_patterns import PATTERN_REGEX, PATTERNS
from code_parser import extract_variable_operations, annotate_code
from api_client import APIClient
from agent.expert_agent import ExpertAgent
from agent.judge_agent import JudgeAgent
from output import save_response

def handle_pattern_task(defect_mode, context, api_client, model):
    """
    Handles expert/judge analysis for a specific defect pattern,
    including multi-turn dialogue until Expert Agent returns "Abstain" or rounds exceed max_rounds.
    If Expert Agent returns "No defects.", the process ends early.
    """
    import json

    pattern_info = PATTERNS.get(defect_mode)
    if not pattern_info:
        print(f"[Warning] Pattern info not found: {defect_mode}")
        return

    # ===== 加载各种prompt和范例 =====
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

    # ===== Judge部分依然保留原有加载方式 =====
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

    response_file_path = context['response_file_path']
    all_responses = ""
    start_time = time.time()

    expert_agent = ExpertAgent(api_client, model)
    judge_agent = JudgeAgent(api_client, model)

    max_rounds = 3
    round_id = 1

    # ========== 多轮循环，直到Expert Agent输出"Abstain"或达到最大轮次 ==========
    system_msg = system_prompt
    expert_msg = expert_prompt + "\nLet's think step by step."

    # 第一轮Expert Agent分析
    response_expert = expert_agent.analyze(system_msg, expert_msg)
    all_responses += f"[Expert Agent Response - Round {round_id}]\n{response_expert}\n\n"

    def is_abstain(text):
        return text.strip().lower().startswith('abstain')

    # 如果Expert Agent返回 "No defects."，直接结束对话
    if "No defects." in response_expert:
        all_responses += "[Expert Agent] No defects found. Ending the conversation.\n"
        save_response(response_file_path, all_responses, time.time() - start_time)
        return (defect_mode, all_responses)

    while not is_abstain(response_expert) and round_id < max_rounds:
        # Judge Agent: 拼接prompt
        def extract_initial_json(response1):
            try:
                json_start = response1.find("{")
                json_end = response1.rfind("}")
                if json_start != -1 and json_end != -1 and json_end > json_start:
                    data = json.loads(response1[json_start:json_end+1])
                    if "initial" in data:
                        return data["initial"]
                    return data
            except Exception as e:
                print("[Warn] initial json extract failed:", e)
            return {}
        initial_json = extract_initial_json(response_expert)
        initial_json_str = json.dumps(initial_json, ensure_ascii=False, indent=2)

        judge_prompt_full = (
            f"{judge_prompt}\n\n"
            f"---\n\n"
            f"Global Variables to Focus on:\n[{context['variables_text']}]\n\n"
            f"The global variable read/write operations, line numbers, and function information are as follows:\n{context['operations_text']}\n"
            f"\nThe code to analyze is:\n```c\n{context['code_str']}\n```\n"
            f"Expert Agent Initial Report (JSON):\n{initial_json_str}\n\n"
        )
        response_judge = judge_agent.judge(judge_prompt_full)
        all_responses += f"[Judge Agent Response - Round {round_id}]\n{response_judge}\n\n"

        # Expert Agent 再分析，prompt给judge的完整回复+pattern名说明
        expert_followup_prompt = f"""
Please review the above revised report and code, specifically examining read and write operations on global variables.
Focus on identifying any defects related to the specific pattern: {pattern_info['pattern_name']}.
If you find any additional defects of this pattern, list them in the JSON format previously provided.
If no additional defects are found, simply output the word "Abstain".
"""
        round_id += 1
        response_expert = expert_agent.analyze(system_msg, response_judge + "\n" + expert_followup_prompt)
        all_responses += f"[Expert Agent Response - Round {round_id}]\n{response_expert}\n\n"

        if is_abstain(response_expert):
            break

    save_response(response_file_path, all_responses, time.time() - start_time)
    return (defect_mode, all_responses)

def main():
    # === File selection logic ===
    i, j = 2, 1
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
        print("[Info] No defects!")
        return

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

    results = []
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

    # === Optional: Further post-processing ===

if __name__ == "__main__":
    main()
