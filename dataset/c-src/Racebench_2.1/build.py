import os
import subprocess

compiler = "clang "
compilerOptions = "-gline-tables-only -O3 -c -emit-llvm  -femit-all-decls -mllvm -disable-llvm-optzns "

opt = "opt "

llvm_dis = "llvm-dis "

for rootPath, dirNames, _ in os.walk('./'):
    
    for dn in dirNames:

        currentProjectDir = os.path.join(rootPath, dn)
        os.chdir(currentProjectDir)
        subprocess.run("rm *.bc *.ll ", shell=True, stderr=subprocess.STDOUT)
        for rp, _, fileNames in os.walk('./'):
            for fn in fileNames:
                targetFilePath = os.path.join(rootPath, fn)
                targetFileName,_ = os.path.splitext(fn)

                cmd1 = compiler + compilerOptions + targetFilePath
                result = subprocess.getstatusoutput(cmd1)

                cmd2 = opt + " -mem2reg -constprop -constmerge -inline " + targetFileName+".bc" + " -o " + targetFileName+"-opt.bc"
                result = subprocess.getstatusoutput(cmd2)

                cmd3 = llvm_dis + targetFileName+".bc"
                result = subprocess.getstatusoutput(cmd3)

                cmd4 = llvm_dis + targetFileName+"-opt.bc"
                result = subprocess.getstatusoutput(cmd4)

        os.chdir("../")
        
