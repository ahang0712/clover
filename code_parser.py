# code_parser.py

import re

def extract_function_calls_with_lines(code_lines, target_functions):
    """从代码中提取指定函数的调用位置和行号"""
    function_calls = []
    
    for i, line in enumerate(code_lines, 1):
        line_content = line.strip()
        for func_name in target_functions:
            # 匹配函数调用模式：function_name(
            pattern = rf'\b{re.escape(func_name)}\s*\('
            if re.search(pattern, line_content):
                function_calls.append({
                    "line": i,
                    "function": func_name,
                    "content": line_content
                })
    
    return function_calls

def extract_variable_operations(variable, json_data): # Extract the operations for the given variable from the JSON data
    operations = []
    for info in json_data.get("MAIN_INFO", []):
        if info["variable"] == variable:
            operations.append(f'{variable}: line {info["line"]}, {"Write" if info["operation"] == "store" else "Read"} Operation, {info["function"]}')
    for info in json_data.get("ISR_INFO", []):
        if info["variable"] == variable:
            operations.append(f'{variable}: line {info["line"]}, {"Write" if info["operation"] == "store" else "Read"} Operation, {info["function"]}')
    return operations

def annotate_code(code_lines, operations, focus_variables=None, function_calls=None): # Annotate the code lines with the extracted operations and function calls
    line_annotations = {}
    
    # 处理变量操作
    for operation in operations:
        parts = operation.split(", ")
        if len(parts) >= 3:
            var_info_parts = parts[0].split(":")
            var_name = var_info_parts[0].strip()
            
            # 如果指定了焦点变量，只处理焦点变量的操作
            if focus_variables and var_name not in focus_variables:
                continue
                
            line_match = re.search(r'line (\d+)', parts[0])
            if line_match:
                line_num = int(line_match.group(1))
                op_type = parts[1].strip()
                
                # 将操作类型映射为更清晰的描述
                operation_mapping = {
                    'load': 'Read operation',
                    'store': 'Write operation'
                }
                display_op = operation_mapping.get(op_type, op_type)
                
                if line_num not in line_annotations:
                    line_annotations[line_num] = []
                line_annotations[line_num].append(f"{display_op} on {var_name}")
    
    # 处理函数调用（如果提供）
    if function_calls:
        for func_call in function_calls:
            line_num = func_call.get("line")
            func_name = func_call.get("function")
            if line_num and func_name:
                if line_num not in line_annotations:
                    line_annotations[line_num] = []
                
                # 为中断控制函数添加特殊注释
                if func_name == "disable_isr":
                    line_annotations[line_num].append("Disable interrupt")
                elif func_name == "enable_isr":
                    line_annotations[line_num].append("Enable interrupt")
                else:
                    line_annotations[line_num].append(f"Call {func_name}")
    
    annotated_code = code_lines.copy()
    for line_num, annotations in line_annotations.items():
        if 0 <= line_num-1 < len(annotated_code):
            combined_annotation = " // " + ". ".join(annotations) + "."
            annotated_code[line_num-1] = annotated_code[line_num-1] + combined_annotation
    return annotated_code

    # 处理变量操作
    for operation in operations:
        parts = operation.split(", ")
        if len(parts) >= 3:
            var_info_parts = parts[0].split(":")
            var_name = var_info_parts[0].strip()
            
            # 如果指定了焦点变量，只处理焦点变量的操作
            if focus_variables and var_name not in focus_variables:
                continue
                
            line_match = re.search(r'line (\d+)', parts[0])
            if line_match:
                line_num = int(line_match.group(1))
                op_type = parts[1].strip()
                
                # 将操作类型映射为更清晰的描述
                operation_mapping = {
                    'load': 'Read operation',
                    'store': 'Write operation'
                }
                display_op = operation_mapping.get(op_type, op_type)
                
                if line_num not in line_annotations:
                    line_annotations[line_num] = []
                line_annotations[line_num].append(f"{display_op} on {var_name}")
    
    # 处理函数调用（如果提供）
    if function_calls:
        for func_call in function_calls:
            line_num = func_call.get("line")
            func_name = func_call.get("function")
            if line_num and func_name:
                if line_num not in line_annotations:
                    line_annotations[line_num] = []
                
                # 为中断控制函数添加特殊注释
                if func_name == "disable_isr":
                    line_annotations[line_num].append("Disable interrupt")
                elif func_name == "enable_isr":
                    line_annotations[line_num].append("Enable interrupt")
                else:
                    line_annotations[line_num].append(f"Call {func_name}")
    
    annotated_code = code_lines.copy()
    for line_num, annotations in line_annotations.items():
        if 0 <= line_num-1 < len(annotated_code):
            combined_annotation = " // " + ". ".join(annotations) + "."
            annotated_code[line_num-1] = annotated_code[line_num-1] + combined_annotation
    return annotated_code
