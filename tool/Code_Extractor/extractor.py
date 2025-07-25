#!/usr/bin/env python3
"""
代码提取器 (Code Extractor)
用于压缩C代码，提取关键函数（如主函数和中断函数），处理内联函数，
基于LLVM IR中间代码进行准确的静态分析，并保留原始文件结构和行号。
不需要的代码将被注释掉，而不是删除，确保行号与原文档完全一致。

用法: extractor.py <输入文件> [输出文件]
"""

import os
import sys
import re
import json
import subprocess
import tempfile
from typing import Dict, Any, List, Set, Tuple

# Add parent directory to path to import mcp
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import mcp

@mcp.tool(name="Code_Extractor", description="Extracts relevant code snippets for analysis")
def extract_code(input_file: str, output_file: str, inline: bool = False, keep_all: bool = True, main_function: str = None, verbose: bool = False) -> Dict[str, Any]:
    """
    提取C代码中的关键片段，基于LLVM IR中间代码进行精确提取
    
    Args:
        input_file: 输入C文件路径
        output_file: 输出文件路径
        inline: 是否内联函数
        keep_all: 是否保留所有代码行
        main_function: 指定主函数名
        verbose: 是否显示详细输出
        
    Returns:
        Dict with status and results
    """
    try:
        # 导入config模块获取RESPONSE_PATH
        try:
            sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '../..')))
            import config
            response_path = config.RESPONSE_PATH
            # 确保输出目录存在
            os.makedirs(response_path, exist_ok=True)
            
            # 从输入文件名提取基础名称
            input_basename = os.path.basename(input_file)
            # 提取C文件的基础名称
            if input_basename.endswith(".c"):
                # 如果是C文件，提取基本名称
                base_name = input_basename.replace(".c", "")
                if base_name.startswith("svp_") or "_" in base_name:
                    # 如果文件名看起来像是测试用例，使用它作为前缀
                    output_filename = os.path.basename(output_file).replace("input", base_name)
                else:
                    output_filename = os.path.basename(output_file)
            else:
                # 如果不是C文件，尝试从路径中提取测试用例名称
                match = re.search(r'(svp_\w+_\d+)', input_file)
                if match:
                    base_name = match.group(1)
                    output_filename = os.path.basename(output_file).replace("input", base_name)
                else:
                    # 如果无法提取，直接使用输出文件名
                    output_filename = os.path.basename(output_file)
            
            # 构建新的输出路径
            new_output_file = os.path.join(response_path, output_filename)
            print(f"Redirecting output to: {new_output_file}")
            output_file = new_output_file
        except ImportError:
            print("Warning: Could not import config module, using original output path")
        except Exception as e:
            print(f"Warning: Error setting output path: {str(e)}, using original output path")
        
        print(f"Extracting code from {input_file}")
        
        # 确保输入文件存在
        if not os.path.exists(input_file):
            print(f"Input file does not exist: {input_file}")
            return {
                "status": "error",
                "message": f"Input file does not exist: {input_file}"
            }
        
        # 生成LLVM IR中间代码
        ir_file = generate_llvm_ir(input_file)
        if not ir_file:
            print(f"Failed to generate LLVM IR for {input_file}")
            # 回退到基于文本的提取
            snippets = extract_snippets_text_based(input_file)
            write_output(snippets, output_file)
            return {
                "status": "success",
                "message": "Used text-based extraction as fallback",
                "snippets": snippets,
                "output_file": output_file
            }
        
        # 读取原始代码
        with open(input_file, 'r') as f:
            original_code = f.read()
        
        # 从IR中提取关键函数和变量
        functions, variables = extract_from_ir(ir_file, input_file)
        
        # 基于提取的信息生成代码片段
        extracted_code = generate_extracted_code(original_code, functions, variables)
        
        # 确保输出目录存在
        os.makedirs(os.path.dirname(os.path.abspath(output_file)), exist_ok=True)
        
        # 写入输出文件
        write_output(extracted_code, output_file)
    
        # 清理临时文件
        if os.path.exists(ir_file) and ir_file.startswith(tempfile.gettempdir()):
            os.unlink(ir_file)
        
        print(f"Successfully extracted code to {output_file}")
        return {
            "status": "success",
            "snippets": extracted_code,
            "output_file": output_file
        }
    except Exception as e:
        print(f"Error extracting code: {str(e)}")
        return {
            "status": "error",
            "message": f"Error extracting code: {str(e)}",
            "output_file": output_file if 'output_file' in locals() else None
        }

