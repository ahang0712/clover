import json
import sys
import os
from typing import List, Dict, Any

# 添加MCP装饰器函数
def mcp_tool(func):
    """MCP工具装饰器，标记函数为MCP工具"""
    def wrapper(*args, **kwargs):
        try:
            result = func(*args, **kwargs)
            return {"status": "success", "message": "Tool executed successfully", "data": result}
        except Exception as e:
            return {"status": "error", "message": str(e)}
    
    # 添加标记属性
    wrapper.is_mcp_tool = True
    wrapper.__name__ = func.__name__
    wrapper.__doc__ = func.__doc__
    return wrapper

def find_consecutive_reads(operations: List[Dict[str, str]], variable: str) -> bool:
    """
    Find consecutive read operations for a given variable
    Returns True if found consecutive reads, False otherwise
    """
    if len(operations) < 2:
        return False
        
    found_first_read = False
    for i in range(len(operations)):
        current_op = operations[i]
        
        # Skip if not the target variable
        if current_op["variable"] != variable:
            continue
            
        # If we find a write operation, reset the first read flag
        # if current_op["operation"] == "store":
        #     found_first_read = False
        #     continue
            
        # If we find a read operation
        if current_op["operation"] == "load":
            # If we already found a first read, we found consecutive reads
            if found_first_read:
                # print("OK!")
                return True
            # Mark that we found our first read
            found_first_read = True
            
    return False

def find_read_then_write(operations: List[Dict[str, str]], variable: str) -> bool:
    """
    Find read followed by write operation for a given variable
    Returns True if found read-write pattern, False otherwise
    """
    if len(operations) < 2:
        return False
        
    found_read = False
    for op in operations:
        # Skip if not the target variable
        if op["variable"] != variable:
            continue
            
        # If we find a read operation
        if op["operation"] == "load":
            found_read = True
        # If we find a write operation after a read
        elif op["operation"] == "store" and found_read:
            return True
            
    return False

def find_consecutive_writes(operations: List[Dict[str, str]], variable: str) -> bool:
    """
    Find consecutive write operations for a given variable
    Returns True if found consecutive writes, False otherwise
    """
    if len(operations) < 2:
        return False
        
    found_first_write = False
    for i in range(len(operations)):
        current_op = operations[i]
        
        # Skip if not the target variable
        if current_op["variable"] != variable:
            continue
            
        # If we find a read operation, reset the first write flag
        # if current_op["operation"] == "load":
        #     found_first_write = False
        #     continue
            
        # If we find a write operation
        if current_op["operation"] == "store":
            # If we already found a first write, we found consecutive writes
            if found_first_write:
                return True
            # Mark that we found our first write
            found_first_write = True
            
    return False

def find_write_then_read(operations: List[Dict[str, str]], variable: str) -> bool:
    """
    Find write followed by read operation for a given variable
    Returns True if found write-read pattern, False otherwise
    """
    if len(operations) < 2:
        return False
        
    found_write = False
    for op in operations:
        # Skip if not the target variable
        if op["variable"] != variable:
            continue
            
        # If we find a write operation
        if op["operation"] == "store":
            found_write = True
        # If we find a read operation after a write
        elif op["operation"] == "load" and found_write:
            return True
            
    return False

def has_write_operation(operations: List[Dict[str, str]], variable: str) -> bool:
    """
    Check if there are any write operations for the given variable
    """
    return any(op["operation"] == "store" and op["variable"] == variable for op in operations)

def has_read_operation(operations: List[Dict[str, str]], variable: str) -> bool:
    """
    Check if there are any read operations for the given variable
    """
    return any(op["operation"] == "load" and op["variable"] == variable for op in operations)

def get_isr_operations(isr_info: List[Dict[str, str]], isr_function: str) -> List[Dict[str, str]]:
    """
    Get all operations for a specific ISR function
    """
    return [op for op in isr_info if op["function"] == isr_function]

