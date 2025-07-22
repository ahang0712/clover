#!/bin/bash
# 代码提取器运行脚本

# 默认参数
VERBOSE=""
INLINE=""
MAIN=""
KEEP_ALL=""
INPUT_FILE=""
OUTPUT_FILE=""

# 显示使用帮助
function show_help {
    echo "代码提取器 (Code Extractor) - 压缩C代码并提取主要函数"
    echo ""
    echo "用法: $0 [选项] <输入文件> [输出文件]"
    echo ""
    echo "选项:"
    echo "  -i, --inline         内联所有被调用的函数"
    echo "  -m, --main <函数名>  指定主函数名（如果不是标准的main）"
    echo "  -v, --verbose        显示详细输出"
    echo "  -k, --keep-all       保留所有原始代码行（注释不需要的部分）"
    echo "  -h, --help           显示此帮助信息"
    echo ""
    echo "示例:"
    echo "  $0 example.c                             # 提取example.c中的主函数和中断函数"
    echo "  $0 -i -m svp_simple_main example.c       # 提取并内联函数，指定主函数名"
    echo "  $0 -k -v example.c example_extracted.c   # 保留所有代码行，显示详细输出"
    exit 1
}

# 解析参数
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -i|--inline)
            INLINE="--inline"
            shift
            ;;
        -m|--main)
            MAIN="--main $2"
            shift
            shift
            ;;
        -v|--verbose)
            VERBOSE="--verbose"
            shift
            ;;
        -k|--keep-all)
            KEEP_ALL="--keep-all"
            shift
            ;;
        -h|--help)
            show_help
            ;;
        *)
            if [ -z "$INPUT_FILE" ]; then
                INPUT_FILE="$1"
            elif [ -z "$OUTPUT_FILE" ]; then
                OUTPUT_FILE="$1"
            else
                echo "错误: 过多的参数"
                show_help
            fi
            shift
            ;;
    esac
done

# 检查输入文件
if [ -z "$INPUT_FILE" ]; then
    echo "错误: 必须指定输入文件"
    show_help
fi

# 检查输入文件是否存在
if [ ! -f "$INPUT_FILE" ]; then
    echo "错误: 输入文件 '$INPUT_FILE' 不存在"
    exit 1
fi

# 构建输出文件名（如果未指定）
if [ -z "$OUTPUT_FILE" ]; then
    filename=$(basename -- "$INPUT_FILE")
    extension="${filename##*.}"
    filename="${filename%.*}"
    OUTPUT_FILE="${filename}_extracted.${extension}"
fi

# 获取脚本所在目录
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# 执行Python脚本
echo "正在提取代码..."
python3 "$SCRIPT_DIR/extractor.py" $INLINE $MAIN $VERBOSE $KEEP_ALL "$INPUT_FILE" -o "$OUTPUT_FILE"

# 检查执行结果
if [ $? -eq 0 ]; then
    echo "代码提取完成，输出文件: $OUTPUT_FILE"
    # 显示文件大小变化
    INPUT_SIZE=$(wc -c < "$INPUT_FILE")
    OUTPUT_SIZE=$(wc -c < "$OUTPUT_FILE")
    REDUCTION=$((100 - (OUTPUT_SIZE * 100 / INPUT_SIZE)))
    echo "输入文件大小: $INPUT_SIZE 字节"
    echo "输出文件大小: $OUTPUT_SIZE 字节"
    echo "减小了: $REDUCTION%"
else
    echo "代码提取失败"
    exit 1
fi