def generate_llvm_ir(input_file: str) -> str:
    """
    使用clang生成LLVM IR中间代码
    
    Args:
        input_file: 输入C文件路径
        
    Returns:
        生成的LLVM IR文件路径，失败则返回None
    """
    try:
        # 创建临时文件用于IR输出
        with tempfile.NamedTemporaryFile(suffix='.ll', delete=False) as tmp_file:
            ir_file = tmp_file.name
        
        # 构建clang命令
        clang_cmd = [
            "clang", "-O0", "-g", "-emit-llvm", "-S",
            # 添加包含路径
            "-I", os.path.dirname(input_file),
            "-I", os.path.join(os.path.dirname(input_file), ".."),
            input_file, "-o", ir_file
        ]
        
        print(f"Executing command: {' '.join(clang_cmd)}")
        result = subprocess.run(clang_cmd, capture_output=True, text=True)
        
        if result.returncode == 0:
            print(f"Generated LLVM IR: {ir_file}")
            return ir_file
        else:
            print(f"Error generating LLVM IR: {result.stderr}")
            return None
    except Exception as e:
        print(f"Exception while generating LLVM IR: {str(e)}")
        return None

def extract_from_ir(ir_file: str, original_file: str) -> Tuple[Set[str], Set[str]]:
    """
    从LLVM IR中提取关键函数和变量
    
    Args:
        ir_file: LLVM IR文件路径
        original_file: 原始C文件路径
        
    Returns:
        (函数集合, 变量集合)
    """
    try:
        with open(ir_file, 'r') as f:
            ir_content = f.read()
        
        # 提取函数定义
        functions = set()
        func_pattern = re.compile(r'define\s+(?:dso_local\s+)?[^@]*@([a-zA-Z_][a-zA-Z0-9_]*)\(')
        for match in func_pattern.finditer(ir_content):
            functions.add(match.group(1))
        
        # 提取主函数和中断函数
        main_functions = {func for func in functions if func == 'main' or 'main' in func}
        interrupt_functions = {func for func in functions if 'isr' in func.lower() or 'interrupt' in func.lower() or '_irq' in func.lower()}
        
        # 提取全局变量
        variables = set()
        var_pattern = re.compile(r'@([a-zA-Z_][a-zA-Z0-9_]*)\s*=')
        for match in var_pattern.finditer(ir_content):
            variables.add(match.group(1))
        
        # 提取函数调用关系
        call_graph = {}
        for func in functions:
            call_graph[func] = set()
        
        # 为每个函数找出它调用的其他函数
        for func in functions:
            # 找到函数定义
            func_def_pattern = re.compile(r'define\s+(?:dso_local\s+)?[^@]*@' + re.escape(func) + r'\([^{]*{(.*?)}\s*(?:$|;|\n)', re.DOTALL)
            func_match = func_def_pattern.search(ir_content)
            if func_match:
                func_body = func_match.group(1)
                # 查找函数调用
                call_pattern = re.compile(r'call\s+[^@]*@([a-zA-Z_][a-zA-Z0-9_]*)\(')
                for call_match in call_pattern.finditer(func_body):
                    called_func = call_match.group(1)
                    if called_func in functions:
                        call_graph[func].add(called_func)
        
        # 找出所有从主函数和中断函数可达的函数
        reachable_functions = set()
        
        def find_reachable(func):
            if func in reachable_functions:
                return
            reachable_functions.add(func)
            for called_func in call_graph.get(func, set()):
                find_reachable(called_func)
        
        # 从主函数和中断函数开始遍历
        starting_functions = main_functions.union(interrupt_functions)
        if starting_functions:
            for func in starting_functions:
                find_reachable(func)
        else:
            # 如果没有主函数或中断函数，则包含所有函数
            # 这种情况在测试文件中可能会出现
            print("未找到主函数或中断函数，将包含所有函数")
            reachable_functions = functions
        
        print(f"Found {len(reachable_functions)} reachable functions from main and interrupt functions")
        print(f"Found {len(variables)} global variables")
        
        return reachable_functions, variables
    except Exception as e:
        print(f"Error extracting from IR: {str(e)}")
        return set(), set()

