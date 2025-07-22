#!/usr/bin/env python3

"""
仓库控制流分析器
分析整个代码仓库的函数调用关系
"""

import os
import sys
import json
import subprocess
import tempfile
import re
import glob
from pathlib import Path
from collections import defaultdict

def find_c_files(repo_dir):
    """查找仓库中的所有C文件"""
    c_files = []
    for root, _, files in os.walk(repo_dir):
        for file in files:
            if file.endswith('.c'):
                c_files.append(os.path.join(root, file))
    return c_files

def generate_compilation_database(repo_dir, output_dir):
    """生成编译数据库，用于跨文件分析"""
    db_path = os.path.join(output_dir, "compile_commands.json")
    
    # 创建一个简单的编译数据库
    compile_commands = []
    
    c_files = find_c_files(repo_dir)
    for c_file in c_files:
        rel_path = os.path.relpath(c_file, repo_dir)
        compile_commands.append({
            "directory": repo_dir,
            "command": f"clang-10 -O0 -g -c {rel_path} -o {rel_path}.o",
            "file": c_file
        })
    
    with open(db_path, 'w') as f:
        json.dump(compile_commands, f, indent=2)
    
    return db_path

def generate_llvm_ir(c_file, output_dir):
    """使用Clang生成LLVM IR"""
    basename = os.path.basename(c_file)
    name_without_ext = os.path.splitext(basename)[0]
    ir_file = os.path.join(output_dir, f"{name_without_ext}.ll")
    
    # 获取环境变量中的系统包含路径
    system_includes = os.environ.get('SYSTEM_INCLUDES', '')
    
    cmd = ["clang-10", "-O0", "-g", "-emit-llvm", "-S"]
    if system_includes:
        cmd.extend(system_includes.split())
    cmd.extend([c_file, "-o", ir_file])
    
    try:
        print(f"执行命令: {' '.join(cmd)}")
        subprocess.run(
            cmd,
            check=True,
            stderr=subprocess.PIPE
        )
        return ir_file
    except subprocess.CalledProcessError as e:
        print(f"警告: 生成LLVM IR失败 {c_file}: {e.stderr.decode()}")
        return None

def parse_function_declarations(c_file):
    """解析C文件中的函数声明"""
    try:
        with open(c_file, 'r') as f:
            content = f.read()
        
        # 匹配函数声明的正则表达式 (简化版，可能需要根据实际情况调整)
        pattern = re.compile(r'(\w+)\s+(\w+)\s*\([^)]*\)\s*;')
        matches = pattern.findall(content)
        
        declarations = []
        for return_type, func_name in matches:
            # 排除一些常见的关键字
            if return_type not in ['if', 'for', 'while', 'switch', 'return']:
                declarations.append(func_name)
        
        return declarations
    except Exception as e:
        print(f"警告: 解析函数声明失败 {c_file}: {e}")
        return []

def parse_function_definitions(ir_file):
    """解析IR文件中的函数定义"""
    if not ir_file or not os.path.exists(ir_file):
        return []
    
    definitions = []
    
    try:
        with open(ir_file, 'r') as f:
            lines = f.readlines()
        
        # 函数定义的正则表达式
        define_pattern = re.compile(r'define.*@([a-zA-Z0-9_\.]+)\(')
        
        for line in lines:
            # 检查是否是函数定义
            define_match = define_pattern.search(line)
            if define_match:
                func_name = define_match.group(1)
                definitions.append(func_name)
    except Exception as e:
        print(f"警告: 解析函数定义失败 {ir_file}: {e}")
    
    return definitions

def parse_function_calls(ir_file):
    """解析IR文件中的函数调用关系"""
    if not ir_file or not os.path.exists(ir_file):
        return {}
    
    function_calls = {}
    current_function = None
    
    try:
        with open(ir_file, 'r') as f:
            lines = f.readlines()
        
        # 函数定义的正则表达式
        define_pattern = re.compile(r'define.*@([a-zA-Z0-9_\.]+)\(')
        # 函数调用的正则表达式
        call_pattern = re.compile(r'call.*@([a-zA-Z0-9_\.]+)\(')
        
        for line in lines:
            # 检查是否是函数定义
            define_match = define_pattern.search(line)
            if define_match:
                current_function = define_match.group(1)
                function_calls[current_function] = []
                continue
            
            # 检查是否是函数调用
            if current_function:
                call_match = call_pattern.search(line)
                if call_match:
                    called_function = call_match.group(1)
                    # 排除一些LLVM内部函数
                    if not called_function.startswith("llvm."):
                        function_calls[current_function].append(called_function)
    except Exception as e:
        print(f"警告: 解析函数调用失败 {ir_file}: {e}")
    
    return function_calls

def merge_function_calls(all_function_calls):
    """合并所有文件的函数调用关系"""
    merged_calls = {}
    
    for file_calls in all_function_calls:
        for caller, callees in file_calls.items():
            if caller not in merged_calls:
                merged_calls[caller] = []
            merged_calls[caller].extend(callees)
    
    # 去除重复的调用
    for caller in merged_calls:
        merged_calls[caller] = list(set(merged_calls[caller]))
    
    return merged_calls

def build_file_function_map(c_files, ir_files):
    """构建文件到函数的映射"""
    file_function_map = {}
    
    for i, c_file in enumerate(c_files):
        if i < len(ir_files) and ir_files[i]:
            definitions = parse_function_definitions(ir_files[i])
            file_function_map[c_file] = definitions
    
    return file_function_map

