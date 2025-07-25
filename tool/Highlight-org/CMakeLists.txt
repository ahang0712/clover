cmake_minimum_required(VERSION 3.10)
project(PatternAnalyzer)

# 设置C++标准
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 添加可执行文件
add_executable(pattern_analyzer pattern_analyzer.cpp)

# 安装目标
install(TARGETS pattern_analyzer DESTINATION bin) 