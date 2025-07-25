#!/bin/bash

# 构建pattern_analyzer工具的脚本

# 确保工作目录是脚本所在目录
cd "$(dirname "$0")"

# 创建build目录
mkdir -p build
cd build

# 运行CMake生成构建文件
cmake ..

# 构建项目
make -j$(nproc)

echo "Build completed. The executable is at build/pattern_analyzer"
echo "Usage: ./pattern_analyzer <IR_FILE_PATH> [OUTPUT_FILE_PATH]" 