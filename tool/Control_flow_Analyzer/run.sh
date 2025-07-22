#!/bin/bash

# Control Flow Analyzer
# 用于分析C代码的函数调用关系

set -e

# 获取脚本所在目录的绝对路径
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 默认参数
OUTPUT_DIR="./output"
MODE="single"  # single或repo
FORMAT="json"  # json或dot
LLVM_PATH="$HOME/llvm10/clang+llvm-10.0.0-x86_64-apple-darwin/bin"

# 添加系统包含路径 - 使用clang的内置路径而不是xcrun
CLANG_INCLUDE_DIR="$HOME/llvm10/clang+llvm-10.0.0-x86_64-apple-darwin/lib/clang/10.0.0/include"
SYSTEM_INCLUDES="-isystem /usr/include -isystem $CLANG_INCLUDE_DIR"

# 解析命令行参数
function show_help {
    echo "控制流分析器 - 分析C代码的函数调用关系"
    echo ""
    echo "用法: $0 [选项] <输入文件或目录>"
    echo ""
    echo "选项:"
    echo "  -o, --output DIR       指定输出目录 (默认: ./output)"
    echo "  -m, --mode MODE        分析模式: single(单文件)或repo(仓库) (默认: single)"
    echo "  -f, --format FORMAT    输出格式: json或dot (默认: json)"
    echo "  -l, --llvm-path PATH   LLVM工具路径 (默认: $HOME/llvm10/clang+llvm-10.0.0-x86_64-apple-darwin/bin)"
    echo "  -h, --help             显示此帮助信息"
    echo ""
    echo "示例:"
    echo "  $0 example.c                      # 分析单个C文件"
    echo "  $0 -m repo -o output_dir src/     # 分析整个仓库并输出到指定目录"
    echo "  $0 -f dot example.c               # 输出DOT格式的调用图"
    exit 1
}

# 解析参数
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -o|--output)
            OUTPUT_DIR="$2"
            shift
            shift
            ;;
        -m|--mode)
            MODE="$2"
            shift
            shift
            ;;
        -f|--format)
            FORMAT="$2"
            shift
            shift
            ;;
        -l|--llvm-path)
            LLVM_PATH="$2"
            shift
            shift
            ;;
        -h|--help)
            show_help
            ;;
        *)
            INPUT="$1"
            shift
            ;;
    esac
done

# 检查必要参数
if [ -z "$INPUT" ]; then
    echo "错误: 未指定输入文件或目录"
    show_help
fi

# 创建输出目录
mkdir -p "$OUTPUT_DIR"

# 设置LLVM工具路径
export PATH="$LLVM_PATH:$PATH"

# 将系统包含路径传递给Python脚本
export SYSTEM_INCLUDES="$SYSTEM_INCLUDES"

# 根据模式执行不同的分析
if [ "$MODE" = "single" ]; then
    echo "分析单个文件: $INPUT"
    python "$SCRIPT_DIR/analyze_single.py" "$INPUT" "$OUTPUT_DIR" "$FORMAT"
elif [ "$MODE" = "repo" ]; then
    echo "分析仓库: $INPUT"
    python "$SCRIPT_DIR/analyze_repo.py" "$INPUT" "$OUTPUT_DIR" "$FORMAT"
else
    echo "错误: 无效的模式 '$MODE'. 使用 'single' 或 'repo'."
    exit 1
fi

echo "分析完成. 结果保存在 $OUTPUT_DIR"
