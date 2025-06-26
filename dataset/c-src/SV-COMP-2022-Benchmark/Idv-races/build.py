import os
import subprocess

# 编译器路径
compiler = "clang "
# 编译选项（启用调试符号、优化、生成LLVM bitcode等）
compilerOptions = "-gline-tables-only -O3 -c -emit-llvm -femit-all-decls -mllvm -disable-llvm-optzns "

# 优化工具路径
opt = "opt "

# LLVM disassembler路径
llvm_dis = "llvm-dis "

# 处理特定文件 appTask.c
targetFilePath = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/SV-COMP-2022-Benchmark/Idv-races/svp_simple_301_001.c"
targetFileName, _ = os.path.splitext(os.path.basename(targetFilePath))

# 第一步：编译 .c 文件为 LLVM bitcode
cmd1 = compiler + compilerOptions + targetFilePath + " -o " + targetFileName + ".bc"
result = subprocess.getstatusoutput(cmd1)
print("Step 1: Compilation result:", result)

# 第二步：对编译后的 .bc 文件进行优化，强制内联函数
# 添加了 inline-threshold=0 和 always_inline 强制内联所有函数
cmd2 = opt + " -O3 -inline-threshold=0 -inline -always-inline -mem2reg -constprop -constmerge " + targetFileName + ".bc" + " -o " + targetFileName + "-opt.bc"
result = subprocess.getstatusoutput(cmd2)
print("Step 2: Optimization result:", result)

# 第三步：使用 llvm-dis 显示未优化的 LLVM 中间表示
cmd3 = llvm_dis + targetFileName + ".bc"
result = subprocess.getstatusoutput(cmd3)
print("Step 3: llvm-dis (non-optimized) result:\n", result)

# 第四步：使用 llvm-dis 显示优化后的 LLVM 中间表示
cmd4 = llvm_dis + targetFileName + "-opt.bc"
result = subprocess.getstatusoutput(cmd4)
print("Step 4: llvm-dis (optimized) result:\n", result)
