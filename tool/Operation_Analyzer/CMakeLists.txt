cmake_minimum_required(VERSION 3.10)
project(Operation_Analyzer)

# 设置C++标准
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 查找LLVM包
find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")
message(STATUS "Using LLVMConfig.cmake in: ${LLVM_DIR}")

# 添加LLVM包含目录
include_directories(${LLVM_INCLUDE_DIRS})
separate_arguments(LLVM_DEFINITIONS_LIST UNIX_COMMAND "${LLVM_DEFINITIONS}")
add_definitions(${LLVM_DEFINITIONS_LIST})

# 查找需要的LLVM组件
llvm_map_components_to_libnames(llvm_libs 
    support 
    core 
    irreader 
    analysis
    transformutils
    scalaropts
    instcombine
    target
    mc
    mcparser
    bitreader
    asmparser
)

# 源文件
set(SOURCES
    main.cpp
    tool.cpp
    cJSON.c
)

# 头文件
set(HEADERS
    tool.h
    cJSON.h
)

# 创建可执行文件
add_executable(llvm_api_demo ${SOURCES})

# 链接LLVM库
target_link_libraries(llvm_api_demo ${llvm_libs})

# 设置编译选项
target_compile_options(llvm_api_demo PRIVATE -Wall -Wextra)

# 如果是Debug模式，添加调试信息
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_options(llvm_api_demo PRIVATE -g -O0)
else()
    target_compile_options(llvm_api_demo PRIVATE -O2)
endif() 