def detect_rwr_defects(data: Dict[str, Any]) -> List[Dict[str, Any]]:
    """
    Detect RWR defects in the given data
    Returns a list of detected defects
    """
    defects = []
    isr_count = data["ISR_COUNT"]
    
    if isr_count == 0:
        return defects
        
    for global_var in data["GLOBAL_VAR"]:
        main_ops = data["MAIN_INFO"]
        if find_consecutive_reads(main_ops, global_var):
            for isr_ops in data["ISR_INFO"]:
                if has_write_operation([isr_ops], global_var):
                    # print("Write!")
                    defects.append({
                        "variable": global_var,
                        "type": "RWR",
                        "location": "MAIN",
                        "description": f"RWR defect found: consecutive reads in main function with write in ISR"
                    })
                    break
        
        if isr_count >= 2:
            isr_functions = sorted(set(op["function"] for op in data["ISR_INFO"]))
            
            for i in range(len(isr_functions) - 1):
                current_isr = isr_functions[i]
                current_isr_ops = get_isr_operations(data["ISR_INFO"], current_isr)
                
                if find_consecutive_reads(current_isr_ops, global_var):
                    for higher_isr in isr_functions[i + 1:]:
                        higher_isr_ops = get_isr_operations(data["ISR_INFO"], higher_isr)
                        if has_write_operation(higher_isr_ops, global_var):
                            defects.append({
                                "variable": global_var,
                                "type": "RWR",
                                "location": current_isr,
                                "description": f"RWR defect found: consecutive reads in {current_isr} with write in {higher_isr}"
                            })
                            break
    
    return defects

def detect_rww_defects(data: Dict[str, Any]) -> List[Dict[str, Any]]:
    """
    Detect RWW defects in the given data
    Returns a list of detected defects
    """
    defects = []
    isr_count = data["ISR_COUNT"]
    
    if isr_count == 0:
        return defects
        
    for global_var in data["GLOBAL_VAR"]:
        main_ops = data["MAIN_INFO"]
        if find_read_then_write(main_ops, global_var):
            for isr_ops in data["ISR_INFO"]:
                if has_write_operation([isr_ops], global_var):
                    defects.append({
                        "variable": global_var,
                        "type": "RWW",
                        "location": "MAIN",
                        "description": f"RWW defect found: read-write in main function with write in ISR"
                    })
                    break
        
        if isr_count >= 2:
            isr_functions = sorted(set(op["function"] for op in data["ISR_INFO"]))
            
            for i in range(len(isr_functions) - 1):
                current_isr = isr_functions[i]
                current_isr_ops = get_isr_operations(data["ISR_INFO"], current_isr)
                
                if find_read_then_write(current_isr_ops, global_var):
                    for higher_isr in isr_functions[i + 1:]:
                        higher_isr_ops = get_isr_operations(data["ISR_INFO"], higher_isr)
                        if has_write_operation(higher_isr_ops, global_var):
                            defects.append({
                                "variable": global_var,
                                "type": "RWW",
                                "location": current_isr,
                                "description": f"RWW defect found: read-write in {current_isr} with write in {higher_isr}"
                            })
                            break
    
    return defects

def detect_wrw_defects(data: Dict[str, Any]) -> List[Dict[str, Any]]:
    """
    Detect WRW defects in the given data
    Returns a list of detected defects
    """
    defects = []
    isr_count = data["ISR_COUNT"]
    
    if isr_count == 0:
        return defects
        
    for global_var in data["GLOBAL_VAR"]:
        main_ops = data["MAIN_INFO"]
        if find_consecutive_writes(main_ops, global_var):
            for isr_ops in data["ISR_INFO"]:
                if has_read_operation([isr_ops], global_var):
                    defects.append({
                        "variable": global_var,
                        "type": "WRW",
                        "location": "MAIN",
                        "description": f"WRW defect found: consecutive writes in main function with read in ISR"
                    })
                    break
        
        if isr_count >= 2:
            isr_functions = sorted(set(op["function"] for op in data["ISR_INFO"]))
            
            for i in range(len(isr_functions) - 1):
                current_isr = isr_functions[i]
                current_isr_ops = get_isr_operations(data["ISR_INFO"], current_isr)
                
                if find_consecutive_writes(current_isr_ops, global_var):
                    for higher_isr in isr_functions[i + 1:]:
                        higher_isr_ops = get_isr_operations(data["ISR_INFO"], higher_isr)
                        if has_read_operation(higher_isr_ops, global_var):
                            defects.append({
                                "variable": global_var,
                                "type": "WRW",
                                "location": current_isr,
                                "description": f"WRW defect found: consecutive writes in {current_isr} with read in {higher_isr}"
                            })
                            break
    
    return defects

