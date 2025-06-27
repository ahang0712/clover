#!/bin/bash

# base_path="/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple"
# suffix="_001-opt.ll"

# for i in {001..031}
# do
#     file_path="${base_path}_${i}/svp_simple_${i}${suffix}"
#     echo "Processing file: $file_path"  # 打印路径
#     ./llvm_api_demo "$file_path"
# done

# # base_path="/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple"
# base_path="/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/pthread"
# # base_path="/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races"
# # base_path="/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/goblint-regression"
# # base_path="/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1/svp_simple"
# # base_path="/home/vip/hanghe/race-master/llvm-api-demo/c-src/code"
# suffix="_001-opt.ll"

# # for i in {001..031}
# for i in {304..333}
# do
#     file_path="${base_path}/svp_simple_${i}${suffix}"
#     # file_path="${base_path}_${i}/svp_simple_${i}${suffix}"
#     echo "Processing file: $file_path"  # 打印路径
#     ./llvm_api_demo "$file_path"
# done

base_path="/home/vip/hanghe/race-master/llvm-api-demo/c-src/code"
suffix="-opt.ll"

# 遍历所有子文件夹
echo "Starting to search for files in base path: $base_path"  # 打印起始路径
for dir in "$base_path"/*/; do
    if [ -d "$dir" ]; then
        echo "Entering directory: $dir"  # 打印当前处理的目录
        
        # 查找符合条件的文件
        find "$dir" -type f -name "*$suffix" | while read file_path; do
            echo "Found file: $file_path"  # 打印找到的文件路径
            echo "Processing file: $file_path"  # 打印正在处理的文件
            ./llvm_api_demo "$file_path"
        done
    else
        echo "Skipping non-directory: $dir"  # 如果不是目录，打印跳过的消息
    fi
done

echo "File processing completed."

