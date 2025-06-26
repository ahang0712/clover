# main.py

import time
import os
import re
from config import *
from utils import read_file, read_json, add_line_numbers, load_prompt
from defect_patterns import PATTERN_REGEX, PATTERNS
from code_parser import extract_variable_operations, annotate_code
from api_client import APIClient
from expert_agent import ExpertAgent
from judge_agent import JudgeAgent
from output import save_response

def main():
    api_client = APIClient()
    model = API_MODEL

    # 举例处理一组文件
    i, j = 22, 1
    file_template = f'{BASE_SRC_PATH}/2.1/svp_simple_{{:03d}}/svp_simple_{{:03d}}_{{:03d}}'
    defect_file_path = file_template.format(i, i, j) + '-output_defects.txt'
    json_file_path = file_template.format(i, i, j) + '-output.json'
    code_file_path = file_template.format(i, i, j) + '.c'
    response_file_name = os.path.basename(code_file_path).replace('.c', '-response.txt')
    response_file_path = os.path.join(RESPONSE_PATH, response_file_name)

    content = read_file(defect_file_path)
    json_data = read_json(json_file_path)
    code_lines = read_file(code_file_path).splitlines()
    code_with_lines = add_line_numbers(code_lines)

    reports = content.split('---')
    all_variables = set()
    all_operations = {}
    found_defect_modes = set()

    for report in reports:
        matches = re.findall(PATTERN_REGEX, report)
        if matches:
            for match in matches:
                defect_mode, variable, location = match
                all_variables.add(variable)
                found_defect_modes.add(defect_mode)
                operations = extract_variable_operations(variable, json_data)
                all_operations.setdefault(variable, []).extend(operations)

    if not found_defect_modes:
        print("No defects!")
        return

    variables_text = ", ".join(sorted(all_variables))
    unique_operations = []
    for var in sorted(all_variables):
        unique_operations.extend(list(dict.fromkeys(all_operations.get(var, []))))
    operations_text = "\n".join(unique_operations)

    annotated_code = annotate_code(code_with_lines, unique_operations)
    code_str = "\n".join(annotated_code)

    for defect_mode in found_defect_modes:
        pattern_info = PATTERNS.get(defect_mode)
        if not pattern_info:
            continue
        pattern_name = pattern_info['pattern_name']
        example_md_file = pattern_info['prompt_file']

        # 读取所有prompt
        system_prompt = load_prompt("prompt/common/system_message.md")
        task_objective = load_prompt("prompt/expert/task_objective.md", pattern_name=pattern_name)
        detection_rules = load_prompt("prompt/expert/detection_rules.md")
        pattern_example = load_prompt(f"prompt/expert/{example_md_file}")
        judge_prompt = load_prompt("prompt/judge/judge_steps.md")

        # 组装prompt
        user_prompt = f"{task_objective}\n{detection_rules}\n\n{pattern_example}\n\n" \
                      f"---\n\n" \
                      f"Global Variables to Focus on:\n[{variables_text}]\n\n" \
                      f"The global variable read/write operations, line numbers, and function information are as follows:\n{operations_text}\n" \
                      f"\nThe code to analyze is:\n```c\n{code_str}\n```\n"

        expert_agent = ExpertAgent(api_client, model)
        judge_agent = JudgeAgent(api_client, model)

        start = time.time()
        # expert agent
        response1 = expert_agent.analyze(system_prompt, user_prompt + "\nLet's think step by step.")
        save_response(response_file_path, f"Expert Agent Response: {response1}", time.time() - start)

        # judge agent
        response2 = judge_agent.judge(judge_prompt)
        save_response(response_file_path, f"Judge Agent Response: {response2}", time.time() - start)

        # 你可以继续多轮 judge/expert 交互

if __name__ == "__main__":
    main()