def generate_extracted_code(original_code: str, functions: Set[str], variables: Set[str]) -> str:
    """
    基于提取的函数和变量生成代码片段
    
    Args:
        original_code: 原始C代码
        functions: 要保留的函数集合
        variables: 要保留的变量集合
        
    Returns:
        提取后的代码，非提取部分被注释
    """
    lines = original_code.split('\n')
    result_lines = []
    
    # 需要保留的行类型
    keep_patterns = [
        r'^\s*#include',          # include语句
        r'^\s*#define',           # 宏定义
        r'^\s*typedef',           # 类型定义
        r'^\s*struct',            # 结构体定义
        r'^\s*enum',              # 枚举定义
        r'^\s*union',             # 联合定义
    ]
    
    # 查找函数定义 - 改进匹配模式以处理更多的函数定义格式
    function_ranges = {}
    in_function = None
    brace_count = 0
    start_line = 0
    
    # 首先尝试查找函数声明
    for i, line in enumerate(lines):
        # 检查函数定义开始 - 先检查是否有函数名
        if not in_function:
            for func_name in functions:
                # 特别检查此函数名是否在当前行中
                if re.search(r'\b' + re.escape(func_name) + r'\s*\(', line):
                    # 检查这行是否有左大括号，表示函数定义开始
                    if '{' in line:
                        in_function = func_name
                        start_line = i
                        brace_count = line.count('{') - line.count('}')
                        if brace_count == 0:  # 单行函数
                            function_ranges[func_name] = (start_line, i)
                            in_function = None
                        break
                    # 可能函数定义跨越多行，检查下一行是否有左大括号
                    elif i + 1 < len(lines) and '{' in lines[i + 1]:
                        in_function = func_name
                        start_line = i
                        # 下一行将在后续循环中处理
                        break
        else:
            # 在函数内部，计算大括号
            brace_count += line.count('{') - line.count('}')
            if brace_count == 0:
                function_ranges[in_function] = (start_line, i)
                in_function = None
    
    print(f"找到 {len(function_ranges)} 个函数范围:")
    for func_name, (start, end) in function_ranges.items():
        print(f"- {func_name}: 行 {start+1}-{end+1}")
    
    # 查找变量定义
    var_lines = set()
    for i, line in enumerate(lines):
        # 检查是否是变量声明或定义
        if any(var in line for var in variables):
            var_match = re.match(r'^\s*(?:static\s+|extern\s+|volatile\s+|const\s+)*(?:int|char|float|double|long|unsigned|signed|size_t|bool|[a-zA-Z_][a-zA-Z0-9_]*\s*\*)\s+([a-zA-Z_][a-zA-Z0-9_]*)', line)
            if var_match:
                var_name = var_match.group(1)
                if var_name in variables:
                    var_lines.add(i)
    
    # 生成结果，严格保持与原始代码行号对齐
    for i, line in enumerate(lines):
        # 检查是否在要保留的函数内
        in_kept_function = False
        for func_name, (start, end) in function_ranges.items():
            if start <= i <= end and func_name in functions:
                in_kept_function = True
                break
        
        # 检查是否是注释行
        is_comment = re.match(r'^\s*//', line) or re.match(r'^\s*/\*', line) or re.match(r'^\s*\*', line)
        
        # 决定是否保留该行
        keep_line = (
            in_kept_function or
            i in var_lines or
            any(re.match(pattern, line) for pattern in keep_patterns)
        )
        
        if keep_line:
            # 如果是要保留的行，则直接添加
            result_lines.append(line)
        else:
            # 如果是注释行，则添加注释标记，但不复制原始注释内容
            if is_comment:
                result_lines.append("//")
            # 如果是非空行，则添加注释标记并保留原始内容
            elif line.strip():
                result_lines.append(f"// {line}")
            else:
                # 保留空行
                result_lines.append("")
    
    return '\n'.join(result_lines)

def write_output(content: str, output_file: str) -> None:
    """
    将内容写入输出文件
    
    Args:
        content: 要写入的内容
        output_file: 输出文件路径
    """
    # 确保输出目录存在
    os.makedirs(os.path.dirname(os.path.abspath(output_file)), exist_ok=True)
    
    with open(output_file, 'w') as f:
        f.write(content)

