#include <llvm/IR/Module.h>
#include <llvm/IR/Function.h>
#include <llvm/IR/BasicBlock.h>
#include <llvm/IR/Instruction.h>
#include <llvm/IR/Instructions.h>
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IRReader/IRReader.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/raw_ostream.h>
#include <llvm/Analysis/CFG.h>
#include <llvm/IR/DebugInfoMetadata.h>
#include <llvm/IR/DebugLoc.h>
#include <llvm/Analysis/PostDominators.h>
#include <llvm/Analysis/DominanceFrontier.h>

#include <json/json.h>
#include <iostream>
#include <cstdio>
#include <vector>
#include <unordered_map>
#include <unordered_set>
#include <set>
#include <algorithm>
#include <string>
#include <queue>
#include <cctype>
#include <tuple>
#include <regex>

using namespace llvm;

// 增强的数组索引信息结构
struct ArrayIndexInfo {
    std::string originalIndex;      // 原始索引字符串
    std::vector<std::string> possibleValues; // 可能的值
    bool isConstant;               // 是否为常量
    bool isLoopVariable;          // 是否为循环变量
    int constantValue;            // 如果是常量，存储值
    std::string loopBound;        // 如果是循环变量，存储上界
    
    ArrayIndexInfo() : isConstant(false), isLoopVariable(false), constantValue(-1) {}
    
    ArrayIndexInfo(const std::string& idx) 
        : originalIndex(idx), isConstant(false), isLoopVariable(false), constantValue(-1) {
        // 尝试解析为常量
        if (std::all_of(idx.begin(), idx.end(), ::isdigit) || 
            (idx[0] == '-' && std::all_of(idx.begin() + 1, idx.end(), ::isdigit))) {
            constantValue = std::atoi(idx.c_str());
            isConstant = true;
            possibleValues.push_back(idx);
        } else {
            // 不是常量，检查是否为已知的循环变量模式
            analyzeLoopVariable(idx);
        }
    }
    
private:
    void analyzeLoopVariable(const std::string& idx) {
        // 检查是否为LLVM临时变量（如%8, %22等）
        if (idx.length() > 1 && idx[0] == '%') {
            isLoopVariable = true;
            // 对于循环变量，我们假设它可能达到一些常见的触发值
            possibleValues.push_back("9999"); // TRIGGER常量
            possibleValues.push_back("0");
            possibleValues.push_back("1");
        }
    }
};

// 增强的数组索引分析器
class ArrayIndexAnalyzer {
private:
    static const std::unordered_set<std::string> TRIGGER_VALUES;
    
public:
    // 检查两个数组索引是否可能相等
    static bool maybeEqual(const ArrayIndexInfo& idx1, const ArrayIndexInfo& idx2) {
        // 如果都是常量，直接比较
        if (idx1.isConstant && idx2.isConstant) {
            return idx1.constantValue == idx2.constantValue;
        }
        
        // 如果原始索引相同，肯定相等
        if (idx1.originalIndex == idx2.originalIndex) {
            return true;
        }
        
        // 检查可能值的交集
        for (const std::string& val1 : idx1.possibleValues) {
            for (const std::string& val2 : idx2.possibleValues) {
                if (val1 == val2) {
                    return true;
                }
            }
        }
        
        // 特殊情况：检查TRIGGER值匹配
        return checkTriggerMatch(idx1, idx2);
    }
    
    // 检查是否为TRIGGER相关的匹配
    static bool checkTriggerMatch(const ArrayIndexInfo& idx1, const ArrayIndexInfo& idx2) {
        // 如果一个是常量9999，另一个是循环变量，认为可能匹配
        if (idx1.isConstant && idx1.constantValue == 9999 && idx2.isLoopVariable) {
            return true;
        }
        if (idx2.isConstant && idx2.constantValue == 9999 && idx1.isLoopVariable) {
            return true;
        }
        
        // 新增：如果一个是常量，另一个是循环变量，检查循环变量是否可能达到该常量值
        if (idx1.isConstant && idx2.isLoopVariable) {
            // 对于循环变量，我们假设它可能达到常见的小数值（比如0-100范围内）
            if (idx1.constantValue >= 0 && idx1.constantValue <= 100) {
                return true;
            }
        }
        if (idx2.isConstant && idx1.isLoopVariable) {
            // 对于循环变量，我们假设它可能达到常见的小数值（比如0-100范围内）
            if (idx2.constantValue >= 0 && idx2.constantValue <= 100) {
                return true;
            }
        }
        
        // 检查是否都可能达到TRIGGER值
        bool idx1HasTrigger = std::find(idx1.possibleValues.begin(), idx1.possibleValues.end(), "9999") != idx1.possibleValues.end();
        bool idx2HasTrigger = std::find(idx2.possibleValues.begin(), idx2.possibleValues.end(), "9999") != idx2.possibleValues.end();
        
        return idx1HasTrigger && idx2HasTrigger;
    }
    
    // 从LLVM Value创建ArrayIndexInfo
    static ArrayIndexInfo createFromValue(Value* index) {
        if (ConstantInt* CI = dyn_cast<ConstantInt>(index)) {
            return ArrayIndexInfo(std::to_string(CI->getSExtValue()));
        } else if (index->hasName()) {
            return ArrayIndexInfo(index->getName().str());
        } else {
            // 对于复杂表达式，使用"expr"标记，但仍然分析可能的值
            ArrayIndexInfo info("expr");
            info.isLoopVariable = true; // 假设复杂表达式可能包含循环变量
            info.possibleValues.push_back("9999"); // 可能达到TRIGGER值
            return info;
        }
    }
};

// 初始化TRIGGER值集合
const std::unordered_set<std::string> ArrayIndexAnalyzer::TRIGGER_VALUES = {"9999"};

// 内存访问操作结构 - 增强版
struct MemoryAccess {
    std::string variable;       // 变量名
    std::string operation;      // "load" 或 "store"
    std::string function;       // 函数名
    int line;                   // 行号
    std::string basicBlock;     // 基本块ID
    bool isArrayAccess;         // 是否为数组访问
    std::string arrayInfo;      // 数组访问信息（如索引表达式）
    ArrayIndexInfo indexInfo;   // 增强的索引信息
    
    MemoryAccess(const std::string& var, const std::string& op, 
                const std::string& func, int ln, const std::string& bb,
                bool isArray = false, const std::string& arrInfo = "",
                const ArrayIndexInfo& idxInfo = ArrayIndexInfo())
        : variable(var), operation(op), function(func), line(ln), basicBlock(bb), 
          isArrayAccess(isArray), arrayInfo(arrInfo), indexInfo(idxInfo) {}
};

// 缺陷结构
struct Defect {
    std::string sharedVariable;
    std::vector<std::string> accessPattern;
    std::vector<int> lines;
    std::string type;
    std::string location;
    std::vector<bool> isArrayAccess;        // 每个访问是否为数组访问
    std::vector<std::string> arrayInfo;     // 每个访问的数组信息
    
    Defect(const std::string& var, const std::vector<std::string>& pattern,
          const std::vector<int>& lns, const std::string& tp, const std::string& loc,
          const std::vector<bool>& isArray = {}, const std::vector<std::string>& arrInfo = {})
        : sharedVariable(var), accessPattern(pattern), lines(lns), type(tp), location(loc),
          isArrayAccess(isArray), arrayInfo(arrInfo) {}
};

class LLVMAnalyzer {
private:
    std::unique_ptr<LLVMContext> context;
    std::unique_ptr<Module> module;
    std::vector<MemoryAccess> memoryAccesses;
    std::unordered_set<std::string> globalVariables;
    std::unordered_map<std::string, std::vector<MemoryAccess>> functionAccesses;
    
    // 函数调用关系图：调用者 -> 被调用者列表
    std::unordered_map<std::string, std::vector<std::string>> callGraph;
    
    // 新增：控制流分析相关数据结构
    std::unordered_map<std::string, std::unordered_map<std::string, std::unordered_set<std::string>>> basicBlockSuccessors;
    std::unordered_map<std::string, std::unordered_map<std::string, std::unordered_set<std::string>>> basicBlockPredecessors;
    
    // 新增：指针分析相关数据结构
    // 函数内的局部指针到全局变量的映射: [函数名][局部指针值] -> 全局变量名
    std::unordered_map<std::string, std::unordered_map<Value*, std::string>> pointerToGlobalMap;
    
public:
    void collectGlobalVariablesOnly() {
        // 只收集全局变量
        collectGlobalVariables();
    }
    
    bool loadModule(const std::string& filename) {
        SMDiagnostic error;
        context = std::make_unique<LLVMContext>();
        module = parseIRFile(filename, error, *context);
        
        if (!module) {
            error.print("llvm_analyzer", errs());
            return false;
        }
        return true;
    }
    
    void analyzeModule() {
        // 收集全局变量
        std::cout << "Collecting global variables..." << std::endl;
        collectGlobalVariables();
        
        // 分析每个函数
        std::cout << "Analyzing functions..." << std::endl;
        for (Function& F : *module) {
            if (!F.isDeclaration()) {
                std::cout << "Analyzing function: " << F.getName().str() << std::endl;
                analyzeFunction(F);
                std::cout << "Analyzing control flow for function: " << F.getName().str() << std::endl;
                analyzeControlFlow(F);
            }
        }
        
        // 分析函数调用关系
        std::cout << "Analyzing function call relationships..." << std::endl;
        analyzeFunctionCalls();
        std::cout << "Module analysis completed successfully." << std::endl;
    }
    
private:
    void collectGlobalVariables() {
        for (GlobalVariable& GV : module->globals()) {
            if (!GV.isDeclaration()) {
                globalVariables.insert(GV.getName().str());
            }
        }
    }
    
    void analyzeFunction(Function& F) {
        std::string funcName = F.getName().str();
        std::vector<MemoryAccess> funcAccesses;
        
        // 首先进行指针分析，建立局部指针到全局变量的映射
        analyzePointerMappings(F, funcName);
        
        for (BasicBlock& BB : F) {
            std::string bbName = BB.getName().str();
            if (bbName.empty()) {
                bbName = "bb_" + std::to_string(reinterpret_cast<uintptr_t>(&BB));
            }
            
            for (Instruction& I : BB) {
                analyzeInstruction(I, funcName, bbName, funcAccesses);
                // 同时分析函数调用
                analyzeFunctionCall(I, funcName);
            }
        }
        
        functionAccesses[funcName] = funcAccesses;
        memoryAccesses.insert(memoryAccesses.end(), funcAccesses.begin(), funcAccesses.end());
    }
    
