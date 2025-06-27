#!/bin/bash

# # Directory where the JSON files are stored
# # json_dir="/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1"
# json_dir="/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread"
# # json_dir="/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races"
# # json_dir="/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression"
# # json_dir="/home/vip/hanghe/race-master/llvm-api-demo/c-src/code"

# # # Initialize an empty array to store JSON file paths
# json_files=()

# # Loop to generate file paths from 001 to 031
# # for i in $(seq -f "%03g" 001 031); do
# for i in $(seq -f "%03g" 304 333); do
# # for i in $(seq -f "%03g" 300 304); do
# # for i in $(seq -f "%03g" 500 703); do
#     # json_files+=("$json_dir/svp_simple_${i}/svp_simple_${i}_001-output.json")
#     json_files+=("$json_dir/svp_simple_${i}_001-output.json")
# done

# # Run Python script with all generated JSON files as arguments
# python3 Pattern.py "${json_files[@]}"

# json_dir="/home/vip/hanghe/race-master/llvm-api-demo/c-src/code"
json_dir="/home/vip/hanghe/race-master/llvm-api-demo/c-src/real-code/real-code/xx25/customApp"

# Initialize an empty array to store JSON file paths
json_files=()

# 遍历所有子文件夹查找符合条件的文件
echo "Starting to search for output.json files in base path: $json_dir"  # 打印起始路径
for dir in "$json_dir"/*/; do
    echo "Checking directory: $dir"  # 打印当前处理的目录

    if [ -d "$dir" ]; then
        echo "Entering directory: $dir"  # 打印进入的目录

        # 查找符合条件的-output.json文件
        find "$dir" -type f -name "*-output.json" | while read file_path; do
            echo "Found JSON file: $file_path"  # 打印找到的文件路径
            python3 Pattern.py $file_path

            # json_files+=("$file_path")  # 将找到的文件路径添加到数组中
        done
    else
        echo "Skipping non-directory: $dir"  # 如果不是目录，打印跳过的消息
    fi
done

# 如果有找到符合条件的文件，运行Python脚本
# if [ ${#json_files[@]} -gt 0 ]; then
#     echo "Running Python script with ${#json_files[@]} JSON files"  # 打印将传递给Python脚本的文件数量
#     echo "Files being passed to Python script: ${json_files[@]}"  # 打印传递给Python脚本的文件路径
#     python3 Pattern.py "${json_files[@]}"
# else
#     echo "No JSON files found."  # 如果没有找到符合条件的文件，打印提示
# fi


