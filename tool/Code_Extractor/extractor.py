#!/usr/bin/env python3
"""
代码提取器 (Code Extractor)
用于压缩C代码，提取关键函数（如主函数和中断函数），处理内联函数，
基于行号进行准确的静态分析，并保留原始文件结构和行号。
不需要的代码将被注释掉，而不是删除，确保行号与原文档完全一致。

用法: extractor.py <输入文件> [输出文件]
"""

import argparse
import os
import re
import sys
from collections import defaultdict, namedtuple

# 定义函数信息结构
FunctionInfo = namedtuple('FunctionInfo', ['name', 'code', 'start_line', 'end_line', 'calls'])

def parse_arguments():
    """解析命令行参数"""
    parser = argparse.ArgumentParser(description='C代码提取器 - 保持原始行号')
    parser.add_argument('input_file', help='输入的C文件')
    parser.add_argument('-o', '--output', dest='output_file', help='输出文件名（默认为<输入文件名>_extracted.c）')
    parser.add_argument('-i', '--inline', action='store_true', help='内联所有被调用的函数')
    parser.add_argument('-m', '--main', help='指定主函数名（如果不是标准的main）')
    parser.add_argument('-p', '--patterns', help='指定包含模式的文件，每行一个正则表达式')
    parser.add_argument('-v', '--verbose', action='store_true', help='显示详细输出')
    parser.add_argument('-k', '--keep-all', action='store_true', help='保留所有原始代码行（注释不需要的部分）')
    return parser.parse_args()

def read_file(filename):
    """读取文件内容"""
    try:
        with open(filename, 'r', encoding='utf-8', errors='replace') as f:
            return f.read()
    except Exception as e:
        print(f"错误：无法读取文件 {filename}: {e}")
        sys.exit(1)

def write_file(filename, content):
    """写入文件内容"""
    try:
        with open(filename, 'w', encoding='utf-8') as f:
            f.write(content)
    except Exception as e:
        print(f"错误：无法写入文件 {filename}: {e}")
        sys.exit(1)

def find_function_locations(code):
    """
    查找所有函数的位置
    返回：字典，键为函数名，值为(开始行, 结束行)元组
    """
    functions = {}
    
    # 分割代码行
    lines = code.split('\n')
    
    # 函数匹配模式 - 匹配函数定义的开始行
    pattern = re.compile(r'^(\w+(?:\s+\w+)*)\s+([a-zA-Z_]\w*)\s*\(([^)]*)\)\s*{', re.MULTILINE)
    
    i = 0
    while i < len(lines):
        line = lines[i]
        match = pattern.search(line)
        
        if match:
            return_type = match.group(1)
            func_name = match.group(2)
            params = match.group(3)
            
            # 排除类型定义和声明
            if return_type.startswith('typedef') or line.strip().endswith(';'):
                i += 1
                continue
                
            # 找到函数开始
            func_start = i
            brace_count = line.count('{') - line.count('}')
            
            i += 1
            while i < len(lines) and brace_count > 0:
                line = lines[i]
                brace_count += line.count('{') - line.count('}')
                i += 1
                
            if brace_count == 0:
                # 找到完整函数
                func_end = i - 1
                functions[func_name] = (func_start, func_end)
            else:
                # 函数定义不完整，继续向下扫描
                i += 1
        else:
            i += 1
    
    return functions

def build_call_graph(code, functions):
    """
    构建函数调用图
    返回：FunctionInfo对象的字典
    """
    call_graph = {}
    lines = code.split('\n')
    
    # 首先构建基本的函数信息
    for func_name, (start_line, end_line) in functions.items():
        func_code = '\n'.join(lines[start_line:end_line+1])
        call_graph[func_name] = FunctionInfo(
            name=func_name,
            code=func_code,
            start_line=start_line,
            end_line=end_line,
            calls=set()
        )
    
    # 添加调用关系
    for func_name, info in call_graph.items():
        for other_func in call_graph:
            if other_func != func_name:
                # 检查func_name是否调用了other_func
                call_pattern = r'\b' + re.escape(other_func) + r'\s*\([^;{]*\)\s*;'
                if re.search(call_pattern, info.code):
                    call_graph[func_name].calls.add(other_func)
    
    return call_graph

def is_interrupt_function(func_name, func_code):
    """判断是否为中断函数"""
    # 查找常见的中断函数标志
    interrupt_markers = [
        r'interrupt', r'isr', r'_irq', r'irq_handler', 
        r'priority:\s*\d+', r'// priority:', r'\/\* priority:',
        r'@interrupt', r'__interrupt'
    ]
    
    # 检查函数名是否包含中断相关关键词
    if re.search(r'interrupt|isr|_irq|handler', func_name, re.IGNORECASE):
        return True
    
    # 检查函数代码中是否有中断标记
    for marker in interrupt_markers:
        if re.search(marker, func_code, re.IGNORECASE):
            return True
    
    return False

