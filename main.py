import time
import os
import re
import concurrent.futures
import json

from config import *
from utils import read_file, read_json, add_line_numbers, load_prompt
from defect_patterns import PATTERN_REGEX, PATTERNS
from api_client import APIClient
from agent.plan_agent import PlanAgent
from agent.expert_agent import ExpertAgent
from agent.judge_agent import JudgeAgent
from output import save_response

def handle_pattern_task(defect_mode, context, api_client, model):
    """
    Handles expert/judge analysis for a specific defect pattern.
    """
    pattern_info = PATTERNS.get(defect_mode)
    if not pattern_info:
        print(f"[Warning] Pattern info not found: {defect_mode}")
        return

    # Load prompts
    system_prompt = load_prompt("prompt/common/system_message.md")
    task_objective = load_prompt("prompt/expert/task_objective.md", pattern_name=pattern_info['pattern_name'])
    detection_rules = load_prompt("prompt/expert/detection_rules.md")
    domain_knowledge_md_file = pattern_info['domain_knowledge']
    domain_knowledge = load_prompt(f"prompt/domain_knowledge/{domain_knowledge_md_file}")
    example_md_file = pattern_info['pattern_example']
    pattern_example = load_prompt(f"prompt/expert/{example_md_file}")
    judge_prompt = load_prompt("prompt/judge/judge_steps.md")
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
        f"The following structured analysis facts are provided:\n"
        f"{json.dumps(context['facts'], indent=2)}\n"
        f"</think>"
    )
    
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

    expert_agent = ExpertAgent(api_client, model)
    judge_agent = JudgeAgent(api_client, model)

    response_file_path = context['response_file_path']
    start = time.time()
    # Expert agent
    response1 = expert_agent.analyze(system_prompt, expert_prompt + "\nLet's think step by step.")
    save_response(response_file_path, f"Expert Agent Response: {response1}", time.time() - start)
    # Judge agent
    response2 = judge_agent.judge(judge_prompt)
    save_response(response_file_path, f"Judge Agent Response: {response2}", time.time() - start)
    return (defect_mode, response1, response2)

def main():
    # === File selection logic ===
    i, j = 18, 1
    file_template = f'{BASE_SRC_PATH}/Racebench_2.1/svp_simple_{{:03d}}/svp_simple_{{:03d}}_{{:03d}}'
    defect_file_path = file_template.format(i, i, j) + '-output_defects.txt'
    json_file_path = file_template.format(i, i, j) + '-output.json'
    code_file_path = file_template.format(i, i, j) + '.c'
    response_file_name = os.path.basename(code_file_path).replace('.c', '-response.txt')
    response_file_base = os.path.join(RESPONSE_PATH, response_file_name)

    # === Load code and defect pattern detection results ===
    code_text = read_file(code_file_path)
    content = read_file(defect_file_path)
    reports = content.split('---')

    # === Detect all found defect modes ===
    found_defect_modes = set()
    for report in reports:
        matches = re.findall(PATTERN_REGEX, report)
        for match in matches:
            defect_mode, variable, location = match
            found_defect_modes.add(defect_mode)

    if not found_defect_modes:
        print("[Info] No defects!")
        return

    # === Prepare PlanAgent ===
    api_client = APIClient()
    model = API_MODEL
    plan_agent = PlanAgent(api_client, model)

    # === Let PlanAgent produce all required structured facts ===
    plan_result = plan_agent.decide_tools(
        code_text,
        known_patterns=list(found_defect_modes)
    )
    # The facts object (as required by ExpertAgent/JudgeAgent)
    facts = plan_result["facts"]

    # === Shared context for all pattern tasks ===
    context_base = {
        'facts': facts
    }

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