def extract_snippets_text_based(input_file: str) -> str:
    """
    基于文本的代码提取方法（作为备用）
    
    Args:
        input_file: 输入C文件路径
        
    Returns:
        提取的代码片段
    """
    # 读取输入文件
    with open(input_file, 'r') as f:
        code = f.read()
    
    # 提取全局变量
    global_vars = extract_global_variables(code)
    
    # 提取函数定义
    functions = extract_functions(code)
    
    # 提取线程创建
    threads = extract_thread_operations(code)
    
    # 提取锁操作
    locks = extract_lock_operations(code)
    
    # 组合提取的片段
    snippets = []
    
    if global_vars:
        snippets.append("/* 全局变量 */")
        snippets.append(global_vars)
    
    if functions:
        snippets.append("\n/* 函数定义 */")
        snippets.append(functions)
    
    if threads:
        snippets.append("\n/* 线程操作 */")
        snippets.append(threads)
    
    if locks:
        snippets.append("\n/* 锁操作 */")
        snippets.append(locks)
    
    return "\n".join(snippets)

def extract_global_variables(code: str) -> str:
    """提取全局变量定义"""
    # 匹配全局变量定义的正则表达式
    pattern = r'(?:extern|static)?\s+(?:const|volatile)?\s*(?:int|char|float|double|long|unsigned|void\s*\*|pthread_mutex_t|pthread_t)\s+[a-zA-Z_][a-zA-Z0-9_]*(?:\s*=\s*[^;]+)?;'
    matches = re.findall(pattern, code)
    
    # 过滤掉函数内的局部变量
    global_vars = []
    for match in matches:
        # 简单检查：如果变量定义前后没有大括号，则可能是全局变量
        pos = code.find(match)
        if pos > 0:
            # 检查前面的代码中是否有未闭合的大括号
            pre_code = code[:pos]
            if pre_code.count('{') == pre_code.count('}'):
                global_vars.append(match)
    
    return "\n".join(global_vars)

def extract_functions(code: str) -> str:
    """提取函数定义"""
    # 匹配函数定义的正则表达式
    pattern = r'(?:static|extern)?\s*(?:void|int|char|float|double|long|unsigned|void\s*\*|pthread_t)\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\([^)]*\)\s*\{'
    matches = re.finditer(pattern, code)
    
    functions = []
    for match in matches:
        func_start = match.start()
        
        # 找到函数体的结束位置
        brace_count = 1
        func_end = func_start + match.group(0).rfind('{') + 1
        
        while brace_count > 0 and func_end < len(code):
            if code[func_end] == '{':
                brace_count += 1
            elif code[func_end] == '}':
                brace_count -= 1
            func_end += 1
        
        # 提取完整的函数定义
        function = code[func_start:func_end]
        functions.append(function)
    
    return "\n\n".join(functions)

def extract_thread_operations(code: str) -> str:
    """提取线程创建和操作"""
    # 匹配线程创建和操作的正则表达式
    patterns = [
        r'pthread_create\s*\([^;]*;',
        r'pthread_join\s*\([^;]*;',
        r'pthread_detach\s*\([^;]*;'
    ]
    
    thread_ops = []
    for pattern in patterns:
        matches = re.findall(pattern, code)
        thread_ops.extend(matches)
    
    return "\n".join(thread_ops)

def extract_lock_operations(code: str) -> str:
    """提取锁操作"""
    # 匹配锁操作的正则表达式
    patterns = [
        r'pthread_mutex_init\s*\([^;]*;',
        r'pthread_mutex_lock\s*\([^;]*;',
        r'pthread_mutex_unlock\s*\([^;]*;',
        r'pthread_mutex_destroy\s*\([^;]*;'
    ]
    
    lock_ops = []
    for pattern in patterns:
        matches = re.findall(pattern, code)
        lock_ops.extend(matches)
    
    return "\n".join(lock_ops)

if __name__ == "__main__":
    # 简单的命令行接口，用于测试
    if len(sys.argv) < 3:
        print("Usage: python extractor.py <input_file> <output_file>")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    
    result = extract_code(input_file, output_file)
    print(json.dumps(result, indent=2)) 