def find_all_called_functions(func_name, call_graph, collected=None):
    """递归查找函数直接和间接调用的所有函数"""
    if collected is None:
        collected = set()
    
    if func_name in collected:
        return collected
    
    collected.add(func_name)
    
    if func_name in call_graph:
        for called_func in call_graph[func_name].calls:
            find_all_called_functions(called_func, call_graph, collected)
    
    return collected

def extract_variables(code, functions_to_keep, call_graph):
    """
    提取主函数和中断函数以及它们调用的函数中使用的所有变量
    返回：使用的变量名集合
    """
    used_variables = set()
    
    # 收集保留函数中所有使用的变量
    for func_name in functions_to_keep:
        if func_name in call_graph:
            func_info = call_graph[func_name]
            # 使用正则表达式找出所有变量引用
            var_refs = re.findall(r'\b([a-zA-Z_]\w*)\b', func_info.code)
            
            # 排除关键字、函数名和类型名
            c_keywords = {'if', 'else', 'while', 'for', 'do', 'switch', 'case', 'break', 'continue', 
                         'return', 'void', 'int', 'char', 'float', 'double', 'long', 'short', 'unsigned', 
                         'signed', 'const', 'static', 'struct', 'union', 'enum', 'typedef', 'sizeof', 'NULL'}
            
            for var in var_refs:
                if var not in c_keywords and var not in call_graph and var.islower():
                    used_variables.add(var)
    
    return used_variables

def inline_function(func_info, call_graph, processed=None):
    """
    内联函数中调用的其他函数
    返回：内联后的函数代码
    """
    if processed is None:
        processed = set()
    
    if func_info.name in processed:
        return func_info.code  # 避免循环递归
    
    processed.add(func_info.name)
    func_code = func_info.code
    
    # 对每个被调用的函数进行内联
    for called_func_name in sorted(func_info.calls):
        if called_func_name in call_graph and called_func_name != func_info.name:
            called_func_info = call_graph[called_func_name]
            
            # 递归内联被调用函数中可能调用的其他函数
            inlined_called_code = inline_function(called_func_info, call_graph, processed.copy())
            
            # 将被调用函数的代码作为注释放在内联位置
            inline_comment = f"\n    /* INLINED {called_func_name} */ {{\n{inlined_called_code}\n}}; \n"
            
            # 替换函数调用为内联代码
            call_pattern = r'(\b' + re.escape(called_func_name) + r'\s*\([^;]*\)\s*;)'
            func_code = re.sub(call_pattern, inline_comment, func_code)
    
    return func_code

