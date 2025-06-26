# code_parser.py

import re

def extract_variable_operations(variable, json_data): # Extract the operations for the given variable from the JSON data
    operations = []
    for info in json_data.get("MAIN_INFO", []):
        if info["variable"] == variable:
            operations.append(f'{variable}: line {info["line"]}, {"Write" if info["operation"] == "store" else "Read"} Operation, {info["function"]}')
    for info in json_data.get("ISR_INFO", []):
        if info["variable"] == variable:
            operations.append(f'{variable}: line {info["line"]}, {"Write" if info["operation"] == "store" else "Read"} Operation, {info["function"]}')
    return operations

def annotate_code(code_lines, operations): # Annotate the code lines with the extracted operations
    line_annotations = {}
    for operation in operations:
        parts = operation.split(", ")
        if len(parts) >= 3:
            var_info_parts = parts[0].split(":")
            var_name = var_info_parts[0].strip()
            line_match = re.search(r'line (\d+)', parts[0])
            if line_match:
                line_num = int(line_match.group(1))
                op_type = parts[1].strip()
                if line_num not in line_annotations:
                    line_annotations[line_num] = []
                line_annotations[line_num].append(f"{op_type} on {var_name}")
    annotated_code = code_lines.copy()
    for line_num, annotations in line_annotations.items():
        if 0 <= line_num-1 < len(annotated_code):
            combined_annotation = " // " + ". ".join(annotations) + "."
            annotated_code[line_num-1] = annotated_code[line_num-1] + combined_annotation
    return annotated_code
