//
// Created by tuhaoxin on 2019-11-16.
//
#include "tool.h"
#include "llvm/IR/CFG.h"

bool findSubString(std::string str_long, std::string str_short)
{
    std::string::size_type idx = str_long.find(str_short);
    if (idx != std::string::npos)
    {
        return true;
    }
    else
    {
        return false;
    }
}

void travers3D(const std::vector<std::vector<std::vector<std::string>>> &vec_3D)
{
    // std::cout << "size " << vec_3D.size() << std::endl;
    for (auto v : vec_3D)
    {
        std::cout << " \n " << std::endl;
        for (auto i : v)
        {
            for (auto a : i)
                std::cout << a << " ";
            std::cout << std::endl;
        }
        std::cout << std::endl;
    }
}

void travers2D(const std::vector<std::vector<std::string>> &vec_2D)
{
    // std::cout << "size " << vec_2D.size() << std::endl;
    for (auto v : vec_2D)
    {
        for (auto i : v)
        {
            std::cout << i << " ";
        }
        std::cout << std::endl;
    }
}

void travers1D(const std::vector<std::string> vec_1D)
{
    for (auto v : vec_1D)
    {
        std::cout << v << " " << std::endl;
    }
}

// 函数功能：查找使能中断函数并获取其参数
int findNumberInEnbleFun(Module *M)
{

    int ret = 0; // 返回值,记录使能函数所在的基本块编号
    // 遍历LLVM模块中的所有函数
    for (auto &f : M->getFunctionList())
    {
        // std::string fname = bb.getModule()->getFunction("enable_isr")->getName().str();
        //  获取函数名
        std::string fname = f.getName().str();
        // 如果是main函数
        if (findSubString(fname, "main"))
        {

            // if (findSubString(fname, "enable")) {
            //     return g_count;
            // }
            int cnt = 0; // 基本块计数器
            // 遍历main函数中的所有基本块
            for (auto &bb : f.getBasicBlockList())
            {
                // g_count++;
                cnt++;
                for (auto &inst : bb)
                {
                    // errs() << inst.getOpcodeName();
                    //  检查是否是调用指令(call)
                    if (!strncmp(inst.getOpcodeName(), "call", 4))
                    {
                        const CallInst *callInst = dyn_cast<CallInst>(&inst);
                        Function *calledFun = callInst->getCalledFunction();
                        std::string funName;
                        if (calledFun)
                        {
                            funName = calledFun->getName().str();
                        }

                        // errs() << funName;

                        auto paraNum = callInst->getNumArgOperands();
                        if (paraNum)
                        {
                            for (unsigned int i = 0; i < paraNum; i++)
                            {
                                Value *para = callInst->getArgOperandUse(i);
                                auto *v = dyn_cast<ConstantInt>(para);
                                // errs() << v->getValue().getSExtValue();
                                if (v)
                                    g_enable_para = v->getZExtValue();
                            }
                        }
                        mapCalledFun.insert(std::pair<std::string, int>(funName, g_enable_para));
                        // if (findSubString(funName,"init")){
                        //    ret = 0;
                        //    return ret;
                        //}
                        if (findSubString(funName, "enable"))
                        {
                            ret = cnt;
                            return ret;
                        }
                    }
                }
                // return ret;
            }
        }
    }
    return ret;
}

int findNumberInitFun(Module *M)
{

    int ret = 0;
    for (auto &f : M->getFunctionList())
    {
        // std::string fname = bb.getModule()->getFunction("enable_isr")->getName().str();
        std::string fname = f.getName().str();
        errs() << "fname in findNumberInitFun : " << fname << "\n";
        if (findSubString(fname, "main") || findSubString(fname, "AppTask") || findSubString(fname, "AppInit") || findSubString(fname, "AppSoftSync"))
        {

            // if (findSubString(fname, "enable")) {
            //     return g_count;
            // }
            int cnt = 0;
            for (auto &bb : f.getBasicBlockList())
            {
                // g_count++;
                cnt++;
                for (auto &inst : bb)
                {
                    // errs() << inst.getOpcodeName();
                    if (!strncmp(inst.getOpcodeName(), "call", 4))
                    {
                        const CallInst *callInst = dyn_cast<CallInst>(&inst);
                        Function *calledFun = callInst->getCalledFunction();
                        std::string funName;
                        if (calledFun)
                        {
                            funName = calledFun->getName().str();
                        }

                        errs() << "IN " << funName << "\n";

                        if (findSubString(funName, "init"))
                        {
                            ret = cnt;
                            return ret;
                        }
                    }
                }
                // return ret;
            }
        }
    }
    return ret;
}

void exactGeteleInfoFun(Function *f)
{
    std::vector<std::string> vec_inst;
    for (auto &bb : f->getBasicBlockList())
    {

        for (auto &inst : bb)
        {
            /*
            errs() << "inst : " << inst.getOpcodeName() << "\n";
            if (!strncmp(inst.getOpcodeName(),"getelementptr",4)){
                const GetElementPtrInst* GEP = dyn_cast<GetElementPtrInst>(&inst);
                auto idxNum = GEP->getNumIndices();
                if(idxNum){
                    errs() << idxNum << "\n";
                    for (unsigned int i = 0; i<=idxNum;i++){
                        if (Value* idx = GEP->getOperand(i)){
                            //errs() << "hello" ;
                            errs() << "getelementptr :" << idx->getName().str() ;
                            if(auto *v = dyn_cast<ConstantInt>(idx)){
                                errs() <<  v->getValue() << ",";
                            }
                            errs() <<inst.getDebugLoc().getLine() <<"\n";
                        }
                    }
                }

            }
            */

            vec_inst.push_back(inst.getOpcodeName());
            // travers1D(vec_inst);
        }
    }
}