def detect_wwr_defects(data: Dict[str, Any]) -> List[Dict[str, Any]]:
    """
    Detect WWR defects in the given data
    Returns a list of detected defects
    """
    defects = []
    isr_count = data["ISR_COUNT"]
    
    if isr_count == 0:
        return defects
        
    for global_var in data["GLOBAL_VAR"]:
        main_ops = data["MAIN_INFO"]
        if find_write_then_read(main_ops, global_var):
            for isr_ops in data["ISR_INFO"]:
                if has_write_operation([isr_ops], global_var):
                    defects.append({
                        "variable": global_var,
                        "type": "WWR",
                        "location": "MAIN",
                        "description": f"WWR defect found: write-read in main function with write in ISR"
                    })
                    break
        
        if isr_count >= 2:
            isr_functions = sorted(set(op["function"] for op in data["ISR_INFO"]))
            
            for i in range(len(isr_functions) - 1):
                current_isr = isr_functions[i]
                current_isr_ops = get_isr_operations(data["ISR_INFO"], current_isr)
                
                if find_write_then_read(current_isr_ops, global_var):
                    for higher_isr in isr_functions[i + 1:]:
                        higher_isr_ops = get_isr_operations(data["ISR_INFO"], higher_isr)
                        if has_write_operation(higher_isr_ops, global_var):
                            defects.append({
                                "variable": global_var,
                                "type": "WWR",
                                "location": current_isr,
                                "description": f"WWR defect found: write-read in {current_isr} with write in {higher_isr}"
                            })
                            break
    
    return defects

def process_files(file_paths: List[str]) -> None:
    """
    Process multiple JSON files and detect all types of defects
    Save results to txt files only when defects are found
    """
    for file_path in file_paths:
        print(f"\nProcessing file: {file_path}")
        try:
            # Load input data from JSON file
            with open(file_path, 'r') as f:
                input_data = json.load(f)
            
            # Detect all types of defects
            all_defects = []
            all_defects.extend(detect_rwr_defects(input_data))
            all_defects.extend(detect_rww_defects(input_data))
            all_defects.extend(detect_wrw_defects(input_data))
            all_defects.extend(detect_wwr_defects(input_data))
            
            output_file = os.path.splitext(file_path)[0] + "_defects.txt"
            with open(output_file, 'w') as f:
                if not all_defects:
                    print(f"No defects found in {file_path}.")
                    f.write("No defects!")
                else:
                # Only create output file if defects are found
                # output_file = os.path.splitext(file_path)[0] + "_defects.txt"
                    f.write(f"Found defects in {file_path}:\n")
                    print(f"Found defects in {file_path}:")
                    
                    # Group defects by type
                    defect_types = sorted(set(defect["type"] for defect in all_defects))
                    for defect_type in defect_types:
                        # f.write(f"\n{defect_type} Defects:\n")
                        print(f"\n{defect_type} Defects:")
                        
                        type_defects = [d for d in all_defects if d["type"] == defect_type]
                        for defect in type_defects:
                            defect_info = (
                                f"Defect_Pattern: {defect['type']}\n"
                                f"Variable: {defect['variable']}\n"
                                f"Location: {defect['location']}\n"
                                f"Description: {defect['description']}\n"
                                "---\n"
                            )
                            f.write(defect_info)
                            print(defect_info, end='')
                
                print(f"\nResults saved to: {output_file}")
            
        except Exception as e:
            print(f"Error processing file {file_path}: {e}")