def process_file(input_file, output_file, main_name=None, do_inline=False, keep_all=False, verbose=False):
    """处理C文件，提取和内联所需函数，保持原始行号"""
    # 读取输入文件
    code = read_file(input_file)
    
    # 分割为行
    lines = code.split('\n')
    
    # 查找所有函数的位置
    function_locations = find_function_locations(code)
    
    if verbose:
        print(f"找到 {len(function_locations)} 个函数定义")
    
    # 构建函数调用图
    call_graph = build_call_graph(code, function_locations)
    
    # 找出主函数
    main_function = None
    main_func_info = None
    
    if main_name:
        if main_name in function_locations:
            main_func_info = call_graph[main_name]
    else:
        # 尝试找到标准main函数或类似main的函数
        main_candidates = [
            'main', 
            'app_main', 
            'svp_simple_main', 
            'svp_simple_\d+_\d+_main'
        ]
        
        for candidate in main_candidates:
            for func_name in function_locations:
                if re.fullmatch(candidate, func_name):
                    main_func_info = call_graph[func_name]
                    main_name = func_name
                    break
            if main_func_info:
                break
    
    if not main_func_info and verbose:
        print("警告：未找到主函数")
    
    # 找出所有中断函数
    interrupt_functions = {}
    
    for func_name, info in call_graph.items():
        if is_interrupt_function(func_name, info.code):
            interrupt_functions[func_name] = info
            if verbose:
                print(f"找到中断函数: {func_name}")
    
    # 收集所有需要保留的函数（主函数、中断函数及其调用的函数）
    base_functions = set()
    functions_to_keep = set()
    
    # 添加主函数
    if main_func_info:
        base_functions.add(main_name)
    
    # 添加中断函数
    for func_name in interrupt_functions:
        base_functions.add(func_name)
    
    # 递归找出所有被调用的函数
    for func_name in base_functions:
        called_funcs = find_all_called_functions(func_name, call_graph)
        functions_to_keep.update(called_funcs)
    
    if verbose and functions_to_keep:
        print(f"需要保留的函数: {', '.join(functions_to_keep)}")
    
    # 提取主函数、中断函数及其调用函数中使用的变量
    used_variables = extract_variables(code, functions_to_keep, call_graph)
    if verbose and used_variables:
        print(f"找到函数中使用的变量: {', '.join(used_variables)}")
    
    # 如果启用内联，对每个保留的函数进行内联处理
    inlined_functions = {}
    if do_inline:
        for func_name in base_functions:  # 只对主函数和中断函数进行内联
            func_info = call_graph[func_name]
            inlined_code = inline_function(func_info, call_graph)
            # 创建修改后的函数信息
            inlined_functions[func_name] = inlined_code
    
    # 处理每一行代码
    processed_lines = []
    current_function = None
    in_kept_function = False
    
    # 添加文件头
    processed_lines.append("/*")
    processed_lines.append(" * 自动生成的代码 - 由Code_Extractor提取")
    processed_lines.append(" * 保持原始行号 - 不需要的代码被注释")
    processed_lines.append(" */")
    processed_lines.append("")
    
    # 需要原样保留的行类型
    keep_patterns = [
        r'^\s*#include',          # include语句
        r'^\s*#define',           # 宏定义
        r'^\s*typedef',           # 类型定义
        r'^\s*struct',            # 结构体定义
        r'^\s*enum',              # 枚举定义
        r'^\s*union',             # 联合定义
        r'^\s*extern\s+',         # 外部声明
    ]
    
    # 构建行映射
    line_map = {}
    original_line_index = 0
    processed_line_index = len(processed_lines)  # 从文件头后开始
    
    # 处理每一行原始代码
    for i, line in enumerate(lines):
        # 检查是否进入函数定义
        for func_name, (start, end) in function_locations.items():
            if i == start:
                current_function = func_name
                in_kept_function = func_name in functions_to_keep
                break
        
        # 添加行
        if in_kept_function:
            # 在保留的函数内，直接添加行
            if do_inline and current_function in inlined_functions and i == function_locations[current_function][0]:
                # 替换函数定义的第一行为内联后的代码
                first_line = line
                rest_lines = inlined_functions[current_function].split('\n')[1:]  # 跳过第一行
                processed_lines.append(first_line)
                processed_lines.extend(rest_lines)
                # 调整行映射
                for j in range(len(rest_lines)):
                    line_map[original_line_index + j] = processed_line_index + j
                original_line_index += len(rest_lines)
                processed_line_index += len(rest_lines)
            else:
                processed_lines.append(line)
                line_map[original_line_index] = processed_line_index
                original_line_index += 1
                processed_line_index += 1
        else:
            # 检查是否是变量声明或定义
            is_variable_decl = re.match(r'^\s*(static|volatile|const|register|extern)?\s*[a-zA-Z_][\w\s\*]+\s+([a-zA-Z_]\w*)\s*(=|\[|\;)', line)
            if is_variable_decl:
                # 提取变量名
                var_decl_match = re.search(r'\b([a-zA-Z_]\w*)\s*(=|\[|\;)', line)
                if var_decl_match:
                    var_name = var_decl_match.group(1)
                    # 如果该变量被保留的函数使用，则保留这行
                    if var_name in used_variables:
                        processed_lines.append(line)
                        line_map[original_line_index] = processed_line_index
                        original_line_index += 1
                        processed_line_index += 1
                        continue
            
            # 其他行的处理
            if keep_all or any(re.match(pattern, line) for pattern in keep_patterns):
                # 需要保留的行，但不在保留的函数内，保留为注释
                if line.strip():  # 非空行
                    processed_lines.append(f"// {line}")
                else:
                    processed_lines.append("")  # 保留空行
                line_map[original_line_index] = processed_line_index
                original_line_index += 1
                processed_line_index += 1
            else:
                # 不需要保留的行，保留为注释
                processed_lines.append(f"// {line}" if line.strip() else "")
                line_map[original_line_index] = processed_line_index
                original_line_index += 1
                processed_line_index += 1
        
        # 检查是否离开函数定义
        if current_function and i == function_locations[current_function][1]:
            current_function = None
            in_kept_function = False
    
    # 写入输出文件
    write_file(output_file, '\n'.join(processed_lines))
    
    if verbose:
        print(f"提取完成，输出文件: {output_file}")
        print(f"包含了 {len(functions_to_keep)} 个函数")

def main():
    """主函数"""
    args = parse_arguments()
    
    input_file = args.input_file
    
    # 设置输出文件名
    if args.output_file:
        output_file = args.output_file
    else:
        base_name, ext = os.path.splitext(os.path.basename(input_file))
        output_file = f"{base_name}_extracted{ext}"
    
    # 处理文件
    process_file(input_file, output_file, args.main, args.inline, args.keep_all, args.verbose)
    
    # 显示处理结果
    print("代码提取完成，输出文件:", output_file)
    
    # 显示文件大小对比
    input_size = os.path.getsize(input_file)
    output_size = os.path.getsize(output_file)
    size_diff = ((output_size - input_size) / input_size) * 100
    
    print(f"输入文件大小:     {input_size:6d} 字节")
    print(f"输出文件大小:     {output_size:6d} 字节")
    print(f"减小了: {-size_diff:.0f}%")

if __name__ == "__main__":
    main() 