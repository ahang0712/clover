import os
import subprocess

compiler = "clang "
compilerOptions = "-gline-tables-only -O3 -c -emit-llvm -femit-all-decls -mllvm -disable-llvm-optzns "

opt = "opt "

llvm_dis = "llvm-dis "

# 处理特定文件 appTask.c
targetFilePath = "/home/vip/hanghe/race-master/llvm-api-demo/c-src/code/i8xx_tco/i8xx_tco_3.c"
targetFileName, _ = os.path.splitext(os.path.basename(targetFilePath))

# 编译 appTask.c 文件为 LLVM bitcode
cmd1 = compiler + compilerOptions + targetFilePath
result = subprocess.getstatusoutput(cmd1)
print(result)

# 对编译后的 .bc 文件进行优化
cmd2 = opt + " -mem2reg -constprop -constmerge -inline " + targetFileName + ".bc" + " -o " + targetFileName + "-opt.bc"
result = subprocess.getstatusoutput(cmd2)
print(result)

# 使用 llvm-dis 显示 LLVM 中间表示
cmd3 = llvm_dis + targetFileName + ".bc"
result = subprocess.getstatusoutput(cmd3)
print(result)

cmd4 = llvm_dis + targetFileName + "-opt.bc"
result = subprocess.getstatusoutput(cmd4)
print(result)