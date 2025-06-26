#!/bin/bash

# 目录路径
dir="/home/vip/hanghe/race-master/llvm-api-demo/c-src/2.1"

# 遍历目录中的所有 C 文件
find "$dir" -type f -name "*.c" | while read file; do
  # 使用 sed 删除注释块
  sed -i '/\/\*/,/\*\//d' "$file"
done

echo "注释已删除！"