def generate_json_output(function_calls, file_function_map, output_file):
    """生成JSON格式的函数调用关系"""
    # 构建更丰富的JSON结构
    result = {
        "files": [],
        "functions": [],
        "call_graph": []
    }
    
    # 添加所有文件
    for file_path, functions in file_function_map.items():
        result["files"].append({
            "path": file_path,
            "functions": functions
        })
    
    # 添加所有函数
    defined_functions = set()
    for functions in file_function_map.values():
        defined_functions.update(functions)
    
    for func_name in defined_functions:
        result["functions"].append({
            "name": func_name,
            "type": "defined"  # 在当前仓库中定义的函数
        })
    
    # 添加所有被调用但未定义的函数
    called_functions = set()
    for calls in function_calls.values():
        called_functions.update(calls)
    
    for func_name in called_functions:
        if func_name not in defined_functions:
            result["functions"].append({
                "name": func_name,
                "type": "external"  # 外部函数或库函数
            })
    
    # 添加调用关系
    for caller, callees in function_calls.items():
        for callee in callees:
            result["call_graph"].append({
                "caller": caller,
                "callee": callee
            })
    
    # 写入JSON文件
    with open(output_file, 'w') as f:
        json.dump(result, f, indent=2)

def generate_dot_output(function_calls, file_function_map, output_file):
    """生成DOT格式的函数调用图"""
    # 创建反向映射：函数到文件
    function_file_map = {}
    for file_path, functions in file_function_map.items():
        for func in functions:
            function_file_map[func] = os.path.basename(file_path)
    
    with open(output_file, 'w') as f:
        f.write('digraph CallGraph {\n')
        f.write('  node [shape=box];\n')
        
        # 为每个文件创建一个子图
        file_to_functions = defaultdict(list)
        for func, file in function_file_map.items():
            file_to_functions[file].append(func)
        
        # 为每个文件创建一个子图
        for file, functions in file_to_functions.items():
            f.write(f'  subgraph "cluster_{file}" {{\n')
            f.write(f'    label="{file}";\n')
            f.write('    style=filled;\n')
            f.write('    color=lightgrey;\n')
            
            # 添加该文件中的所有函数
            for func in functions:
                f.write(f'    "{func}" [style=filled, fillcolor=lightblue];\n')
            
            f.write('  }\n\n')
        
        # 为被调用但未定义的函数创建节点
        called_functions = set()
        for calls in function_calls.values():
            called_functions.update(calls)
        
        defined_functions = set(function_file_map.keys())
        external_functions = called_functions - defined_functions
        
        if external_functions:
            f.write('  subgraph "cluster_external" {\n')
            f.write('    label="External Functions";\n')
            f.write('    style=filled;\n')
            f.write('    color=lightgrey;\n')
            
            for func in external_functions:
                f.write(f'    "{func}" [style=filled, fillcolor=lightgray];\n')
            
            f.write('  }\n\n')
        
        # 创建调用边
        for caller, callees in function_calls.items():
            for callee in callees:
                f.write(f'  "{caller}" -> "{callee}";\n')
        
        f.write('}\n')

def main():
    if len(sys.argv) < 3:
        print(f"用法: {sys.argv[0]} <仓库目录> <输出目录> [输出格式]")
        sys.exit(1)
    
    repo_dir = sys.argv[1]
    output_dir = sys.argv[2]
    output_format = sys.argv[3] if len(sys.argv) > 3 else "json"
    
    # 检查仓库目录是否存在
    if not os.path.isdir(repo_dir):
        print(f"错误: 仓库目录 '{repo_dir}' 不存在")
        sys.exit(1)
    
    # 确保输出目录存在
    os.makedirs(output_dir, exist_ok=True)
    
    # 查找所有C文件
    c_files = find_c_files(repo_dir)
    if not c_files:
        print(f"错误: 在仓库 '{repo_dir}' 中未找到C文件")
        sys.exit(1)
    
    print(f"找到 {len(c_files)} 个C文件")
    
    # 为每个C文件生成LLVM IR
    ir_files = []
    for c_file in c_files:
        print(f"处理文件: {c_file}")
        ir_file = generate_llvm_ir(c_file, output_dir)
        ir_files.append(ir_file)
    
    # 构建文件到函数的映射
    file_function_map = build_file_function_map(c_files, ir_files)
    
    # 解析每个IR文件的函数调用关系
    all_function_calls = []
    for ir_file in ir_files:
        if ir_file:
            function_calls = parse_function_calls(ir_file)
            all_function_calls.append(function_calls)
    
    # 合并所有函数调用关系
    merged_calls = merge_function_calls(all_function_calls)
    
    # 生成输出
    repo_name = os.path.basename(os.path.abspath(repo_dir))
    
    if output_format.lower() == "json":
        output_file = os.path.join(output_dir, f"{repo_name}_callgraph.json")
        generate_json_output(merged_calls, file_function_map, output_file)
        print(f"JSON调用图已保存到: {output_file}")
    elif output_format.lower() == "dot":
        output_file = os.path.join(output_dir, f"{repo_name}_callgraph.dot")
        generate_dot_output(merged_calls, file_function_map, output_file)
        print(f"DOT调用图已保存到: {output_file}")
        
        # 如果安装了Graphviz，可以自动生成图像
        try:
            png_file = os.path.join(output_dir, f"{repo_name}_callgraph.png")
            subprocess.run(["dot", "-Tpng", output_file, "-o", png_file], check=True)
            print(f"PNG调用图已保存到: {png_file}")
        except (subprocess.CalledProcessError, FileNotFoundError):
            print("提示: 安装Graphviz可以自动生成PNG图像")
    else:
        print(f"错误: 不支持的输出格式 '{output_format}'")
        sys.exit(1)

if __name__ == "__main__":
    main() 