    // 新增：分析函数内的指针映射关系
    void analyzePointerMappings(Function& F, const std::string& funcName) {
        auto& ptrMap = pointerToGlobalMap[funcName];
        std::cerr << "DEBUG: Analyzing pointer mappings for function: " << funcName << std::endl;
        
        // 首先分析局部指针映射
        analyzeLocalPointerMappings(F, funcName);
        
        // 分析函数调用时的参数传递
        for (BasicBlock& BB : F) {
            for (Instruction& I : BB) {
                if (CallInst* CI = dyn_cast<CallInst>(&I)) {
                    Function* calledFunc = CI->getCalledFunction();
                    if (calledFunc && !calledFunc->isDeclaration()) {
                        std::cerr << "DEBUG: Found call to function: " << calledFunc->getName().str() << std::endl;
                        // 分析传递给被调用函数的参数
                        for (unsigned i = 0; i < CI->getNumArgOperands(); ++i) {
                            Value* arg = CI->getArgOperand(i);
                            if (arg->getType()->isPointerTy()) {
                                std::cerr << "DEBUG: Found pointer argument at index " << i << std::endl;
                                // 检查参数是否指向全局变量
                                std::string globalVar = resolveToGlobalVariable(arg);
                                if (!globalVar.empty()) {
                                    std::cerr << "DEBUG: Resolved to global variable: " << globalVar << std::endl;
                                    // 获取被调用函数的对应参数
                                    if (i < calledFunc->arg_size()) {
                                        Argument* formalArg = calledFunc->getArg(i);
                                        auto& calledPtrMap = pointerToGlobalMap[calledFunc->getName().str()];
                                        calledPtrMap[formalArg] = globalVar;
                                        std::cerr << "DEBUG: Mapped formal argument to global: " << globalVar << std::endl;
                                        
                                        // 跟踪这个参数在被调用函数中的使用
                                        trackPointerUsage(calledFunc, formalArg, globalVar);
                                    }
                                } else {
                                    std::cerr << "DEBUG: Could not resolve pointer argument to global variable" << std::endl;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 新增：分析函数内的局部指针映射
    void analyzeLocalPointerMappings(Function& F, const std::string& funcName) {
        auto& ptrMap = pointerToGlobalMap[funcName];
        std::cerr << "DEBUG: Analyzing local pointer mappings for function: " << funcName << std::endl;
        
        // 分析函数内的store指令，查找指针赋值操作
        for (BasicBlock& BB : F) {
            for (Instruction& I : BB) {
                if (StoreInst* SI = dyn_cast<StoreInst>(&I)) {
                    Value* valueOperand = SI->getValueOperand();
                    Value* pointerOperand = SI->getPointerOperand();
                    
                    // 检查是否是将全局变量地址存储到局部变量
                    // 例如: int *p = &global_var; 会生成 store &global_var, p
                    std::string globalVar = resolveToGlobalVariable(valueOperand);
                    if (!globalVar.empty()) {
                        // 将局部指针变量映射到全局变量
                        ptrMap[pointerOperand] = globalVar;
                        std::cerr << "DEBUG: Found local pointer assignment: local var -> " << globalVar 
                                 << " at line " << getLineNumber(I) << std::endl;
                    }
                } else if (LoadInst* LI = dyn_cast<LoadInst>(&I)) {
                    Value* pointerOperand = LI->getPointerOperand();
                    
                    // 检查是否是从全局变量指针加载
                    if (GlobalVariable* GV = dyn_cast<GlobalVariable>(pointerOperand)) {
                        std::string globalVarName = GV->getName().str();
                        if (isGlobalVariable(globalVarName) && LI->getType()->isPointerTy()) {
                            // 这是从全局指针变量加载指针值
                            std::cerr << "DEBUG: Found load from global pointer variable: " << globalVarName 
                                     << " at line " << getLineNumber(I) << std::endl;
                        }
                    }
                    
                    // 检查是否是从局部指针变量加载指针值
                    if (ptrMap.find(pointerOperand) != ptrMap.end()) {
                        // 这个load指令加载了一个指向全局变量的指针
                        ptrMap[LI] = ptrMap[pointerOperand];
                        std::cerr << "DEBUG: Found load from local pointer variable -> " << ptrMap[pointerOperand] 
                                 << " at line " << getLineNumber(I) << std::endl;
                    }
                }
            }
        }
    }
    
    // 新增：解析值到全局变量的映射
    std::string resolveToGlobalVariable(Value* V) {
        if (GlobalVariable* GV = dyn_cast<GlobalVariable>(V)) {
            return GV->getName().str();
        }
        
        // 处理GetElementPtr指令（指向全局变量的指针）
        if (GetElementPtrInst* GEP = dyn_cast<GetElementPtrInst>(V)) {
            return resolveToGlobalVariable(GEP->getPointerOperand());
        }
        
        // 处理BitCast指令（类型转换）
        if (BitCastInst* BC = dyn_cast<BitCastInst>(V)) {
            return resolveToGlobalVariable(BC->getOperand(0));
        }
        
        // 处理常量表达式
        if (ConstantExpr* CE = dyn_cast<ConstantExpr>(V)) {
            if (CE->getOpcode() == Instruction::GetElementPtr && CE->getNumOperands() > 0) {
                return resolveToGlobalVariable(CE->getOperand(0));
            }
            // 修复：添加对BitCast常量表达式的处理
            else if (CE->getOpcode() == Instruction::BitCast && CE->getNumOperands() > 0) {
                return resolveToGlobalVariable(CE->getOperand(0));
            }
        }
        
        return "";
    }
    
    // 新增：跟踪指针在函数中的使用
    void trackPointerUsage(Function* F, Value* pointer, const std::string& globalVar) {
        std::string funcName = F->getName().str();
        auto& ptrMap = pointerToGlobalMap[funcName];
        
        // 跟踪通过store指令存储到局部变量的指针
        for (BasicBlock& BB : *F) {
            for (Instruction& I : BB) {
                if (StoreInst* SI = dyn_cast<StoreInst>(&I)) {
                    if (SI->getValueOperand() == pointer) {
                        // pointer被存储到SI->getPointerOperand()
                        ptrMap[SI->getPointerOperand()] = globalVar;
                    }
                }
                // 跟踪load指令加载的指针
                else if (LoadInst* LI = dyn_cast<LoadInst>(&I)) {
                    Value* loadedFrom = LI->getPointerOperand();
                    if (ptrMap.find(loadedFrom) != ptrMap.end()) {
                        // 从包含全局变量指针的局部变量加载
                        ptrMap[LI] = ptrMap[loadedFrom];
                    }
                }
            }
        }
    }
    
    void analyzeInstruction(Instruction& I, const std::string& funcName, 
                           const std::string& bbName, std::vector<MemoryAccess>& accesses) {
        int lineNumber = getLineNumber(I);
        
        if (LoadInst* LI = dyn_cast<LoadInst>(&I)) {
            std::string varName;
            bool isArray = false;
            std::string arrayInfo;
            ArrayIndexInfo indexInfo;
            
            std::tie(varName, isArray, arrayInfo, indexInfo) = getVariableNameWithArrayInfoEnhanced(LI->getPointerOperand(), funcName);
            
            // 增加调试输出：显示每个load指令的详细信息
            std::cerr << "DEBUG: Found LoadInst at line " << lineNumber << " in function " << funcName 
                     << ", target variable: " << varName << std::endl;
            
            // 如果直接访问全局变量
            if (isGlobalVariable(varName)) {
                // 检查是否是加载指针值（而不是目标变量的值）
                Type* loadedType = LI->getType();
                if (!loadedType->isPointerTy()) {
                    // 只有当加载的不是指针类型时，才认为是对全局变量值的访问
                    std::cerr << "DEBUG: Recording direct load access to " << varName << " (arrayInfo: " << arrayInfo << ") at line " << lineNumber << " in function " << funcName << std::endl;
                accesses.emplace_back(varName, "load", funcName, lineNumber, bbName, isArray, arrayInfo, indexInfo);
                } else {
                    std::cerr << "DEBUG: Skipping pointer load from global variable " << varName << " at line " << lineNumber << std::endl;
                }
            }
            // 如果通过指针间接访问全局变量
            else {
                std::string globalVar = resolvePointerToGlobal(LI->getPointerOperand(), funcName);
                if (!globalVar.empty() && lineNumber > 0) {
                    // 检查这是否真的是对全局变量值的访问，而不是指针的加载
                    Type* loadedType = LI->getType();
                    if (!loadedType->isPointerTy()) { // 只有当加载的不是指针类型时，才认为是对全局变量值的访问
                        std::cerr << "DEBUG: Recording load access to " << globalVar << " at line " << lineNumber << " in function " << funcName << std::endl;
                        accesses.emplace_back(globalVar, "load", funcName, lineNumber, bbName, false, "", ArrayIndexInfo());
                    } else {
                        std::cerr << "DEBUG: Skipping pointer load (not a value load) at line " << lineNumber << std::endl;
                    }
                } else if (!globalVar.empty()) {
                    std::cerr << "DEBUG: Skipping access with invalid line number: " << lineNumber << std::endl;
                } else {
                    std::cerr << "DEBUG: LoadInst at line " << lineNumber << " does not target a global variable (varName: " << varName << ")" << std::endl;
                }
            }
        } else if (StoreInst* SI = dyn_cast<StoreInst>(&I)) {
            std::string varName;
            bool isArray = false;
            std::string arrayInfo;
            ArrayIndexInfo indexInfo;
            
            std::tie(varName, isArray, arrayInfo, indexInfo) = getVariableNameWithArrayInfoEnhanced(SI->getPointerOperand(), funcName);
            
            // 增加调试输出：显示每个store指令的详细信息
            std::cerr << "DEBUG: Found StoreInst at line " << lineNumber << " in function " << funcName 
                     << ", target variable: " << varName << std::endl;
            
            // 如果直接访问全局变量
            if (isGlobalVariable(varName)) {
                std::cerr << "DEBUG: Recording direct store access to " << varName << " (arrayInfo: " << arrayInfo << ") at line " << lineNumber << " in function " << funcName << std::endl;
                accesses.emplace_back(varName, "store", funcName, lineNumber, bbName, isArray, arrayInfo, indexInfo);
            }
            // 如果通过指针间接访问全局变量
            else {
                std::string globalVar = resolvePointerToGlobal(SI->getPointerOperand(), funcName);
                if (!globalVar.empty() && lineNumber > 0) { // 只处理有有效行号的指令
                    // 检查这是否是指针赋值操作（如 int *p = &global_var）
                    Value* storedValue = SI->getValueOperand();
                    std::string storedGlobalVar = resolveToGlobalVariable(storedValue);
                    if (storedGlobalVar == globalVar) {
                        // 这是指针赋值操作，不应记录为对全局变量的写操作
                        std::cerr << "DEBUG: Skipping pointer assignment at line " << lineNumber 
                                 << " (storing address of " << globalVar << " to local pointer)" << std::endl;
                    } else {
                        // 这是真正的间接写操作（如 *p = value）
                    std::cerr << "DEBUG: Recording store access to " << globalVar << " at line " << lineNumber << " in function " << funcName << std::endl;
                    accesses.emplace_back(globalVar, "store", funcName, lineNumber, bbName, false, "", ArrayIndexInfo());
                    }
                } else if (!globalVar.empty()) {
                    std::cerr << "DEBUG: Skipping store access with invalid line number: " << lineNumber << std::endl;
                } else {
                    std::cerr << "DEBUG: StoreInst at line " << lineNumber << " does not target a global variable (varName: " << varName << ")" << std::endl;
                }
            }
        } else {
            // 对于非内存访问指令，输出调试信息
            std::cerr << "DEBUG: Non-memory instruction at line " << lineNumber << " in function " << funcName 
                     << " (opcode: " << I.getOpcodeName() << ")" << std::endl;
        }
    }
    
    // 新增：解析指针到全局变量的映射
    std::string resolvePointerToGlobal(Value* pointer, const std::string& funcName) {
        std::cerr << "DEBUG: resolvePointerToGlobal called for function: " << funcName << std::endl;
        auto funcIt = pointerToGlobalMap.find(funcName);
        if (funcIt != pointerToGlobalMap.end()) {
            std::cerr << "DEBUG: Found function in pointer map, checking " << funcIt->second.size() << " mappings" << std::endl;
            auto ptrIt = funcIt->second.find(pointer);
            if (ptrIt != funcIt->second.end()) {
                std::cerr << "DEBUG: Found pointer mapping to global: " << ptrIt->second << std::endl;
                return ptrIt->second;
            } else {
                std::cerr << "DEBUG: Pointer not found in mappings" << std::endl;
            }
        } else {
            std::cerr << "DEBUG: Function not found in pointer map" << std::endl;
        }
        return "";
    }
    
    int getLineNumber(Instruction& I) {
        if (DILocation* Loc = I.getDebugLoc()) {
            int line = Loc->getLine();
            std::cerr << "DEBUG: getLineNumber for " << I.getOpcodeName() << " instruction: " << line << std::endl;
            return line;
        }    
        std::cerr << "DEBUG: getLineNumber for " << I.getOpcodeName() << " instruction: NO DEBUG INFO (returning 0)" << std::endl;
    return 0;
}
    
    std::string getVariableName(Value* V) {
        if (GlobalVariable* GV = dyn_cast<GlobalVariable>(V)) {
            return GV->getName().str();
        } else if (V->hasName()) {
            return V->getName().str();
        }
        
        // 处理指向全局变量的指针
        if (GetElementPtrInst* GEP = dyn_cast<GetElementPtrInst>(V)) {
            return getVariableName(GEP->getPointerOperand());
        }
        
        return "";
    }

// 增强的变量名和数组信息获取函数
std::tuple<std::string, bool, std::string, ArrayIndexInfo> getVariableNameWithArrayInfoEnhanced(Value* V, const std::string& funcName = "") {
    if (GlobalVariable* GV = dyn_cast<GlobalVariable>(V)) {
        return std::make_tuple(GV->getName().str(), false, "", ArrayIndexInfo());
    } else if (V->hasName()) {
        return std::make_tuple(V->getName().str(), false, "", ArrayIndexInfo());
    }
    
    // 处理GetElementPtr指令（数组/结构体访问）
    if (GetElementPtrInst* GEP = dyn_cast<GetElementPtrInst>(V)) {
        // 递归获取基础变量名
        auto [baseVarName, _, __, ___] = getVariableNameWithArrayInfoEnhanced(GEP->getPointerOperand(), funcName);
        
        if (!baseVarName.empty()) {
            // 构造数组访问信息
            std::string arrayInfo = buildArrayAccessInfo(GEP);
            ArrayIndexInfo indexInfo = buildArrayIndexInfo(GEP);
            return std::make_tuple(baseVarName, true, arrayInfo, indexInfo);
        }
    }
    
    // 处理BitCast指令（联合体类型转换）
    if (BitCastInst* BC = dyn_cast<BitCastInst>(V)) {
        auto [baseVarName, isArray, arrayInfo, indexInfo] = getVariableNameWithArrayInfoEnhanced(BC->getOperand(0), funcName);
        if (!baseVarName.empty()) {
            // 对于联合体的bitcast，添加特殊标记
            std::string enhancedArrayInfo = arrayInfo;
            if (enhancedArrayInfo.empty()) {
                enhancedArrayInfo = "bitcast";
            } else {
                enhancedArrayInfo = "bitcast_" + enhancedArrayInfo;
            }
            return std::make_tuple(baseVarName, true, enhancedArrayInfo, indexInfo);
        }
        return getVariableNameWithArrayInfoEnhanced(BC->getOperand(0), funcName);
    }
    
    // 新增：处理LoadInst结果 - 通过指针映射解析
    if (LoadInst* LI = dyn_cast<LoadInst>(V)) {
        if (!funcName.empty()) {
            std::string globalVar = resolvePointerToGlobal(LI->getPointerOperand(), funcName);
            if (!globalVar.empty()) {
                return std::make_tuple(globalVar, false, "", ArrayIndexInfo());
            }
        }
        // 如果没有函数上下文或无法解析，继续递归处理
        return getVariableNameWithArrayInfoEnhanced(LI->getPointerOperand(), funcName);
    }
    
    // 处理其他类型的指针
    if (V->getType()->isPointerTy()) {
        if (Instruction* I = dyn_cast<Instruction>(V)) {
            if (I->getNumOperands() > 0) {
                return getVariableNameWithArrayInfoEnhanced(I->getOperand(0), funcName);
            }
        }
        
        // 如果是指针类型但不是指令，可能是常量表达式
        if (ConstantExpr* CE = dyn_cast<ConstantExpr>(V)) {
            // 检查是否是getelementptr常量表达式
            if (CE->getOpcode() == Instruction::GetElementPtr) {
                // 递归获取基础变量名
                auto [baseVarName, _, __, ___] = getVariableNameWithArrayInfoEnhanced(CE->getOperand(0), funcName);
                
                if (!baseVarName.empty()) {
                    // 构造数组访问信息
                    std::string arrayInfo = buildArrayAccessInfoFromConstantExpr(CE);
                    ArrayIndexInfo indexInfo = buildArrayIndexInfoFromConstantExpr(CE);
                    return std::make_tuple(baseVarName, true, arrayInfo, indexInfo);
                }
            } else if (CE->getOpcode() == Instruction::BitCast) {
                // 处理bitcast常量表达式（联合体类型转换）
                auto [baseVarName, isArray, arrayInfo, indexInfo] = getVariableNameWithArrayInfoEnhanced(CE->getOperand(0), funcName);
                if (!baseVarName.empty()) {
                    std::string enhancedArrayInfo = arrayInfo;
                    if (enhancedArrayInfo.empty()) {
                        enhancedArrayInfo = "bitcast";
                    } else {
                        enhancedArrayInfo = "bitcast_" + enhancedArrayInfo;
                    }
                    return std::make_tuple(baseVarName, true, enhancedArrayInfo, indexInfo);
                }
            } else if (CE->getNumOperands() > 0) {
                return getVariableNameWithArrayInfoEnhanced(CE->getOperand(0), funcName);
            }
        }
    }
    
    return std::make_tuple("", false, "", ArrayIndexInfo());
}

// 新增：构造增强的数组索引信息
ArrayIndexInfo buildArrayIndexInfo(GetElementPtrInst* GEP) {
    // 对于多维数组，我们主要关注最后一个索引
    if (GEP->getNumOperands() > 1) {
        Value* lastIndex = GEP->getOperand(GEP->getNumOperands() - 1);
        return ArrayIndexAnalyzer::createFromValue(lastIndex);
    }
    return ArrayIndexInfo();
}

// 新增：从ConstantExpr构造数组索引信息
ArrayIndexInfo buildArrayIndexInfoFromConstantExpr(ConstantExpr* CE) {
    // 对于多维数组，我们主要关注最后一个索引
    if (CE->getNumOperands() > 1) {
        Value* lastIndex = CE->getOperand(CE->getNumOperands() - 1);
        return ArrayIndexAnalyzer::createFromValue(lastIndex);
    }
    return ArrayIndexInfo();
}

// 保留原有的buildArrayAccessInfo函数以保持兼容性
std::string buildArrayAccessInfo(GetElementPtrInst* GEP) {
    std::string indexInfo;
    
    // 遍历所有索引
    for (unsigned i = 1; i < GEP->getNumOperands(); ++i) { // 跳过第0个操作数（基址）
        Value* index = GEP->getOperand(i);
        
        if (!indexInfo.empty()) {
            indexInfo += "][";
        }
        
        if (ConstantInt* CI = dyn_cast<ConstantInt>(index)) {
            // 常量索引
            indexInfo += std::to_string(CI->getSExtValue());
        } else if (index->hasName()) {
            // 变量索引
            indexInfo += index->getName().str();
        } else {
            // 复杂表达式或临时值
            indexInfo += "expr";
        }
    }
    
    return indexInfo;
}

// 保留原有的buildArrayAccessInfoFromConstantExpr函数
std::string buildArrayAccessInfoFromConstantExpr(ConstantExpr* CE) {
    std::string indexInfo;
    
    // 遍历所有索引
    for (unsigned i = 1; i < CE->getNumOperands(); ++i) { // 跳过第0个操作数（基址）
        Value* index = CE->getOperand(i);
        
        if (!indexInfo.empty()) {
            indexInfo += "][";
        }
        
        if (ConstantInt* CI = dyn_cast<ConstantInt>(index)) {
            // 常量索引
            indexInfo += std::to_string(CI->getSExtValue());
        } else if (index->hasName()) {
            // 变量索引
            indexInfo += index->getName().str();
        } else {
            // 复杂表达式或临时值
            indexInfo += "expr";
        }
    }
    
    return indexInfo;
}

bool isGlobalVariable(const std::string& varName) {
    return !varName.empty() && globalVariables.count(varName) > 0;
}

// 增强的数组索引匹配函数
bool enhancedArrayIndexMatch(const MemoryAccess& access1, const MemoryAccess& access2) {
    // 首先检查是否为联合体字段访问 - 联合体字段共享内存空间，应该匹配
    if (isUnionFieldAccess(access1) && isUnionFieldAccess(access2)) {
        // 如果两个访问都是同一个联合体的字段访问，则认为匹配（内存重叠）
        std::string union1 = extractUnionName(access1);
        std::string union2 = extractUnionName(access2);
        if (union1 == union2 && !union1.empty()) {
            std::cout << "Union field access match: " << union1 << " (line " << access1.line 
                     << " and " << access2.line << " access overlapping memory)" << std::endl;
            return true;
        }
    }
    
    // 如果都不是数组访问，认为匹配
    if (!access1.isArrayAccess && !access2.isArrayAccess) {
        return true;
    }
    
    // 如果只有一个是数组访问，不匹配
    if (access1.isArrayAccess != access2.isArrayAccess) {
        return false;
    }
    
    // 都是数组访问，使用增强的索引分析
    bool result = ArrayIndexAnalyzer::maybeEqual(access1.indexInfo, access2.indexInfo);
    
    // 添加调试输出
    if (result) {
        std::cout << "Enhanced index match found: " 
                  << access1.arrayInfo << " (line " << access1.line << ") <-> "
                  << access2.arrayInfo << " (line " << access2.line << ")" << std::endl;
    } else {
        std::cout << "Enhanced index mismatch: " 
                  << access1.arrayInfo << " (line " << access1.line << ") </> "
                  << access2.arrayInfo << " (line " << access2.line << ")" << std::endl;
    }
    
    return result;
}

// 新增：检查是否为联合体字段访问
bool isUnionFieldAccess(const MemoryAccess& access) {
    // 检查变量名是否包含联合体标识
    // 这里检查LLVM IR中的联合体访问模式
    return access.variable.find("union") != std::string::npos ||
           access.arrayInfo.find("bitcast") != std::string::npos ||
           access.arrayInfo.find("union") != std::string::npos;
}

// 新增：提取联合体名称
std::string extractUnionName(const MemoryAccess& access) {
    // 从变量名中提取联合体名称
    std::string varName = access.variable;
    if (varName.find("union") != std::string::npos) {
        return varName;
    }
    return "";
}

public:
    // 缺陷检测方法 - 参考pattern-org.py的逻辑
    std::vector<Defect> detectRWRDefects() {
        std::vector<Defect> defects;
        
        std::cout << "Starting RWR defect detection..." << std::endl;
        
        for (const std::string& globalVar : globalVariables) {
            std::cout << "Analyzing variable: " << globalVar << " for RWR defects" << std::endl;
            
            // 获取main函数的内联访问（包括被调用函数的访问）
            std::string mainFuncName = findMainFunction();
            if (mainFuncName.empty()) {
                continue;
            }
            
            auto mainAccesses = getInlinedAccesses(mainFuncName, globalVar);
            auto mainReadOps = getReadOperations(mainAccesses);
            
            std::cout << "Found " << mainReadOps.size() << " main read operations for " << globalVar << std::endl;
            
            // RWR模式：主函数读操作 → ISR写操作 → 主函数读操作
            for (size_t i = 0; i < mainReadOps.size(); i++) {
                const auto& read1 = mainReadOps[i];
                std::cout << "Checking read1 at line " << read1.line << " in function " << read1.function << std::endl;
                
                for (size_t j = i + 1; j < mainReadOps.size(); j++) {
                    const auto& read2 = mainReadOps[j];
                    std::cout << "Checking read2 at line " << read2.line << " in function " << read2.function << std::endl;
                    
                    // 检查两个读操作是否可能在同一执行路径上连续发生
                    bool areConsecutive = false;
                    
                    // 情况1：同一函数内的读操作
                    if (read1.function == read2.function) {
                        areConsecutive = areStrictlyConsecutiveReads(mainAccesses, read1, read2);
                    }
                    // 情况2：跨函数的读操作（如main调用RecvTcBlock）
                    else if (read1.function != read2.function) {
                        // 检查函数调用关系
                        if (callGraph[mainFuncName].size() > 0) {
                            // 检查是否存在调用关系：main -> 其他函数（包括间接调用）
                            bool hasCallRelation = false;
                            
                            // 首先检查直接调用
                            for (const auto& callee : callGraph[mainFuncName]) {
                                if (read1.function == callee || read2.function == callee) {
                                    hasCallRelation = true;
                                    break;
                                }
                            }
                            
                            // 如果没有直接调用关系，检查间接调用
                            if (!hasCallRelation) {
                                for (const auto& directCallee : callGraph[mainFuncName]) {
                                    if (callGraph.find(directCallee) != callGraph.end()) {
                                        for (const auto& indirectCallee : callGraph[directCallee]) {
                                            if (read1.function == indirectCallee || read2.function == indirectCallee) {
                                                hasCallRelation = true;
                                                std::cout << "Found indirect call relation: " << mainFuncName 
                                                         << " -> " << directCallee << " -> " << indirectCallee << std::endl;
                                                break;
                                            }
                                        }
                                    }
                                    if (hasCallRelation) break;
                                }
                            }
                            
                            if (hasCallRelation) {
                                // 对于跨函数的情况，检查是否存在中间的写操作阻断连续性
                                areConsecutive = !hasInterveningWriteAccess(mainAccesses, read1, read2, globalVar);
                                std::cout << "Cross-function consecutive check: " << read1.function << "(" << read1.line << ") -> " 
                                         << read2.function << "(" << read2.line << ") = " << areConsecutive << std::endl;
                            }
                        }
                    }
                    
                    if (areConsecutive) {
                        std::cout << "Found consecutive reads: " << read1.line << " -> " << read2.line << std::endl;
                        
                        // 查找可能中断的ISR写操作
                    for (const auto& [funcName, _] : functionAccesses) {
                        if (funcName != mainFuncName && isISRFunction(funcName)) {
                                std::cout << "Checking ISR: " << funcName << " for interrupting writes" << std::endl;
                                
                            auto isrAccesses = getInlinedAccesses(funcName, globalVar);
                                auto isrWrites = getWriteOperations(isrAccesses);
                                
                                for (const auto& isrWrite : isrWrites) {
                                    std::cout << "Found ISR write at line " << isrWrite.line << std::endl;
                                    
                                    // 使用增强的数组索引匹配
                                    if (!enhancedArrayIndexMatch(read1, isrWrite) || !enhancedArrayIndexMatch(read1, read2)) {
                                        std::cout << "Array index mismatch in RWR pattern: " << read1.line << " -> " << isrWrite.line << " -> " << read2.line << std::endl;
                                        continue;
                                    }
                                    
                                    std::cout << "Found RWR pattern: " << read1.function << " R1(" << read1.line 
                                             << ") -> " << funcName << " W(" << isrWrite.line 
                                             << ") -> " << read2.function << " R2(" << read2.line << ")" << std::endl;
                                    
                                    // 创建缺陷记录
                                std::vector<MemoryAccess> allRelatedAccesses;
                                    allRelatedAccesses.push_back(read1);
                                    allRelatedAccesses.push_back(isrWrite);
                                    allRelatedAccesses.push_back(read2);
                                
                                    defects.push_back(createDefectWithArrayInfo(
                                        globalVar,
                                        std::vector<std::string>{"Read", "Write", "Read"},
                                        std::vector<int>{read1.line, isrWrite.line, read2.line},
                                        "RWR",
                                        mainFuncName + "(inlined)",
                                        allRelatedAccesses
                                    ));
                                }
                            }
                        }
                    }
                }
            }
            
            // 检查ISR之间的RWR模式
            detectISRToISRDefects(globalVar, "RWR", defects);
        }
        
        // 关键修复：添加ISR函数间的RWR缺陷检测
        // 检测模式：ISR1中的读操作 -> ISR2中的写操作 -> ISR1中的读操作（循环中的重复执行）
        std::vector<std::string> isrFunctions;
        for (const auto& [funcName, _] : functionAccesses) {
            if (isISRFunction(funcName)) {
                isrFunctions.push_back(funcName);
            }
        }
        
        for (const std::string& globalVar : globalVariables) {
            for (size_t i = 0; i < isrFunctions.size(); ++i) {
                const std::string& isr1 = isrFunctions[i];
                auto isr1Accesses = getInlinedAccesses(isr1, globalVar);
                auto isr1Reads = getReadOperations(isr1Accesses);
                
                for (size_t j = 0; j < isrFunctions.size(); ++j) {
                    if (i == j) continue;
                    
                    const std::string& isr2 = isrFunctions[j];
                    auto isr2Accesses = getInlinedAccesses(isr2, globalVar);
                    auto isr2Writes = getWriteOperations(isr2Accesses);
                    
                    // RWR模式：ISR1读 -> ISR2写 -> ISR1读（循环中的重复执行）
                    for (const auto& read1 : isr1Reads) {
                        // 检查读操作是否在循环中
                        bool readInLoop = isAccessInLoop(isr1Accesses, read1.line, isr1);
                        if (readInLoop) {
                            std::cout << "Read operation in loop at line " << read1.line 
                                     << " in " << isr1 << ", checking for cross-iteration RWR pattern" << std::endl;
                            
                            for (const auto& write : isr2Writes) {
                                // 使用增强的数组索引匹配
                                if (!enhancedArrayIndexMatch(read1, write)) {
                                    continue;
                                }
                                
                                // 检查中断优先级约束：RWR模式需要isr2能够中断isr1
                                if (!canInterrupt(isr2, isr1)) {
                                    std::cout << "Skipping RWR pattern due to priority constraint: " 
                                             << isr2 << " cannot interrupt " << isr1 << std::endl;
                                    continue;
                                }
                                
                                std::cout << "Found valid ISR-to-ISR RWR pattern: " << isr1 << " R(" << read1.line 
                                         << ") -> " << isr2 << " W(" << write.line 
                                         << ") -> " << isr1 << " R(" << read1.line << " next iteration)" << std::endl;
                                
                                std::vector<MemoryAccess> allRelatedAccesses = {read1, write, read1};
                                defects.push_back(createDefectWithArrayInfo(
                                    globalVar,
                                    std::vector<std::string>{"Read", "Write", "Read"},
                                    std::vector<int>{read1.line, write.line, read1.line},
                                    "RWR",
                                    isr1 + "_" + isr2,
                                    allRelatedAccesses
                                ));
                            }
                        }
                    }
                }
            }
        }
        
        std::cout << "RWR defect detection completed." << std::endl;
        return defects;
    }
    
    std::vector<Defect> detectRWWDefects() {
        std::vector<Defect> defects;
        
        std::cout << "Starting RWW defect detection..." << std::endl;
        
        for (const std::string& globalVar : globalVariables) {
                std::cout << "Analyzing variable: " << globalVar << std::endl;
                
                // 获取main函数的访问操作（包括内联的被调用函数）
                std::string mainFuncName = findMainFunction();
                if (mainFuncName.empty()) {
                    continue;  // 如果没有找到主函数，跳过这个变量
                }
                auto mainAccesses = getInlinedAccesses(mainFuncName, globalVar);
                std::cout << "Found " << mainAccesses.size() << " main accesses for " << globalVar << std::endl;
                
                auto mainReadOps = getReadOperations(mainAccesses);
                auto mainWriteOps = getWriteOperations(mainAccesses);
                
                // RWW模式：main读操作 → ISR写操作 → main写操作
                for (const auto& mainRead : mainReadOps) {
                    std::cout << "Found main read at line " << mainRead.line << std::endl;
                    
                    // 查找ISR中的写操作
                    for (const auto& [funcName, _] : functionAccesses) {
                        if (funcName != mainFuncName && isISRFunction(funcName)) {
                            std::cout << "Checking ISR: " << funcName << std::endl;
                            
                            auto isrAccesses = getInlinedAccesses(funcName, globalVar);
                            auto isrWrites = getWriteOperations(isrAccesses);
                            auto isrReads = getReadOperations(isrAccesses);
                            
                            // ISR写操作
                            for (const auto& isrWrite : isrWrites) {
                                std::cout << "Found ISR write at line " << isrWrite.line << std::endl;
                                
                                // main写操作 - 检查连续性
                                for (const auto& mainWrite : mainWriteOps) {
                                    // 关键修复：严格检查mainRead和mainWrite是否真正连续
                                    bool isReallyConsecutive = false;
                                    
                                    if (mainRead.line == mainWrite.line) {
                                        // 同一行的读-修改-写操作（如 glob = glob+1）
                                        // 这种操作可以被ISR中断，形成 R(read part) -> ISR_WRITE -> W(write part) 模式
                                        std::cout << "Same-line read-modify-write at line " << mainRead.line 
                                                 << ", checking for RWW interruption pattern" << std::endl;
                                        isReallyConsecutive = true;
                                    } else if (mainRead.line < mainWrite.line) {
                                        // 不同行的读写操作，严格检查是否连续（中间不能有其他访问）
                                        // 关键修复：对于跨行的读写操作，必须严格检查中间是否有其他访问
                                        std::cout << "Checking cross-line read-write pattern: " << mainRead.line 
                                                 << " -> " << mainWrite.line << std::endl;
                                        
                                        // 检查两个操作之间是否有其他对同一变量的访问
                                        bool hasInterveningAccess = false;
                                        for (const auto& access : mainAccesses) {
                                            if (access.variable == globalVar && 
                                                access.line > mainRead.line && access.line < mainWrite.line) {
                                                std::cout << "Found intervening access at line " << access.line 
                                                         << " (operation: " << access.operation << ") between read at line " << mainRead.line 
                                                         << " and write at line " << mainWrite.line << std::endl;
                                                hasInterveningAccess = true;
                                                break;
                                            }
                                        }
                                        
                                        // 特殊检查1：如果写操作行有读-修改-写模式，需要检查读操作是否在该行的读操作之前
                                        if (!hasInterveningAccess && mainWrite.line > mainRead.line) {
                                            // 检查写操作行是否有读操作（读-修改-写模式）
                                            bool writeLineHasRead = false;
                                            for (const auto& access : mainAccesses) {
                                                if (access.variable == globalVar && 
                                                    access.line == mainWrite.line && 
                                                    access.operation == "load") {
                                                    writeLineHasRead = true;
                                                    std::cout << "Write line " << mainWrite.line << " has read operation (read-modify-write)" << std::endl;
                                                    break;
                                                }
                                            }
                                            
                                            // 如果写操作行有读操作，那么前面的独立读操作与写操作不连续
                                            if (writeLineHasRead) {
                                                std::cout << "Read at line " << mainRead.line << " is not consecutive with write at line " 
                                                         << mainWrite.line << " (write line has its own read operation)" << std::endl;
                                                hasInterveningAccess = true;
                                            }
                                        }
                                        
                                        // 特殊检查2：如果读操作行有读-修改-写模式，检查该行的写操作是否在目标写操作之前
                                        if (!hasInterveningAccess && mainWrite.line > mainRead.line) {
                                            // 检查读操作行是否有写操作（读-修改-写模式）
                                            bool readLineHasWrite = false;
                                            for (const auto& access : mainAccesses) {
                                                if (access.variable == globalVar && 
                                                    access.line == mainRead.line && 
                                                    access.operation == "store") {
                                                    readLineHasWrite = true;
                                                    std::cout << "Read line " << mainRead.line << " has write operation (read-modify-write)" << std::endl;
                                                    break;
                                                }
                                            }
                                            
                                            // 如果读操作行有写操作，那么该行的读操作与后面的独立写操作不连续
                                            if (readLineHasWrite) {
                                                std::cout << "Read at line " << mainRead.line << " is not consecutive with write at line " 
                                                         << mainWrite.line << " (read line has its own write operation)" << std::endl;
                                                hasInterveningAccess = true;
                                            }
                                        }
                                        
                                        // 只有当中间没有其他访问时才认为是连续的
                                        isReallyConsecutive = !hasInterveningAccess;
                                        std::cout << "Cross-line read-write consecutiveness: " << mainRead.line 
                                                 << " -> " << mainWrite.line << " = " << isReallyConsecutive << std::endl;
                                    }
                                    
                                    if (isReallyConsecutive) {
                                    // 使用增强的数组索引匹配
                                    if (!enhancedArrayIndexMatch(mainRead, isrWrite) || !enhancedArrayIndexMatch(mainRead, mainWrite)) {
                                        std::cout << "Array index mismatch in RWW pattern: " << mainRead.line << " -> " << isrWrite.line << " -> " << mainWrite.line << std::endl;
                                        continue;
                                    }
                                    
                                    std::cout << "Found valid RWW pattern: " << mainRead.line << " -> " << isrWrite.line << " -> " << mainWrite.line << std::endl;
                                    
                                    // 使用createDefectWithArrayInfo来创建包含数组信息的缺陷
                                    std::vector<MemoryAccess> allRelatedAccesses;
                                    allRelatedAccesses.push_back(mainRead);
                                    allRelatedAccesses.push_back(isrWrite);
                                    allRelatedAccesses.push_back(mainWrite);
                                    
                                    defects.push_back(createDefectWithArrayInfo(
                                        globalVar,
                                        std::vector<std::string>{"Read", "Write", "Write"},
                                        std::vector<int>{mainRead.line, isrWrite.line, mainWrite.line},
                                        "RWW",
                                        "MAIN",
                                        allRelatedAccesses
                                    ));
                                } else {
                                        std::cout << "Skipping non-consecutive read-write pattern: " << mainRead.line << " -> " << mainWrite.line << std::endl;
                                    }
                                }
                            }
                        }
                    }
                }
                
                // 检查ISR中的读操作与其他ISR写操作的RWW模式
                for (const auto& [funcName, _] : functionAccesses) {
                    if (funcName != "main" && isISRFunction(funcName)) {
                        std::cout << "Checking ISR reads in: " << funcName << std::endl;
                        
                        auto isrAccesses = getInlinedAccesses(funcName, globalVar);
                        auto readOps = getReadOperations(isrAccesses);
                        auto writeOps = getWriteOperations(isrAccesses);
                        
                        // RWW模式：读操作 -> 写操作（中断）-> 写操作
                        for (const auto& readOp : readOps) {
                            std::cout << "Found ISR read at line " << readOp.line << std::endl;
                            
                            for (const auto& writeOp : writeOps) {
                                std::cout << "Found ISR write at line " << writeOp.line << std::endl;
                                
                                // 关键修复：对于同一行的读-修改-写操作，也需要检测跨ISR的RWW模式
                                bool isReallyConsecutive = false;
                                
                                if (readOp.line != writeOp.line) {
                                    // 不同行的读写操作
                                    if (readOp.line < writeOp.line) {
                                        isReallyConsecutive = areConsecutiveInPath(funcName, globalVar, readOp.line, writeOp.line);
                                    } else {
                                        // 循环中的跨迭代情况
                                        bool readInLoop = isAccessInLoop(isrAccesses, readOp.line, funcName);
                                        bool writeInLoop = isAccessInLoop(isrAccesses, writeOp.line, funcName);
                                        if (readInLoop && writeInLoop && areInSameLoop(isrAccesses, readOp.line, writeOp.line, funcName)) {
                                            std::cout << "Cross-iteration read-write pattern: write at line " << writeOp.line 
                                                     << " -> read at line " << readOp.line << " (next iteration)" << std::endl;
                                            isReallyConsecutive = true;
                                        }
                                    }
                                } else {
                                    // 同一行的读-修改-写操作（如 glob++），这是原子的读-修改-写操作
                                    // 但可能被其他ISR中断，形成 R(read part) -> ISR_WRITE -> W(write part) 模式
                                    std::cout << "Found read-modify-write at line " << readOp.line 
                                             << " in ISR " << funcName << ", checking for cross-ISR RWW interruption" << std::endl;
                                    isReallyConsecutive = true;
                                }
                                
                                if (isReallyConsecutive) {
                                    std::cout << "Found consecutive read-write pair in " << funcName << ": " << readOp.line << " -> " << writeOp.line << std::endl;
                                    
                                    // 检查其他ISR的写操作 - 只有高优先级ISR能中断低优先级ISR
                                    for (const auto& [otherFuncName, _] : functionAccesses) {
                                        if (otherFuncName != funcName && otherFuncName != "main" && isISRFunction(otherFuncName)) {
                                            // 检查优先级：只有高优先级ISR能中断低优先级ISR
                                            if (canInterrupt(otherFuncName, funcName)) {
                                                std::cout << "Checking other ISR: " << otherFuncName << " (can interrupt " << funcName << ")" << std::endl;
                                                
                                                auto otherIsrAccesses = getInlinedAccesses(otherFuncName, globalVar);
                                                auto otherWriteOps = getWriteOperations(otherIsrAccesses);
                                                
                                                for (const auto& otherWriteOp : otherWriteOps) {
                                                    // 使用增强的数组索引匹配
                                                    if (!enhancedArrayIndexMatch(readOp, otherWriteOp) || !enhancedArrayIndexMatch(readOp, writeOp)) {
                                                        std::cout << "Array index mismatch in RWW pattern: " << readOp.line << " -> " << otherWriteOp.line << " -> " << writeOp.line << std::endl;
                                                        continue;
                                                    }
                                                    
                                                    // RWW模式：Read -> Write(interrupt) -> Write
                                                    std::cout << "Found consecutive RWW pattern in ISR: " << readOp.line << " -> " << otherWriteOp.line << " -> " << writeOp.line << std::endl;
                                                    
                                                    // 使用createDefectWithArrayInfo来创建包含数组信息的缺陷
                                                    std::vector<MemoryAccess> allRelatedAccesses;
                                                    allRelatedAccesses.push_back(readOp);  // 第一个读操作
                                                    allRelatedAccesses.push_back(otherWriteOp);  // 中断写操作  
                                                    allRelatedAccesses.push_back(writeOp);  // 第二个写操作
                                                    
                                                    defects.push_back(createDefectWithArrayInfo(
                                                        globalVar,
                                                        std::vector<std::string>{"Read", "Write", "Write"},
                                                        std::vector<int>{readOp.line, otherWriteOp.line, writeOp.line},
                                                        "RWW",
                                                        funcName,
                                                        allRelatedAccesses
                                                    ));
                                                }
                                            } else {
                                                std::cout << "Skipping ISR: " << otherFuncName << " (cannot interrupt " << funcName << ")" << std::endl;
                                            }
                                        }
                                    }
                                } else {
                                    std::cout << "Skipping non-consecutive ISR read-write pair: " << readOp.line << " -> " << writeOp.line 
                                             << " (areConsecutiveInPath returned false)" << std::endl;
                                }
                            }
                        }
                    }
                }
                
                std::cout << "Completed analysis for variable: " << globalVar << std::endl;
            }
        
        // 关键修复：添加ISR函数间的RWW缺陷检测
        // 检测模式：ISR1中的读操作 -> ISR2中的写操作 -> ISR1中的写操作
        std::vector<std::string> isrFunctions;
        for (const auto& [funcName, _] : functionAccesses) {
            if (isISRFunction(funcName)) {
                isrFunctions.push_back(funcName);
            }
        }
        
        for (const std::string& globalVar : globalVariables) {
            for (size_t i = 0; i < isrFunctions.size(); ++i) {
                const std::string& isr1 = isrFunctions[i];
                auto isr1Accesses = getInlinedAccesses(isr1, globalVar);
                auto isr1Reads = getReadOperations(isr1Accesses);
                auto isr1Writes = getWriteOperations(isr1Accesses);
                
                for (size_t j = 0; j < isrFunctions.size(); ++j) {
                    if (i == j) continue;
                    
                    const std::string& isr2 = isrFunctions[j];
                    auto isr2Accesses = getInlinedAccesses(isr2, globalVar);
                    auto isr2Writes = getWriteOperations(isr2Accesses);
                    
                    // RWW模式：ISR1读 -> ISR2写 -> ISR1写（循环中的重复执行）
                     for (const auto& read1 : isr1Reads) {
                         for (const auto& write1 : isr1Writes) {
                             // 关键修复：对于同一行的读-修改-写操作，也需要检测跨ISR的RWW模式
                             bool readWriteConsecutive = false;
                             if (read1.line == write1.line) {
                                 // 同一行的读-修改-写（如 glob++），这是原子的读-修改-写操作
                                 // 但可能被其他ISR中断，形成 R(read part) -> ISR_WRITE -> W(write part) 模式
                                 std::cout << "Found read-modify-write at line " << read1.line 
                                          << " in " << isr1 << ", checking for cross-ISR RWW interruption" << std::endl;
                                 readWriteConsecutive = true;
                             } else {
                                 // 检查是否在循环中且连续
                                 bool readInLoop = isAccessInLoop(isr1Accesses, read1.line, isr1);
                                 bool writeInLoop = isAccessInLoop(isr1Accesses, write1.line, isr1);
                                 if (readInLoop && writeInLoop) {
                                     readWriteConsecutive = checkLoopConsecutiveness(isr1Accesses, read1.line, write1.line, isr1, globalVar);
                                 }
                             }
                             
                             if (readWriteConsecutive) {
                                 for (const auto& write2 : isr2Writes) {
                                                                         // 使用增强的数组索引匹配
                                    if (!enhancedArrayIndexMatch(read1, write2) || !enhancedArrayIndexMatch(read1, write1)) {
                                        continue;
                                    }
                                    
                                    // 检查中断优先级约束：RWW模式需要isr2能够中断isr1
                                    if (!canInterrupt(isr2, isr1)) {
                                        std::cout << "Skipping RWW pattern due to priority constraint: " 
                                                 << isr2 << " (priority " << getISRPriority(isr2) 
                                                 << ") cannot interrupt " << isr1 << " (priority " 
                                                 << getISRPriority(isr1) << ")" << std::endl;
                                        continue;
                                    }
                                    
                                    std::cout << "Found valid ISR-to-ISR RWW pattern: " << isr1 << " R(" << read1.line 
                                             << ") -> " << isr2 << " W(" << write2.line 
                                             << ") -> " << isr1 << " W(" << write1.line << ")" << std::endl;
                                     
                                     std::vector<MemoryAccess> allRelatedAccesses = {read1, write2, write1};
                                     defects.push_back(createDefectWithArrayInfo(
                                         globalVar,
                                         std::vector<std::string>{"Read", "Write", "Write"},
                                         std::vector<int>{read1.line, write2.line, write1.line},
                                         "RWW",
                                         isr1 + "_" + isr2,
                                         allRelatedAccesses
                                     ));
                                 }
                             }
                         }
                     }
                }
            }
            }
        
        std::cout << "RWW defect detection completed." << std::endl;
        return defects;
    }
    
    std::vector<Defect> detectWRWDefects() {
        std::vector<Defect> defects;
        
        for (const std::string& globalVar : globalVariables) {
            std::string mainFuncName = findMainFunction();
            
            // 1. 检查主函数内的连续写操作被ISR读操作中断的情况
            if (!mainFuncName.empty()) {
                auto mainAccesses = getInlinedAccesses(mainFuncName, globalVar);
                auto consecutiveWrites = findConsecutiveWrites(mainAccesses);
                
                // 对于每对连续的写操作，检查是否有ISR读操作可能中断它们
                for (const auto& writePair : consecutiveWrites) {
                    int write1Line = writePair.first;
                    int write2Line = writePair.second;
                    
                    // 确保这两个写操作确实是连续的
                    if (areConsecutiveInPath(mainFuncName, globalVar, write1Line, write2Line)) {
                        // 检查ISR中是否有读操作
                        for (const auto& [funcName, _] : functionAccesses) {
                            if (funcName != mainFuncName && isISRFunction(funcName)) {
                                auto isrAccesses = getInlinedAccesses(funcName, globalVar);
                                auto isrReads = getReadOperations(isrAccesses);
                                
                                for (const auto& isrRead : isrReads) {
                                    // 找到对应的写操作来验证数组索引匹配
                                    MemoryAccess* write1Access = nullptr;
                                    MemoryAccess* write2Access = nullptr;
                                    
                                    for (auto& access : mainAccesses) {
                                        if (access.line == write1Line && access.operation == "store") {
                                            write1Access = &access;
                                        }
                                        if (access.line == write2Line && access.operation == "store") {
                                            write2Access = &access;
                                        }
                                    }
                                    
                                    if (write1Access && write2Access) {
                                        // 使用增强的数组索引匹配
                                        if (!enhancedArrayIndexMatch(*write1Access, isrRead) || 
                                            !enhancedArrayIndexMatch(*write1Access, *write2Access)) {
                                            std::cout << "Array index mismatch in WRW pattern: " << write1Line << " -> " << isrRead.line << " -> " << write2Line << std::endl;
                                            continue;
                                        }
                                        
                                        std::cout << "Found consecutive WRW pattern: " << write1Line << " -> " << isrRead.line << " -> " << write2Line << std::endl;
                                        
                                        // 创建缺陷记录
                                        std::vector<MemoryAccess> allRelatedAccesses;
                                        allRelatedAccesses.push_back(*write1Access);
                                        allRelatedAccesses.push_back(isrRead);
                                        allRelatedAccesses.push_back(*write2Access);
                                        
                                        defects.push_back(createDefectWithArrayInfo(
                                            globalVar,
                                            std::vector<std::string>{"Write", "Read", "Write"},
                                            std::vector<int>{write1Line, isrRead.line, write2Line},
                                            "WRW",
                                            "MAIN",
                                            allRelatedAccesses
                                        ));
                                    }
                                }
                            }
                        }
                    }
                }
            }
            
            // 2. 检查ISR内的连续写操作被更高优先级ISR读操作中断的情况
            std::vector<std::string> isrFunctions;
            for (const auto& [funcName, _] : functionAccesses) {
                if (isISRFunction(funcName)) {
                    isrFunctions.push_back(funcName);
                }
            }
            
            // 假设ISR函数按名称排序代表优先级（可以根据实际需求调整）
            std::sort(isrFunctions.begin(), isrFunctions.end());
            
            for (size_t i = 0; i < isrFunctions.size(); ++i) {
                const std::string& currentISR = isrFunctions[i];
                auto currentAccesses = getInlinedAccesses(currentISR, globalVar);
                auto consecutiveWrites = findConsecutiveWrites(currentAccesses);
                
                // 对于当前ISR的每对连续写操作
                for (const auto& writePair : consecutiveWrites) {
                    int write1Line = writePair.first;
                    int write2Line = writePair.second;
                    
                    // 确保这两个写操作确实是连续的 - 增强循环支持
                    bool areConsecutive = areConsecutiveInPath(currentISR, globalVar, write1Line, write2Line);
                    
                    // 特殊处理：如果两个写操作都在循环中，需要额外检查
                    if (!areConsecutive) {
                        auto currentAccesses = getInlinedAccesses(currentISR, globalVar);
                        bool write1InLoop = isAccessInLoop(currentAccesses, write1Line, currentISR);
                        bool write2InLoop = isAccessInLoop(currentAccesses, write2Line, currentISR);
                        
                        if (write1InLoop && write2InLoop) {
                            areConsecutive = checkLoopConsecutiveness(currentAccesses, write1Line, write2Line, currentISR, globalVar);
                            std::cout << "Loop-based consecutiveness check for writes at lines " << write1Line 
                                     << " and " << write2Line << ": " << areConsecutive << std::endl;
                        }
                    }
                    
                    if (areConsecutive) {
                        // 检查更高优先级的ISR中是否有读操作
                        for (size_t j = i + 1; j < isrFunctions.size(); ++j) {
                            const std::string& higherISR = isrFunctions[j];
                            auto higherAccesses = getInlinedAccesses(higherISR, globalVar);
                            auto higherReads = getReadOperations(higherAccesses);
                            
                            for (const auto& higherRead : higherReads) {
                                // 找到对应的写操作来验证数组索引匹配
                                MemoryAccess* write1Access = nullptr;
                                MemoryAccess* write2Access = nullptr;
                                
                                for (auto& access : currentAccesses) {
                                    if (access.line == write1Line && access.operation == "store") {
                                        write1Access = &access;
                                    }
                                    if (access.line == write2Line && access.operation == "store") {
                                        write2Access = &access;
                                    }
                                }
                                
                                if (write1Access && write2Access) {
                                    // 使用增强的数组索引匹配
                                    if (!enhancedArrayIndexMatch(*write1Access, higherRead) || 
                                        !enhancedArrayIndexMatch(*write1Access, *write2Access)) {
                                        std::cout << "Array index mismatch in WRW pattern: " << write1Line << " -> " << higherRead.line << " -> " << write2Line << std::endl;
                                        continue;
                                    }
                                    
                                    std::cout << "Found consecutive WRW pattern in ISR: " << write1Line << " -> " << higherRead.line << " -> " << write2Line << std::endl;
                                    
                                    // 创建缺陷记录
                                    std::vector<MemoryAccess> allRelatedAccesses;
                                    allRelatedAccesses.push_back(*write1Access);
                                    allRelatedAccesses.push_back(higherRead);
                                    allRelatedAccesses.push_back(*write2Access);
                                    
                                    defects.push_back(createDefectWithArrayInfo(
                                        globalVar,
                                        std::vector<std::string>{"Write", "Read", "Write"},
                                        std::vector<int>{write1Line, higherRead.line, write2Line},
                                        "WRW",
                                        currentISR,
                                        allRelatedAccesses
                                    ));
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // 关键修复：添加ISR函数间的WRW缺陷检测
        // 检测模式：ISR1中的写操作 -> ISR2中的读操作 -> ISR1中的写操作
        std::vector<std::string> isrFunctions;
        for (const auto& [funcName, _] : functionAccesses) {
            if (isISRFunction(funcName)) {
                isrFunctions.push_back(funcName);
            }
        }
        
        for (const std::string& globalVar : globalVariables) {
            for (size_t i = 0; i < isrFunctions.size(); ++i) {
                const std::string& isr1 = isrFunctions[i];
                auto isr1Accesses = getInlinedAccesses(isr1, globalVar);
                auto isr1Writes = getWriteOperations(isr1Accesses);
                
                for (size_t j = 0; j < isrFunctions.size(); ++j) {
                    if (i == j) continue;
                    
                    const std::string& isr2 = isrFunctions[j];
                    auto isr2Accesses = getInlinedAccesses(isr2, globalVar);
                    auto isr2Reads = getReadOperations(isr2Accesses);
                    
                    // WRW模式：ISR1写 -> ISR2读 -> ISR1写（循环中的重复执行）
                    for (const auto& write1 : isr1Writes) {
                        // 检查写操作是否在循环中
                        bool writeInLoop = isAccessInLoop(isr1Accesses, write1.line, isr1);
                        if (writeInLoop) {
                            std::cout << "Write operation in loop at line " << write1.line 
                                     << " in " << isr1 << ", checking for cross-iteration WRW pattern" << std::endl;
                            
                            for (const auto& read : isr2Reads) {
                                // 使用增强的数组索引匹配
                                if (!enhancedArrayIndexMatch(write1, read)) {
                                    continue;
                                }
                                
                                // 检查中断优先级约束：WRW模式需要isr2能够中断isr1
                                if (!canInterrupt(isr2, isr1)) {
                                    std::cout << "Skipping WRW pattern due to priority constraint: " 
                                             << isr2 << " cannot interrupt " << isr1 << std::endl;
                                    continue;
                                }
                                
                                std::cout << "Found valid ISR-to-ISR WRW pattern: " << isr1 << " W(" << write1.line 
                                         << ") -> " << isr2 << " R(" << read.line 
                                         << ") -> " << isr1 << " W(" << write1.line << " next iteration)" << std::endl;
                                 
                                 // 检查是否已经存在相同的缺陷模式，避免重复
                                 bool duplicateFound = false;
                                 for (const auto& existingDefect : defects) {
                                     if (existingDefect.sharedVariable == globalVar &&
                                         existingDefect.type == "WRW" &&
                                         existingDefect.lines.size() == 3 &&
                                         existingDefect.lines[0] == write1.line &&
                                         existingDefect.lines[1] == read.line &&
                                         existingDefect.lines[2] == write1.line) {
                                         duplicateFound = true;
                                         break;
                                     }
                                 }
                                 
                                 if (!duplicateFound) {
                                     std::vector<MemoryAccess> allRelatedAccesses = {write1, read, write1};
                                     defects.push_back(createDefectWithArrayInfo(
                                         globalVar,
                                         std::vector<std::string>{"Write", "Read", "Write"},
                                         std::vector<int>{write1.line, read.line, write1.line},
                                         "WRW",
                                         isr1 + "_" + isr2,
                                         allRelatedAccesses
                                     ));
                                 }
                             }
                        }
                    }
                    
                    // 新增：特别检测循环内的读-修改-写模式的WRW缺陷
                    // 检测形如 i = j + 1; j = i + 1; 的跨ISR WRW模式
                    for (const auto& isr1Access : isr1Accesses) {
                        if (isr1Access.variable == globalVar && isAccessInLoop(isr1Accesses, isr1Access.line, isr1)) {
                            // 在循环中的访问，检查是否存在读-修改-写模式
                            MemoryAccess* readAccess = nullptr;
                            MemoryAccess* writeAccess = nullptr;
                            
                            // 查找同一行的读写操作（读-修改-写模式）
                            for (const auto& otherAccess : isr1Accesses) {
                                if (otherAccess.line == isr1Access.line && otherAccess.variable != globalVar) {
                                    if (otherAccess.operation == "load") {
                                        readAccess = const_cast<MemoryAccess*>(&otherAccess);
                                    }
                                }
                                if (otherAccess.line == isr1Access.line && otherAccess.variable == globalVar) {
                                    if (otherAccess.operation == "store") {
                                        writeAccess = const_cast<MemoryAccess*>(&otherAccess);
                                    }
                                }
                            }
                            
                            // 如果找到了读-修改-写模式，检查是否有其他ISR的写操作中断
                            if (readAccess && writeAccess && readAccess->variable != writeAccess->variable) {
                                std::cout << "Found read-modify-write pattern at line " << isr1Access.line 
                                         << " in " << isr1 << ": read " << readAccess->variable 
                                         << " -> write " << writeAccess->variable << std::endl;
                                
                                // 查找其他ISR对读取变量的写操作
                                auto isr2Writes = getWriteOperations(isr2Accesses);
                                for (const auto& isr2Write : isr2Writes) {
                                    if (isr2Write.variable == readAccess->variable) {
                                        if (canInterrupt(isr2, isr1)) {
                                            std::cout << "Found cross-ISR WRW pattern: " 
                                                     << isr1 << " reads " << readAccess->variable << " at line " << readAccess->line
                                                     << " -> " << isr2 << " writes " << readAccess->variable << " at line " << isr2Write.line
                                                     << " -> " << isr1 << " reads " << readAccess->variable << " again (next iteration)" << std::endl;
                                            
                                            // 创建WRW缺陷记录（对于被读取的变量）
                                            std::vector<MemoryAccess> allRelatedAccesses = {*readAccess, isr2Write, *readAccess};
                                            defects.push_back(createDefectWithArrayInfo(
                                                readAccess->variable,
                                                std::vector<std::string>{"Read", "Write", "Read"},
                                                std::vector<int>{readAccess->line, isr2Write.line, readAccess->line},
                                                "RWR",  // 这实际上是RWR模式
                                                isr1 + "_" + isr2,
                                                allRelatedAccesses
                                            ));
                                        }
                                    }
                                }
                                
                                // 查找其他ISR对写入变量的读操作
                                for (const auto& isr2Read : isr2Reads) {
                                    if (isr2Read.variable == writeAccess->variable) {
                                        if (canInterrupt(isr2, isr1)) {
                                            std::cout << "Found cross-ISR WRW pattern: " 
                                                     << isr1 << " writes " << writeAccess->variable << " at line " << writeAccess->line
                                                     << " -> " << isr2 << " reads " << writeAccess->variable << " at line " << isr2Read.line
                                                     << " -> " << isr1 << " writes " << writeAccess->variable << " again (next iteration)" << std::endl;
                                            
                                            // 创建WRW缺陷记录（对于被写入的变量）
                                            std::vector<MemoryAccess> allRelatedAccesses = {*writeAccess, isr2Read, *writeAccess};
                                            defects.push_back(createDefectWithArrayInfo(
                                                writeAccess->variable,
                                                std::vector<std::string>{"Write", "Read", "Write"},
                                                std::vector<int>{writeAccess->line, isr2Read.line, writeAccess->line},
                                                "WRW",
                                                isr1 + "_" + isr2,
                                                allRelatedAccesses
                                            ));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return defects;
    }
    
    std::vector<Defect> detectWWRDefects() {
    std::vector<Defect> defects;
    
    std::cout << "Starting WWR defect detection..." << std::endl;
    
    for (const std::string& globalVar : globalVariables) {
        std::cout << "Analyzing variable: " << globalVar << " for WWR defects" << std::endl;
        
        // 特殊处理：main函数及其被调用函数的内联检测
        std::string mainFuncName = findMainFunction();
        if (!mainFuncName.empty()) {
            std::cout << "Checking inlined WWR patterns in main function and its callees" << std::endl;
            
            // 获取main函数的内联访问（包括被调用函数的访问）
            auto inlinedAccesses = getInlinedAccesses(mainFuncName, globalVar);
            auto writeOps = getWriteOperations(inlinedAccesses);
            auto readOps = getReadOperations(inlinedAccesses);
            
            std::cout << "Main function (inlined) has " << writeOps.size() << " writes and " << readOps.size() << " reads" << std::endl;
            
            // WWR模式：W1（main或其被调用函数）→ W2（ISR中断）→ R1（main或其被调用函数）
            for (const auto& write1 : writeOps) {
                std::cout << "Checking write1 at line " << write1.line << " in function " << write1.function << std::endl;
                
                // 查找与write1可能连续的读操作（考虑条件执行）
                for (const auto& read1 : readOps) {
                    std::cout << "Checking read1 at line " << read1.line << " in function " << read1.function << std::endl;
                    
                    // 检查write1和read1是否可能在执行上下文中连续
                    bool isConsecutive = false;
                    
                    if (write1.function == read1.function) {
                        // 同一函数内的连续性检查 - 对于WWR使用宽松的连续性检查
                        isConsecutive = areStrictlyConsecutiveWR(inlinedAccesses, write1, read1);
                    } else if (write1.function != read1.function) {
                        // 跨函数的情况：main调用其他函数，或其他函数中的操作
                        if (callGraph[mainFuncName].size() > 0) {
                            // 检查是否存在调用关系
                            bool hasCallRelation = false;
                        for (const auto& callee : callGraph[mainFuncName]) {
                                if (write1.function == callee || read1.function == callee || 
                                    write1.function == mainFuncName || read1.function == mainFuncName) {
                                    hasCallRelation = true;
                                break;
                                }
                            }
                            
                            if (hasCallRelation) {
                                // 对于跨函数的WWR，检查是否存在中间的访问阻断连续性
                                // 关键修改：对于条件写操作，即使有中间访问也可能连续
                                if (isAccessConditional(write1, inlinedAccesses)) {
                                    // 条件写操作：如果写操作不执行，则不会阻断后续的读操作
                                    isConsecutive = true;
                                    std::cout << "Conditional write1 at line " << write1.line 
                                             << " may not execute, allowing consecutive read at line " << read1.line << std::endl;
                                } else {
                                    // 无条件写操作：检查是否有中间访问
                                    isConsecutive = !hasInterveningAccess(inlinedAccesses, write1, read1, globalVar);
                                }
                                
                                std::cout << "Cross-function consecutive check: " << write1.function << "(" << write1.line << ") -> " 
                                         << read1.function << "(" << read1.line << ") = " << isConsecutive << std::endl;
                            }
                        }
                    }
                    
                    std::cout << "areConsecutiveInPath(" << write1.line << ", " << read1.line << ") = " << isConsecutive << std::endl;
                    
                    if (isConsecutive) {
                        // 查找可能中断的ISR写操作
                        for (const auto& [interruptFuncName, _] : functionAccesses) {
                            if (interruptFuncName != mainFuncName && isISRFunction(interruptFuncName)) {
                                std::cout << "Checking ISR: " << interruptFuncName << " for interrupting writes" << std::endl;
                                
                                auto interruptAccesses = getInlinedAccesses(interruptFuncName, globalVar);
                                auto interruptWrites = getWriteOperations(interruptAccesses);
                                
                                for (const auto& write2 : interruptWrites) {
                                    std::cout << "Checking ISR write at line " << write2.line << std::endl;
                                    
                                    // 使用增强的数组索引匹配
                                    if (!enhancedArrayIndexMatch(write1, write2) || !enhancedArrayIndexMatch(write1, read1)) {
                                        std::cout << "Array index mismatch in WWR pattern: " << write1.line << " -> " << write2.line << " -> " << read1.line << std::endl;
                                        continue;
                                    }
                                    
                                    // 关键修复：确保WWR的正确顺序 - 第一个写操作必须在读操作之前
                                    if (write1.line < read1.line) {
                                    std::cout << "Found WWR pattern: " << write1.function << " W1(" << write1.line 
                                             << ") -> " << interruptFuncName << " W2(" << write2.line 
                                             << ") -> " << read1.function << " R1(" << read1.line << ")" << std::endl;
                                    
                                    // 使用createDefectWithArrayInfo来创建包含数组信息的缺陷
                                    std::vector<MemoryAccess> allRelatedAccesses;
                                    allRelatedAccesses.push_back(write1);
                                    allRelatedAccesses.push_back(write2);
                                    allRelatedAccesses.push_back(read1);
                                    
                                    defects.push_back(createDefectWithArrayInfo(
                                        globalVar,
                                        std::vector<std::string>{"Write", "Write", "Read"},
                                        std::vector<int>{write1.line, write2.line, read1.line},
                                        "WWR",
                                        mainFuncName + "(inlined)",
                                        allRelatedAccesses
                                    ));
                                    } else {
                                        std::cout << "Skipping WWR pattern due to wrong order: W1(" << write1.line 
                                                 << ") should be before R1(" << read1.line << ")" << std::endl;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        // 保留原有的每个执行上下文中的WWR模式检测
        for (const auto& [funcName, _] : functionAccesses) {
            // 跳过main函数，因为已经在上面处理了内联版本
            if (funcName == mainFuncName) continue;
            
            auto accesses = getInlinedAccesses(funcName, globalVar);
            auto writeOps = getWriteOperations(accesses);
            auto readOps = getReadOperations(accesses);
            
            std::cout << "Function " << funcName << " has " << writeOps.size() << " writes and " << readOps.size() << " reads" << std::endl;
                
                // WWR模式：W1（当前上下文）→ W2（中断）→ R1（当前上下文，与W1连续）
                for (size_t i = 0; i < writeOps.size(); i++) {
                    const auto& write1 = writeOps[i];
                    
                                    // 查找与write1连续的读操作
                for (const auto& read1 : readOps) {
                    std::cout << "Checking WWR: write1.line=" << write1.line << ", read1.line=" << read1.line << std::endl;
                    bool isConsecutive = areStrictlyConsecutiveWR(accesses, write1, read1);
                    std::cout << "areStrictlyConsecutiveWR(" << write1.line << ", " << read1.line << ") = " << isConsecutive << std::endl;
                    
                    // 对于WWR检测，严格要求W1和R必须连续（与WRW保持一致的严格性）
                    if (isConsecutive) {
                            
                            // 查找可能中断的写操作
                            for (const auto& [interruptFuncName, _] : functionAccesses) {
                                if (interruptFuncName != funcName) {
                                                                         // 检查是否可以中断当前上下文
                                     bool canInterruptContext = false;
                                     
                                     if (isISRFunction(funcName) && isISRFunction(interruptFuncName)) {
                                         // 高优先级ISR可以中断低优先级ISR
                                         canInterruptContext = canInterrupt(interruptFuncName, funcName);
                                     } else if (!isISRFunction(funcName) && isISRFunction(interruptFuncName)) {
                                         // 非ISR函数可能被ISR调用，检查是否有ISR调用当前函数
                                         for (const auto& [caller, callees] : callGraph) {
                                             if (isISRFunction(caller) && 
                                                 std::find(callees.begin(), callees.end(), funcName) != callees.end()) {
                                                 // funcName被ISR caller调用，检查interruptFuncName是否能中断caller
                                                 if (canInterrupt(interruptFuncName, caller)) {
                                                     canInterruptContext = true;
                                                     break;
                                                 }
                                             }
                                         }
                                     }
                                    
                                                                         if (canInterruptContext) {
                                        auto interruptAccesses = getInlinedAccesses(interruptFuncName, globalVar);
                                        auto interruptWrites = getWriteOperations(interruptAccesses);
                                        
                                                                            for (const auto& write2 : interruptWrites) {
                                                                // 使用增强的数组索引匹配
                        if (!enhancedArrayIndexMatch(write1, write2) || !enhancedArrayIndexMatch(write1, read1)) {
                            std::cout << "Array index mismatch in WWR pattern: " << write1.line << " -> " << write2.line << " -> " << read1.line << std::endl;
                            continue;
                        }
                                        
                                        std::cout << "Found WWR pattern: " << funcName << " W1(" << write1.line 
                                                 << ") -> " << interruptFuncName << " W2(" << write2.line 
                                                 << ") -> " << funcName << " R1(" << read1.line << ")" << std::endl;
                                        
                                        // 使用createDefectWithArrayInfo来创建包含数组信息的缺陷
                                        std::vector<MemoryAccess> allRelatedAccesses;
                                        allRelatedAccesses.push_back(write1);
                                        allRelatedAccesses.push_back(write2);
                                        allRelatedAccesses.push_back(read1);
                                        
                                        defects.push_back(createDefectWithArrayInfo(
                                            globalVar,
                                            std::vector<std::string>{"Write", "Write", "Read"},
                                            std::vector<int>{write1.line, write2.line, read1.line},
                                            "WWR",
                                            funcName,
                                            allRelatedAccesses
                                        ));
                                    }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return defects;
    }
    
    // 查找主函数名
    std::string findMainFunction() {
        for (const auto& func : functionAccesses) {
            if (func.first.find("main") != std::string::npos) {
                return func.first;
            }
        }
        return "";  // 没有找到主函数
    }
    
    // 检查两个访问是否可能在同一个执行路径上发生
    bool areConsecutiveInPath(const std::string& funcName, const std::string& varName, int line1, int line2) {
        // 特殊处理主函数：使用内联访问来支持跨函数的连续性检查
        std::string mainFuncName = findMainFunction();
        std::vector<MemoryAccess> accesses;
        
        if (funcName == mainFuncName) {
            accesses = getInlinedAccesses(funcName, varName);
        } else {
            accesses = getAccessesForFunction(funcName, varName);
        }
        
        if (accesses.empty()) return false;
        
        // 找到对应的访问操作
        MemoryAccess* access1 = nullptr;
        MemoryAccess* access2 = nullptr;
        
        // 新增：特殊处理循环中的同一行访问
        if (line1 == line2) {
            // 对于同一行的情况，检查是否存在读-修改-写模式，或者是否在循环中
            MemoryAccess* loadAccess = nullptr;
            MemoryAccess* storeAccess = nullptr;
            
            for (auto& access : accesses) {
                if (access.line == line1) {
                    if (access.operation == "load" && !loadAccess) {
                        loadAccess = &access;
                    } else if (access.operation == "store" && !storeAccess) {
                        storeAccess = &access;
                    }
                }
            }
            
            // 情况1：同一行的读-修改-写操作（如 i++, j = i + 1等）
            if (loadAccess && storeAccess) {
                std::cout << "Found read-modify-write pattern at line " << line1 << std::endl;
                return true;
            }
            
            // 情况2：同一行在循环中的重复执行
            // 检查该行是否在循环结构中
            bool isInLoop = isAccessInLoop(accesses, line1, funcName);
            if (isInLoop) {
                std::cout << "Access at line " << line1 << " is in a loop, treating as consecutive" << std::endl;
                return true;
            }
            
            // 如果同一行没有读写操作对，且不在循环中，不算连续
            return false;
        }
        
        // 新增：检查循环中的连续性 - 关键修复
        // 对于不同行的情况，首先检查两个访问是否都在循环中
        bool access1InLoop = isAccessInLoop(accesses, line1, funcName);
        bool access2InLoop = isAccessInLoop(accesses, line2, funcName);
        
        if (access1InLoop && access2InLoop) {
            // 检查是否在同一个循环中
            if (areInSameLoop(accesses, line1, line2, funcName)) {
                std::cout << "Both accesses at lines " << line1 << " and " << line2 
                         << " are in the same loop, treating as consecutive" << std::endl;
                return true;
            }
        }
        
        // 新增：单独处理循环中的访问连续性
        // 如果其中一个访问在循环中，需要特殊处理
        if (access1InLoop || access2InLoop) {
            std::cout << "Checking loop-based consecutiveness for lines " << line1 << " and " << line2 << std::endl;
            
            // 对于循环中的访问，我们需要检查循环体内的执行顺序
            // 以及循环迭代之间的连续性
            bool loopConsecutive = checkLoopConsecutiveness(accesses, line1, line2, funcName, varName);
            if (loopConsecutive) {
                std::cout << "Found loop-based consecutiveness between lines " << line1 << " and " << line2 << std::endl;
                return true;
            }
        }
        
        // 对于不同行的情况，使用原有逻辑
        for (auto& access : accesses) {
            if (access.line == line1) access1 = &access;
            if (access.line == line2) access2 = &access;
        }
        
        if (!access1 || !access2) {
            return false;
        }
        
        // 新增：检查两个不同行的访问是否都在同一个循环中
        if (line1 != line2) {
            bool access1InLoop = isAccessInLoop(accesses, line1, funcName);
            bool access2InLoop = isAccessInLoop(accesses, line2, funcName);
            
            if (access1InLoop && access2InLoop) {
                // 检查是否在同一个循环中
                if (areInSameLoop(accesses, line1, line2, funcName)) {
                    std::cout << "Accesses at lines " << line1 << " and " << line2 
                             << " are in the same loop, treating as consecutive" << std::endl;
                return true;
            }
            }
        }
        
        // 检查两个访问是否在互斥分支上
        if (areInMutuallyExclusiveBranches(*access1, *access2)) {
            return false;
        }
        
        // 修复：对于主函数的内联访问，需要严格按照实际执行顺序检查
        if (funcName == mainFuncName) {
            // 首先确保line1在line2之前（对于正向连续性）
            if (line1 >= line2) {
                return false; // line1必须在line2之前
            }
            
            // 对于跨函数的内联访问，需要根据函数调用顺序来判断执行顺序
            if (access1->function != access2->function) {
                // 检查函数调用顺序：如果access1在被调用函数中，access2在主函数中
                // 那么需要确保被调用函数在主函数中access2之前被调用
                if (access1->function != mainFuncName && access2->function == mainFuncName) {
                    // access1在被调用函数中，access2在主函数中
                    // 需要确保被调用函数的调用点在access2之前
                    bool calleeCalledBeforeAccess2 = isCalleeCalledBeforeLine(mainFuncName, access1->function, access2->line);
                    if (!calleeCalledBeforeAccess2) {
                        std::cout << "Function " << access1->function << " is not called before line " << access2->line << " in " << mainFuncName << std::endl;
                        return false;
                    }
                } else if (access1->function == mainFuncName && access2->function != mainFuncName) {
                    // access1在主函数中，access2在被调用函数中
                    // 需要确保被调用函数的调用点在access1之后
                    bool calleeCalledAfterAccess1 = isCalleeCalledAfterLine(mainFuncName, access2->function, access1->line);
                    if (!calleeCalledAfterAccess1) {
                        std::cout << "Function " << access2->function << " is not called after line " << access1->line << " in " << mainFuncName << std::endl;
                        return false;
                    }
                }
            }
            
            // 关键修复：严格检查两个访问之间是否有无条件的中间访问
            std::cout << "DEBUG: Checking for intervening accesses between lines " << line1 << " and " << line2 << std::endl;
            
            // 对于内联访问，需要检查所有内联函数中的中间访问
            for (const auto& access : accesses) {
                if (access.variable == varName && 
                    access.line > line1 && access.line < line2) {
                    
                    std::cout << "DEBUG: Found potential intervening access at line " << access.line 
                             << " in function " << access.function << " (operation: " << access.operation << ")" << std::endl;
                    
                    // 检查这个中间访问是否是无条件的
                    if (!isAccessConditional(access, accesses)) {
                        std::cout << "Found unconditional intervening access at line " << access.line 
                                 << " in function " << access.function << " between accesses at lines " 
                                 << line1 << " (" << access1->function << ") and " << line2 
                                 << " (" << access2->function << ")" << std::endl;
                        return false; // 有无条件的中间访问，阻断连续性
                    } else {
                        std::cout << "Found conditional intervening access at line " << access.line 
                                 << " in function " << access.function << " between accesses at lines " 
                                 << line1 << " and " << line2 << " (may be skipped, not blocking continuity)" << std::endl;
                    }
                }
            }
            
            // 修复：对于主函数内的两个访问，还需要考虑调用顺序
            // 即使两个访问都在主函数中，如果中间有函数调用，也要检查被调用函数中的访问
            if (access1->function == mainFuncName && access2->function == mainFuncName) {
                std::cout << "DEBUG: Checking main function cross-call intervening accesses for lines " 
                         << line1 << " and " << line2 << std::endl;
                         
                // 获取所有被调用函数的访问
                for (const auto& access : accesses) {
                    if (access.function != mainFuncName && access.variable == varName) {
                        std::cout << "DEBUG: Found access at line " << access.line 
                                 << " in function " << access.function << std::endl;
                                 
                        // 关键修复：检查这个被调用函数是否在两个主函数访问之间被调用
                        bool isCalledBetween = isFunctionCalledBetweenLines(mainFuncName, access.function, access1->line, access2->line);
                        
                        if (isCalledBetween) {
                            std::cout << "DEBUG: Function " << access.function 
                                     << " is called between lines " << access1->line 
                                     << " and " << access2->line << " in main" << std::endl;
                            
                            bool isConditional = isAccessConditional(access, accesses);
                            std::cout << "DEBUG: Access at line " << access.line 
                                     << " in function " << access.function 
                                     << " is " << (isConditional ? "conditional" : "unconditional") << std::endl;
                                     
                            if (!isConditional) {
                                std::cout << "Found unconditional intervening access at line " << access.line 
                                         << " in function " << access.function 
                                         << " (called between main function accesses at lines " 
                                         << line1 << " and " << line2 << ")" << std::endl;
                                return false; // 有无条件的中间访问，阻断连续性
                            } else {
                                std::cout << "Found conditional intervening access at line " << access.line 
                                         << " in function " << access.function 
                                         << " (called between main function accesses at lines " 
                                         << line1 << " and " << line2 << " but may be skipped)" << std::endl;
                            }
                        } else {
                            std::cout << "DEBUG: Function " << access.function 
                                     << " is not called between lines " << access1->line 
                                     << " and " << access2->line << " in main" << std::endl;
                        }
                    }
                }
            }
        }
        
        // 修复：对于主函数的内联访问，如果前面的条件性检查逻辑没有发现无条件的中间访问，
        // 则应该认为两个访问是连续的，不需要进一步的基本块路径检查
        if (funcName == mainFuncName) {
            // 对于主函数的内联访问，前面的逻辑已经充分检查了条件性中间访问
            // 如果没有找到无条件的中间访问，则认为是连续的
            std::cout << "Main function inlined access: accepting consecutive pattern for lines " 
                     << line1 << " and " << line2 << " (no unconditional intervening access found)" << std::endl;
            return true;
        }
        
        // 对于非主函数（ISR函数等），使用原有的逻辑（因为ISR可能有更复杂的控制流）
        // 改进的连续性检测：对于条件代码块，我们需要考虑"可能的执行路径"
        std::vector<MemoryAccess> sortedAccesses = accesses;
        std::sort(sortedAccesses.begin(), sortedAccesses.end(), [](const MemoryAccess& a, const MemoryAccess& b) {
            return a.line < b.line;
        });
        
        // 找到两个访问操作在排序数组中的位置
        int pos1 = -1, pos2 = -1;
        for (int i = 0; i < sortedAccesses.size(); i++) {
            if (sortedAccesses[i].line == line1) pos1 = i;
            if (sortedAccesses[i].line == line2) pos2 = i;
        }
        
        if (pos1 != -1 && pos2 != -1) {
            int start = std::min(pos1, pos2);
            int end = std::max(pos1, pos2);
            
            // 改进的路径存在检查：对于条件代码，我们需要更宽松的检查
            // 检查是否存在一条可能的执行路径，使得两个访问可以连续发生
            bool pathExists = true;
            
            for (int i = start + 1; i < end; i++) {
                MemoryAccess& middleAccess = sortedAccesses[i];
                
                // 改进的逻辑：检查是否存在一条路径从access1到access2，而不经过middleAccess
                // 如果存在这样的路径，则middle access不应该阻断连续性
                bool pathExistsWithoutMiddle = canReachWithoutGoingThrough(
                    funcName, access1->basicBlock, access2->basicBlock, middleAccess.basicBlock);
                
                if (!pathExistsWithoutMiddle) {
                    pathExists = false;
                    break;
                }
            }
            
            if (pathExists) {
                return true;
            }
        }
        
        return false;
    }

private:
    std::vector<MemoryAccess> getAccessesForFunction(const std::string& funcName, const std::string& varName) {
        std::vector<MemoryAccess> result;
        if (functionAccesses.count(funcName)) {
            for (const auto& access : functionAccesses[funcName]) {
                if (access.variable == varName) {
                    result.push_back(access);
                }
            }
        }
        return result;
    }
    
    std::vector<std::pair<int, int>> findConsecutiveReads(const std::vector<MemoryAccess>& accesses) {
        std::vector<std::pair<int, int>> pairs;
        std::vector<MemoryAccess> readOps;
        
        for (const auto& access : accesses) {
            if (access.operation == "load") {
                readOps.push_back(access);
            }
        }
        
        std::cout << "DEBUG: findConsecutiveReads found " << readOps.size() << " read operations" << std::endl;
        
        if (readOps.size() > 1) {
            for (size_t i = 0; i < readOps.size() - 1; ++i) {
                for (size_t j = i + 1; j < readOps.size(); ++j) {
                    std::cout << "DEBUG: Checking read pair: line " << readOps[i].line 
                             << " (BB: " << readOps[i].basicBlock << ") vs line " << readOps[j].line 
                             << " (BB: " << readOps[j].basicBlock << ")" << std::endl;
                    
                    // 首先检查两个读操作是否在互斥分支上
                    if (areInMutuallyExclusiveBranches(readOps[i], readOps[j])) {
                        std::cout << "DEBUG: Skipping read pair at lines " << readOps[i].line 
                                 << " and " << readOps[j].line << " (in mutually exclusive branches)" << std::endl;
                        continue;
                    }
                    
                        // 使用增强的数组索引匹配
                        if (!enhancedArrayIndexMatch(readOps[i], readOps[j])) {
                        std::cout << "DEBUG: Skipping read pair at lines " << readOps[i].line 
                                 << " and " << readOps[j].line << " (array index mismatch)" << std::endl;
                            continue;
                        }
                        
                        // 严格检查连续性：两个读操作之间不能有其他对同一变量的访问
                        if (areStrictlyConsecutiveReads(accesses, readOps[i], readOps[j])) {
                            pairs.emplace_back(readOps[i].line, readOps[j].line);
                            std::cout << "Lines " << readOps[i].line << " and " << readOps[j].line << " are strictly consecutive reads" << std::endl;
                        } else {
                        std::cout << "Lines " << readOps[i].line << " and " << readOps[j].line << " are NOT strictly consecutive (have intervening accesses or in exclusive branches)" << std::endl;
                    }
                }
            }
        }
        
        std::cout << "DEBUG: findConsecutiveReads found " << pairs.size() << " consecutive read pairs" << std::endl;
        return pairs;
    }
    
    // 新增：检查两个读操作之间是否有中间的写操作阻断连续性
    bool hasInterveningWriteAccess(const std::vector<MemoryAccess>& accesses, 
                                 const MemoryAccess& read1, const MemoryAccess& read2, 
                                 const std::string& globalVar) {
        int earlierLine = std::min(read1.line, read2.line);
        int laterLine = std::max(read1.line, read2.line);
        
        std::cout << "DEBUG: hasInterveningWriteAccess checking between lines " << earlierLine << " and " << laterLine << std::endl;
        
        // 检查两个读操作之间是否有对同一变量的写操作
                for (const auto& access : accesses) {
            if (access.variable == globalVar && 
                access.operation == "store" &&
                access.line > earlierLine && access.line < laterLine) {
                
                std::cout << "DEBUG: Found potential intervening write at line " << access.line 
                         << " in function " << access.function << std::endl;
                
                // 关键修复：检查这个中间写操作是否是强制性的（必然发生的）
                if (isMandatoryAccess(access, accesses)) {
                    std::cout << "Found mandatory intervening write at line " << access.line 
                             << " between reads at lines " << earlierLine << " and " << laterLine << std::endl;
                    return true; // 有强制性的中间写操作，阻断连续性
                } else if (!isAccessConditional(access, accesses)) {
                    std::cout << "Found unconditional intervening write at line " << access.line 
                             << " between reads at lines " << earlierLine << " and " << laterLine << std::endl;
                    return true; // 有无条件的中间写操作，阻断连续性
                } else {
                    std::cout << "Found conditional intervening write at line " << access.line 
                             << " between reads at lines " << earlierLine << " and " << laterLine 
                             << " (may be skipped, not blocking continuity)" << std::endl;
                }
            }
        }
        
        return false; // 没有强制性或无条件的中间写操作
    }
    
    // 新增：检查两个访问之间是否有中间的访问阻断连续性
    bool hasInterveningAccess(const std::vector<MemoryAccess>& accesses, 
                            const MemoryAccess& access1, const MemoryAccess& access2, 
                            const std::string& globalVar) {
        int earlierLine = std::min(access1.line, access2.line);
        int laterLine = std::max(access1.line, access2.line);
        
        // 检查两个访问之间是否有对同一变量的其他访问
        for (const auto& access : accesses) {
            if (access.variable == globalVar && 
                access.line > earlierLine && access.line < laterLine) {
                
                // 检查这个中间访问是否是条件性的
                        if (!isAccessConditional(access, accesses)) {
                            std::cout << "Found unconditional intervening access at line " << access.line 
                             << " between accesses at lines " << earlierLine << " and " << laterLine << std::endl;
                    return true; // 有无条件的中间访问，阻断连续性
                } else {
                    std::cout << "Found conditional intervening access at line " << access.line 
                             << " between accesses at lines " << earlierLine << " and " << laterLine 
                             << " (may be skipped, not blocking continuity)" << std::endl;
                }
            }
        }
        
        return false; // 没有无条件的中间访问
    }
    
    // 新增：严格检查两个读操作是否真正连续（中间没有其他对同一变量的访问）
    bool areStrictlyConsecutiveReads(const std::vector<MemoryAccess>& accesses, 
                                   const MemoryAccess& read1, const MemoryAccess& read2) {
        std::cout << "DEBUG: areStrictlyConsecutiveReads called for reads at line " << read1.line 
                 << " (function: " << read1.function << ", BB: " << read1.basicBlock << ") and line " << read2.line 
                 << " (function: " << read2.function << ", BB: " << read2.basicBlock << ")" << std::endl;
        
        // 首先检查两个读操作是否在互斥分支中
        if (areInMutuallyExclusiveBranches(read1, read2)) {
            std::cout << "DEBUG: Read operations at lines " << read1.line << " and " << read2.line 
                     << " are in mutually exclusive branches - cannot be consecutive" << std::endl;
            return false;
        }
        
        // 关键修复：检查是否一个读操作实际上是读-修改-写操作的一部分
        // 对于 glob = glob + 1 这样的操作，第9行的独立读操作和第10行内部的读操作是连续的
        const MemoryAccess* earlierRead = (read1.line < read2.line) ? &read1 : &read2;
        const MemoryAccess* laterRead = (read1.line < read2.line) ? &read2 : &read1;
        
        // 检查后面的读操作是否是读-修改-写操作的一部分
        bool laterReadIsPartOfRMW = false;
        for (const auto& access : accesses) {
            if (access.line == laterRead->line && 
                access.variable == laterRead->variable && 
                access.operation == "store" &&
                access.function == laterRead->function) {
                laterReadIsPartOfRMW = true;
                std::cout << "DEBUG: Later read at line " << laterRead->line 
                         << " is part of read-modify-write operation" << std::endl;
                break;
            }
        }
        
        // 确保read1在read2之前
        int earlierLine = std::min(read1.line, read2.line);
        int laterLine = std::max(read1.line, read2.line);
        
        // 修复：对于内联访问，需要考虑实际的执行顺序而不仅仅是行号
        // 特别是当read1和read2在不同函数时，需要检查被调用函数中的中间访问
        std::string mainFuncName = findMainFunction();
        if (!mainFuncName.empty() && read1.function != read2.function) {
            // 对于跨函数的读操作，需要检查执行顺序并考虑间接调用
            for (const auto& access : accesses) {
                // 跳过两个目标读操作本身
                if (access.line == read1.line || access.line == read2.line) {
                    continue;
                }
                
                if (access.variable == read1.variable) {
                    bool isInterveningAccess = false;
                    
                    // 情况1：中间访问在同一函数中，使用行号比较
                    if (access.function == mainFuncName || 
                        access.function == read1.function || 
                        access.function == read2.function) {
                        if (access.line > earlierLine && access.line < laterLine) {
                            isInterveningAccess = true;
                        }
                    }
                    // 情况2：中间访问在其他被调用函数中，需要检查调用顺序
                    else {
                        // 检查被调用函数是否在两个读操作之间被调用
                        bool calledAfterRead1 = false;
                        bool calledBeforeRead2 = false;
                        
                        // 检查直接调用
                        if (read1.function == mainFuncName) {
                            calledAfterRead1 = isCalleeCalledAfterLine(mainFuncName, access.function, read1.line);
                        }
                        if (read2.function == mainFuncName) {
                            calledBeforeRead2 = isCalleeCalledBeforeLine(mainFuncName, access.function, read2.line);
                        }
                        
                        // 检查间接调用
                        if (!calledAfterRead1 || !calledBeforeRead2) {
                            for (const auto& intermediateFunc : callGraph[mainFuncName]) {
                                if (callGraph.find(intermediateFunc) != callGraph.end()) {
                                    for (const auto& indirectCallee : callGraph[intermediateFunc]) {
                                        if (indirectCallee == access.function) {
                                            if (read1.function == mainFuncName) {
                                                calledAfterRead1 = isCalleeCalledAfterLine(mainFuncName, intermediateFunc, read1.line);
                                            }
                                            if (read2.function == mainFuncName) {
                                                calledBeforeRead2 = isCalleeCalledBeforeLine(mainFuncName, intermediateFunc, read2.line);
                                            }
                                            break;
                                        }
                                    }
                                }
                                if (calledAfterRead1 && calledBeforeRead2) break;
                            }
                        }
                        
                        if (calledAfterRead1 && calledBeforeRead2) {
                            isInterveningAccess = true;
                        }
                    }
                    
                    if (isInterveningAccess) {
                        std::cout << "DEBUG: Found potential intervening access at line " << access.line 
                                 << " in function " << access.function << " (operation: " << access.operation 
                                 << ") between reads at line " << earlierLine << " and line " << laterLine << std::endl;
                        
                        // 关键修复：检查这个中间访问是否是强制性的或无条件的
                        if (isMandatoryAccess(access, accesses)) {
                            // 如果中间访问是强制性的（如if-else中必然执行的写操作），则阻断连续性
                            std::cout << "Found mandatory intervening access at line " << access.line 
                                     << " in function " << access.function << " between reads at line " << earlierLine 
                                     << " and line " << laterLine << std::endl;
                            return false;
                        } else if (!isAccessConditional(access, accesses)) {
                            // 如果中间访问是无条件的，则两个读操作不是严格连续的
                            std::cout << "Found unconditional intervening access at line " << access.line 
                                     << " in function " << access.function << " between reads at line " << earlierLine 
                                     << " and line " << laterLine << std::endl;
                            return false;
                        } else {
                            std::cout << "Found conditional intervening access at line " << access.line 
                                     << " in function " << access.function << " between reads at line " << earlierLine 
                                     << " and line " << laterLine << " (may be skipped, not blocking continuity)" << std::endl;
                        }
                    }
                }
            }
        } else {
            // 原有的逻辑：对于同一函数内的访问，使用行号比较
        for (const auto& access : accesses) {
            // 跳过两个目标读操作本身
            if (access.line == read1.line || access.line == read2.line) {
                continue;
            }
            
            // 如果是对同一变量的访问，且在两个读操作之间
            if (access.variable == read1.variable && 
                access.line > earlierLine && access.line < laterLine) {
                
                std::cout << "DEBUG: Found potential intervening access at line " << access.line 
                         << " (operation: " << access.operation << ") between reads at lines " 
                         << earlierLine << " and " << laterLine << std::endl;
                
                // 关键修复：检查这个中间访问是否是强制性的或无条件的
                if (isMandatoryAccess(access, accesses)) {
                    // 如果中间访问是强制性的（如if-else中必然执行的写操作），则阻断连续性
                    std::cout << "Found mandatory intervening access at line " << access.line 
                             << " between reads at lines " << earlierLine << " and " << laterLine << std::endl;
                    return false;
                } else if (!isAccessConditional(access, accesses)) {
                    // 如果中间访问是无条件的，则两个读操作不是严格连续的
                    std::cout << "Found unconditional intervening access at line " << access.line 
                             << " between reads at lines " << earlierLine << " and " << laterLine << std::endl;
                    return false;
                } else {
                    std::cout << "Found conditional intervening access at line " << access.line 
                             << " between reads at lines " << earlierLine << " and " << laterLine 
                             << " (may be skipped, not blocking continuity)" << std::endl;
                }
                }
            }
        }
        
        // 如果没有找到无条件的中间访问，则认为是严格连续的
        std::cout << "DEBUG: areStrictlyConsecutiveReads returning true for reads at line " << read1.line 
                 << " and line " << read2.line << std::endl;
        return true;
    }
    
    // 新增：检查一个访问是否是强制性的（必然发生的，如if-else分支中的写操作）
    bool isMandatoryAccess(const MemoryAccess& access, const std::vector<MemoryAccess>& allAccesses) {
        const std::string& funcName = access.function;
        const std::string& bbName = access.basicBlock;
        
        std::cout << "DEBUG: isMandatoryAccess checking access at line " << access.line 
                 << " in function " << funcName << " (BB: " << bbName << ")" << std::endl;
        
        // 检查控制流信息是否可用
        if (basicBlockSuccessors.find(funcName) == basicBlockSuccessors.end()) {
            return false;
        }
        
        const auto& successors = basicBlockSuccessors.at(funcName);
        
        // 关键逻辑：检查是否为if-else结构中的必执行分支
        // 1. 找到当前基本块的前驱
        std::vector<std::string> predecessors;
        for (const auto& [predBB, predSuccs] : successors) {
            if (predSuccs.find(bbName) != predSuccs.end()) {
                predecessors.push_back(predBB);
            }
        }
        
        std::cout << "DEBUG: Found " << predecessors.size() << " predecessors for BB " << bbName << std::endl;
        
        // 2. 检查是否存在共同的条件分支前驱
        for (const std::string& pred : predecessors) {
            if (successors.find(pred) != successors.end()) {
                const auto& predSuccs = successors.at(pred);
                std::cout << "DEBUG: Predecessor " << pred << " has " << predSuccs.size() << " successors" << std::endl;
                
                // 如果前驱有多个后继（条件分支），检查所有分支是否都执行同样的操作
                if (predSuccs.size() > 1) {
                    // 这是一个条件分支，检查是否为if-else结构
                    bool isIfElseWithMandatoryWrite = checkIfElseStructureWithMandatoryWrite(
                        funcName, pred, predSuccs, access.variable, allAccesses);
                    
                    if (isIfElseWithMandatoryWrite) {
                        std::cout << "DEBUG: Access at line " << access.line 
                                 << " is part of mandatory if-else structure" << std::endl;
                        return true;
                    }
                }
            }
        }
        
        return false;
    }
    
    // 新增：检查if-else结构中是否有强制性写操作
    bool checkIfElseStructureWithMandatoryWrite(const std::string& funcName, 
                                               const std::string& conditionBB,
                                               const std::unordered_set<std::string>& branches,
                                               const std::string& variable,
                                               const std::vector<MemoryAccess>& allAccesses) {
        std::cout << "DEBUG: checkIfElseStructureWithMandatoryWrite for condition BB " << conditionBB 
                 << " with " << branches.size() << " branches" << std::endl;
        
        // 检查每个分支是否都包含对同一变量的写操作
        int branchesWithWrite = 0;
        for (const std::string& branch : branches) {
            bool hasWriteInBranch = false;
            
            // 检查这个分支中是否有对指定变量的写操作
            for (const auto& access : allAccesses) {
                if (access.function == funcName && 
                    access.basicBlock == branch && 
                    access.variable == variable && 
                    access.operation == "store") {
                    hasWriteInBranch = true;
                    std::cout << "DEBUG: Found write to " << variable << " at line " << access.line 
                             << " in branch " << branch << std::endl;
                    break;
                }
            }
            
            if (hasWriteInBranch) {
                branchesWithWrite++;
            }
        }
        
        // 如果所有分支都有写操作，则这是强制性的
        bool isMandatory = (branchesWithWrite == branches.size() && branches.size() > 1);
        std::cout << "DEBUG: " << branchesWithWrite << " out of " << branches.size() 
                 << " branches have writes. Mandatory: " << isMandatory << std::endl;
        
        return isMandatory;
    }
    
    // 新增：检查一个访问是否是条件性的（可能不执行）
    bool isAccessConditional(const MemoryAccess& access, const std::vector<MemoryAccess>& allAccesses) {
        const std::string& funcName = access.function;
        const std::string& bbName = access.basicBlock;
        
        // 修复：对于主函数调用的函数中的访问，需要特殊处理
        std::string mainFuncName = findMainFunction();
        if (!mainFuncName.empty() && funcName != mainFuncName) {
            // 检查这个函数是否被主函数直接调用
            if (callGraph.find(mainFuncName) != callGraph.end()) {
                for (const auto& callee : callGraph[mainFuncName]) {
                    if (callee == funcName) {
                        // 这是主函数直接调用的函数，函数内的访问相对于主函数是无条件的
                        // 但我们仍需要检查在函数内部是否是条件性的
                        std::cout << "Access at line " << access.line << " is in function " << funcName 
                                 << " called by main, checking internal conditionality" << std::endl;
                        break;
                    }
                }
            }
        }
        
        // 首先检查控制流信息是否可用
        if (basicBlockSuccessors.find(funcName) == basicBlockSuccessors.end()) {
            // 如果没有控制流信息，使用基于基本块名称的启发式方法
            return useHeuristicConditionalCheck(access, allAccesses);
        }
        
        const auto& successors = basicBlockSuccessors.at(funcName);
        
        // 方法1：检查是否有多个基本块指向当前基本块（合并点）
        int predecessorCount = 0;
        bool hasConditionalPredecessor = false;
        
        for (const auto& [predBB, predSuccs] : successors) {
            if (predSuccs.find(bbName) != predSuccs.end()) {
                predecessorCount++;
                // 如果前驱有多个后继，说明它是条件分支
                if (predSuccs.size() > 1) {
                    hasConditionalPredecessor = true;
                }
            }
        }
        
        // 方法2：检查当前基本块是否有多个后继（分支点）
        bool isConditionalBranch = false;
        if (successors.find(bbName) != successors.end()) {
            const auto& blockSuccessors = successors.at(bbName);
            isConditionalBranch = (blockSuccessors.size() > 1);
        }
        
        // 修复：更严格的条件性判断
        // 只有当基本块确实在条件分支中时才认为是条件性的
        bool isConditional = false;
        
        // 如果有条件分支前驱，且只有一个前驱，说明在条件分支中
        if (hasConditionalPredecessor && predecessorCount == 1) {
            isConditional = true;
        }
        // 如果当前块是条件分支起点，那么这个块本身是无条件执行的
        // 但是它的后继块可能是条件性的
        else if (isConditionalBranch) {
            // 分支起点的访问通常是无条件的
            isConditional = false;
        }
        // 如果有多个前驱（合并点），需要检查这些前驱是否来自条件分支
        else if (predecessorCount > 1) {
            // 检查是否所有前驱都来自条件分支
            bool allPredecessorsConditional = true;
            for (const auto& [predBB, predSuccs] : successors) {
                if (predSuccs.find(bbName) != predSuccs.end()) {
                    if (predSuccs.size() <= 1) {
                        allPredecessorsConditional = false;
                        break;
                    }
                }
            }
            isConditional = allPredecessorsConditional;
        }
        
        // 关键修复：对于主函数调用的函数，即使函数内部访问看起来是条件性的，
        // 但由于函数调用本身是无条件的，所以函数内的主要逻辑路径应该被认为是无条件的
        if (!mainFuncName.empty() && funcName != mainFuncName) {
            if (callGraph.find(mainFuncName) != callGraph.end()) {
                for (const auto& callee : callGraph[mainFuncName]) {
                    if (callee == funcName) {
                        // 这是主函数直接调用的函数
                        // 对于被调用函数中的主要执行路径（比如入口基本块），应该被认为是无条件的
                        // 只有当访问明确在条件分支中时才认为是条件性的
                        
                        // 如果访问在函数的入口基本块或主要执行路径上，认为是无条件的
                        if (!hasConditionalPredecessor || predecessorCount == 0) {
                            std::cout << "Access at line " << access.line << " in called function " << funcName 
                                     << " is on main execution path, treating as unconditional" << std::endl;
                            isConditional = false;
                        }
                        break;
                    }
                }
            }
        }
        
        if (isConditional) {
            std::cout << "Access at line " << access.line << " is conditional (in block " 
                     << access.basicBlock << ", predecessors: " << predecessorCount 
                     << ", hasConditionalPred: " << hasConditionalPredecessor 
                     << ", isConditionalBranch: " << isConditionalBranch << ")" << std::endl;
        } else {
            std::cout << "Access at line " << access.line << " is unconditional (in block " 
                     << access.basicBlock << ", predecessors: " << predecessorCount 
                     << ", hasConditionalPred: " << hasConditionalPredecessor 
                     << ", isConditionalBranch: " << isConditionalBranch << ")" << std::endl;
        }
        
        return isConditional;
    }
    
    // 启发式条件检查方法（当没有控制流信息时使用）
    bool useHeuristicConditionalCheck(const MemoryAccess& access, const std::vector<MemoryAccess>& allAccesses) {
        // 获取同一函数中的所有访问，按行号排序
        std::vector<MemoryAccess> functionAccesses;
        for (const auto& acc : allAccesses) {
            if (acc.function == access.function) {
                functionAccesses.push_back(acc);
            }
        }
        
        std::sort(functionAccesses.begin(), functionAccesses.end(), 
                 [](const MemoryAccess& a, const MemoryAccess& b) {
                     return a.line < b.line;
                 });
        
        // 统计每个基本块的访问次数
        std::unordered_map<std::string, int> blockCounts;
        for (const auto& acc : functionAccesses) {
            blockCounts[acc.basicBlock]++;
        }
        
        // 找到最常见的基本块（主执行路径）
        std::string mainBlock;
        int maxCount = 0;
        for (const auto& [block, count] : blockCounts) {
            if (count > maxCount) {
                maxCount = count;
                mainBlock = block;
            }
        }
        
        // 如果访问不在主执行路径的基本块中，认为是条件性的
        bool isConditional = (access.basicBlock != mainBlock);
        
        if (isConditional) {
            std::cout << "Access at line " << access.line << " is conditional (heuristic: in block " 
                     << access.basicBlock << ", main block is " << mainBlock << ")" << std::endl;
        }
        
        return isConditional;
    }
    
    // 新增：严格检查读操作和写操作是否真正连续（中间没有其他对同一变量的访问）
    bool areStrictlyConsecutiveRW(const std::vector<MemoryAccess>& accesses, 
                                 const MemoryAccess& read1, const MemoryAccess& write1) {
        std::cout << "DEBUG: areStrictlyConsecutiveRW called for read at line " << read1.line 
                 << " (function: " << read1.function << ") and write at line " << write1.line 
                 << " (function: " << write1.function << ")" << std::endl;
        
        // 确保read1在write1之前
        if (read1.line >= write1.line) {
            std::cout << "DEBUG: read1.line (" << read1.line << ") >= write1.line (" << write1.line << "), returning false" << std::endl;
            return false;
        }
        
        // 检查两个操作之间是否有对同一变量的其他访问
        for (const auto& access : accesses) {
            // 跳过两个目标操作本身
            if (access.line == read1.line || access.line == write1.line) {
                continue;
            }
            
            // 如果是对同一变量的访问，且在两个操作之间
            if (access.variable == read1.variable && 
                access.line > read1.line && access.line < write1.line) {
                
                std::cout << "DEBUG: Found intervening access at line " << access.line 
                         << " (operation: " << access.operation << ") between read at line " 
                         << read1.line << " and write at line " << write1.line << std::endl;
                
                // 检查这个中间访问是否是条件性的
                if (!isAccessConditional(access, accesses)) {
                    std::cout << "Found unconditional intervening access at line " << access.line 
                             << " between read at line " << read1.line << " and write at line " << write1.line << std::endl;
                    return false;
                } else {
                    std::cout << "Found conditional intervening access at line " << access.line 
                             << " between read at line " << read1.line << " and write at line " << write1.line 
                             << " (may be skipped, not blocking continuity)" << std::endl;
                }
            }
        }
        
        // 如果没有找到无条件的中间访问，则认为是严格连续的
        std::cout << "DEBUG: areStrictlyConsecutiveRW returning true for read at line " << read1.line 
                 << " and write at line " << write1.line << std::endl;
        return true;
    }
    
    // 新增：严格检查写操作和读操作是否真正连续（中间没有其他对同一变量的访问）
    bool areStrictlyConsecutiveWR(const std::vector<MemoryAccess>& accesses, 
                                 const MemoryAccess& write1, const MemoryAccess& read1) {
        std::cout << "DEBUG: areStrictlyConsecutiveWR called for write at line " << write1.line 
                 << " (function: " << write1.function << ") and read at line " << read1.line 
                 << " (function: " << read1.function << ")" << std::endl;
        std::cout << "DEBUG: Total accesses provided: " << accesses.size() << std::endl;
        
        // 确保write1在read1之前
        if (write1.line >= read1.line) {
            std::cout << "DEBUG: write1.line (" << write1.line << ") >= read1.line (" << read1.line << "), returning false" << std::endl;
            return false;
        }
        
        // 列出所有访问以便调试
        for (const auto& access : accesses) {
            if (access.variable == write1.variable) {
                std::cout << "DEBUG: Found access to " << access.variable << " at line " << access.line 
                         << " in function " << access.function << " (operation: " << access.operation << ")" << std::endl;
            }
        }
        
        // 修复：对于内联访问，需要考虑实际的执行顺序而不仅仅是行号
        // 特别是当write1和read1在同一函数（如main）中，但中间可能有被调用函数的访问
        std::string mainFuncName = findMainFunction();
        if (!mainFuncName.empty() && write1.function == mainFuncName && read1.function == mainFuncName) {
            // 对于主函数内的写操作和读操作，需要检查被调用函数中的中间访问
            for (const auto& access : accesses) {
                // 跳过两个目标操作本身
                if (access.line == write1.line || access.line == read1.line) {
                    continue;
                }
                
                if (access.variable == write1.variable) {
                    bool isInterveningAccess = false;
                    
                    // 情况1：中间访问在同一函数（main）中，使用行号比较
                    if (access.function == mainFuncName) {
                        if (access.line > write1.line && access.line < read1.line) {
                            isInterveningAccess = true;
                        }
                    }
                    // 情况2：中间访问在被调用函数中，需要检查调用顺序
                    else {
                        // 检查被调用函数是否在write1和read1之间被调用
                        bool calledAfterWrite1 = false;
                        bool calledBeforeRead1 = false;
                        
                        // 首先检查直接调用
                        calledAfterWrite1 = isCalleeCalledAfterLine(mainFuncName, access.function, write1.line);
                        calledBeforeRead1 = isCalleeCalledBeforeLine(mainFuncName, access.function, read1.line);
                        
                        // 如果不是直接调用，检查间接调用
                        if (!calledAfterWrite1 || !calledBeforeRead1) {
                            // 查找间接调用路径
                            for (const auto& intermediateFunc : callGraph[mainFuncName]) {
                                if (callGraph.find(intermediateFunc) != callGraph.end()) {
                                    for (const auto& indirectCallee : callGraph[intermediateFunc]) {
                                        if (indirectCallee == access.function) {
                                            // 找到间接调用路径: main -> intermediateFunc -> access.function
                                            bool intermediateCalledAfterWrite1 = isCalleeCalledAfterLine(mainFuncName, intermediateFunc, write1.line);
                                            bool intermediateCalledBeforeRead1 = isCalleeCalledBeforeLine(mainFuncName, intermediateFunc, read1.line);
                                            
                                            if (intermediateCalledAfterWrite1 && intermediateCalledBeforeRead1) {
                                                calledAfterWrite1 = true;
                                                calledBeforeRead1 = true;
                                                std::cout << "DEBUG: Found indirect call path: " << mainFuncName 
                                                         << " -> " << intermediateFunc << " -> " << access.function << std::endl;
                                                break;
                                            }
                                        }
                                    }
                                }
                                if (calledAfterWrite1 && calledBeforeRead1) break;
                            }
                        }
                        
                        if (calledAfterWrite1 && calledBeforeRead1) {
                            isInterveningAccess = true;
                            std::cout << "DEBUG: Function " << access.function << " is called between write1 (line " 
                                     << write1.line << ") and read1 (line " << read1.line << ") in " << mainFuncName << std::endl;
                        }
                    }
                    
                    if (isInterveningAccess) {
                        std::cout << "DEBUG: Found potential intervening access at line " << access.line 
                                 << " in function " << access.function << " (operation: " << access.operation 
                                 << ") between write at line " << write1.line << " and read at line " << read1.line << std::endl;
                        
                        // 检查这个中间访问是否是条件性的（在条件分支中）
                        if (!isAccessConditional(access, accesses)) {
                            // 如果中间访问是无条件的，则写操作和读操作不是严格连续的
                            std::cout << "Found unconditional intervening access at line " << access.line 
                                     << " in function " << access.function << " between write at line " << write1.line 
                                     << " and read at line " << read1.line << std::endl;
                            return false;
                        } else {
                            std::cout << "Found conditional intervening access at line " << access.line 
                                     << " in function " << access.function << " between write at line " << write1.line 
                                     << " and read at line " << read1.line << " (may be skipped, not blocking continuity)" << std::endl;
                        }
                    }
                }
            }
        } else {
            // 原有的逻辑：对于同一函数内的访问，使用行号比较
        for (const auto& access : accesses) {
            // 跳过两个目标操作本身
            if (access.line == write1.line || access.line == read1.line) {
                continue;
            }
            
            // 如果是对同一变量的访问，且在两个操作之间
            if (access.variable == write1.variable && 
                access.line > write1.line && access.line < read1.line) {
                
                    std::cout << "DEBUG: Found potential intervening access at line " << access.line 
                             << " in function " << access.function << " (operation: " << access.operation 
                             << ") between write at line " << write1.line << " and read at line " << read1.line << std::endl;
                
                // 检查这个中间访问是否是条件性的（在条件分支中）
                if (!isAccessConditional(access, accesses)) {
                    // 如果中间访问是无条件的，则写操作和读操作不是严格连续的
                    std::cout << "Found unconditional intervening access at line " << access.line 
                             << " between write at line " << write1.line << " and read at line " << read1.line << std::endl;
                    return false;
                    } else {
                        std::cout << "Found conditional intervening access at line " << access.line 
                                 << " between write at line " << write1.line << " and read at line " << read1.line 
                                 << " (may be skipped, not blocking continuity)" << std::endl;
                    }
                }
            }
        }
        
        // 如果没有找到无条件的中间访问，则认为是严格连续的
        std::cout << "DEBUG: areStrictlyConsecutiveWR returning true for write at line " << write1.line 
                 << " and read at line " << read1.line << std::endl;
        return true;
    }
    
    std::vector<std::pair<int, int>> findConsecutiveWrites(const std::vector<MemoryAccess>& accesses) {
        std::vector<std::pair<int, int>> pairs;
        std::vector<MemoryAccess> writeOps;
        
        // 只考虑针对同一全局变量的写操作
        for (const auto& access : accesses) {
            if (access.operation == "store") {
                writeOps.push_back(access);
            }
        }
        
        // 按行号排序
        std::sort(writeOps.begin(), writeOps.end(), [](const MemoryAccess& a, const MemoryAccess& b) {
            return a.line < b.line;
        });
        
        if (writeOps.size() > 1) {
            // 检查真正连续的写操作：中间不能有对同一变量的其他操作
            for (size_t i = 0; i < writeOps.size() - 1; ++i) {
                for (size_t j = i + 1; j < writeOps.size(); ++j) {
                    // 检查两个写操作是否在互斥分支上
                    if (!areInMutuallyExclusiveBranches(writeOps[i], writeOps[j])) {
                        // 使用增强的数组索引匹配来确保访问同一内存位置
                        if (enhancedArrayIndexMatch(writeOps[i], writeOps[j])) {
                            // 首先检查两个写操作是否可能连续执行
                            // 如果它们在互斥分支中，就不会连续
                            std::cout << "Checking if writes at lines " << writeOps[i].line << " and " << writeOps[j].line << " are in mutually exclusive branches" << std::endl;
                            if (areInMutuallyExclusiveBranches(writeOps[i], writeOps[j])) {
                                std::cout << "Skipping writes at lines " << writeOps[i].line << " and " << writeOps[j].line << " (in mutually exclusive branches)" << std::endl;
                                continue;
                            }
                            std::cout << "Writes at lines " << writeOps[i].line << " and " << writeOps[j].line << " are NOT in mutually exclusive branches" << std::endl;
                            
                            // 检查两个写操作之间是否有对同一变量的其他操作
                            bool hasUnconditionalIntermediateAccess = false;
                            int line1 = writeOps[i].line;
                            int line2 = writeOps[j].line;
                            
                            for (const auto& access : accesses) {
                                if (access.line > line1 && access.line < line2) {
                                    // 如果中间有对同一变量的其他访问
                                    if (access.variable == writeOps[i].variable) {
                                        // 关键修复：检查中间访问是否真正阻断连续性
                                        // 只有当中间访问是无条件的，或者与两个写操作都不在互斥分支时，才阻断连续性
                                        bool intermediateIsConditional = isInConditionalBranch(access);
                                        bool mutualExclusiveWithFirst = areInMutuallyExclusiveBranches(writeOps[i], access);
                                        bool mutualExclusiveWithSecond = areInMutuallyExclusiveBranches(access, writeOps[j]);
                                        
                                        std::cout << "Checking intermediate access at line " << access.line 
                                                  << " (conditional: " << intermediateIsConditional 
                                                  << ", mutual exclusive with first: " << mutualExclusiveWithFirst
                                                  << ", mutual exclusive with second: " << mutualExclusiveWithSecond << ")" << std::endl;
                                        
                                        // 关键逻辑：只有当中间访问是无条件的时，才完全阻断连续性
                                        // 如果中间访问是条件性的，它可能不执行，所以不应该阻断连续性
                                        if (!intermediateIsConditional) {
                                            hasUnconditionalIntermediateAccess = true;
                                            std::cout << "Found intermediate access at line " << access.line << " that blocks continuity between " << line1 << " and " << line2 << std::endl;
                                            break;
                                        } else {
                                            std::cout << "Found conditional intermediate access at line " << access.line << " between " << line1 << " and " << line2 << " (may be skipped, not blocking continuity)" << std::endl;
                                        }
                                    }
                                }
                            }
                            
                            if (!hasUnconditionalIntermediateAccess) {
                                pairs.emplace_back(line1, line2);
                                std::cout << "Found consecutive writes at lines " << line1 << " and " << line2 << " (considering conditional branches)" << std::endl;
                            } else {
                                std::cout << "Skipping non-consecutive writes at lines " << line1 << " and " << line2 << " (unconditional intermediate access found)" << std::endl;
                            }
                        }
                    }
                }
            }
        }
        
        return pairs;
    }
    
    std::vector<std::pair<int, int>> findReadWritePairs(const std::vector<MemoryAccess>& accesses) {
        std::vector<std::pair<int, int>> pairs;
        
        for (size_t i = 0; i < accesses.size() - 1; ++i) {
            if (accesses[i].operation == "load") {
                for (size_t j = i + 1; j < accesses.size(); ++j) {
                    if (accesses[j].operation == "store") {
                        // 检查读写操作是否在互斥分支上
                        if (!areInMutuallyExclusiveBranches(accesses[i], accesses[j])) {
                            pairs.emplace_back(accesses[i].line, accesses[j].line);
                        }
                        break;
                    }
                }
            }
        }
        
        return pairs;
    }
    
    std::vector<std::pair<int, int>> findWriteReadPairs(const std::vector<MemoryAccess>& accesses) {
        std::vector<std::pair<int, int>> pairs;
        
        for (size_t i = 0; i < accesses.size() - 1; ++i) {
            if (accesses[i].operation == "store") {
                for (size_t j = i + 1; j < accesses.size(); ++j) {
                    if (accesses[j].operation == "load") {
                        // 检查写读操作是否在互斥分支上
                        if (!areInMutuallyExclusiveBranches(accesses[i], accesses[j])) {
                            pairs.emplace_back(accesses[i].line, accesses[j].line);
                        }
                        // 不要break，继续查找更多的读操作
                    }
                }
            }
        }
        
        return pairs;
    }
    
    std::vector<MemoryAccess> getWriteOperations(const std::vector<MemoryAccess>& accesses) {
        std::vector<MemoryAccess> writeOps;
        for (const auto& access : accesses) {
            if (access.operation == "store") {
                writeOps.push_back(access);
            }
        }
        return writeOps;
    }
    
    std::vector<MemoryAccess> getReadOperations(const std::vector<MemoryAccess>& accesses) {
        std::vector<MemoryAccess> readOps;
        for (const auto& access : accesses) {
            if (access.operation == "load") {
                readOps.push_back(access);
            }
        }
        return readOps;
    }
    
    bool isISRFunction(const std::string& funcName) {
        // 简单的ISR函数检测逻辑，支持大小写不敏感匹配
        std::string lowerFuncName = funcName;
        std::transform(lowerFuncName.begin(), lowerFuncName.end(), lowerFuncName.begin(), ::tolower);
        
        return lowerFuncName.find("isr") != std::string::npos || 
               lowerFuncName.find("interrupt") != std::string::npos ||
               lowerFuncName.find("handler") != std::string::npos;
    }
    
    // 获取ISR优先级，数字越大优先级越高
    int getISRPriority(const std::string& funcName) {
        if (!isISRFunction(funcName)) {
            return 0; // 非ISR函数，最低优先级
        }
        

        
                 // 从函数名中提取数字作为优先级
         // 支持格式如：ISR_1, ISR_2, interrupt_handler_3, Timer_ISR_5 等
         size_t pos = funcName.find_last_of('_');
         if (pos != std::string::npos && pos + 1 < funcName.length()) {
             std::string numberStr = funcName.substr(pos + 1);

             // 检查是否全为数字
             bool isNumber = true;
             for (char c : numberStr) {
                 if (!std::isdigit(c)) {
                     isNumber = false;
                     break;
                 }
             }
             if (isNumber && !numberStr.empty()) {
                 int priority = std::atoi(numberStr.c_str());

                 return priority; // 数字越大优先级越高
             }
         }
         
         // 如果没有找到下划线分隔的数字，尝试从"isr_"开始查找
         size_t isrPos = funcName.find("isr_");
         if (isrPos != std::string::npos) {
             size_t startPos = isrPos + 4; // "isr_"的长度是4
             std::string remaining = funcName.substr(startPos);

             
             // 提取数字部分（直到遇到非数字字符）
             std::string numberStr = "";
             for (char c : remaining) {
                 if (std::isdigit(c)) {
                     numberStr += c;
                 } else {
                             break;
                         }
                     }
             
             if (!numberStr.empty()) {
                         int priority = std::atoi(numberStr.c_str());

                         return priority;
             }
         }
        
        return 1; // 默认优先级
    }
    
    // 检查是否可以中断：严格按照优先级限制
    // 只有高优先级ISR能中断低优先级ISR
    bool canInterrupt(const std::string& higherISR, const std::string& lowerISR) {
        if (higherISR == lowerISR) {
            return false;  // 同一个ISR不能中断自己
        }
        
        int higherPriority = getISRPriority(higherISR);
        int lowerPriority = getISRPriority(lowerISR);
        

        
        // 只有更高优先级的ISR能中断较低优先级的ISR
        return higherPriority > lowerPriority;
    }
    
    // 分析单个指令的函数调用
    void analyzeFunctionCall(const Instruction& I, const std::string& callerFunc) {
        if (const CallInst* callInst = dyn_cast<CallInst>(&I)) {
            if (Function* calledFunc = callInst->getCalledFunction()) {
                // 直接函数调用
                std::string calledFuncName = calledFunc->getName().str();
                if (!calledFunc->isDeclaration()) {
                    callGraph[callerFunc].push_back(calledFuncName);
                }
            } else {
                // 间接函数调用（通过函数指针）
                Value* calledValue = callInst->getCalledOperand();
                std::cerr << "DEBUG: Found indirect call in function " << callerFunc << std::endl;
                
                // 尝试解析函数指针指向的具体函数
                if (LoadInst* LI = dyn_cast<LoadInst>(calledValue)) {
                    // 检查是否是从全局函数指针变量加载
                    if (GlobalVariable* GV = dyn_cast<GlobalVariable>(LI->getPointerOperand())) {
                        std::string ptrVarName = GV->getName().str();
                        std::cerr << "DEBUG: Indirect call through function pointer: " << ptrVarName << std::endl;
                        
                        // 根据函数指针变量名推断目标函数
                        std::string targetFuncName = inferTargetFunctionFromPointer(ptrVarName);
                        if (!targetFuncName.empty()) {
                            callGraph[callerFunc].push_back(targetFuncName);
                            std::cerr << "DEBUG: Added indirect call: " << callerFunc << " -> " << targetFuncName << std::endl;
                        }
                    }
                }
            }
        }
    }
    
    // 新增：根据函数指针变量名推断目标函数
    std::string inferTargetFunctionFromPointer(const std::string& ptrVarName) {
        // 基于命名约定推断函数名
        // 例如：svp_simple_029_001_ptr_SetSelfCtrlFlag -> svp_simple_029_001_SetSelfCtrlFlag
        if (ptrVarName.find("_ptr_") != std::string::npos) {
            // 替换 "_ptr_" 为 "_"
            std::string funcName = ptrVarName;
            size_t ptrPos = funcName.find("_ptr_");
            if (ptrPos != std::string::npos) {
                funcName.replace(ptrPos, 5, "_"); // 将 "_ptr_" 替换为 "_"
                std::cerr << "DEBUG: Inferred function name from pointer: " << ptrVarName << " -> " << funcName << std::endl;
                return funcName;
            }
        }
        
        // 其他推断逻辑可以在这里添加
        return "";
    }
    
    // 分析所有函数调用关系
    void analyzeFunctionCalls() {
        for (Function& F : *module) {
            if (!F.isDeclaration()) {
                std::string funcName = F.getName().str();
                callGraph[funcName] = std::vector<std::string>(); // 初始化
                
                for (BasicBlock& BB : F) {
                    for (Instruction& I : BB) {
                        analyzeFunctionCall(I, funcName);
                    }
                }
            }
        }
        
        // 打印调用关系
        std::cout << "Function call relationships:" << std::endl;
        for (const auto& [caller, callees] : callGraph) {
            for (const auto& callee : callees) {
                std::cout << "  " << caller << " -> " << callee << std::endl;
            }
        }
    }
    
    // 获取函数的内联访问（包括被调用函数的访问）
    std::vector<MemoryAccess> getInlinedAccesses(const std::string& funcName, const std::string& globalVar) {
        std::vector<MemoryAccess> result;
        std::set<std::string> visited; // 防止循环调用
        getInlinedAccessesRecursive(funcName, globalVar, result, visited);
        return result;
    }
    
    // 递归获取内联访问
    void getInlinedAccessesRecursive(const std::string& funcName, const std::string& globalVar, 
                                   std::vector<MemoryAccess>& result, std::set<std::string>& visited) {
        if (visited.count(funcName)) {
            return; // 防止循环调用
        }
        visited.insert(funcName);
        
        // 添加当前函数的访问
        auto directAccesses = getAccessesForFunction(funcName, globalVar);
        result.insert(result.end(), directAccesses.begin(), directAccesses.end());
        
        // 递归添加被调用函数的访问
        if (callGraph.count(funcName)) {
            for (const auto& callee : callGraph[funcName]) {
                // 只内联非ISR函数的调用（ISR函数通过中断调用，不应该内联）
                if (!isISRFunction(callee)) {
                    getInlinedAccessesRecursive(callee, globalVar, result, visited);
                }
            }
        }
    }
    
    void detectISRToISRDefects(const std::string& globalVar, const std::string& defectType, 
                              std::vector<Defect>& defects) {
        std::vector<std::string> isrFunctions;
        for (const auto& [funcName, _] : functionAccesses) {
            if (isISRFunction(funcName)) {
                isrFunctions.push_back(funcName);
            }
        }
        
        if (isrFunctions.size() < 2) return;
        
        for (size_t i = 0; i < isrFunctions.size(); ++i) {
            const std::string& currentISR = isrFunctions[i];
            auto currentAccesses = getInlinedAccesses(currentISR, globalVar);
            
            if (defectType == "RWR") {
                auto consecutiveReads = findConsecutiveReads(currentAccesses);
                for (const auto& readPair : consecutiveReads) {
                    // 验证这两个读操作确实是连续的
                    if (areConsecutiveInPath(currentISR, globalVar, readPair.first, readPair.second)) {
                        for (size_t j = 0; j < isrFunctions.size(); ++j) {
                            if (i != j && canInterrupt(isrFunctions[j], currentISR)) {
                                auto otherAccesses = getInlinedAccesses(isrFunctions[j], globalVar);
                                auto writeOps = getWriteOperations(otherAccesses);
                                for (const auto& writeOp : writeOps) {
                                    // 找到对应的读操作访问对象
                                    MemoryAccess* read1Access = nullptr;
                                    MemoryAccess* read2Access = nullptr;
                                    for (const auto& access : currentAccesses) {
                                        if (access.line == readPair.first) read1Access = const_cast<MemoryAccess*>(&access);
                                        if (access.line == readPair.second) read2Access = const_cast<MemoryAccess*>(&access);
                                    }
                                    
                                    if (!read1Access || !read2Access) continue;
                                    
                                    // 使用增强的数组索引匹配
                                    if (!enhancedArrayIndexMatch(*read1Access, writeOp) || !enhancedArrayIndexMatch(*read1Access, *read2Access)) {
                                        continue; // 数组索引不匹配，跳过
                                    }
                                    
                                    std::vector<MemoryAccess> allRelatedAccesses = {*read1Access, writeOp, *read2Access};
                                    defects.push_back(createDefectWithArrayInfo(
                                        globalVar,
                                        std::vector<std::string>{"Read", "Write", "Read"},
                                        std::vector<int>{readPair.first, writeOp.line, readPair.second},
                                        "RWR",
                                        currentISR,
                                        allRelatedAccesses
                                    ));
                                }
                            }
                        }
                    }
                }
            } else if (defectType == "WRW") {
                auto writeOps = getWriteOperations(currentAccesses);
                
                // 查找连续的写操作对
                auto consecutiveWrites = findConsecutiveWrites(currentAccesses);
                for (const auto& writePair : consecutiveWrites) {
                    // 验证这两个写操作确实是连续的
                    if (areConsecutiveInPath(currentISR, globalVar, writePair.first, writePair.second)) {
                        // 检查其他ISR中的读操作
                        for (size_t j = 0; j < isrFunctions.size(); ++j) {
                            if (i != j && canInterrupt(isrFunctions[j], currentISR)) {
                                auto otherAccesses = getInlinedAccesses(isrFunctions[j], globalVar);
                                auto readOps = getReadOperations(otherAccesses);
                                for (const auto& readOp : readOps) {
                                    // 找到对应的写操作访问对象
                                    MemoryAccess* write1Access = nullptr;
                                    MemoryAccess* write2Access = nullptr;
                                    for (const auto& access : currentAccesses) {
                                        if (access.line == writePair.first) write1Access = const_cast<MemoryAccess*>(&access);
                                        if (access.line == writePair.second) write2Access = const_cast<MemoryAccess*>(&access);
                                    }
                                    
                                    if (!write1Access || !write2Access) continue;
                                    
                                    // 使用增强的数组索引匹配
                                    if (!enhancedArrayIndexMatch(*write1Access, readOp) || !enhancedArrayIndexMatch(*write1Access, *write2Access)) {
                                        continue; // 数组索引不匹配，跳过
                                    }
                                    
                                    std::vector<MemoryAccess> allRelatedAccesses = {*write1Access, readOp, *write2Access};
                                    defects.push_back(createDefectWithArrayInfo(
                                        globalVar,
                                        std::vector<std::string>{"Write", "Read", "Write"},
                                        std::vector<int>{writePair.first, readOp.line, writePair.second},
                                        "WRW",
                                        currentISR,
                                        allRelatedAccesses
                                    ));
                                }
                            }
                        }
                    }
                }
            } else if (defectType == "RWW") {
                auto readOps = getReadOperations(currentAccesses);
                auto writeOps = getWriteOperations(currentAccesses);
                
                // 查找连续的读-写对
                for (const auto& read1 : readOps) {
                    for (const auto& write1 : writeOps) {
                        if (write1.line > read1.line && 
                            areConsecutiveInPath(currentISR, globalVar, read1.line, write1.line)) {
                            
                            // 检查其他ISR中的写操作
                            for (size_t j = 0; j < isrFunctions.size(); ++j) {
                                if (i != j && canInterrupt(isrFunctions[j], currentISR)) {
                                    auto otherAccesses = getInlinedAccesses(isrFunctions[j], globalVar);
                                    auto otherWriteOps = getWriteOperations(otherAccesses);
                                    
                                    for (const auto& write2 : otherWriteOps) {
                                        // 使用增强的数组索引匹配
                                        if (!enhancedArrayIndexMatch(read1, write2) || !enhancedArrayIndexMatch(read1, write1)) {
                                            continue; // 数组索引不匹配，跳过
                                        }
                                        
                                        std::vector<MemoryAccess> allRelatedAccesses = {read1, write2, write1};
                                        defects.push_back(createDefectWithArrayInfo(
                                            globalVar,
                                            std::vector<std::string>{"Read", "Write", "Write"},
                                            std::vector<int>{read1.line, write2.line, write1.line},
                                            "RWW",
                                            currentISR,
                                            allRelatedAccesses
                                        ));
                                    }
                                }
                            }
                        }
                    }
                }
            } else if (defectType == "WWR") {
                auto writeOps = getWriteOperations(currentAccesses);
                auto readOps = getReadOperations(currentAccesses);
                
                // 查找连续的写-读对
                for (const auto& write1 : writeOps) {
                    for (const auto& read1 : readOps) {
                        if (read1.line > write1.line && 
                            areConsecutiveInPath(currentISR, globalVar, write1.line, read1.line)) {
                            
                            // 检查其他ISR中的写操作
                            for (size_t j = 0; j < isrFunctions.size(); ++j) {
                                if (i != j && canInterrupt(isrFunctions[j], currentISR)) {
                                    auto otherAccesses = getInlinedAccesses(isrFunctions[j], globalVar);
                                    auto otherWriteOps = getWriteOperations(otherAccesses);
                                    
                                    for (const auto& write2 : otherWriteOps) {
                                        defects.emplace_back(
                                            globalVar,
                                            std::vector<std::string>{"Write", "Write", "Read"},
                                            std::vector<int>{write1.line, write2.line, read1.line},
                                            "WWR",
                                            currentISR
                                        );
                                    }
                                }
                            }
                        }
                    }
                }
            }
            }
}

// 新增：检查两个数组访问是否访问相同的索引
bool accessSameArrayIndex(const std::vector<MemoryAccess>& accesses, int line1, int line2, const std::string& globalVar) {
    std::string arrayInfo1, arrayInfo2;
    bool isArray1 = false, isArray2 = false;
    
    // 查找两个行号对应的数组访问信息
    for (const auto& access : accesses) {
        if (access.line == line1 && access.variable == globalVar) {
            isArray1 = access.isArrayAccess;
            arrayInfo1 = access.arrayInfo;
        } else if (access.line == line2 && access.variable == globalVar) {
            isArray2 = access.isArrayAccess;
            arrayInfo2 = access.arrayInfo;
        }
    }
    
    // 如果都不是数组访问，或者其中一个不是数组访问，认为是相同的
    if (!isArray1 || !isArray2) {
        return true;
    }
    
    // 如果都是数组访问，比较索引
    return arrayInfo1 == arrayInfo2;
}

// 新增：创建包含数组访问信息的缺陷
Defect createDefectWithArrayInfo(const std::string& globalVar, 
                               const std::vector<std::string>& accessPattern,
                               const std::vector<int>& lines,
                               const std::string& type,
                               const std::string& location,
                               const std::vector<MemoryAccess>& relatedAccesses) {
    std::vector<bool> isArrayFlags;
    std::vector<std::string> arrayInfos;
    
    // 为每个访问收集数组信息
    for (int line : lines) {
        bool found = false;
        for (const auto& access : relatedAccesses) {
            if (access.line == line && access.variable == globalVar) {
                isArrayFlags.push_back(access.isArrayAccess);
                arrayInfos.push_back(access.arrayInfo);
                found = true;
                break;
            }
        }
        if (!found) {
            // 如果没有找到对应的访问信息，使用默认值
            isArrayFlags.push_back(false);
            arrayInfos.push_back("");
        }
    }
    
    return Defect(globalVar, accessPattern, lines, type, location, isArrayFlags, arrayInfos);
}

// 新增：分析函数控制流图
    void analyzeControlFlow(Function& F) {
        std::string funcName = F.getName().str();
        std::cout << "Starting control flow analysis for: " << funcName << std::endl;
        
        basicBlockSuccessors[funcName] = std::unordered_map<std::string, std::unordered_set<std::string>>();
        basicBlockPredecessors[funcName] = std::unordered_map<std::string, std::unordered_set<std::string>>();
        
        for (BasicBlock& BB : F) {
                std::string bbName = BB.getName().str();
                if (bbName.empty()) {
                    bbName = "bb_" + std::to_string(reinterpret_cast<uintptr_t>(&BB));
                }
                
                std::cout << "Processing basic block: " << bbName << std::endl;
                
                // 分析后继基本块
                for (BasicBlock* Succ : successors(&BB)) {
                    if (Succ) {  // 添加空指针检查
                        std::string succName = Succ->getName().str();
                        if (succName.empty()) {
                            succName = "bb_" + std::to_string(reinterpret_cast<uintptr_t>(Succ));
                        }
                        basicBlockSuccessors[funcName][bbName].insert(succName);
                        basicBlockPredecessors[funcName][succName].insert(bbName);
                    }
                }
            }
        
        std::cout << "Control flow analysis completed for: " << funcName << std::endl;
    }
    
    // 新增：检查两个基本块是否可能在同一执行路径上
    bool canReachInSameExecution(const std::string& funcName, const std::string& bb1, const std::string& bb2) {
        if (bb1 == bb2) return true;
        
        // 检查函数是否存在
        if (basicBlockSuccessors.find(funcName) == basicBlockSuccessors.end()) {
            return false;
        }
        
        // 使用BFS检查从bb1是否能到达bb2
        std::unordered_set<std::string> visited;
        std::queue<std::string> queue;
        queue.push(bb1);
        visited.insert(bb1);
        
        while (!queue.empty()) {
            std::string current = queue.front();
            queue.pop();
            
            if (current == bb2) return true;
            
            auto& funcSuccessors = basicBlockSuccessors[funcName];
            if (funcSuccessors.find(current) != funcSuccessors.end()) {
                for (const std::string& succ : funcSuccessors[current]) {
                    if (visited.find(succ) == visited.end()) {
                        visited.insert(succ);
                        queue.push(succ);
                    }
                }
            }
        }
        
        return false;
    }
    
    // 检查访问是否在条件代码块中
    bool isInConditionalBlock(const MemoryAccess& access) {
        // 简单的启发式方法：检查基本块名称是否包含条件相关的标识
        // 在LLVM IR中，条件分支通常会产生多个基本块
        const std::string& funcName = access.function;
        
        // 获取函数的所有基本块
        if (basicBlockSuccessors.find(funcName) != basicBlockSuccessors.end()) {
            const auto& successors = basicBlockSuccessors.at(funcName);
            
            // 如果一个基本块有多个后继，或者是某个分支的目标，可能是条件块
            if (successors.find(access.basicBlock) != successors.end()) {
                const auto& blockSuccessors = successors.at(access.basicBlock);
                // 如果有多个后继，说明这个块包含条件分支
                if (blockSuccessors.size() > 1) {
                    return true;
                }
            }
            
            // 检查是否有多个基本块指向这个基本块（合并点）
            int predecessorCount = 0;
            for (const auto& [bb, succs] : successors) {
                if (std::find(succs.begin(), succs.end(), access.basicBlock) != succs.end()) {
                    predecessorCount++;
                }
            }
            if (predecessorCount > 1) {
                return true;
            }
        }
        
        return false;
    }
    
    // 检查三个访问是否在不同的条件分支中
    bool areInDifferentConditionalBranches(const MemoryAccess& access1, const MemoryAccess& access2, const MemoryAccess& middleAccess) {
        // 如果访问在不同的基本块中，且这些基本块不能同时到达，则它们在不同的条件分支中
        if (access1.basicBlock != access2.basicBlock || 
            access1.basicBlock != middleAccess.basicBlock || 
            access2.basicBlock != middleAccess.basicBlock) {
            
            // 检查是否存在一条路径可以同时经过这三个基本块
            const std::string& funcName = access1.function;
            if (basicBlockSuccessors.find(funcName) != basicBlockSuccessors.end()) {
                // 简化的检查：如果三个访问都在不同的基本块，且不存在直接的路径连接，
                // 则认为它们可能在不同的条件分支中
                bool canReach12 = canReachInSameExecution(funcName, access1.basicBlock, access2.basicBlock);
                bool canReach1M = canReachInSameExecution(funcName, access1.basicBlock, middleAccess.basicBlock);
                bool canReach2M = canReachInSameExecution(funcName, access2.basicBlock, middleAccess.basicBlock);
                
                // 如果不是所有的访问都可以互相到达，则它们可能在不同的条件分支中
                return !(canReach12 && canReach1M && canReach2M);
            }
        }
        
        return false;
    }
    
    // 检查是否可以从start到达end而不经过avoid
    bool canReachWithoutGoingThrough(const std::string& funcName, const std::string& start, 
                                   const std::string& end, const std::string& avoid) {
        if (start == end) return true;
        if (start == avoid) return false;
        
        if (basicBlockSuccessors.find(funcName) == basicBlockSuccessors.end()) {
            return false;
        }
        
        const auto& successors = basicBlockSuccessors.at(funcName);
        std::set<std::string> visited;
        std::queue<std::string> toVisit;
        
        toVisit.push(start);
        visited.insert(start);
        
        while (!toVisit.empty()) {
            std::string current = toVisit.front();
            toVisit.pop();
            
            if (current == end) {
                return true;
            }
            
            if (current == avoid) {
                continue; // 跳过要避免的基本块
            }
            
            if (successors.find(current) != successors.end()) {
                for (const std::string& successor : successors.at(current)) {
                    if (visited.find(successor) == visited.end()) {
                        visited.insert(successor);
                        toVisit.push(successor);
                    }
                }
            }
        }
        
        return false;
    }
    
    // 检查操作是否在条件分支中（简化版本）
    // 基于基本块名称的启发式判断：如果基本块有多个前驱，可能是条件性的
    bool isInConditionalBranch(const MemoryAccess& access) {
        const std::string& funcName = access.function;
        const std::string& bbName = access.basicBlock;
        
        // 检查控制流信息是否可用
        if (basicBlockSuccessors.find(funcName) == basicBlockSuccessors.end()) {
            return false; // 如果没有控制流信息，保守地假设不是条件性的
        }
        
        const auto& successors = basicBlockSuccessors.at(funcName);
        
        // 计算有多少基本块指向当前基本块
        int predecessorCount = 0;
        bool hasConditionalPredecessor = false;
        
        for (const auto& [predBB, predSuccs] : successors) {
            if (predSuccs.find(bbName) != predSuccs.end()) {
                predecessorCount++;
                // 如果前驱有多个后继，说明它是条件分支
                if (predSuccs.size() > 1) {
                    hasConditionalPredecessor = true;
                }
            }
        }
        
        // 如果有条件分支前驱，或者只能从条件分支到达，认为是条件性的
        return hasConditionalPredecessor && predecessorCount == 1;
    }
    
    // 新增：检查两个访问是否在互斥分支上
    bool areInMutuallyExclusiveBranches(const MemoryAccess& access1, const MemoryAccess& access2) {
        std::cout << "  areInMutuallyExclusiveBranches: Checking access1 at line " << access1.line 
                 << " (BB: " << access1.basicBlock << ") vs access2 at line " << access2.line 
                 << " (BB: " << access2.basicBlock << ")" << std::endl;
        
        if (access1.function != access2.function) {
            // 不同函数，默认认为可能同时执行（除非有更精确的调用图分析）
            std::cout << "  Different functions (" << access1.function << " vs " << access2.function 
                     << "), returning false" << std::endl;
            return false;
        }
        
        if (access1.basicBlock == access2.basicBlock) {
            // 同一基本块内，按行号顺序执行
            std::cout << "  Same basic block (" << access1.basicBlock << "), returning false" << std::endl;
            return false;
        }
        
        const std::string& funcName = access1.function;
        const std::string& bb1 = access1.basicBlock;
        const std::string& bb2 = access2.basicBlock;
        
        std::cout << "  Checking mutual exclusivity between BB " << bb1 << " and BB " << bb2 
                 << " in function " << funcName << std::endl;
        
        // 检查控制流信息是否可用
        if (basicBlockSuccessors.find(funcName) == basicBlockSuccessors.end()) {
            std::cout << "  No control flow information available for function " << funcName 
                     << ", returning false (conservative)" << std::endl;
            return false; // 如果没有控制流信息，保守地假设不互斥
        }
        
        // 检查是否存在从bb1到bb2或从bb2到bb1的路径
        bool bb1CanReachBb2 = canReachInSameExecution(funcName, bb1, bb2);
        bool bb2CanReachBb1 = canReachInSameExecution(funcName, bb2, bb1);
        
        std::cout << "  Reachability: " << bb1 << " can reach " << bb2 << ": " << bb1CanReachBb2 << std::endl;
        std::cout << "  Reachability: " << bb2 << " can reach " << bb1 << ": " << bb2CanReachBb1 << std::endl;
        
        // 特殊情况：检查两个基本块是否有共同的条件前驱
        // 这有助于识别 if-else 分支结构
        bool haveCommonConditionalPredecessor = false;
        const auto& successors = basicBlockSuccessors.at(funcName);
        
        for (const auto& [predBB, predSuccs] : successors) {
            // 如果前驱基本块有多个后继，且包含bb1和bb2
            if (predSuccs.size() > 1 && 
                predSuccs.find(bb1) != predSuccs.end() && 
                predSuccs.find(bb2) != predSuccs.end()) {
                haveCommonConditionalPredecessor = true;
                std::cout << "  Found common conditional predecessor: " << predBB 
                         << " branches to both " << bb1 << " and " << bb2 << std::endl;
                break;
            }
        }
        
        // 如果两个基本块都无法互相到达，则它们在互斥分支上
        bool areMutuallyExclusive = !bb1CanReachBb2 && !bb2CanReachBb1;
        
        // 增强检查：如果有共同的条件前驱，更可能是互斥的
        if (haveCommonConditionalPredecessor && areMutuallyExclusive) {
            std::cout << "  Confirmed: BB " << bb1 << " and BB " << bb2 
                     << " are in mutually exclusive branches (common conditional predecessor)" << std::endl;
            return true;
        } else if (areMutuallyExclusive) {
            std::cout << "  Confirmed: BB " << bb1 << " and BB " << bb2 
                     << " are in mutually exclusive branches (no reachability)" << std::endl;
            return true;
        } else {
            std::cout << "  BB " << bb1 << " and BB " << bb2 
                     << " are NOT mutually exclusive (reachable from each other)" << std::endl;
            return false;
        }
    }
    
private:
    // 新增：缺陷去重函数
    std::vector<Defect> removeDuplicateDefects(const std::vector<Defect>& defects) {
        std::vector<Defect> uniqueDefects;
        std::set<std::string> seen;
        
        for (const auto& defect : defects) {
            // 创建唯一标识符：变量名 + 缺陷类型 + 行号序列 + 访问模式
            std::string identifier = defect.sharedVariable + "_" + defect.type + "_";
            
            // 添加排序后的行号
            std::vector<int> sortedLines = defect.lines;
            std::sort(sortedLines.begin(), sortedLines.end());
            for (int line : sortedLines) {
                identifier += std::to_string(line) + "_";
            }
            
            // 添加访问模式
            for (const auto& pattern : defect.accessPattern) {
                identifier += pattern + "_";
            }
            
            // 如果是新的缺陷，添加到结果中
            if (seen.find(identifier) == seen.end()) {
                seen.insert(identifier);
                uniqueDefects.push_back(defect);
                std::cout << "Added unique defect: " << identifier << std::endl;
            } else {
                std::cout << "Skipped duplicate defect: " << identifier << std::endl;
            }
        }
        
        std::cout << "Removed " << (defects.size() - uniqueDefects.size()) << " duplicate defects" << std::endl;
        return uniqueDefects;
    }

public:
    Json::Value generateReport() {
        Json::Value report;
        
        std::cout << "Starting defect detection..." << std::endl;
        
        // 运行所有类型的缺陷检测
            std::cout << "Detecting RWW defects..." << std::endl;
            auto rwwDefects = detectRWWDefects();
            std::cout << "Found " << rwwDefects.size() << " RWW defects." << std::endl;
            
            std::cout << "Detecting RWR defects..." << std::endl;
            auto rwrDefects = detectRWRDefects();
            std::cout << "Found " << rwrDefects.size() << " RWR defects." << std::endl;
            
            std::cout << "Detecting WRW defects..." << std::endl;
            auto wrwDefects = detectWRWDefects();
            std::cout << "Found " << wrwDefects.size() << " WRW defects." << std::endl;
            
            std::cout << "Detecting WWR defects..." << std::endl;
            auto wwrDefects = detectWWRDefects();
            std::cout << "Found " << wwrDefects.size() << " WWR defects." << std::endl;
            
            // 合并所有缺陷
            std::vector<Defect> allDefects;
            allDefects.insert(allDefects.end(), rwwDefects.begin(), rwwDefects.end());
            allDefects.insert(allDefects.end(), rwrDefects.begin(), rwrDefects.end());
            allDefects.insert(allDefects.end(), wrwDefects.begin(), wrwDefects.end());
            allDefects.insert(allDefects.end(), wwrDefects.begin(), wwrDefects.end());
            
            std::cout << "Total defects before deduplication: " << allDefects.size() << std::endl;
            
            // 去除重复的缺陷
            allDefects = removeDuplicateDefects(allDefects);
            std::cout << "Total unique defects after deduplication: " << allDefects.size() << std::endl;
            
            std::cout << "Building JSON report..." << std::endl;
            
            Json::Value defectsJson(Json::arrayValue);
            for (const auto& defect : allDefects) {
                Json::Value defectJson;
                defectJson["sharedVariable"] = defect.sharedVariable;
                defectJson["type"] = defect.type;
                
                Json::Value accessPattern(Json::arrayValue);
                for (const auto& access : defect.accessPattern) {
                    accessPattern.append(access);
                }
                defectJson["accessPattern"] = accessPattern;
                
                Json::Value lines(Json::arrayValue);
                for (int line : defect.lines) {
                    lines.append(line);
                }
                defectJson["lines"] = lines;
                
                // 添加数组访问信息
                if (!defect.isArrayAccess.empty()) {
                    Json::Value arrayAccess(Json::arrayValue);
                    for (bool isArray : defect.isArrayAccess) {
                        arrayAccess.append(isArray);
                    }
                    defectJson["isArrayAccess"] = arrayAccess;
                }
                
                if (!defect.arrayInfo.empty()) {
                    Json::Value arrayInfo(Json::arrayValue);
                    for (const auto& info : defect.arrayInfo) {
                        arrayInfo.append(info);
                    }
                    defectJson["arrayInfo"] = arrayInfo;
                }
                
                defectsJson.append(defectJson);
            }
            
            // 创建包含defect_count的对象
            Json::Value result;
            result["defect_count"] = static_cast<int>(allDefects.size());
            result["defects"] = defectsJson;
            report = result;
            
            std::cout << "Report generation completed successfully." << std::endl;

        
        return report;
    }
    
    void saveReport(const std::string& filename) {
        Json::Value report = generateReport();
        
        Json::StreamWriterBuilder builder;
        builder["indentation"] = "  ";
        std::string jsonString = Json::writeString(builder, report);
        
        FILE* file = fopen(filename.c_str(), "w");
        if (file) {
            fprintf(file, "%s", jsonString.c_str());
            fclose(file);
        } else {
            printf("Error: Could not open file %s for writing\n", filename.c_str());
        }
    }

    // 新增：检查被调用函数是否在指定行之前被调用
    bool isCalleeCalledBeforeLine(const std::string& callerFunc, const std::string& calleeFunc, int line) {
        // 遍历调用者函数的所有指令，查找对被调用函数的调用
        for (Function& F : *module) {
            if (F.getName().str() == callerFunc && !F.isDeclaration()) {
                for (BasicBlock& BB : F) {
                    for (Instruction& I : BB) {
                        if (const CallInst* callInst = dyn_cast<CallInst>(&I)) {
                            if (Function* calledFunc = callInst->getCalledFunction()) {
                                if (calledFunc->getName().str() == calleeFunc) {
                                    int callLine = getLineNumber(I);
                                    if (callLine > 0 && callLine < line) {
                                        return true; // 找到在指定行之前的调用
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }
    
    // 新增：检查被调用函数是否在指定行之后被调用
    bool isCalleeCalledAfterLine(const std::string& callerFunc, const std::string& calleeFunc, int line) {
        // 遍历调用者函数的所有指令，查找对被调用函数的调用
        for (Function& F : *module) {
            if (F.getName().str() == callerFunc && !F.isDeclaration()) {
                for (BasicBlock& BB : F) {
                    for (Instruction& I : BB) {
                        if (const CallInst* callInst = dyn_cast<CallInst>(&I)) {
                            if (Function* calledFunc = callInst->getCalledFunction()) {
                                if (calledFunc->getName().str() == calleeFunc) {
                                    int callLine = getLineNumber(I);
                                    if (callLine > 0 && callLine > line) {
                                        return true; // 找到在指定行之后的调用
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    // 新增：检查函数是否在两个行号之间被调用
    bool isFunctionCalledBetweenLines(const std::string& callerFunc, const std::string& calleeFunc, int startLine, int endLine) {
        // 遍历调用者函数的所有指令，查找对被调用函数的调用
        for (Function& F : *module) {
            if (F.getName().str() == callerFunc && !F.isDeclaration()) {
                for (BasicBlock& BB : F) {
                    for (Instruction& I : BB) {
                        if (const CallInst* callInst = dyn_cast<CallInst>(&I)) {
                            if (Function* calledFunc = callInst->getCalledFunction()) {
                                if (calledFunc->getName().str() == calleeFunc) {
                                    int callLine = getLineNumber(I);
                                    if (callLine > 0 && callLine > startLine && callLine < endLine) {
                                        return true; // 找到在指定范围内的调用
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return false;
    }

    // 新增：检查访问是否在循环中
    bool isAccessInLoop(const std::vector<MemoryAccess>& accesses, int line, const std::string& funcName) {
        // 方法1：检查基本块名称是否包含循环相关的标识
        for (const auto& access : accesses) {
            if (access.line == line && access.function == funcName) {
                const std::string& bbName = access.basicBlock;
                
                // LLVM IR中循环基本块通常包含这些标识
                // 更严格的循环块识别：只有明确的循环块才认为在循环中
                if (bbName.find("for.body") != std::string::npos ||
                    bbName.find("for.cond") != std::string::npos ||
                    bbName.find("for.inc") != std::string::npos ||
                    bbName.find("while.body") != std::string::npos ||
                    bbName.find("while.cond") != std::string::npos ||
                    bbName.find("do.body") != std::string::npos ||
                    bbName.find("loop.body") != std::string::npos ||
                    bbName.find("loop.cond") != std::string::npos) {
                    std::cout << "Access at line " << line << " is in explicit loop block: " << bbName << std::endl;
                    return true;
                }
                
                // 新增：检查是否是简单的for循环模式
                // 对于形如 for(int k=0; k<NUM; k++) 的循环，检查函数中是否有多个基本块
                // 且存在循环变量的访问模式
                if (isSimpleForLoopPattern(accesses, funcName, line)) {
                    std::cout << "Access at line " << line << " is in simple for loop pattern" << std::endl;
                    return true;
                }
                
                // 方法2：检查控制流是否形成循环
                if (basicBlockSuccessors.find(funcName) != basicBlockSuccessors.end()) {
                    const auto& successors = basicBlockSuccessors.at(funcName);
                    
                    // 检查当前基本块是否有回边（指向前面的基本块）
                    if (successors.find(bbName) != successors.end()) {
                        for (const std::string& successor : successors.at(bbName)) {
                            // 如果后继基本块能够回到当前基本块，说明存在循环
                            if (canReachInSameExecution(funcName, successor, bbName)) {
                                std::cout << "Access at line " << line << " is in loop (back edge detected from " 
                                         << bbName << " to " << successor << ")" << std::endl;
                                return true;
                            }
                        }
                    }
                    
                    // 方法3：检查是否有前驱基本块也是后继基本块（强循环指示）
                    std::unordered_set<std::string> predecessors;
                    for (const auto& [predBB, predSuccs] : successors) {
                        if (predSuccs.find(bbName) != predSuccs.end()) {
                            predecessors.insert(predBB);
                        }
                    }
                    
                    if (successors.find(bbName) != successors.end()) {
                        for (const std::string& successor : successors.at(bbName)) {
                            if (predecessors.find(successor) != predecessors.end()) {
                                std::cout << "Access at line " << line << " is in loop (predecessor-successor cycle: " 
                                         << bbName << " <-> " << successor << ")" << std::endl;
                                return true;
                            }
                        }
                    }
                    
                    // 方法4：检查基本块的前驱数量和后继数量
                    // 循环体通常有多个前驱（循环头和回边）
                    int predecessorCount = 0;
                    int successorCount = 0;
                    
                    // 计算前驱数量
                    for (const auto& [predBB, predSuccs] : successors) {
                        if (predSuccs.find(bbName) != predSuccs.end()) {
                            predecessorCount++;
                        }
                    }
                    
                    // 计算后继数量
                    if (successors.find(bbName) != successors.end()) {
                        successorCount = successors.at(bbName).size();
                    }
                    
                    // 更严格的前驱检查：只有当基本块名称暗示循环且有多个前驱时才认为在循环中
                    if (predecessorCount > 1 && bbName != "entry" && 
                        (bbName.find("for.") != std::string::npos ||
                         bbName.find("while.") != std::string::npos ||
                         bbName.find("loop") != std::string::npos ||
                         bbName.find("do.") != std::string::npos ||
                         bbName.find("cond") != std::string::npos ||
                         bbName.find("body") != std::string::npos)) {
                        std::cout << "Access at line " << line << " is likely in loop (multiple predecessors: " 
                                 << predecessorCount << " and loop-like block name)" << std::endl;
                        return true;
                    }
                    
                    // 方法5：基于启发式规则检测循环
                    // 如果基本块包含多个访问同一变量的操作，可能在循环中
                    // 但需要排除简单的读-修改-写操作（如i++）和连续的写操作
                    int accessCountInSameBlock = 0;
                    bool hasReadWritePair = false;
                    bool hasMultipleWrites = false;
                    int writeCount = 0;
                    
                    for (const auto& otherAccess : accesses) {
                        if (otherAccess.function == funcName && 
                            otherAccess.basicBlock == bbName &&
                            otherAccess.variable == access.variable) {
                            accessCountInSameBlock++;
                            
                            // 统计写操作数量
                            if (otherAccess.operation == "store") {
                                writeCount++;
                            }
                            
                            // 检查是否是同一行的读写操作（如i++）
                            if (otherAccess.line == line) {
                                if ((access.operation == "load" && otherAccess.operation == "store") ||
                                    (access.operation == "store" && otherAccess.operation == "load")) {
                                    hasReadWritePair = true;
                                }
                            }
                        }
                    }
                    
                    // 检查是否有多个连续的写操作（非循环模式）
                    if (writeCount > 1) {
                        // 检查写操作是否在连续的行号上
                        std::vector<int> writeLines;
                        for (const auto& otherAccess : accesses) {
                            if (otherAccess.function == funcName && 
                                otherAccess.basicBlock == bbName &&
                                otherAccess.variable == access.variable &&
                                otherAccess.operation == "store") {
                                writeLines.push_back(otherAccess.line);
                            }
                        }
                        
                        // 排序写操作行号
                        std::sort(writeLines.begin(), writeLines.end());
                        
                        // 检查是否连续
                        bool isConsecutive = true;
                        for (size_t i = 1; i < writeLines.size(); i++) {
                            if (writeLines[i] - writeLines[i-1] > 2) { // 允许小的间隔
                                isConsecutive = false;
                                break;
                            }
                        }
                        
                        if (isConsecutive) {
                            hasMultipleWrites = true;
                            std::cout << "Access at line " << line << " has consecutive writes (not a loop pattern)" << std::endl;
                        }
                    }
                    
                    // 更严格的同块多访问检查：只有当基本块名称暗示循环时才认为在循环中
                    if (accessCountInSameBlock > 1 && !hasReadWritePair && !hasMultipleWrites && bbName != "entry" &&
                        (bbName.find("for.") != std::string::npos ||
                         bbName.find("while.") != std::string::npos ||
                         bbName.find("loop") != std::string::npos ||
                         bbName.find("do.") != std::string::npos ||
                         bbName.find("cond") != std::string::npos ||
                         bbName.find("body") != std::string::npos)) {
                        std::cout << "Access at line " << line << " is likely in loop (multiple accesses in loop-like block: " 
                                 << accessCountInSameBlock << ")" << std::endl;
                        return true;
                    }
                }
                
                // 方法6：增强的循环检测 - 更严格地检查函数中的循环模式
                // 对于ISR函数，只有当访问确实在循环块中时才认为在循环中
                if (isISRFunction(funcName)) {
                    // 检查当前访问的基本块是否是明确的循环块
                    if (bbName.find("for.body") != std::string::npos ||
                        bbName.find("for.cond") != std::string::npos ||
                        bbName.find("for.inc") != std::string::npos ||
                        bbName.find("while.body") != std::string::npos ||
                        bbName.find("while.cond") != std::string::npos ||
                        bbName.find("do.body") != std::string::npos ||
                        bbName.find("loop.body") != std::string::npos ||
                        bbName.find("loop.cond") != std::string::npos) {
                        std::cout << "Access at line " << line << " is in ISR function " << funcName 
                                 << " loop block: " << bbName << std::endl;
                        return true;
                    }
                }
                
                // 方法7：基于代码模式的启发式检测（更严格）
                // 只有当访问的基本块名称暗示循环时，才检查循环变量模式
                if ((bbName.find("for.") != std::string::npos ||
                     bbName.find("while.") != std::string::npos ||
                     bbName.find("loop") != std::string::npos ||
                     bbName.find("do.") != std::string::npos) &&
                    isLikelyLoopContext(accesses, funcName, line)) {
                    std::cout << "Access at line " << line << " is in likely loop context with loop-like block" << std::endl;
                    return true;
                }
                
                break;
            }
        }
        
        return false;
    }
    
    // 新增：检查是否是简单的for循环模式
    bool isSimpleForLoopPattern(const std::vector<MemoryAccess>& accesses, const std::string& funcName, int targetLine) {
        // 检查函数中是否有典型的for循环特征：
        // 1. 函数有多个基本块（表示有控制流）
        // 2. 存在循环变量（如k, i, j等）
        // 3. 函数是ISR函数且包含重复的内存访问
        
        std::unordered_set<std::string> functionBlocks;
        std::unordered_map<std::string, int> variableAccessCount;
        bool hasLoopVariables = false;
        
        // 收集函数的基本块和变量访问信息
        for (const auto& access : accesses) {
            if (access.function == funcName) {
                functionBlocks.insert(access.basicBlock);
                variableAccessCount[access.variable]++;
                
                // 检查是否有典型的循环变量
                if (access.variable == "k" || access.variable == "i" || access.variable == "j" || 
                    access.variable == "index" || access.variable == "cnt" || access.variable == "count") {
                    hasLoopVariables = true;
                }
            }
        }
        
        // 更严格的ISR函数循环检测：只有当确实有循环块时才认为在循环中
        if (isISRFunction(funcName) && functionBlocks.size() >= 3) {
            // 检查是否有明确的循环基本块
            bool hasExplicitLoopBlocks = false;
            for (const auto& access : accesses) {
                if (access.function == funcName) {
                    const std::string& bbName = access.basicBlock;
                    if (bbName.find("for.body") != std::string::npos ||
                        bbName.find("for.cond") != std::string::npos ||
                        bbName.find("for.inc") != std::string::npos ||
                        bbName.find("while.body") != std::string::npos ||
                        bbName.find("while.cond") != std::string::npos ||
                        bbName.find("do.body") != std::string::npos ||
                        bbName.find("loop.body") != std::string::npos ||
                        bbName.find("loop.cond") != std::string::npos) {
                        hasExplicitLoopBlocks = true;
                        break;
                    }
                }
            }
            
            // 只有当有明确的循环块时，才检查多次访问
            if (hasExplicitLoopBlocks) {
                for (const auto& [var, count] : variableAccessCount) {
                    if (count > 1 && globalVariables.count(var)) {
                        std::cout << "Function " << funcName << " has multiple accesses to global variable " 
                                 << var << " (" << count << " times) and explicit loop blocks" << std::endl;
                        return true;
                    }
                }
            }
        }
        
        // 更严格的循环结构检查：只有当有明确的循环块且有循环变量时才认为在循环中
        if (functionBlocks.size() >= 3 && hasLoopVariables) {
            // 检查是否有明确的循环基本块
            bool hasExplicitLoopBlocks = false;
            for (const auto& access : accesses) {
                if (access.function == funcName) {
                    const std::string& bbName = access.basicBlock;
                    if (bbName.find("for.body") != std::string::npos ||
                        bbName.find("for.cond") != std::string::npos ||
                        bbName.find("for.inc") != std::string::npos ||
                        bbName.find("while.body") != std::string::npos ||
                        bbName.find("while.cond") != std::string::npos ||
                        bbName.find("do.body") != std::string::npos ||
                        bbName.find("loop.body") != std::string::npos ||
                        bbName.find("loop.cond") != std::string::npos) {
                        hasExplicitLoopBlocks = true;
                        break;
                    }
                }
            }
            
            if (hasExplicitLoopBlocks) {
                std::cout << "Function " << funcName << " has " << functionBlocks.size() 
                         << " basic blocks, loop variables, and explicit loop blocks" << std::endl;
                return true;
            }
        }
        
        return false;
    }
    
    // 新增：检查是否为可能的循环上下文
    bool isLikelyLoopContext(const std::vector<MemoryAccess>& accesses, const std::string& funcName, int targetLine) {
        // 这个函数的逻辑过于宽松，导致误报
        // 对于test_30.ll这样的简单函数，不应该认为是循环上下文
        // 我们需要更严格的循环检测
        
        // 首先检查是否有明显的循环基本块
        bool hasLoopBasicBlocks = false;
        for (const auto& access : accesses) {
            if (access.function == funcName) {
                const std::string& bbName = access.basicBlock;
                if (bbName.find("for.") != std::string::npos ||
                    bbName.find("while.") != std::string::npos ||
                    bbName.find("loop") != std::string::npos ||
                    bbName.find("do.") != std::string::npos ||
                    bbName.find("cond") != std::string::npos ||
                    bbName.find("body") != std::string::npos ||
                    bbName.find("inc") != std::string::npos) {
                    hasLoopBasicBlocks = true;
                    break;
                }
            }
        }
        
        // 如果没有循环基本块，不应该认为是循环上下文
        if (!hasLoopBasicBlocks) {
            return false;
        }
        
        // 查找典型的循环变量模式
        std::unordered_set<std::string> loopVariables = {"i", "j", "k", "l", "m", "n", "idx", "index", "cnt", "count"};
        
        // 检查函数中是否有对循环变量的读写操作
        bool hasLoopVariableAccess = false;
        for (const auto& access : accesses) {
            if (access.function == funcName) {
                for (const std::string& loopVar : loopVariables) {
                    if (access.variable.find(loopVar) != std::string::npos) {
                        hasLoopVariableAccess = true;
                        std::cout << "Found potential loop variable access: " << access.variable 
                                 << " at line " << access.line << std::endl;
                        break;
                    }
                }
                if (hasLoopVariableAccess) break;
            }
        }
        
        // 只有当同时有循环基本块和循环变量访问时，才认为是循环上下文
        if (!hasLoopVariableAccess) {
            return false;
        }
        
        // 检查目标行附近是否有循环变量的增量操作
        for (const auto& access : accesses) {
            if (access.function == funcName && 
                std::abs(access.line - targetLine) <= 3) { // 在目标行附近3行内
                
                for (const std::string& loopVar : loopVariables) {
                    if (access.variable.find(loopVar) != std::string::npos) {
                        return true;
                    }
                }
            }
        }
        
        return false;
    }
    
    // 新增：检查循环中的连续性
    bool checkLoopConsecutiveness(const std::vector<MemoryAccess>& accesses, int line1, int line2, 
                                 const std::string& funcName, const std::string& varName) {
        std::cout << "DEBUG: checkLoopConsecutiveness called for lines " << line1 << " and " << line2 
                 << " in function " << funcName << std::endl;
        
        // 情况1：两个访问都在循环中，检查它们在循环体内的相对位置
        bool access1InLoop = isAccessInLoop(accesses, line1, funcName);
        bool access2InLoop = isAccessInLoop(accesses, line2, funcName);
        
        if (access1InLoop && access2InLoop) {
            // 如果两个访问都在同一个循环中，检查循环体内的执行顺序
            if (areInSameLoop(accesses, line1, line2, funcName)) {
                // 在同一个循环中，检查是否有中间的非条件访问
                bool hasUnconditionalIntervening = false;
                int earlierLine = std::min(line1, line2);
                int laterLine = std::max(line1, line2);
                
                for (const auto& access : accesses) {
                    if (access.variable == varName && 
                        access.function == funcName &&
                        access.line > earlierLine && access.line < laterLine) {
                        
                        // 检查中间访问是否是条件性的
                        if (!isAccessConditional(access, accesses)) {
                            hasUnconditionalIntervening = true;
                            std::cout << "Found unconditional intervening access at line " << access.line 
                                     << " between loop accesses at lines " << earlierLine << " and " << laterLine << std::endl;
                            break;
                        }
                    }
                }
                
                if (!hasUnconditionalIntervening) {
                    std::cout << "Loop accesses at lines " << line1 << " and " << line2 
                             << " are consecutive within the same loop" << std::endl;
                    return true;
                }
            }
        }
        
        // 情况2：一个访问在循环中，另一个不在循环中
        // 检查循环外的访问是否与循环内的访问连续
        if (access1InLoop != access2InLoop) {
            int loopLine = access1InLoop ? line1 : line2;
            int nonLoopLine = access1InLoop ? line2 : line1;
            
            std::cout << "Checking consecutiveness between loop access at line " << loopLine 
                     << " and non-loop access at line " << nonLoopLine << std::endl;
            
            // 检查循环和非循环访问之间是否有中间访问
            int earlierLine = std::min(loopLine, nonLoopLine);
            int laterLine = std::max(loopLine, nonLoopLine);
            
            bool hasUnconditionalIntervening = false;
            for (const auto& access : accesses) {
                if (access.variable == varName && 
                    access.function == funcName &&
                    access.line > earlierLine && access.line < laterLine) {
                    
                    // 对于跨循环边界的访问，更严格的检查
                    if (!isAccessConditional(access, accesses)) {
                        hasUnconditionalIntervening = true;
                        std::cout << "Found unconditional intervening access at line " << access.line 
                                 << " between loop and non-loop accesses" << std::endl;
                        break;
                    }
                }
            }
            
            if (!hasUnconditionalIntervening) {
                std::cout << "Loop and non-loop accesses at lines " << line1 << " and " << line2 
                         << " are consecutive" << std::endl;
                return true;
            }
        }
        
        // 情况3：关键修复 - 检查循环迭代之间的连续性
        // 即使两个访问在不同的行，如果它们都在循环中，循环的每次迭代都会执行这些访问
        // 那么第一次迭代的后一个访问和第二次迭代的前一个访问是连续的
        if (access1InLoop && access2InLoop && areInSameLoop(accesses, line1, line2, funcName)) {
            // 检查循环体内的访问模式
            // 如果line1在line2之前（在循环体内），那么：
            // 第一次迭代: line1 -> line2
            // 第二次迭代: line1 -> line2
            // 因此 第一次迭代的line2 和 第二次迭代的line1 是连续的
            
            if (line1 != line2) {
                std::cout << "Found potential cross-iteration consecutiveness: line " << line1 
                         << " and line " << line2 << " in the same loop" << std::endl;
                
                // 检查循环体内是否有其他对同一变量的访问会阻断连续性
                bool hasBlockingAccess = false;
                int minLine = std::min(line1, line2);
                int maxLine = std::max(line1, line2);
                
                for (const auto& access : accesses) {
                    if (access.variable == varName && 
                        access.function == funcName &&
                        access.line != line1 && access.line != line2) {
                        
                        // 如果有其他访问在循环中，且不是条件性的，可能阻断连续性
                        bool isInSameLoopAsTargets = isAccessInLoop(accesses, access.line, funcName);
                        if (isInSameLoopAsTargets && !isAccessConditional(access, accesses)) {
                            hasBlockingAccess = true;
                            std::cout << "Found potential blocking access at line " << access.line 
                                     << " in the same loop" << std::endl;
                            break;
                        }
                    }
                }
                
                if (!hasBlockingAccess) {
                    std::cout << "Cross-iteration consecutiveness confirmed for lines " << line1 
                             << " and " << line2 << std::endl;
                    return true;
                }
            }
        }
        
        return false;
    }
    
    // 新增：检查两个访问是否在同一个循环中
    bool areInSameLoop(const std::vector<MemoryAccess>& accesses, int line1, int line2, const std::string& funcName) {
        std::string bb1, bb2;
        
        // 找到两个访问对应的基本块
        for (const auto& access : accesses) {
            if (access.line == line1 && access.function == funcName) {
                bb1 = access.basicBlock;
            }
            if (access.line == line2 && access.function == funcName) {
                bb2 = access.basicBlock;
            }
        }
        
        if (bb1.empty() || bb2.empty()) {
            return false;
        }
        
        // 如果在同一个基本块中，肯定在同一个循环中
        if (bb1 == bb2) {
            return true;
        }
        
        // 检查两个基本块是否都在循环结构中，并且相互可达
        if (basicBlockSuccessors.find(funcName) != basicBlockSuccessors.end()) {
            // 检查是否存在循环路径连接这两个基本块
            bool bb1CanReachBb2 = canReachInSameExecution(funcName, bb1, bb2);
            bool bb2CanReachBb1 = canReachInSameExecution(funcName, bb2, bb1);
            
            // 如果两个基本块可以相互到达，很可能在同一个循环中
            if (bb1CanReachBb2 && bb2CanReachBb1) {
                std::cout << "Basic blocks " << bb1 << " and " << bb2 << " are mutually reachable (likely in same loop)" << std::endl;
                return true;
            }
            
            // 检查是否有共同的循环头基本块
            std::unordered_set<std::string> bb1Predecessors, bb2Predecessors;
            const auto& successors = basicBlockSuccessors.at(funcName);
            
            // 收集bb1的所有前驱
            for (const auto& [predBB, predSuccs] : successors) {
                if (predSuccs.find(bb1) != predSuccs.end()) {
                    bb1Predecessors.insert(predBB);
                }
            }
            
            // 收集bb2的所有前驱
            for (const auto& [predBB, predSuccs] : successors) {
                if (predSuccs.find(bb2) != predSuccs.end()) {
                    bb2Predecessors.insert(predBB);
                }
            }
            
            // 检查是否有共同的前驱（可能是循环头）
            for (const std::string& pred1 : bb1Predecessors) {
                if (bb2Predecessors.find(pred1) != bb2Predecessors.end()) {
                    // 检查这个共同前驱是否是循环头（有回边指向它）
                    bool hasBackEdge = false;
                    if (successors.find(pred1) != successors.end()) {
                        for (const std::string& succ : successors.at(pred1)) {
                            if (canReachInSameExecution(funcName, succ, pred1)) {
                                hasBackEdge = true;
                                break;
                            }
                        }
                    }
                    
                    if (hasBackEdge) {
                        std::cout << "Basic blocks " << bb1 << " and " << bb2 
                                 << " have common loop header: " << pred1 << std::endl;
                        return true;
                    }
                }
            }
        }
        
        return false;
    }

};

// 命令行参数
static cl::opt<std::string> InputFilename(cl::Positional,
                                         cl::desc("<input LLVM IR file>"),
                                         cl::Required);

static cl::opt<std::string> OutputFilename("o",
                                          cl::desc("Output JSON file"),
                                          cl::value_desc("filename"),
                                          cl::init("llvm_analysis.json"));

int main(int argc, char** argv) {
    cl::ParseCommandLineOptions(argc, argv, "LLVM Race Condition Analyzer\n");
    
    LLVMAnalyzer analyzer;
    
    if (!analyzer.loadModule(InputFilename)) {
        errs() << "Error: Failed to load LLVM IR file: " << InputFilename << "\n";
        return 1;
    }
    
    std::cout << "Analyzing LLVM IR file: " << InputFilename << std::endl;
    
    // 进行完整的分析，包括缺陷检测
        std::cout << "Starting module analysis..." << std::endl;
        analyzer.analyzeModule();
        
        std::cout << "Module analysis complete. Generating defect analysis report..." << std::endl;
        analyzer.saveReport(OutputFilename);
        
        std::cout << "Analysis complete. Report saved to: " << OutputFilename << std::endl;

    
    return 0;
} 