@mcp_tool
def detect_defects(input_file: str, output_file: str) -> Dict[str, Any]:
    """
    MCP入口函数，用于检测缺陷
    
    参数:
        input_file: 输入JSON文件路径
        output_file: 输出文件路径
    
    返回:
        包含状态和消息的字典
    """
    try:
        print(f"Processing file: {input_file}")
        
        # 导入config模块获取RESPONSE_PATH
        try:
            sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))
            import config
            response_path = config.RESPONSE_PATH
            # 确保输出目录存在
            os.makedirs(response_path, exist_ok=True)
            
            # 从输入文件名提取基础名称
            input_basename = os.path.basename(input_file)
            if input_basename.startswith("input-"):
                # 如果是固定的input前缀，替换为基于原始C文件的名称
                if "analysis" in input_basename:
                    # 从输入文件内容中提取原始文件名
                    with open(input_file, 'r') as f:
                        try:
                            data = json.load(f)
                            # 尝试从全局变量名中提取文件名前缀
                            if "GLOBAL_VAR" in data and len(data["GLOBAL_VAR"]) > 0:
                                first_var = data["GLOBAL_VAR"][0]
                                # 假设变量名格式为 "filename_global_var"
                                parts = first_var.split("_global_")
                                if len(parts) > 0:
                                    base_name = parts[0]
                                    output_filename = os.path.basename(output_file).replace("input", base_name)
                                else:
                                    output_filename = os.path.basename(output_file)
                            else:
                                output_filename = os.path.basename(output_file)
                        except json.JSONDecodeError:
                            output_filename = os.path.basename(output_file)
                else:
                    # 如果无法从内容提取，使用输出文件名但替换前缀
                    output_filename = os.path.basename(output_file)
            else:
                # 如果输入文件不是以input开头，直接使用输出文件名
                output_filename = os.path.basename(output_file)
                
            # 构建新的输出路径
            new_output_file = os.path.join(response_path, output_filename)
            print(f"Redirecting output to: {new_output_file}")
            output_file = new_output_file
        except ImportError:
            print("Warning: Could not import config module, using original output path")
        except Exception as e:
            print(f"Warning: Error setting output path: {str(e)}, using original output path")
        
        # 加载输入数据
        with open(input_file, 'r') as f:
            input_data = json.load(f)
        
        # 检测所有类型的缺陷
        all_defects = []
        all_defects.extend(detect_rwr_defects(input_data))
        all_defects.extend(detect_rww_defects(input_data))
        all_defects.extend(detect_wrw_defects(input_data))
        all_defects.extend(detect_wwr_defects(input_data))
        
        # 创建结果对象
        result = {
            "status": "success",
            "defects_found": len(all_defects) > 0,
            "defect_count": len(all_defects),
            "defects": all_defects
        }
        
        # 确保输出目录存在
        os.makedirs(os.path.dirname(os.path.abspath(output_file)), exist_ok=True)
        
        # 确定输出格式
        is_json_output = output_file.endswith('.json')
        
        # 将结果写入输出文件
        if is_json_output:
            # JSON格式输出
            with open(output_file, 'w') as f:
                json.dump(result, f, indent=2)
        else:
            # 文本格式输出
            with open(output_file, 'w') as f:
                if not all_defects:
                    print(f"No defects found in {input_file}.")
                    f.write("No defects!")
                else:
                    f.write(f"Found defects in {input_file}:\n")
                    print(f"Found defects in {input_file}:")
                    
                    # 分组缺陷
                    defect_types = sorted(set(defect["type"] for defect in all_defects))
                    for defect_type in defect_types:
                        print(f"\n{defect_type} Defects:")
                        
                        type_defects = [d for d in all_defects if d["type"] == defect_type]
                        for defect in type_defects:
                            defect_info = (
                                f"Defect_Pattern: {defect['type']}\n"
                                f"Variable: {defect['variable']}\n"
                                f"Location: {defect['location']}\n"
                                f"Description: {defect['description']}\n"
                                "---\n"
                            )
                            f.write(defect_info)
                            print(defect_info, end='')
        
        print(f"\nResults saved to: {output_file}")
        return {"status": "success", "message": "Tool executed successfully", "data": result, "output_file": output_file}
            
    except Exception as e:
        error_message = f"Error processing file {input_file}: {e}"
        print(error_message)
        return {"status": "error", "message": error_message}

def main():
    # Get file paths from command line arguments
    file_paths = sys.argv[1:]
    
    if not file_paths:
        print("Please provide file paths as arguments.")
        sys.exit(1)
    
    # Process all files
    process_files(file_paths)

if __name__ == "__main__":
    main()