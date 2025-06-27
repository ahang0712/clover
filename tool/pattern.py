import json
import sys
import os
from typing import List, Dict, Any

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