// 函数功能: 收集所有函数中的变量读写访问信息
// 返回值: map<函数名, 变量访问信息>
std::map<std::string, std::vector<std::vector<std::string>>> exactAllFunInfo(Module *M)
{
    // 遍历模块中的所有函数
    for (auto &f : M->getFunctionList())
    {
        std::string fname = f.getName().str();

        std::vector<std::vector<std::string>> temp_AllFun;
        // 跳过中断处理函数(含有_isr_的函数名)
        if (!findSubString(fname, "_isr_"))
        {
            // 遍历函数中的所有基本块
            for (auto &bb : f.getBasicBlockList())
            {

                // 遍历基本块中的所有指令
                for (auto &inst : bb)
                {

                    std::vector<std::string> temp;

                    // 处理数组/结构体访问指令(getelementptr)
                    if (!strncmp(inst.getOpcodeName(), "getelementptr", 4))
                    {
                        // 记录下一条指令类型
                        temp.push_back(inst.getNextNode()->getOpcodeName());
                        const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&inst);
                        // 获取索引数量
                        auto idxNum = GEP->getNumIndices();
                        if (idxNum)
                        {
                            // errs() << idxNum << "\n";
                            //  遍历所有索引,获取访问的成员名
                            for (unsigned int i = 0; i <= idxNum; i++)
                            {
                                if (Value *idx = GEP->getOperand(i))
                                {
                                    temp.push_back(idx->getName().str());
                                }
                            }
                        }
                        // errs() << "temp in getelementptr :\n";
                        // travers1D(temp);
                        //  记录代码位置信息
                        temp.push_back(std::to_string(inst.getDebugLoc().getLine()));
                        // temp.push_back(inst.getDebugLoc().get()->getDirectory().str() + "/" +
                        //                inst.getDebugLoc().get()->getFilename().str());
                        temp.push_back(fname); // 使用函数名代替文件名
                        if (temp.size())
                        {
                            temp_AllFun.push_back(temp);
                            temp.clear();
                        }
                    }

                    // 处理读操作指令(load)
                    if (!strncmp(inst.getOpcodeName(), "load", 4))
                    {
                        // std::cout << "   Instruction " << " : " << inst.getOpcodeName() << " ";
                        temp.push_back(inst.getOpcodeName());
                        unsigned int i = 0;
                        unsigned int opnt_cnt = inst.getNumOperands();
                        for (; i < opnt_cnt; ++i)
                        {
                            Value *opnd = inst.getOperand(i);
                            // errs() << "n " << opnd->getNumUses();

                            // deal with getelement type   e.g. struct union

                            auto gep = dyn_cast<GEPOperator>(opnd); // gep->getAsInstruction();
                            auto bitcast = opnd->stripPointerCasts();
                            if (gep)
                            {
                                // std::cout <<"GEP\n";
                                Value *op = gep->getOperand(0);

                                if (auto bcast = op->stripPointerCasts())
                                {
                                    StringRef name = bcast->getName();
                                    // std::cout << name.str()  << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                                else
                                {
                                    StringRef name = gep->getOperand(0)->getName();
                                    // std::cout << name.str()  << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                            }

                            // deal with bitcast
                            if (bitcast)
                            {
                                auto *bst = dyn_cast<BitCastOperator>(opnd);
                                if (bst)
                                {
                                    std::cout << "bitcast\n";
                                    Value *op = bst->getOperand(0);
                                    auto g = dyn_cast<GEPOperator>(op);
                                    if (g)
                                    {
                                        StringRef name = g->getOperand(0)->getName();
                                        std::cout << name.str() << "\n";
                                        if (name.str() != "")
                                            temp.push_back(name.str());
                                    }
                                }

                                // std::cout << bitcast->getName().str() << " ";
                                if (bitcast->getName().str() != "")
                                    temp.push_back(bitcast->getName().str());
                            }

                            // deal with normal variable
                            else
                            {
                                StringRef name;

                                if (opnd->hasName())
                                {
                                    name = opnd->getName();
                                    // std::cout << name.str() << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                            }
                        }
                        // output line number
                        // std::cout << inst.getDebugLoc().getLine() << inst.getDebugLoc().get()->getDirectory().str() << std::endl;
                        // std::cout << inst.getDebugLoc().getLine() << std::endl;
                        temp.push_back(std::to_string(inst.getDebugLoc().getLine()));
                        // temp.push_back(inst.getDebugLoc().get()->z   ().str() + "/" +
                        //                inst.getDebugLoc().get()->getFilename().str());
                        temp.push_back(fname); // 使用函数名代替文件名
                        if (temp.size())
                        {
                            temp_AllFun.push_back(temp);
                            temp.clear();
                        }
                    }

                    if (!strncmp(inst.getOpcodeName(), "store", 4))
                    {
                        // std::cout << "   Instruction " << " : " << inst.getOpcodeName() << " ";
                        temp.push_back(inst.getOpcodeName());
                        unsigned int i = 0;
                        unsigned int opnt_cnt = inst.getNumOperands();
                        // std::cout << opnt_cnt<<"\n ";
                        for (; i < opnt_cnt; ++i)
                        {
                            Value *opnd = inst.getOperand(i);

                            // deal with getelement type   (array, struct)
                            auto gep = dyn_cast<GEPOperator>(opnd);
                            auto bitcast = opnd->stripPointerCasts();
                            if (gep)
                            {
                                // std::cout <<"GEP\n";
                                Value *op = gep->getOperand(0);

                                if (auto bcast = op->stripPointerCasts())
                                {
                                    StringRef name = bcast->getName();
                                    // std::cout << name.str()  << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                                else
                                {
                                    StringRef name = gep->getOperand(0)->getName();
                                    // std::cout << name.str()  << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                            }
                            // else{std::cout << "gep is null!\n ";}

                            // deal with bitcast (union)
                            if (bitcast)
                            {
                                // std::cout << bitcast->getName().str() << " ";
                                if (bitcast->getName().str() != "")
                                    temp.push_back(bitcast->getName().str());
                            }

                            // deal with normal  (variable)
                            else
                            {
                                StringRef name;

                                if (opnd->hasName())
                                {
                                    name = opnd->getName();
                                    // std::cout << name.str() << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                    // std::cout << " regex_match return : "<< regex_match(global_var[0], result,:: pattern) << std::endl;
                                }
                            }
                        }
                        // output line number
                        // std::cout << inst.getDebugLoc().getLine() << std::endl;
                        temp.push_back(std::to_string(inst.getDebugLoc().getLine()));
                        // temp.push_back(inst.getDebugLoc().get()->getDirectory().str() + "/" +
                        //                inst.getDebugLoc().get()->getFilename().str());
                        temp.push_back(fname); // 使用函数名代替文件名
                        if (temp.size())
                        {
                            temp_AllFun.push_back(temp);
                            temp.clear();
                        }
                    }
                }
            }
            // errs() << "fname in exactFunInfo : " << fname << "\n";
            // errs() << "temp_AllFun in exactFunInfo : "  << "\n";
            // travers2D(temp_AllFun);
            allFunInfo.insert(std::pair<std::string, std::vector<std::vector<std::string>>>(fname, temp_AllFun));
        }
    }
    return allFunInfo;
}

// 获取函数优先级的函数，假设优先级与函数名相关，函数名越小，优先级越高
int getPriority(const std::string &funcName)
{
    // 如果函数名包含 "main"，表示是主函数，优先级最低
    if (findSubString(funcName, "main"))
    {
        return 0; // 主函数优先级最低
    }
    else if (funcName.find("isr") != std::string::npos)
    {
        // 假设通过函数名数字部分的大小来决定优先级
        size_t pos = funcName.find_last_of('_');
        int priority = std::stoi(funcName.substr(pos + 1)); // 获取最后一个数字作为优先级
        return priority;
    }
    return 100; // 默认优先级
}

void exactBasicInfoFun(Function *f, int g_count, int g_init)
{
    // std::cout << " Function: " << f->getName().str() << std::endl;
    int retCount, retEnablePara;
    std::string fname = f->getName().str();
    for (auto &arg : f->operands()) // 遍历函数的操作数
    {
        // ConstantInt* ci = dyn_cast<ConstantInt>(&arg);
        errs() << arg->getName().str();
        // errs() << *arg << "\n";
    }
    if (findSubString(fname, "main")||findSubString(fname, "AppTask")||findSubString(fname, "AppSoftSync")||findSubString(fname, "csTimeSubProc"))
    // if (findSubString(fname, "main") || findSubString(fname, "AppTask") || findSubString(fname, "AppInit") || findSubString(fname, "AppSoftSync"))
    {
        // errs() << "function name in main : " << fname << "\n" ;
        int cnt = 0;      // 基本块计数器
        int cnt_init = 0; // 初始化函数调用计数器
        for (auto &bb : f->getBasicBlockList())
        {
            cnt += 1;
            // errs() << "cnt " << cnt << " \n";
            // std::cout << "  BasicBlock: " << bb.getName().str() << std::endl;
            // errs() << g_count << " " << "\n";
            if (cnt > 0)
            {

                for (auto &inst : bb)
                // bb 是一个基本块(Basic Block)，包含了一系列LLVM IR指令
                //  inst 是每一条LLVM IR指令的引用
                {
                    // bool inLoop = false; // 标记是否在循环中

                    // 检查是否是循环结构
                    // if (inst.getOpcodeName() == "br" && inst.getOperand(0) && inst.getOperand(0)->getName() == "loop_start")
                    // {
                    //     inLoop = true;
                    //     errs()<<"循环：true"<<"\n";
                    // }
                    if (!strncmp(inst.getOpcodeName(), "call", 4))
                    {
                        cnt_init += 1; // 函数调用计数加1
                        errs() << "success!!!!!!\n";
                    }
                    // errs() << "hello cnt_init : " << cnt_init << "\n";
                    // errs() << "hello g_init : " << g_init << "\n";
                    // if (cnt_init > g_init) {
                    // auto *ci = cast<CallInst>(inst);
                    // errs() << ci->getCalledFunction()->getName().str();
                    std::vector<std::string> temp;
                    // 如果在循环中，添加循环标记
                    // if (inLoop) {
                    //     temp.push_back("loop");
                    // }
                    errs() << inst.getOpcodeName() << "\n";
                    if (!strncmp(inst.getOpcodeName(), "getelementptr", 4)) // 检查是否是getelementptr指令
                    {
                        temp.push_back(inst.getNextNode()->getOpcodeName());               // 记录下一条指令的类型
                        const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&inst); // 将指令转换为GetElementPtrInst类型
                        auto idxNum = GEP->getNumIndices();                                // 获取索引数量
                        if (idxNum)
                        {
                            // errs() << idxNum << "\n";
                            for (unsigned int i = 0; i <= idxNum; i++)
                            {
                                if (Value *idx = GEP->getOperand(i))
                                {
                                    // errs() << "hello" ;
                                    // errs() << "getelementptr :" << idx->getName().str() ;
                                    if (auto *v = dyn_cast<ConstantInt>(idx)) // 检查是否是常量索引
                                    {
                                        // errs() <<  v->getValue() << ",";
                                        int64_t constIndex = v->getSExtValue();     // 获取有符号整数值
                                        temp.push_back(std::to_string(constIndex)); // 将索引值添加到temp
                                    }
                                    // errs() <<inst.getDebugLoc().getLine() <<"\n";
                                    // errs() << " test: " << inst.getNextNode()->getOpcodeName() << "\n";
                                    // errs() <<  idx->getName().str() << ",";
                                    else
                                    {
                                        temp.push_back(idx->getName().str());
                                    }
                                }
                            }
                        }
                        // errs() << "temp in getelementptr :\n";
                        // travers1D(temp);
                        temp.push_back(std::to_string(inst.getDebugLoc().getLine()));
                        // temp.push_back(inst.getDebugLoc().get()->getDirectory().str() + "/" +
                        //                inst.getDebugLoc().get()->getFilename().str());
                        temp.push_back(f->getName().str()); // 使用函数名代替文件名
                        if (temp.size() == 4)
                        {
                            mainInfo.push_back(temp);
                            temp.clear();
                        }
                    }

                    if (!strncmp(inst.getOpcodeName(), "load", 4))
                    {
                        // std::cout << "   Instruction " << " : " << inst.getOpcodeName() << " ";
                        temp.push_back(inst.getOpcodeName()); // 记录这是一个load操作
                        unsigned int i = 0;
                        // 遍历操作数
                        unsigned int opnt_cnt = inst.getNumOperands();
                        for (; i < opnt_cnt; ++i)
                        {
                            Value *opnd = inst.getOperand(i);
                            // errs() << "n " << opnd->getNumUses();

                            // deal with getelement type   e.g. struct union
                            // 处理结构体/数组访问（GEP操作）
                            auto gep = dyn_cast<GEPOperator>(opnd); // gep->getAsInstruction();
                            auto bitcast = opnd->stripPointerCasts();
                            if (gep)
                            {
                                // std::cout <<"GEP\n";
                                Value *op = gep->getOperand(0);

                                if (auto bcast = op->stripPointerCasts())
                                {
                                    // 情况1: 有类型转换的结构体/数组访问
                                    StringRef name = bcast->getName();
                                    // std::cout << name.str()  << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                                else
                                {
                                    // 情况2: 直接的结构体/数组访问
                                    StringRef name = gep->getOperand(0)->getName();
                                    // std::cout << name.str()  << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                            }

                            // deal with bitcast
                            if (bitcast)
                            {
                                auto *bst = dyn_cast<BitCastOperator>(opnd);
                                if (bst)
                                {
                                    // 处理特殊情况：类型转换后的GEP操作
                                    std::cout << "bitcast\n";
                                    Value *op = bst->getOperand(0);
                                    auto g = dyn_cast<GEPOperator>(op);
                                    if (g)
                                    {
                                        StringRef name = g->getOperand(0)->getName();
                                        std::cout << name.str() << "\n";
                                        if (name.str() != "")
                                            temp.push_back(name.str());
                                    }
                                }

                                // std::cout << bitcast->getName().str() << " ";
                                if (bitcast->getName().str() != "")
                                    temp.push_back(bitcast->getName().str());
                            }

                            // deal with normal variable
                            else
                            {
                                StringRef name;

                                if (opnd->hasName())
                                {
                                    name = opnd->getName();
                                    // std::cout << name.str() << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                            }
                        }
                        // output line number
                        // std::cout << inst.getDebugLoc().getLine() << inst.getDebugLoc().get()->getDirectory().str() << std::endl;
                        // std::cout << inst.getDebugLoc().getLine() << std::endl;
                        temp.push_back(std::to_string(inst.getDebugLoc().getLine()));
                        // temp.push_back(inst.getDebugLoc().get()->getDirectory().str() + "/" +
                        //                inst.getDebugLoc().get()->getFilename().str());
                        temp.push_back(f->getName().str()); // 使用函数名代替文件名
                        if (temp.size() == 4)
                        {
                            mainInfo.push_back(temp);
                            temp.clear();
                        }
                    }

                    if (!strncmp(inst.getOpcodeName(), "store", 4))
                    {
                        // std::cout << "   Instruction " << " : " << inst.getOpcodeName() << " ";
                        temp.push_back(inst.getOpcodeName());
                        unsigned int i = 0;
                        unsigned int opnt_cnt = inst.getNumOperands();
                        // std::cout << opnt_cnt<<"\n ";
                        for (; i < opnt_cnt; ++i)
                        {
                            Value *opnd = inst.getOperand(i);

                            // deal with getelement type   (array, struct)
                            auto gep = dyn_cast<GEPOperator>(opnd);
                            auto bitcast = opnd->stripPointerCasts();
                            if (gep)
                            {
                                // std::cout <<"GEP\n";
                                Value *op = gep->getOperand(0);

                                if (auto bcast = op->stripPointerCasts())
                                {
                                    StringRef name = bcast->getName();
                                    // std::cout << name.str()  << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                                else
                                {
                                    StringRef name = gep->getOperand(0)->getName();
                                    // std::cout << name.str()  << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                }
                            }
                            // else{std::cout << "gep is null!\n ";}

                            // deal with bitcast (union)
                            else if (bitcast)
                            {
                                // std::cout << bitcast->getName().str() << " ";
                                if (bitcast->getName().str() != "")
                                    temp.push_back(bitcast->getName().str());
                            }

                            // deal with normal  (variable)
                            else
                            {
                                StringRef name;

                                if (opnd->hasName())
                                {
                                    name = opnd->getName();
                                    std::cout << "name in load " << name.str() << " ";
                                    if (name.str() != "")
                                        temp.push_back(name.str());
                                    // std::cout << " regex_match return : "<< regex_match(global_var[0], result,:: pattern) << std::endl;
                                }
                            }
                        }
                        // output line number
                        // std::cout << inst.getDebugLoc().getLine() << std::endl;
                        temp.push_back(std::to_string(inst.getDebugLoc().getLine()));
                        // temp.push_back(inst.getDebugLoc().get()->getDirectory().str() + "/" +
                        //                inst.getDebugLoc().get()->getFilename().str());
                        temp.push_back(f->getName().str()); // 使用函数名代替文件名
                        if (temp.size() == 4)
                        {
                            mainInfo.push_back(temp);
                            temp.clear();
                        }
                    }
                }
            }
            //}
        }
    }
    if (findSubString(fname, "isr") || findSubString(fname, "csExtInt")||findSubString(fname, "App1553BInt1")||findSubString(fname, "AppExtIn")||findSubString(fname, "App_Int4ms"))
    {
        // errs() << findSubString(fname,"_isr_");
        std::vector<std::vector<std::string>> temp_isr;
        for (auto &bb : f->getBasicBlockList())
        {
            // std::cout << "  BasicBlock: " << bb.getName().str() << std::endl;
            for (auto &inst : bb)
            {
                std::vector<std::string> temp;

                if (!strncmp(inst.getOpcodeName(), "getelementptr", 4))
                {
                    temp.push_back(inst.getNextNode()->getOpcodeName());
                    const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&inst);
                    auto idxNum = GEP->getNumIndices();
                    if (idxNum)
                    {
                        // errs() << idxNum << "\n";
                        for (unsigned int i = 0; i <= idxNum; i++)
                        {
                            if (Value *idx = GEP->getOperand(i))
                            {
                                // errs() << "hello" ;
                                // errs() << "getelementptr :" << idx->getName().str() ;
                                if (auto *v = dyn_cast<ConstantInt>(idx))
                                {
                                    // errs() <<  v->getValue() << ",";
                                }
                                // errs() <<inst.getDebugLoc().getLine() <<"\n";
                                // errs() << " test: " << inst.getNextNode()->getOpcodeName() << "\n";
                                temp.push_back(idx->getName().str());
                            }
                        }
                    }
                    // errs() << "temp in getelementptr :\n";
                    // travers1D(temp);
                    temp.push_back(std::to_string(inst.getDebugLoc().getLine()));
                    // temp.push_back(inst.getDebugLoc().get()->getDirectory().str() + "/" +
                    //                inst.getDebugLoc().get()->getFilename().str());
                    temp.push_back(f->getName().str()); // 使用函数名代替文件名
                    if (temp.size() == 4)
                    {
                        temp_isr.push_back(temp);
                        temp.clear();
                    }
                }

                if (!strncmp(inst.getOpcodeName(), "load", 4))
                {
                    // std::cout << "   Instruction " << " : " << inst.getOpcodeName() << " ";
                    temp.push_back(inst.getOpcodeName());
                    unsigned int i = 0;
                    unsigned int opnt_cnt = inst.getNumOperands();
                    for (; i < opnt_cnt; ++i)
                    {
                        Value *opnd = inst.getOperand(i);
                        // errs() << "n " << opnd->getNumUses();

                        // deal with getelement type   e.g. struct union

                        auto gep = dyn_cast<GEPOperator>(opnd); // gep->getAsInstruction();
                        auto bitcast = opnd->stripPointerCasts();
                        if (gep)
                        {
                            // std::cout <<"GEP\n";
                            Value *op = gep->getOperand(0);

                            if (auto bcast = op->stripPointerCasts())
                            {
                                StringRef name = bcast->getName();
                                // std::cout << name.str()  << " ";
                                if (name.str() != "")
                                    temp.push_back(name.str());
                            }
                            else
                            {
                                StringRef name = gep->getOperand(0)->getName();
                                // std::cout << name.str()  << " ";
                                if (name.str() != "")
                                    temp.push_back(name.str());
                            }
                        }

                        // deal with bitcast
                        else if (bitcast)
                        {
                            // std::cout << bitcast->getName().str() << " ";
                            if (bitcast->getName().str() != "")
                                temp.push_back(bitcast->getName().str());
                        }

                        // deal with normal variable
                        else
                        {
                            StringRef name;

                            if (opnd->hasName())
                            {
                                name = opnd->getName();
                                // std::cout << name.str() << " ";
                                if (name.str() != "")
                                    temp.push_back(name.str());
                            }
                        }
                    }
                    // output line number
                    // std::cout << inst.getDebugLoc().getLine() << inst.getDebugLoc().get()->getDirectory().str() << std::endl;
                    // std::cout << inst.getDebugLoc().getLine() << std::endl;
                    temp.push_back(std::to_string(inst.getDebugLoc().getLine()));
                    // temp.push_back(inst.getDebugLoc().get()->getDirectory().str() + "/" +
                    //                inst.getDebugLoc().get()->getFilename().str());
                    temp.push_back(f->getName().str()); // 使用函数名代替文件名
                    if (temp.size() == 4)
                    {
                        // travers1D(temp);
                        temp_isr.push_back(temp);
                        temp.clear();
                    }
                }
                // temp.clear();
                if (!strncmp(inst.getOpcodeName(), "store", 4))
                {
                    // std::cout << "   Instruction " << " : " << inst.getOpcodeName() << " ";
                    temp.push_back(inst.getOpcodeName());
                    unsigned int i = 0;
                    unsigned int opnt_cnt = inst.getNumOperands();
                    for (; i < opnt_cnt; ++i)
                    {
                        Value *opnd = inst.getOperand(i);

                        // deal with getelement type   (array, struct)
                        auto gep = dyn_cast<GEPOperator>(opnd);
                        auto bitcast = opnd->stripPointerCasts();
                        if (gep)
                        {
                            // std::cout <<"GEP\n";
                            Value *op = gep->getOperand(0);

                            if (auto bcast = op->stripPointerCasts())
                            {
                                StringRef name = bcast->getName();
                                // std::cout << name.str()  << " ";
                                if (name.str() != "")
                                    temp.push_back(name.str());
                            }
                            else
                            {
                                StringRef name = gep->getOperand(0)->getName();
                                // std::cout << name.str()  << " ";
                                if (name.str() != "")
                                    temp.push_back(name.str());
                            }
                        }

                        // deal with bitcast (union)
                        else if (bitcast)
                        {
                            // std::cout << bitcast->getName().str() << " ";
                            if (bitcast->getName().str() != "")
                                temp.push_back(bitcast->getName().str());
                        }

                        // deal with normal  (variable)
                        else
                        {
                            StringRef name;

                            if (opnd->hasName())
                            {
                                name = opnd->getName();
                                // std::cout << name.str() << " ";
                                if (name.str() != "")
                                    temp.push_back(name.str());
                                // std::cout << " regex_match return : "<< regex_match(global_var[0], result,:: pattern) << std::endl;
                            }
                        }
                    }
                    // output line number
                    // std::cout << inst.getDebugLoc().getLine() << std::endl;
                    temp.push_back(std::to_string(inst.getDebugLoc().getLine()));
                    // temp.push_back(inst.getDebugLoc().get()->getDirectory().str() + "/" +
                    //                inst.getDebugLoc().get()->getFilename().str());
                    temp.push_back(f->getName().str()); // 使用函数名代替文件名
                    if (temp.size() == 4)
                    {
                        // travers1D(temp);
                        temp_isr.push_back(temp);
                        temp.clear();
                    }
                }
            }
        }
        isrInfo.push_back(temp_isr);
        temp_isr.clear();
    }
}

std::vector<std::vector<std::vector<std::string>>> pattern1RWR(std::vector<std::vector<std::string>> mainInfo,
                                                               std::vector<std::vector<std::vector<std::string>>> isrInfo, std::map<std::string, int> mapCalledFun)
{

    // unsigned int size_main = mainInfo.size();
    std::vector<std::vector<std::vector<std::string>>> ret;
    int enable_para = 0;
    int disable_para = 0;
    bool firstR_main = 0;
    bool firstR_isr = 0;
    bool secondR_main = 0;
    bool secondR_isr = 0;
    /*
    std::vector<int> size_isr;

    //add to one vector to mainAndIsr
    std::vector<std::vector<std::string>> mainAndIsr;
    for (int i=0; i< mainInfo.size(); i++){
        mainAndIsr.push_back(mainInfo[i]);

    }
    for (int i=0; i < isrInfo.size(); i++){
        int cnt=0;
        for (int j=0; j<isrInfo[i].size(); j++){
            cnt++;
            mainAndIsr.push_back(isrInfo[i][j]);
        }
        size_isr.push_back(cnt);
    }

    errs() << "mainAndIsr size : " << mainAndIsr.size() << "\n";
    errs() << "size_main : " << size_main << "\n";
    errs() << "size_isr : " << size_isr[0] << "\n";
    travers2D(mainAndIsr);
     */

    // if mainInfo is null
    if (mainInfo.size() == 0)
    {
        mainInfo = isrInfo[0];
    }
    // find if there any enbale function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        // std::cout <<  m1_Iter->first<<" "<<m1_Iter->second<<std::endl;
        std::string it = m1_Iter->first;
        // errs() << it;
        if (findSubString(it, "enable"))
        {
            enable_para = m1_Iter->second;
            // errs() << "enable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "enable_para : " << enable_para << "\n";

    // find if there any disbale function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        // std::cout <<  m1_Iter->first<<" "<<m1_Iter->second<<std::endl;
        std::string it = m1_Iter->first;
        // errs() << it;
        if (findSubString(it, "disable"))
        {
            disable_para = m1_Iter->second;
            // errs() << "disable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "disable_para : " << disable_para << "\n";

    // delete disable part
    if (disable_para != 0)
    {
        for (int t = 0; t < isrInfo.size(); t++)
        {
            if (t == disable_para && t >= 1)
            {
                // isrInfo.erase(isrInfo.begin() + t - 1);
            }
        }
    }

    std::vector<std::vector<std::string>> temp;

    // judge R
    for (int i = 0; i < global_var.size(); i++)
    {
        // 在使用 mainInfo[i] 前，先检查 mainInfo 是否有足够的元素
        if (i >= mainInfo.size())
        {
            errs() << "Warning: mainInfo size (" << mainInfo.size() << ") is less than expected (" << i << ")\n";
            break;
        }
        errs() << "主函数信息:" << mainInfo[i][0] << " " << mainInfo[i][1] << " " << mainInfo[i][2] << " " << mainInfo[i][3] << " " << global_var[i] << "\n";

        temp.clear();
        // 第一个 R 的查找
        bool foundR = false;
        for (auto it = mainInfo.begin(); it != mainInfo.end();)
        {
            if ((*it)[0] == "load" && (*it)[1] == global_var[i])
            {
                temp.push_back(*it);
                // 删除后返回新的迭代器
                it = mainInfo.erase(it);
                foundR = true;
                break;
            }
            else
            {
                ++it;
            }
        }
        // judge W
        if (temp.size() == 1)
        {
            for (auto &i : isrInfo)
            {
                for (int j = 0; j < i.size(); j++)
                {
                    if (i[j][0] == "store" && i[j][1] == temp[0][1] && (getPriority(i[j][3]) > getPriority(temp[0][3])))
                    // if (i[j][0] == "store" && i[j][1] == temp[0][1])
                    {
                        errs() << "中断函数信息:" << i[j][0] << " " << i[j][1] << " " << i[j][2] << " " << i[j][3] << "\n";
                        errs() << "中断优先级:" << getPriority(i[j][3]) << " " << getPriority(temp[j][3]) << "\n";
                        // ret1.push_back("W#"+isrInfo[enable_para-1][j][2]);
                        temp.push_back(i[j]);
                        break;
                    }
                }
            }
        }
        errs() << "temp in second step : " << "\n";
        // travers2D(temp);
        errs() << "temp size in second step : " << temp.size() << "\n";

        // judge R
        if (temp.size() == 2 && firstR_main == 1)
        {
            std::vector<std::vector<std::string>> temp_load;
            for (int j = 0; j < mainInfo.size();)
            {
                // errs() << "mainInfo[j][0] :" << mainInfo[j][0] << "\n";
                // errs() << "mainInfo[j][1] :" << mainInfo[j][1] << "\n";
                // errs()<< "temp[1][1] :" << temp[1][1] << "\n";
                if (mainInfo[j][0] == "load" && mainInfo[j][1] == temp[1][1])
                {
                    // temp.push_back(mainInfo[j]);
                    temp_load.push_back(mainInfo[j]);
                    secondR_main = 1;
                    break;
                }
                else
                {
                    mainInfo.erase(mainInfo.begin() + j);
                }
                j = 0;
            }

            if (temp_load.size() != 0)
            {
                temp.push_back(temp_load[0]);
            }

            errs() << "temp in third step : " << "\n";
            // travers2D(temp);
            errs() << "temp size in third step : " << temp.size() << "\n";
        }
        if (temp.size() == 3)
        {
            // 如果两个 R 的优先级相同，表示来自同一个低优先级中断或主函数
            if (getPriority(temp[0][3]) == getPriority(temp[2][3]))
            {
                ret.push_back(temp);
            }
        }
    }

    return ret;
}

std::vector<std::vector<std::vector<std::string>>> pattern2WWR(std::vector<std::vector<std::string>> mainInfo,
                                                               std::vector<std::vector<std::vector<std::string>>> isrInfo, std::map<std::string, int> mapCalledFun)
{
    std::vector<std::vector<std::vector<std::string>>> ret;
    int enable_para = 0;
    int disable_para = 0;
    // if mainInfo is null
    if (mainInfo.empty())
    {
        mainInfo = isrInfo[0];
    }
    // find if there any enbale function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        std::cout << m1_Iter->first << " " << m1_Iter->second << std::endl;
        std::string it = m1_Iter->first;
        errs() << it;
        if (findSubString(it, "enable"))
        {
            enable_para = m1_Iter->second;
            errs() << "enable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "enable_para : " << enable_para << "\n";

    // find if there any disbale function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        std::cout << m1_Iter->first << " " << m1_Iter->second << std::endl;
        std::string it = m1_Iter->first;
        errs() << it;
        if (findSubString(it, "disable"))
        {
            disable_para = m1_Iter->second;
            errs() << "disable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "disable_para : " << disable_para << "\n";

    // delete disable part
    if (disable_para != 0)
    {
        for (int t = 0; t < isrInfo.size(); t++)
        {
            if (t == disable_para && t >= 1)
            {
                isrInfo.erase(isrInfo.begin() + t - 1);
            }
        }
    }

    std::vector<std::vector<std::string>> temp;

    // iterater each global_var
    for (int i = 0; i < global_var.size(); i++)
    {

        temp.clear();

        // errs() << mainAndIsr[i][0] << mainAndIsr[i][1]<< global_var[i];
        errs() << "global_var in pattern : " << global_var[i] << "\n";
        int index_first = 0;

        // judge W
        std::vector<std::vector<std::string>> temp1;
        for (int j = 0; j < mainInfo.size(); j++)
        {

            if (mainInfo[j][0] == "store" && mainInfo[j][1] == global_var[i])
            {
                // ret1.push_back("R#"+mainInfo[j][2]);
                temp1.push_back(mainInfo[j]);
                // ret1.push_back(mainAndIsr[i][2]);
                mainInfo.erase(mainInfo.begin() + j);
                // errs() << "size of mainInfo after pop :  " << mainInfo.size() << "\n";
                // errs() << "success";
                index_first = j;

                // break;
                // continue;
            }
            else
            {
                mainInfo.erase(mainInfo.begin() + j);
            }

            // break;
            // continue;
        }
        errs() << "first_index : " << "\n";

        // delete dup instructions
        if (temp1.size() != 0)
        {
            temp.push_back(temp1[temp1.size() - 1]);
        }
        errs() << "temp in first step : " << "\n";
        travers2D(temp);
        errs() << "temp size in first step : " << temp.size() << "\n";

        // judge W
        if (temp.size() == 1)
        {
            // if (enable_para)
            // {
            //     for (int j = 0; j < isrInfo[enable_para - 1].size(); j++)
            //     {
            //         if (isrInfo[enable_para - 1][j][0] == "store" && isrInfo[enable_para - 1][j][1] == temp[0][1])
            //         {
            //             // ret1.push_back("W#"+isrInfo[enable_para-1][j][2]);
            //             temp.push_back(isrInfo[enable_para - 1][j]);
            //             break;
            //         }
            //     }
            // }
            // else
            // {
            for (auto &i : isrInfo)
            {
                for (int j = 0; j < i.size(); j++)
                {
                    if (i[j][0] == "store" && i[j][1] == temp[0][1])
                    {
                        // ret1.push_back("W#"+isrInfo[enable_para-1][j][2]);
                        temp.push_back(i[j]);
                        break;
                    }
                }
            }
            // }
            // errs() << "temp in second step : " << "\n";
            // travers2D(temp);
            // errs() << "temp size in second step : " << temp.size() << "\n";
        }

        // judge R
        if (temp.size() == 2)
        {
            std::vector<std::vector<std::string>> temp_store;
            for (int j = 0; j < mainInfo.size(); j++)
            {
                if (mainInfo[j][0] == "load" && mainInfo[j][1] == temp[temp.size() - 1][1])
                {
                    temp_store.push_back(mainInfo[j]);
                    // break;
                }
                else
                {
                    // mainInfo.erase(mainInfo.begin() + j);
                }
                // j=0;
            }
            if (temp_store.size() != 0)
            {
                temp.push_back(temp_store[temp_store.size() - 1]);
                // temp.push_back(temp_store[0]);
            }

            errs() << "temp in third step : " << "\n";
            travers2D(temp);
            errs() << "temp size in third step : " << temp.size() << "\n";
        }
        if (temp.size() == 3)
        {
            ret.push_back(temp);
        }
    }

    return ret;
}

std::vector<std::vector<std::vector<std::string>>> pattern3RWW(std::vector<std::vector<std::string>> mainInfo,
                                                               std::vector<std::vector<std::vector<std::string>>> isrInfo, std::map<std::string, int> mapCalledFun)
{
    std::vector<std::vector<std::vector<std::string>>> ret;
    int enable_para = 0;
    int disable_para = 0;
    // if mainInfo is null
    if (mainInfo.empty())
    {
        mainInfo = isrInfo[0];
    }
    // find if there any enbale function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        // std::cout <<  m1_Iter->first<<" "<<m1_Iter->second<<std::endl;
        std::string it = m1_Iter->first;
        // errs() << it;
        if (findSubString(it, "enable"))
        {
            enable_para = m1_Iter->second;
            // errs() << "enable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "enable_para : " << enable_para << "\n";

    // find if there any disbale function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        // std::cout <<  m1_Iter->first<<" "<<m1_Iter->second<<std::endl;
        std::string it = m1_Iter->first;
        // errs() << it;
        if (findSubString(it, "disable"))
        {
            disable_para = m1_Iter->second;
            // errs() << "disable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "disable_para : " << disable_para << "\n";

    // delete disable part
    if (disable_para != 0)
    {
        for (int t = 0; t < isrInfo.size(); t++)
        {
            if (t == disable_para && t >= 1)
            {
                isrInfo.erase(isrInfo.begin() + t - 1);
            }
        }
    }

    // errs() << "isrInfo size after delete : " << isrInfo.size() << "\n";
    // travers3D(isrInfo);

    // judge R
    std::vector<std::vector<std::string>> temp;
    for (int i = 0; i < global_var.size(); i++)
    {
        temp.clear();
        // errs() << mainAndIsr[i][0] << mainAndIsr[i][1]<< global_var[i];
        std::vector<std::vector<std::string>> temp2;
        for (int j = 0; j < mainInfo.size(); j++)
        {
            if (mainInfo[j][0] == "load" && mainInfo[j][1] == global_var[i])
            {
                // ret1.push_back("R#"+mainInfo[j][2]);
                temp2.push_back(mainInfo[j]);
                // ret1.push_back(mainAndIsr[i][2]);
                mainInfo.erase(mainInfo.begin() + j);
                // errs() << "size of mainInfo after pop :  " << mainInfo.size() << "\n";
                // errs() << "success";
                // break;
            }
            else
            {
                mainInfo.erase(mainInfo.begin() + j);
            }
            // j=0;
            // continue;
        }

        // delete dup instructions
        if (temp2.size() != 0)
        {
            temp.push_back(temp2[temp2.size() - 1]);
            // temp.push_back(temp2[0]);
        }
        errs() << "temp in first step : " << "\n";
        // travers2D(temp);
        errs() << "temp size in first step : " << temp.size() << "\n";

        // judge W
        if (temp.size() == 1)
        {
            std::vector<std::vector<std::string>> temp_store1;
            if (enable_para)
            {
                for (auto &j : isrInfo[enable_para - 1])
                {
                    // errs() << "fffff \n";
                    // travers2D(isrInfo[enable_para - 1]);
                    if (j[0] == "store" && j[1] == temp[0][1])
                    {
                        // ret1.push_back("W#"+isrInfo[enable_para-1][j][2]);
                        // temp.push_back(isrInfo[enable_para-1][j]);
                        temp_store1.push_back(j);
                        break;
                    }
                }
            }
            else
            {
                for (auto &i : isrInfo)
                {
                    for (int j = 0; j < i.size(); j++)
                    {
                        if (i[j][0] == "store" && i[j][1] == temp[0][1])
                        {
                            // ret1.push_back("W#"+isrInfo[enable_para-1][j][2]);
                            // temp.push_back(isrInfo[i][j]);
                            temp_store1.push_back(i[j]);
                            break;
                        }
                    }
                }
            }

            if (temp_store1.size() != 0)
            {
                temp.push_back(temp_store1[temp_store1.size() - 1]);
            }

            errs() << "temp in second step : " << "\n";
            // travers2D(temp);
            errs() << "temp size in second step : " << temp.size() << "\n";
        }

        // judge W
        if (temp.size() == 2)
        {
            errs() << "mainInfo size in 2 : " << mainInfo.size() << "\n";
            std::vector<std::vector<std::string>> temp_store2;
            for (int i = 0; i < mainInfo.size();)
            {
                if (mainInfo[i][0] == "store" && mainInfo[i][1] == temp[temp.size() - 1][1])
                {
                    temp_store2.push_back(mainInfo[i]);
                    break;
                }
                else
                {
                    mainInfo.erase(mainInfo.begin() + i);
                }
                i = 0;
            }

            if (temp_store2.size() != 0)
            {
                // temp.push_back(temp_store2[temp_store2.size() - 1]);
                temp.push_back(temp_store2[0]);
            }

            errs() << "temp in third step : " << "\n";
            // travers2D(temp);
            errs() << "temp size in third step : " << temp.size() << "\n";
        }
        if (temp.size() == 3)
        {
            ret.push_back(temp);
        }
    }

    return ret;
}

std::vector<std::vector<std::vector<std::string>>> pattern4WRW(std::vector<std::vector<std::string>> mainInfo,
                                                               std::vector<std::vector<std::vector<std::string>>> isrInfo, std::map<std::string, int> mapCalledFun)
{
    std::vector<std::vector<std::vector<std::string>>> ret;
    int enable_para = 0;
    int disable_para = 0;
    // if mainInfo is null
    if (mainInfo.empty())
    {
        mainInfo = isrInfo[0];
    }
    // find if there any enbale function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        // std::cout <<  m1_Iter->first<<" "<<m1_Iter->second<<std::endl;
        std::string it = m1_Iter->first;
        // errs() << it;
        if (findSubString(it, "enable"))
        {
            enable_para = m1_Iter->second;
            // errs() << "enable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "enable_para : " << enable_para << "\n";

    // find if there any disbale function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        // std::cout <<  m1_Iter->first<<" "<<m1_Iter->second<<std::endl;
        std::string it = m1_Iter->first;
        // errs() << it;
        if (findSubString(it, "disable"))
        {
            disable_para = m1_Iter->second;
            // errs() << "disable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "disable_para : " << disable_para << "\n";

    // delete disable part
    if (disable_para != 0)
    {
        for (int t = 0; t < isrInfo.size(); t++)
        {
            if (t == disable_para && t >= 1)
            {
                // isrInfo.erase(isrInfo.begin() + t - 1);
            }
        }
    }

    std::vector<std::vector<std::string>> temp;

    // judge W
    for (const auto &i : global_var)
    {
        // errs() << mainAndIsr[i][0] << mainAndIsr[i][1]<< global_var[i];
        temp.clear();

        for (int j = 0; j < mainInfo.size(); j++)
        {
            if (mainInfo[j][0] == "store" && mainInfo[j][1] == i)
            {
                // ret1.push_back("R#"+mainInfo[j][2]);
                temp.push_back(mainInfo[j]);
                // ret1.push_back(mainAndIsr[i][2]);
                mainInfo.erase(mainInfo.begin() + j);
                // errs() << "size of mainInfo after pop :  " << mainInfo.size() << "\n";
                // errs() << "success";
                break;
            }
            else
            {
                // mainInfo.erase(mainInfo.begin() + j);
            }

            // continue;
        }

        // delete dup instructions
        for (int t = 0; t < temp.size(); t++)
        {
            if (t > 0)
            {
                temp.erase(temp.begin() + t);
            }
        }
        errs() << "temp in first step : " << "\n";
        // travers2D(temp);
        errs() << "temp size in first step : " << temp.size() << "\n";

        // judge W
        if (temp.size() == 1)
        {
            if (enable_para)
            {
                for (auto &j : isrInfo[enable_para - 1])
                {
                    if (j[0] == "load" && j[1] == temp[0][1])
                    {
                        // ret1.push_back("W#"+isrInfo[enable_para-1][j][2]);
                        temp.push_back(j);
                        break;
                    }
                }
            }
            else
            {
                for (auto &i : isrInfo)
                {
                    for (int j = 0; j < i.size(); j++)
                    {
                        if (i[j][0] == "load" && i[j][1] == temp[0][1])
                        {
                            // ret1.push_back("W#"+isrInfo[enable_para-1][j][2]);
                            temp.push_back(i[j]);
                            break;
                        }
                    }
                }
            }

            errs() << "temp in second step : " << "\n";
            // travers2D(temp);
            errs() << "temp size in second step : " << temp.size() << "\n";
        }

        // judge R
        if (temp.size() == 2)
        {
            std::vector<std::vector<std::string>> temp_store;
            for (int i = 0; i < mainInfo.size(); i++)
            {
                if (mainInfo[i][0] == "store" && mainInfo[i][1] == temp[temp.size() - 1][1])
                {
                    temp_store.push_back(mainInfo[i]);
                }
                else
                {
                    mainInfo.erase(mainInfo.begin() + i);
                }
                // i=0;
            }

            if (temp_store.size() != 0)
            {
                temp.push_back(temp_store[temp_store.size() - 1]);

                errs() << "temp in third step : " << "\n";
                // travers2D(temp);
                errs() << "temp size in third step : " << temp.size() << "\n";
            }
            if (temp.size() == 3)
            {
                ret.push_back(temp);
            }
        }
    }

    return ret;
}

char *makeJson(std::vector<std::vector<std::vector<std::string>>> result, const char *desc)
{
    cJSON *pRoot = NULL;
    cJSON *pSub_1 = NULL;

    if ((pRoot = cJSON_CreateObject()) == NULL)
    {
        return NULL;
    }

    if ((pSub_1 = cJSON_CreateObject()) == NULL)
    {
        return NULL;
    }
    unsigned long bugsNum = bugsNum = result.size();
    cJSON_AddStringToObject(pRoot, " TotalBugs ", &std::to_string(bugsNum)[0]);
    cJSON_AddStringToObject(pRoot, " BugTypes  ", "1");

    cJSON_AddItemToObject(pRoot, " Bugs ", pSub_1);
    unsigned long size_res = result.size();

    for (int i = 0; i < size_res; i++)
    {
        // if (result[i].size() == 3) {
        cJSON *pSub_temp = NULL;
        if ((pSub_temp = cJSON_CreateObject()) == NULL)
        {
            return NULL;
        }
        cJSON_AddItemToObject(pSub_1, "Paths ", pSub_temp);
        // char* a = "s";
        cJSON_AddStringToObject(pSub_temp, "FileName ", &result[i][0][3][0]);
        cJSON_AddStringToObject(pSub_temp, "   Line  ", &result[i][0][2][0]);
        cJSON_AddStringToObject(pSub_temp, "   Line  ", &result[i][1][2][0]);
        cJSON_AddStringToObject(pSub_temp, "   Line  ", &result[i][2][2][0]);
        cJSON_AddStringToObject(pSub_temp, "   Desc  ", desc);

        //}
    }

    char *pJson = cJSON_Print(pRoot);
    if (NULL == pJson)
    {
        cJSON_Delete(pRoot);
        return NULL;
    }
    return pJson;
}
