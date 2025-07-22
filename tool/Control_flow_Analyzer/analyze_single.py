#!/usr/bin/env python3

"""
单文件控制流分析器
分析单个C文件的函数调用关系
"""

import os
import sys
import json
import subprocess
import tempfile
import re
from pathlib import Path

def generate_llvm_ir(input_file, output_dir):
    """使用Clang生成LLVM IR"""
    basename = os.path.basename(input_file)
    name_without_ext = os.path.splitext(basename)[0]
    ir_file = os.path.join(output_dir, f"{name_without_ext}.ll")
    
    # 获取环境变量中的系统包含路径
    system_includes = os.environ.get('SYSTEM_INCLUDES', '')
    
    cmd = ["clang-10", "-O0", "-g", "-emit-llvm", "-S"]
    if system_includes:
        cmd.extend(system_includes.split())
    cmd.extend([input_file, "-o", ir_file])
    
    try:
        print(f"执行命令: {' '.join(cmd)}")
        subprocess.run(
            cmd,
            check=True,
            stderr=subprocess.PIPE
        )
        return ir_file
    except subprocess.CalledProcessError as e:
        print(f"错误: 生成LLVM IR失败: {e.stderr.decode()}")
        sys.exit(1)

def parse_function_calls(ir_file):
    """解析IR文件中的函数调用关系"""
    function_calls = {}
    current_function = None
    
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
    
    return function_calls

def generate_json_output(function_calls, output_file):
    """生成JSON格式的函数调用关系"""
    # 构建更丰富的JSON结构
    result = {
        "functions": [],
        "call_graph": []
    }
    
    # 添加所有函数
    for func_name in function_calls.keys():
        result["functions"].append({
            "name": func_name,
            "type": "defined"  # 在当前文件中定义的函数
        })
    
    # 添加所有被调用但未定义的函数
    called_functions = set()
    for calls in function_calls.values():
        called_functions.update(calls)
    
    for func_name in called_functions:
        if func_name not in function_calls:
            result["functions"].append({
                "name": func_name,
                "type": "external"  # 外部函数
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

def generate_dot_output(function_calls, output_file):
    """生成DOT格式的函数调用图"""
    with open(output_file, 'w') as f:
        f.write('digraph CallGraph {\n')
        f.write('  node [shape=box];\n')
        
        # 为每个函数创建节点
        for func_name in function_calls.keys():
            f.write(f'  "{func_name}" [style=filled, fillcolor=lightblue];\n')
        
        # 为被调用但未定义的函数创建节点
        called_functions = set()
        for calls in function_calls.values():
            called_functions.update(calls)
        
        for func_name in called_functions:
            if func_name not in function_calls:
                f.write(f'  "{func_name}" [style=filled, fillcolor=lightgray];\n')
        
        # 创建调用边
        for caller, callees in function_calls.items():
            for callee in callees:
                f.write(f'  "{caller}" -> "{callee}";\n')
        
        f.write('}\n')

def main():
    if len(sys.argv) < 3:
        print(f"用法: {sys.argv[0]} <输入C文件> <输出目录> [输出格式]")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_dir = sys.argv[2]
    output_format = sys.argv[3] if len(sys.argv) > 3 else "json"
    
    # 检查输入文件是否存在
    if not os.path.isfile(input_file):
        print(f"错误: 输入文件 '{input_file}' 不存在")
        sys.exit(1)
    
    # 确保输出目录存在
    os.makedirs(output_dir, exist_ok=True)
    
    # 生成LLVM IR
    ir_file = generate_llvm_ir(input_file, output_dir)
    
    # 解析函数调用关系
    function_calls = parse_function_calls(ir_file)
    
    # 生成输出
    basename = os.path.basename(input_file)
    name_without_ext = os.path.splitext(basename)[0]
    
    if output_format.lower() == "json":
        output_file = os.path.join(output_dir, f"{name_without_ext}_callgraph.json")
        generate_json_output(function_calls, output_file)
        print(f"JSON调用图已保存到: {output_file}")
    elif output_format.lower() == "dot":
        output_file = os.path.join(output_dir, f"{name_without_ext}_callgraph.dot")
        generate_dot_output(function_calls, output_file)
        print(f"DOT调用图已保存到: {output_file}")
        
        # 如果安装了Graphviz，可以自动生成图像
        try:
            png_file = os.path.join(output_dir, f"{name_without_ext}_callgraph.png")
            subprocess.run(["dot", "-Tpng", output_file, "-o", png_file], check=True)
            print(f"PNG调用图已保存到: {png_file}")
        except (subprocess.CalledProcessError, FileNotFoundError):
            print("提示: 安装Graphviz可以自动生成PNG图像")
    else:
        print(f"错误: 不支持的输出格式 '{output_format}'")
        sys.exit(1)

if __name__ == "__main__":
    main() 