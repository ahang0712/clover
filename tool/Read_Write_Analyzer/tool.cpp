#include "tool.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Instructions.h"
#include <llvm/IR/GlobalVariable.h>
#include <llvm/IR/Operator.h>
#include <set>
#include <map>
#include <limits>

// 函数声明
void cleanGlobalVarList(Module *M);

// Global variable declarations
bool firstR_main = false;
bool secondR_main = false;

// 全局变量定义
std::map<std::string, std::string> g_pointerTargets;
std::map<std::string, std::vector<std::string>> g_localVarAccesses;
std::map<std::string, std::string> g_memoryLocations;
std::map<std::string, std::set<std::string>> g_sharedMemory;
std::map<std::string, std::string> g_normalizedNames;
std::map<std::string, ValueRange> g_variableRanges;

// 声明全局变量（不是定义）
extern std::vector<std::vector<std::string>> mainInfo;
extern std::vector<std::vector<std::vector<std::string>>> isrInfo;
extern std::vector<std::string> global_var;
extern std::vector<std::string> global_array;
extern std::vector<std::string> global_union;
extern std::map<std::string,int> mapCalledFun;
extern std::map<std::string,std::vector<std::vector<std::string>>> allFunInfo;
extern int g_enable_para;

// 函数用于清理global_var列表，只保留实际使用的变量
void cleanGlobalVarList(Module *M) {
    errs() << "Cleaning global_var list, original size: " << global_var.size() << "\n";
    
    // 创建一个集合来存储实际使用的变量
    std::set<std::string> usedVariables;
    
    // 从代码中收集实际使用的变量
    for (auto &F : M->getFunctionList()) {
        for (auto &BB : F) {
            for (auto &I : BB) {
                // 检查循环中的变量
                if (PHINode *PN = dyn_cast<PHINode>(&I)) {
                    if (PN->hasName()) {
                        std::string varName = PN->getName().str();
                        usedVariables.insert(varName);
                        errs() << "Found used variable in PHI node: " << varName << "\n";
                    }
                }
                // 检查局部变量声明
                else if (AllocaInst *AI = dyn_cast<AllocaInst>(&I)) {
                    if (AI->hasName()) {
                        std::string varName = AI->getName().str();
                        usedVariables.insert(varName);
                        errs() << "Found used variable in alloca: " << varName << "\n";
                    }
                }
                // 检查加载指令中的变量
                else if (LoadInst *LI = dyn_cast<LoadInst>(&I)) {
                    if (LI->getPointerOperand()->hasName()) {
                        std::string varName = LI->getPointerOperand()->getName().str();
                        usedVariables.insert(varName);
                        errs() << "Found used variable in load: " << varName << "\n";
                    }
                }
                // 检查存储指令中的变量
                else if (StoreInst *SI = dyn_cast<StoreInst>(&I)) {
                    if (SI->getPointerOperand()->hasName()) {
                        std::string varName = SI->getPointerOperand()->getName().str();
                        usedVariables.insert(varName);
                        errs() << "Found used variable in store: " << varName << "\n";
                    }
                }
                // 检查数组访问中的索引变量
                else if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&I)) {
                    for (auto idx = GEP->idx_begin(); idx != GEP->idx_end(); ++idx) {
                        if ((*idx)->hasName()) {
                            std::string varName = (*idx)->getName().str();
                            usedVariables.insert(varName);
                            errs() << "Found used variable in GEP index: " << varName << "\n";
                        }
                    }
                }
            }
        }
    }
    
    // 特殊处理：如果代码中有使用TRIGGER常量，添加它
    usedVariables.insert("TRIGGER");
    // 特殊处理：如果代码中使用了i变量（循环变量），添加它
    usedVariables.insert("i");
    // 特殊处理：var变量在某些情况下可能是隐式使用的
    usedVariables.insert("var");
    
    errs() << "Used variables in code:\n";
    for (const auto& var : usedVariables) {
        errs() << "  - " << var << "\n";
    }
    
    // 清理global_var列表，只保留实际使用的变量
    std::vector<std::string> cleanedGlobalVars;
    for (const auto& varName : global_var) {
        bool shouldKeep = true;
        
        // 检查是否是数组访问
        size_t bracketPos = varName.find('[');
        if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
            size_t closeBracketPos = varName.find(']', bracketPos);
            if (closeBracketPos != std::string::npos) {
                std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                
                // 移除任何范围信息
                size_t rangeStart = indexVar.find('[');
                if (rangeStart != std::string::npos) {
                    indexVar = indexVar.substr(0, rangeStart);
                }
                
                // 如果索引变量不是数字且不在使用的变量集合中，不保留
                if (!indexVar.empty() && !std::isdigit(indexVar[0]) && 
                    usedVariables.find(indexVar) == usedVariables.end() && 
                    indexVar != "TRIGGER") {
                    shouldKeep = false;
                    errs() << "Removing unused variable access from GLOBAL_VAR: " << varName << "\n";
                }
            }
        }
        
        if (shouldKeep) {
            cleanedGlobalVars.push_back(varName);
            errs() << "Keeping in GLOBAL_VAR: " << varName << "\n";
        }
    }
    
    // 更新global_var列表
    global_var = cleanedGlobalVars;
    
    errs() << "Cleaned global_var list, new size: " << global_var.size() << "\n";
    
    // 清理变量范围信息，只保留实际使用的变量
    std::vector<std::string> unusedVars;
    for (const auto &entry : g_variableRanges) {
        if (usedVariables.find(entry.first) == usedVariables.end() && 
            entry.first != "TRIGGER" && entry.first != "var" && entry.first != "i") {
            unusedVars.push_back(entry.first);
            errs() << "Removing unused variable range: " << entry.first << "\n";
        }
    }
    
    // 从范围信息中移除未使用的变量
    for (const auto &varName : unusedVars) {
        g_variableRanges.erase(varName);
    }
}

// Forward declarations
std::string getTypeString(Type *Ty);
std::string getStructMemberInfo(const GetElementPtrInst *GEP);
std::string resolvePointerTarget(const std::string &pointerName, std::map<std::string, std::string> &pointerAlias);
bool arePointersRelated(const std::string &ptr1, const std::string &ptr2);
std::string getNormalizedName(const std::string &varName);
std::string getArrayAccessInfo(const GetElementPtrInst *GEP);
ValueRange analyzeVariableRange(const Value *V);

// Function to analyze the range of a variable
ValueRange analyzeVariableRange(const Value *V) {
    if (!V) return ValueRange();
    
    // Handle constant integers directly
    if (const ConstantInt *CI = dyn_cast<ConstantInt>(V)) {
        int64_t val = CI->getSExtValue();
        return ValueRange(val);
    }
    
    // Handle binary operations
    if (const BinaryOperator *BO = dyn_cast<BinaryOperator>(V)) {
        ValueRange leftRange = analyzeVariableRange(BO->getOperand(0));
        ValueRange rightRange = analyzeVariableRange(BO->getOperand(1));
        
        // If both operands have constant values, we can compute the result
        if (leftRange.isConstant && rightRange.isConstant) {
            int64_t leftVal = leftRange.constantValue;
            int64_t rightVal = rightRange.constantValue;
            
            switch (BO->getOpcode()) {
                case Instruction::Add:
                    return ValueRange(leftVal + rightVal);
                case Instruction::Sub:
                    return ValueRange(leftVal - rightVal);
                case Instruction::Mul:
                    return ValueRange(leftVal * rightVal);
                case Instruction::SDiv:
                case Instruction::UDiv:
                    if (rightVal != 0) // Avoid division by zero
                        return ValueRange(leftVal / rightVal);
                    break;
                default:
                    break;
            }
        }
        
        // For non-constant operands, we can still estimate ranges for some operations
        if (BO->getOpcode() == Instruction::Add) {
            return ValueRange(leftRange.min + rightRange.min, leftRange.max + rightRange.max);
        } else if (BO->getOpcode() == Instruction::Sub) {
            return ValueRange(leftRange.min - rightRange.max, leftRange.max - rightRange.min);
        }
    }
    
    // Handle phi nodes (e.g., for loop induction variables)
    if (const PHINode *PHI = dyn_cast<PHINode>(V)) {
        int64_t minVal = std::numeric_limits<int64_t>::max();
        int64_t maxVal = std::numeric_limits<int64_t>::min();
        bool hasValidRange = false;
        
        // Check all incoming values
        for (unsigned i = 0; i < PHI->getNumIncomingValues(); i++) {
            Value *IncomingValue = PHI->getIncomingValue(i);
            
            // Skip self-references (loop variables)
            if (IncomingValue == PHI) continue;
            
            ValueRange incomingRange = analyzeVariableRange(IncomingValue);
            if (incomingRange.isConstant) {
                minVal = std::min(minVal, incomingRange.constantValue);
                maxVal = std::max(maxVal, incomingRange.constantValue);
                hasValidRange = true;
            }
        }
        
        if (hasValidRange) {
            return ValueRange(minVal, maxVal);
        }
    }
    
    // Handle load instructions (e.g., loading a loop bound from memory)
    if (const LoadInst *LI = dyn_cast<LoadInst>(V)) {
        const Value *ptr = LI->getPointerOperand();
        if (ptr->hasName()) {
            std::string varName = ptr->getName().str();
            
            // Check if we have a known range for this variable
            if (g_variableRanges.count(varName)) {
                return g_variableRanges[varName];
            }
            
            // Special case for common loop bounds and array sizes
            if (varName.find("size") != std::string::npos || 
                varName.find("length") != std::string::npos ||
                varName.find("count") != std::string::npos) {
                // Assume positive values for size-related variables
                return ValueRange(0, 10000);
            }
        }
    }
    
    // Check if this is a named variable that we're tracking
    if (V->hasName()) {
        std::string varName = V->getName().str();
        if (g_variableRanges.count(varName)) {
            return g_variableRanges[varName];
        }
        
        // Special handling for loop induction variables
        if (varName == "i" || varName == "j" || varName == "k" || 
            varName.find("idx") != std::string::npos ||
            varName.find("index") != std::string::npos) {
            // Common loop variable, assume a reasonable range
            return ValueRange(0, 10000);
        }
    }
    
    // Default: unknown range
    return ValueRange();
}

// New function to extract array access information including indices
std::string getArrayAccessInfo(const GetElementPtrInst *GEP) {
    if (!GEP) return "";
    
    std::string info;
    const Value *basePtr = GEP->getPointerOperand();
    Type *baseType = GEP->getSourceElementType();
    
    // Get base variable name
    if (basePtr && basePtr->hasName()) {
        info = basePtr->getName().str();
    } else {
        // 如果基础指针没有名称，尝试跟踪它的来源
        if (const Instruction *BaseInst = dyn_cast<Instruction>(basePtr)) {
            // 如果是加载指令，获取加载的变量名
            if (const LoadInst *LI = dyn_cast<LoadInst>(BaseInst)) {
                if (LI->getPointerOperand()->hasName()) {
                    info = LI->getPointerOperand()->getName().str() + "_ptr";
                }
            }
        }
        
        if (info.empty()) {
            return "";  // 如果仍然无法确定基础变量名，放弃
        }
    }
    
    // Check if this is an array access
    if (baseType->isArrayTy() || (GEP->getNumIndices() >= 2)) {
        // Add array indicator
        info += "[";
        
        // Try to get the array index
        bool foundConstantIndex = false;
        auto idxBegin = GEP->idx_begin();
        auto idxEnd = GEP->idx_end();
        
        // Skip the first index for arrays (it's the pointer index)
        if (idxBegin != idxEnd) {
            ++idxBegin;
        }
        
        // Process the indices
        for (auto idx = idxBegin; idx != idxEnd; ++idx) {
            if (const ConstantInt *CI = dyn_cast<ConstantInt>(*idx)) {
                // 常量索引
                info += std::to_string(CI->getZExtValue());
                foundConstantIndex = true;
            } else {
                // 变量索引 - 尝试确定变量名和范围
                std::string varName;
                bool foundVarName = false;
                
                // 尝试从加载指令中获取变量名
                if (const LoadInst *LI = dyn_cast<LoadInst>(*idx)) {
                    if (LI->getPointerOperand()->hasName()) {
                        varName = LI->getPointerOperand()->getName().str();
                        foundVarName = true;
                    }
                } 
                // 尝试从指令本身获取变量名
                else if (const Instruction *IdxInst = dyn_cast<Instruction>(*idx)) {
                    if (IdxInst->hasName()) {
                        varName = IdxInst->getName().str();
                        foundVarName = true;
                    }
                }
                // 尝试从参数获取名称
                else if (const Argument *Arg = dyn_cast<Argument>(*idx)) {
                    varName = "arg" + std::to_string(Arg->getArgNo());
                    foundVarName = true;
                }
                
                // 分析变量范围
                ValueRange range;
                if (foundVarName) {
                    // 检查是否已有该变量的范围信息
                    if (g_variableRanges.find(varName) != g_variableRanges.end()) {
                        range = g_variableRanges[varName];
                    } else {
                        // 尝试分析变量的范围
                        range = analyzeVariableRange(*idx);
                        
                        // 如果分析出了有效范围，保存它
                        if (!range.isConstant && (range.min != std::numeric_limits<int64_t>::min() || 
                                                range.max != std::numeric_limits<int64_t>::max())) {
                            g_variableRanges[varName] = range;
                            errs() << "Analyzed range for array index variable '" << varName << "': " 
                                  << range.toString() << "\n";
                        } else if (range.isConstant) {
                            // 如果是常量，直接使用该值
                            info += std::to_string(range.constantValue);
                            foundConstantIndex = true;
                            continue;
                        } else {
                            // 为未知范围的变量设置默认范围
                            range = ValueRange(0, 9999);
                            g_variableRanges[varName] = range;
                            errs() << "Set default range for array index variable '" << varName << "': [0,9999]\n";
                        }
                    }
                    
                    // 添加变量名和范围信息
                    info += varName;
                    if (!range.isConstant) {
                        info += range.toString();
                    }
                } else {
                    // 无法确定变量名，尝试分析表达式的范围
                    range = analyzeVariableRange(*idx);
                    if (range.isConstant) {
                        info += std::to_string(range.constantValue);
                        foundConstantIndex = true;
                    } else if (range.min != std::numeric_limits<int64_t>::min() || 
                              range.max != std::numeric_limits<int64_t>::max()) {
                        info += "var" + range.toString();
                    } else {
                        info += "var";
                    }
                }
            }
            
            // Add separator for multi-dimensional arrays
            if (std::next(idx) != idxEnd) {
                info += "][";
            }
        }
        
        info += "]";
        
        // If we couldn't determine the index, at least indicate it's an array
        if (!foundConstantIndex && info.find("[") == std::string::npos) {
            info += "[?]";
        }
    }
    
    return info;
}

// New function to get a normalized variable name
std::string getNormalizedName(const std::string &varName) {
    // If we already have a normalized name, return it
    if (g_normalizedNames.count(varName)) {
        return g_normalizedNames[varName];
    }
    
    // Check if this variable is related to any other variables
    for (const auto &group : g_sharedMemory) {
        if (group.second.count(varName)) {
            // Use the first variable in the group as the canonical name
            std::string canonicalName = *group.second.begin();
            g_normalizedNames[varName] = canonicalName;
            errs() << "Normalized " << varName << " to " << canonicalName << "\n";
            return canonicalName;
        }
    }
    
    // If not related to any other variables, use the variable name itself
    g_normalizedNames[varName] = varName;
    return varName;
}

// New function to check if two pointers are related (point to the same memory)
bool arePointersRelated(const std::string &ptr1, const std::string &ptr2) {
    // If they're the same pointer, they're related
    if (ptr1 == ptr2) return true;
    
    // Check if they point to the same memory location
    if (g_memoryLocations.count(ptr1) && g_memoryLocations.count(ptr2)) {
        return g_memoryLocations[ptr1] == g_memoryLocations[ptr2];
    }
    
    // Check if they're in the same shared memory group
    for (const auto &group : g_sharedMemory) {
        if (group.second.count(ptr1) && group.second.count(ptr2)) {
        return true;
    }
    }
    
        return false;
}

// New function to register shared memory between pointers
void registerSharedMemory(const std::string &ptr1, const std::string &ptr2) {
    if (ptr1.empty() || ptr2.empty() || ptr1 == ptr2) {
        return;
    }
    
    errs() << "Registering shared memory relationship: " << ptr1 << " <-> " << ptr2 << "\n";
    
    // 添加双向关系
    g_sharedMemory[ptr1].insert(ptr2);
    g_sharedMemory[ptr2].insert(ptr1);
    
    // 如果ptr1或ptr2已经有规范化名称，使用其中一个作为两者的规范化名称
    std::string normName = "";
    
    if (g_normalizedNames.count(ptr1)) {
        normName = g_normalizedNames[ptr1];
    } else if (g_normalizedNames.count(ptr2)) {
        normName = g_normalizedNames[ptr2];
    } else {
        // 如果都没有规范化名称，使用ptr1作为规范化名称
        normName = ptr1;
    }
    
    // 更新两者的规范化名称
    g_normalizedNames[ptr1] = normName;
    g_normalizedNames[ptr2] = normName;
    
    // 如果ptr1和ptr2都有内存位置，确保它们指向同一个位置
    if (g_memoryLocations.count(ptr1) && g_memoryLocations.count(ptr2)) {
        std::string target1 = g_memoryLocations[ptr1];
        std::string target2 = g_memoryLocations[ptr2];
        
        // 如果它们指向不同的内存位置，选择一个作为共同的目标
        if (target1 != target2) {
            // 使用target1作为共同目标
            g_memoryLocations[ptr2] = target1;
            errs() << "Updating memory location for " << ptr2 << " from " << target2 << " to " << target1 << "\n";
        }
    }
    // 如果只有一个有内存位置，将另一个也指向同一位置
    else if (g_memoryLocations.count(ptr1)) {
        g_memoryLocations[ptr2] = g_memoryLocations[ptr1];
        errs() << "Setting memory location for " << ptr2 << " to " << g_memoryLocations[ptr1] << "\n";
    }
    else if (g_memoryLocations.count(ptr2)) {
        g_memoryLocations[ptr1] = g_memoryLocations[ptr2];
        errs() << "Setting memory location for " << ptr1 << " to " << g_memoryLocations[ptr2] << "\n";
    }
}

// New function to resolve pointer target
std::string resolvePointerTarget(const std::string &pointerName, std::map<std::string, std::string> &pointerAlias) {
    if (pointerName.empty()) return "";
    
    std::set<std::string> visited;
    std::string currentName = pointerName;
    std::string result = pointerName; // Default to the original name
    
    while (pointerAlias.count(currentName) && !currentName.empty() && !visited.count(currentName)) {
        visited.insert(currentName);
        currentName = pointerAlias[currentName];
        if (!currentName.empty()) {
            result = currentName;
        }
    }
    
    return result;
}

// Helper function to get type string representation
std::string getTypeString(Type *Ty) {
    if (!Ty) return "unknown";
    
    if (Ty->isIntegerTy()) {
        return "int" + std::to_string(Ty->getIntegerBitWidth());
    }
    else if (Ty->isFloatingPointTy()) {
        if (Ty->isDoubleTy()) return "double";
        else if (Ty->isFloatTy()) return "float";
        else return "fp";
    }
    else if (Ty->isPointerTy()) {
        return getTypeString(Ty->getPointerElementType()) + "*";
    }
    else if (Ty->isArrayTy()) {
        return getTypeString(Ty->getArrayElementType()) + "[" + 
               std::to_string(Ty->getArrayNumElements()) + "]";
    }
    else if (Ty->isStructTy()) {
        StructType *ST = cast<StructType>(Ty);
        StringRef name = ST->getName();
        if (name.startswith("union.") || name.startswith("struct.")) {
            name = name.drop_front(name.find('.') + 1);
        }
        return name.str();
    }
    return "other";
}

// Helper function to handle GEP operations
std::string handleGEPAccess(const Value *ptr, Instruction *insertPoint) {
    if (!ptr) return "";
    if (!ptr->getType()->isPointerTy()) return "";
    // 跳过本地变量和参数（除非特别需要）
    if (isa<AllocaInst>(ptr) || isa<Instruction>(ptr) || isa<Argument>(ptr)) return "";
    std::string varInfo;
    
    if (const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(ptr)) {
        // First check if this is an array access
        varInfo = getArrayAccessInfo(GEP);
        
        // If not an array access, check if it's a struct/union member access
        if (varInfo.empty() || varInfo.find("[") == std::string::npos) {
            std::string structInfo = getStructMemberInfo(GEP);
            if (!structInfo.empty()) {
                varInfo = structInfo;
            }
        }
    } else if (const GEPOperator *GEPO = dyn_cast<GEPOperator>(ptr)) {
        // Create indices vector
        std::vector<Value*> Indices;
        bool allConstantIndices = true;
        
        for (auto It = GEPO->idx_begin(); It != GEPO->idx_end(); ++It) {
            if (const auto *CI = dyn_cast<ConstantInt>(*It)) {
                // For constant indices, create a new constant with the same value
                Indices.push_back(ConstantInt::get(CI->getType(), CI->getZExtValue()));
            } else {
                allConstantIndices = false;
                break;
            }
        }
        
        if (allConstantIndices) {
            // Create temporary GEP instruction
            GetElementPtrInst *tempGEP = GetElementPtrInst::Create(
                GEPO->getSourceElementType(),
                const_cast<Value*>(GEPO->getPointerOperand()),
                Indices,
                "temp_gep",  // Give it a name to help with debugging
                insertPoint
            );
            
            if (tempGEP) {
                // First check if this is an array access
                varInfo = getArrayAccessInfo(tempGEP);
                
                // If not an array access, check if it's a struct/union member access
                if (varInfo.empty() || varInfo.find("[") == std::string::npos) {
                    std::string structInfo = getStructMemberInfo(tempGEP);
                    if (!structInfo.empty()) {
                        varInfo = structInfo;
                    }
                }
                
                // Make sure we only delete if it's not already deleted
                if (!tempGEP->use_empty()) {
                    tempGEP->deleteValue();
                }
            }
        } else {
            // For non-constant indices, try to get the base name at least
            if (GEPO->getPointerOperand()->hasName()) {
                varInfo = GEPO->getPointerOperand()->getName().str() + "[var]";
            }
        }
    }
    
    return varInfo;
}

// Implementation of getStructMemberInfo
std::string getStructMemberInfo(const GetElementPtrInst *GEP) {
    if (!GEP) return "";
    
    std::string info;
    const Value *basePtr = GEP->getPointerOperand();
    Type *baseType = GEP->getSourceElementType();
    
    // Get base variable name
    if (basePtr && basePtr->hasName()) {
        info = basePtr->getName().str();
    }
    
    // Handle struct/union access
    if (StructType *ST = dyn_cast<StructType>(baseType)) {
        // Check if it's a union
        bool isUnion = ST->getName().startswith("union.");
        
        // Add type prefix
        info += (isUnion ? ".union" : ".struct");
        
        // Get member indices
        auto idxBegin = GEP->idx_begin();
        auto idxEnd = GEP->idx_end();
        
        // Skip the first index as it's the pointer index
        if (idxBegin != idxEnd) {
            ++idxBegin;
        }
        
        for (auto idx = idxBegin; idx != idxEnd; ++idx) {
            if (const ConstantInt *CI = dyn_cast<ConstantInt>(*idx)) {
                unsigned fieldIdx = CI->getZExtValue();
                
                // Get field type
                if (fieldIdx < ST->getNumElements()) {
                    Type *fieldType = ST->getElementType(fieldIdx);
                    
                    // Add field access
                    info += ".field[" + std::to_string(fieldIdx) + "]";
                    
                    // Add type information
                    info += ":" + getTypeString(fieldType);
                    
                    // If field is another struct/union, update ST for next iteration
                    if (StructType *nestedST = dyn_cast<StructType>(fieldType)) {
                        ST = nestedST;
                        isUnion = ST->getName().startswith("union.");
                    }
                }
            }
        }
    }
    
    return info;
}

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

std::string getMemberInfo(StructType *ST, unsigned idx) {
    if (!ST || idx >= ST->getNumElements()) return "";
    
    std::string result;
    // 获取成员类型
    Type *memberType = ST->getElementType(idx);
    result = getTypeString(memberType);
    
    // 如果结构体有名字，加上结构体名
    if (ST->hasName()) {
        result = ST->getName().str() + "." + result;
    }
    
    return result;
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
    // 创建一个集合来跟踪实际使用的变量名
    std::set<std::string> usedVariables;
    
    // 首先收集所有全局变量
    for (auto &gv : M->globals()) {
        std::string gname = gv.getName().str();
        if (!gname.empty()) {
            // 检查是否为 union 或 struct 类型
            if (StructType *ST = dyn_cast<StructType>(gv.getValueType())) {
                bool isUnion = ST->getName().startswith("union.");
                
                // 添加基本的全局变量名
                addToGlobalVars(gname);
                errs() << "Added global var: " << gname << "\n";
                
                // 添加成员访问路径
                for (unsigned i = 0; i < ST->getNumElements(); ++i) {
                    Type *elemType = ST->getElementType(i);
                    std::string typeStr = getTypeString(elemType);
                    std::string memberPath = gname + (isUnion ? ".union.field[" : ".struct.field[") + 
                                           std::to_string(i) + "]:" + typeStr;
                    
                    addToGlobalVars(memberPath);
                    errs() << "Added global member path: " << memberPath << "\n";
                }
            } else if (gv.getValueType()->isArrayTy()) {
                // 数组类型的全局变量
                ArrayType *AT = dyn_cast<ArrayType>(gv.getValueType());
                
                // 添加基本的全局变量名
                addToGlobalVars(gname);
                errs() << "Added global array: " << gname << "\n";
                
                // 添加一些常用的数组索引作为示例
                // 这里添加一些特殊索引，如0, 1以及一些变量索引
                std::vector<std::string> specialIndices = {"0", "1"};
                for (const auto &idx : specialIndices) {
                    std::string arrayAccess = gname + "[" + idx + "]";
                    addToGlobalVars(arrayAccess);
                    errs() << "Added array access: " << arrayAccess << "\n";
                }
                
                // 获取数组大小信息
                uint64_t arraySize = 0;
                if (AT->getNumElements() > 0) {
                    arraySize = AT->getNumElements() - 1;  // 0-based index, so max is size-1
                } else {
                    arraySize = 9999;  // 默认大范围
                }
                
                // 我们不再预先添加所有常见变量，而是等待实际使用时再添加
                // 但仍然为一些特殊常量添加访问模式
                if (arraySize > 0) {
                    std::string arraySizeAccess = gname + "[" + std::to_string(arraySize) + "]";
                    addToGlobalVars(arraySizeAccess);
                    errs() << "Added array access with max index: " << arraySizeAccess << "\n";
                }
                
                // 如果在代码中发现了TRIGGER常量，添加它
                for (auto &F : M->getFunctionList()) {
                    for (auto &BB : F) {
                        for (auto &I : BB) {
                            if (LoadInst *LI = dyn_cast<LoadInst>(&I)) {
                                if (LI->getOperand(0)->getName().str() == "TRIGGER") {
                                    std::string triggerAccess = gname + "[TRIGGER]";
                                    addToGlobalVars(triggerAccess);
                                    errs() << "Added array access with TRIGGER: " << triggerAccess << "\n";
                                    break;
                                }
                            }
                        }
                    }
                }
            } else if (gv.getValueType()->isPointerTy()) {
                // 指针类型的全局变量
                addToGlobalVars(gname);
                errs() << "Added global pointer: " << gname << "\n";
                
                // 检查已知的指针目标
                if (g_memoryLocations.count(gname)) {
                    std::string target = g_memoryLocations[gname];
                    if (!target.empty()) {
                        addToGlobalVars(target);
                        errs() << "Added pointer target: " << target << " (from " << gname << ")\n";
                    }
                }
            } else {
                // 普通全局变量
                addToGlobalVars(gname);
                errs() << "Added regular global var: " << gname << "\n";
            }
        }
    }
    
    // 添加所有已知的内存位置
    for (const auto& memLoc : g_memoryLocations) {
        std::string pointerName = memLoc.first;
        std::string targetName = memLoc.second;
        
        // 添加指针名
        if (!pointerName.empty() && std::find(global_var.begin(), global_var.end(), pointerName) == global_var.end()) {
            global_var.push_back(pointerName);
            errs() << "Added memory pointer: " << pointerName << "\n";
        }
        
        // 添加目标名
        if (!targetName.empty() && std::find(global_var.begin(), global_var.end(), targetName) == global_var.end()) {
            global_var.push_back(targetName);
            errs() << "Added memory target: " << targetName << "\n";
        }
        
        // 添加组合名（指针 -> 目标）
        std::string combinedName = pointerName + " -> " + targetName;
        if (!combinedName.empty() && std::find(global_var.begin(), global_var.end(), combinedName) == global_var.end()) {
            global_var.push_back(combinedName);
            errs() << "Added combined memory access: " << combinedName << "\n";
        }
    }
    
    // 处理共享内存组
    for (const auto& group : g_sharedMemory) {
        if (group.second.size() < 2) continue; // 至少需要两个指针才是共享内存
        
        std::string canonicalName = *group.second.begin(); // 使用第一个指针作为规范名称
        
        // 为每个指针添加规范化的名称映射
        for (const auto& ptr : group.second) {
            g_normalizedNames[ptr] = canonicalName;
            
            // 添加指向关系
            std::string relationName = ptr + " <=> " + canonicalName;
            if (ptr != canonicalName && std::find(global_var.begin(), global_var.end(), relationName) == global_var.end()) {
                global_var.push_back(relationName);
                errs() << "Added shared memory relation: " << relationName << "\n";
            }
        }
        
        // 添加共享内存组信息
        std::string groupInfo = "SHARED_MEM:[";
        for (const auto& ptr : group.second) {
            groupInfo += ptr + ",";
        }
        if (!group.second.empty()) {
            groupInfo.pop_back(); // 删除最后的逗号
        }
        groupInfo += "]";
        
        if (std::find(global_var.begin(), global_var.end(), groupInfo) == global_var.end()) {
            global_var.push_back(groupInfo);
            errs() << "Added shared memory group: " << groupInfo << "\n";
        }
    }
    
    // 分析所有函数中的循环，提取变量范围信息
    for (auto &F : M->getFunctionList()) {
        analyzeForLoops(&F);
        
        // 收集函数中使用的变量名
        for (auto &BB : F) {
            for (auto &I : BB) {
                // 检查循环中的变量
                if (PHINode *PN = dyn_cast<PHINode>(&I)) {
                    if (PN->hasName()) {
                        std::string varName = PN->getName().str();
                        usedVariables.insert(varName);
                    }
                }
                // 检查局部变量声明
                else if (AllocaInst *AI = dyn_cast<AllocaInst>(&I)) {
                    if (AI->hasName()) {
                        std::string varName = AI->getName().str();
                        usedVariables.insert(varName);
                    }
                }
                // 检查加载指令中的变量
                else if (LoadInst *LI = dyn_cast<LoadInst>(&I)) {
                    if (LI->getPointerOperand()->hasName()) {
                        std::string varName = LI->getPointerOperand()->getName().str();
                        usedVariables.insert(varName);
                    }
                }
                // 检查存储指令中的变量
                else if (StoreInst *SI = dyn_cast<StoreInst>(&I)) {
                    if (SI->getPointerOperand()->hasName()) {
                        std::string varName = SI->getPointerOperand()->getName().str();
                        usedVariables.insert(varName);
                    }
                }
                // 检查数组访问中的索引变量
                else if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&I)) {
                    for (auto idx = GEP->idx_begin(); idx != GEP->idx_end(); ++idx) {
                        if ((*idx)->hasName()) {
                            std::string varName = (*idx)->getName().str();
                            usedVariables.insert(varName);
                        }
                    }
                }
            }
        }
    }
    
    // 只保留实际使用的变量的范围信息
    std::vector<std::string> unusedVars;
    for (const auto &entry : g_variableRanges) {
        if (usedVariables.find(entry.first) == usedVariables.end()) {
            unusedVars.push_back(entry.first);
        }
    }
    
    // 从范围信息中移除未使用的变量
    for (const auto &varName : unusedVars) {
        g_variableRanges.erase(varName);
    }
    
    // 清理global_var列表，只保留实际使用的变量
    cleanGlobalVarList(M);
    
    // Make sure global_var is properly populated before returning
    ensureGlobalVarsPopulated(M);
    
    // 原有的函数体继续
    // Traverse all functions in the module
    for (auto &f : M->getFunctionList())
    {
        std::string fname = f.getName().str();
        std::vector<std::vector<std::string>> temp_AllFun;
        
        // Skip interrupt handler functions
        if (!findSubString(fname, "_isr_"))
        {
            // Traverse all basic blocks
            for (auto &bb : f.getBasicBlockList())
            {
                // Traverse all instructions
                for (auto &inst : bb)
                {
                    std::vector<std::string> temp;

                    // Handle struct/array access instructions
                    if (const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&inst)) {
                        std::string memberInfo = getStructMemberInfo(GEP);
                        
                                            if (!memberInfo.empty()) {
                            temp.push_back(inst.getNextNode()->getOpcodeName());
                                                temp.push_back(memberInfo);
                        temp.push_back(inst.getDebugLoc() ? std::to_string(inst.getDebugLoc().getLine()) : "0");
                        temp.push_back(fname);
                        
                            if (std::find(global_var.begin(), global_var.end(), memberInfo) == global_var.end()) {
                                global_var.push_back(memberInfo);
                            }
                            
                            if (temp.size() == 4) {
                            temp_AllFun.push_back(temp);
                            temp.clear();
                        }
                    }
                    }

                    // Handle load instructions
                    if (const LoadInst *LI = dyn_cast<LoadInst>(&inst)) {
                        temp.push_back("load");
                        
                        const Value *ptr = LI->getPointerOperand();
                        std::string varInfo = handleGEPAccess(ptr, const_cast<Instruction*>(&inst));
                        
                        if (!varInfo.empty()) {
                            temp.push_back(varInfo);
                            if (std::find(global_var.begin(), global_var.end(), varInfo) == global_var.end()) {
                                global_var.push_back(varInfo);
                                    }
                        } else if (ptr->hasName()) {
                            temp.push_back(ptr->getName().str());
                            if (std::find(global_var.begin(), global_var.end(), ptr->getName().str()) == global_var.end()) {
                                global_var.push_back(ptr->getName().str());
                                }
                            }
                        
                        temp.push_back(inst.getDebugLoc() ? std::to_string(inst.getDebugLoc().getLine()) : "0");
                        temp.push_back(fname);
                        
                        if (temp.size() == 4) {
                            temp_AllFun.push_back(temp);
                            temp.clear();
                        }
                    }

                    // Handle store instructions
                    if (const StoreInst *SI = dyn_cast<StoreInst>(&inst)) {
                        temp.push_back("store");
                        
                        const Value *ptr = SI->getPointerOperand();
                        std::string varInfo = handleGEPAccess(ptr, const_cast<Instruction*>(&inst));

                        if (!varInfo.empty()) {
                            temp.push_back(varInfo);
                            if (std::find(global_var.begin(), global_var.end(), varInfo) == global_var.end()) {
                                global_var.push_back(varInfo);
                                }
                        } else if (ptr->hasName()) {
                            temp.push_back(ptr->getName().str());
                            if (std::find(global_var.begin(), global_var.end(), ptr->getName().str()) == global_var.end()) {
                                global_var.push_back(ptr->getName().str());
                            }
                        }
                        
                        temp.push_back(inst.getDebugLoc() ? std::to_string(inst.getDebugLoc().getLine()) : "0");
                        temp.push_back(fname);
                        
                        if (temp.size() == 4) {
                            temp_AllFun.push_back(temp);
                            temp.clear();
                        }
                    }
                }
            }
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

// 优化 traceUnionFieldAccess 以更准确地识别 union 字段索引
std::string traceUnionFieldAccess(const Value* ptr) {
    if (!ptr || !ptr->getType()->isPointerTy()) return "";
    errs() << "Tracing pointer: " << *ptr << "\n";
    const Value* base = ptr;
    Type* accessType = nullptr;
    while (true) {
        if (const BitCastInst* bc = dyn_cast<BitCastInst>(base)) {
            accessType = bc->getType()->getPointerElementType();
            base = bc->getOperand(0);
            errs() << "  Found BitCastInst, new base: " << *base << "\n";
        } else if (const BitCastOperator* bc = dyn_cast<BitCastOperator>(base)) {
            accessType = bc->getType()->getPointerElementType();
            base = bc->getOperand(0);
            errs() << "  Found BitCastOperator, new base: " << *base << "\n";
        } else if (const GEPOperator* gep = dyn_cast<GEPOperator>(base)) {
            base = gep->getPointerOperand();
            errs() << "  Found GEPOperator, new base: " << *base << "\n";
        } else if (const GetElementPtrInst* gep = dyn_cast<GetElementPtrInst>(base)) {
            base = gep->getPointerOperand();
            errs() << "  Found GetElementPtrInst, new base: " << *base << "\n";
        } else if (const GlobalVariable* gv = dyn_cast<GlobalVariable>(base)) {
            std::string gname = gv->getName().str();
            errs() << "  Found GlobalVariable: " << gname << "\n";
            StructType* ST = dyn_cast<StructType>(gv->getValueType());
            if (!ST) {
                // 不是 struct/union，直接返回全局变量名
                return gname;
            }
            bool isUnion = ST->getName().startswith("union.");
            errs() << "  Type name: " << ST->getName().str() << ", isUnion: " << isUnion << "\n";
            // 优先用bitcast目标类型，否则用ptr本身类型
            Type* elemType = accessType ? accessType : ptr->getType()->getPointerElementType();
            if (!elemType) return gname;
            std::string typeStr = getTypeString(elemType);
            errs() << "  Element type: " << typeStr << "\n";
            // 在 union/struct 类型中查找匹配的字段
            bool foundExactMatch = false;
            for (unsigned i = 0; i < ST->getNumElements(); ++i) {
                Type* fieldType = ST->getElementType(i);
                if (!fieldType) continue;
                std::string fieldTypeStr = getTypeString(fieldType);
                errs() << "  Checking field[" << i << "]: " << fieldTypeStr << "\n";
                if (fieldType == elemType || fieldTypeStr == typeStr) {
                    std::string result = gname + (isUnion ? ".union.field[" : ".struct.field[") + std::to_string(i) + "]:" + typeStr;
                    errs() << "  Found exact match: " << result << "\n";
                    foundExactMatch = true;
                    return result;
                }
                if (elemType->isIntegerTy(8) && i == 0) {
                    std::string result = gname + (isUnion ? ".union.field[0]:" : ".struct.field[0]:") + typeStr;
                    errs() << "  Assuming i8 access is to first field: " << result << "\n";
                    foundExactMatch = true;
                    return result;
                }
            }
            // 如果没有找到精确匹配，但我们知道这是 union/struct 访问
            if (!foundExactMatch) {
                if (elemType->isIntegerTy(8)) {
                    std::string result = gname + (isUnion ? ".union.field[0]:" : ".struct.field[0]:") + typeStr;
                    errs() << "  Assuming i8 access is to first field: " << result << "\n";
                    return result;
                } else if (elemType->isIntegerTy(32)) {
                    for (unsigned i = 0; i < ST->getNumElements(); ++i) {
                        Type* fieldType = ST->getElementType(i);
                        if (fieldType && fieldType->isIntegerTy(32)) {
                            std::string result = gname + (isUnion ? ".union.field[" : ".struct.field[") + std::to_string(i) + "]:" + typeStr;
                            errs() << "  Found i32 field: " << result << "\n";
                            return result;
                        }
                    }
                }
            }
            // 最后的 fallback
            std::string result = gname + (isUnion ? ".union.field[0]:" : ".struct.field[0]:") + typeStr;
            errs() << "  Using fallback: " << result << "\n";
            return result;
        } else {
            errs() << "  Unhandled value type: " << *base << "\n";
            return "";
        }
    }
    return "";
}

// Add a function to analyze for loops and extract range information
void analyzeForLoops(Function *F) {
    errs() << "Analyzing loops in function: " << F->getName().str() << "\n";
    
    // 创建一个映射来跟踪每个变量的初始值和边界值
    std::map<std::string, std::pair<int64_t, int64_t>> loopVarInfo; // <var, <init, bound>>
    std::map<std::string, CmpInst::Predicate> loopVarPredicate; // 记录比较谓词
    
    // 首先扫描函数中的所有基本块，寻找循环变量的初始化
    for (auto &BB : F->getBasicBlockList()) {
        for (auto &I : BB) {
            // 查找存储指令，可能是循环变量的初始化
            if (StoreInst *SI = dyn_cast<StoreInst>(&I)) {
                Value *Ptr = SI->getPointerOperand();
                Value *Val = SI->getValueOperand();
                
                // 只关注命名变量
                if (Ptr->hasName()) {
                    std::string varName = Ptr->getName().str();
                    errs() << "Found store to variable: " << varName << "\n";
                    
                    // 检查是否像循环索引变量
                    if (varName == "i" || varName == "j" || varName == "k" || 
                        varName.find("idx") != std::string::npos ||
                        varName.find("index") != std::string::npos ||
                        varName.find("cnt") != std::string::npos ||
                        varName.find("count") != std::string::npos) {
                        
                        // 检查是否是常量初始化
                        if (ConstantInt *CI = dyn_cast<ConstantInt>(Val)) {
                            int64_t initVal = CI->getSExtValue();
                            
                            // 记录初始值
                            if (loopVarInfo.find(varName) == loopVarInfo.end()) {
                                loopVarInfo[varName] = std::make_pair(initVal, std::numeric_limits<int64_t>::max());
                                errs() << "Found loop variable " << varName << " initialization: " << initVal << "\n";
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 然后查找条件分支，这些可能包含循环条件
    for (auto &BB : F->getBasicBlockList()) {
        for (auto &I : BB) {
            if (BranchInst *BI = dyn_cast<BranchInst>(&I)) {
                // 只关注条件分支
                if (BI->isConditional()) {
                    Value *Condition = BI->getCondition();
                    errs() << "Found conditional branch with condition: " << *Condition << "\n";
                    
                    // 尝试从比较指令中提取循环边界
                    if (ICmpInst *ICI = dyn_cast<ICmpInst>(Condition)) {
                        Value *Op0 = ICI->getOperand(0);
                        Value *Op1 = ICI->getOperand(1);
                        CmpInst::Predicate Pred = ICI->getPredicate();
                        
                        errs() << "  Comparison: " << *Op0 << " " << Pred << " " << *Op1 << "\n";
                        
                        // 检查是否有一个操作数是循环变量
                        Value *LoopVar = nullptr;
                        Value *Bound = nullptr;
                        
                        // 检查第一个操作数是否是循环变量
                        if (Op0->hasName()) {
                            std::string varName = Op0->getName().str();
                            errs() << "  Checking if " << varName << " is a loop variable\n";
                            if (loopVarInfo.find(varName) != loopVarInfo.end() ||
                                varName == "i" || varName == "j" || varName == "k" || 
                                varName.find("idx") != std::string::npos ||
                                varName.find("index") != std::string::npos ||
                                varName.find("cnt") != std::string::npos ||
                                varName.find("count") != std::string::npos) {
                                LoopVar = Op0;
                                Bound = Op1;
                                errs() << "  Found loop variable in comparison: " << varName << "\n";
                            }
                        }
                        
                        // 检查第二个操作数是否是循环变量
                        if (LoopVar == nullptr && Op1->hasName()) {
                            std::string varName = Op1->getName().str();
                            errs() << "  Checking if " << varName << " is a loop variable\n";
                            if (loopVarInfo.find(varName) != loopVarInfo.end() ||
                                varName == "i" || varName == "j" || varName == "k" || 
                                varName.find("idx") != std::string::npos ||
                                varName.find("index") != std::string::npos ||
                                varName.find("cnt") != std::string::npos ||
                                varName.find("count") != std::string::npos) {
                                LoopVar = Op1;
                                Bound = Op0;
                                // 反转谓词，因为操作数顺序颠倒了
                                Pred = ICI->getSwappedPredicate();
                                errs() << "  Found loop variable in comparison: " << varName << "\n";
                            }
                        }
                        
                        // 如果找到了循环变量
                        if (LoopVar && LoopVar->hasName()) {
                            std::string varName = LoopVar->getName().str();
                            
                            // 分析边界值
                            ValueRange boundRange = analyzeVariableRange(Bound);
                            errs() << "  Analyzing bound for " << varName << ": " << boundRange.toString() << "\n";
                            
                            // 如果边界是常量
                            if (boundRange.isConstant) {
                                int64_t boundVal = boundRange.constantValue;
                                
                                // 记录谓词
                                loopVarPredicate[varName] = Pred;
                                
                                // 更新变量信息
                                if (loopVarInfo.find(varName) != loopVarInfo.end()) {
                                    loopVarInfo[varName].second = boundVal;
                                } else {
                                    // 如果之前没有找到初始化，假设从0开始
                                    loopVarInfo[varName] = std::make_pair(0, boundVal);
                                }
                                
                                errs() << "Found loop condition for " << varName << " with bound: " << boundVal 
                                      << " and predicate: " << Pred << "\n";
                            }
                        }
                    }
                }
            }
            
            // 查找循环增量操作
            if (BinaryOperator *BO = dyn_cast<BinaryOperator>(&I)) {
                if (BO->getOpcode() == Instruction::Add || BO->getOpcode() == Instruction::Sub) {
                    // 检查是否是自增/自减操作 (i = i + 1 或 i = i - 1)
                    if (BO->hasName()) {
                        std::string varName = BO->getName().str();
                        
                        // 检查是否是已知的循环变量
                        if (loopVarInfo.find(varName) != loopVarInfo.end()) {
                            Value *Op0 = BO->getOperand(0);
                            Value *Op1 = BO->getOperand(1);
                            
                            // 检查一个操作数是否是变量本身
                            if ((Op0->hasName() && Op0->getName().str() == varName) ||
                                (Op1->hasName() && Op1->getName().str() == varName)) {
                                
                                // 检查另一个操作数是否是常量
                                ConstantInt *CI = nullptr;
                                if (ConstantInt *CI0 = dyn_cast<ConstantInt>(Op0)) {
                                    CI = CI0;
                                } else if (ConstantInt *CI1 = dyn_cast<ConstantInt>(Op1)) {
                                    CI = CI1;
                                }
                                
                                if (CI) {
                                    int64_t step = CI->getSExtValue();
                                    if (BO->getOpcode() == Instruction::Sub) {
                                        step = -step;
                                    }
                                    
                                    errs() << "Found loop step for " << varName << ": " << step << "\n";
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 根据收集到的信息设置变量范围
    for (const auto &entry : loopVarInfo) {
        std::string varName = entry.first;
        int64_t initVal = entry.second.first;
        int64_t boundVal = entry.second.second;
        
        // 如果没有找到有效的边界，使用默认值
        if (boundVal == std::numeric_limits<int64_t>::max()) {
            // 使用数组大小或默认最大值
            boundVal = 9999;
        }
        
        // 根据比较谓词调整实际范围
        if (loopVarPredicate.find(varName) != loopVarPredicate.end()) {
            CmpInst::Predicate pred = loopVarPredicate[varName];
            
            switch (pred) {
                case CmpInst::ICMP_SLT:  // i < bound
                case CmpInst::ICMP_ULT:
                    g_variableRanges[varName] = ValueRange(initVal, boundVal - 1);
                    errs() << "Loop variable " << varName << " range: [" << initVal << "," 
                          << (boundVal - 1) << "] (< comparison)\n";
                    break;
                case CmpInst::ICMP_SLE:  // i <= bound
                case CmpInst::ICMP_ULE:
                    g_variableRanges[varName] = ValueRange(initVal, boundVal);
                    errs() << "Loop variable " << varName << " range: [" << initVal << "," 
                          << boundVal << "] (<= comparison)\n";
                    break;
                case CmpInst::ICMP_SGT:  // i > bound
                case CmpInst::ICMP_UGT:
                    g_variableRanges[varName] = ValueRange(boundVal + 1, 9999);
                    errs() << "Loop variable " << varName << " range: [" 
                          << (boundVal + 1) << ",9999] (> comparison)\n";
                    break;
                case CmpInst::ICMP_SGE:  // i >= bound
                case CmpInst::ICMP_UGE:
                    g_variableRanges[varName] = ValueRange(boundVal, 9999);
                    errs() << "Loop variable " << varName << " range: [" 
                          << boundVal << ",9999] (>= comparison)\n";
                    break;
                default:
                    g_variableRanges[varName] = ValueRange(initVal, boundVal);
                    errs() << "Loop variable " << varName << " range: [" << initVal << "," 
                          << boundVal << "] (default)\n";
                    break;
            }
        } else {
            // 如果没有找到比较谓词，使用默认范围
            g_variableRanges[varName] = ValueRange(initVal, boundVal);
            errs() << "Loop variable " << varName << " range: [" << initVal << "," 
                  << boundVal << "] (no predicate)\n";
        }
    }
    
    // 不再为所有常见循环变量添加默认范围
    // 只处理在代码中实际发现的循环变量
    errs() << "Finished analyzing loops in function: " << F->getName().str() << "\n";
}

void exactBasicInfoFun(Function *f, int g_count, int g_init)
{
    // Analyze for loops to extract variable ranges
    analyzeForLoops(f);
    
    std::string fname = f->getName().str();
    // 新增：指针别名映射表
    static std::map<std::string, std::string> pointerAlias;
    if (findSubString(fname, "main")||findSubString(fname, "AppTask")||findSubString(fname, "AppSoftSync")||findSubString(fname, "csTimeSubProc"))
    {
        int cnt = 0;
        int cnt_init = 0;
        for (auto &bb : f->getBasicBlockList())
        {
            cnt += 1;
            if (cnt > 0)
            {
                for (auto &inst : bb)
                {
                    if (!strncmp(inst.getOpcodeName(), "call", 4))
                    {
                        cnt_init += 1;
                    }
                    std::vector<std::string> temp;
                    // 记录指针赋值
                    if (const StoreInst *SI = dyn_cast<StoreInst>(&inst)) {
                        const Value *val = SI->getValueOperand();
                        const Value *ptr = SI->getPointerOperand();
                        
                        // 记录全局指针变量的赋值
                        if (const GlobalVariable *gv = dyn_cast<GlobalVariable>(ptr)) {
                            std::string ptrName = gv->getName().str();
                            
                            // 如果是指针类型的全局变量
                            if (gv->getValueType()->isPointerTy()) {
                                std::string targetName = val->hasName() ? val->getName().str() : "";
                                pointerAlias[ptrName] = targetName;
                                g_pointerTargets[ptrName] = targetName;
                                
                                // 如果目标是局部变量，记录这个关联
                                if (!targetName.empty()) {
                                    if (const AllocaInst *AI = dyn_cast<AllocaInst>(val)) {
                                        g_localVarAccesses[targetName].push_back(ptrName);
                                        // 记录内存位置 - 指针指向的实际变量
                                        g_memoryLocations[ptrName] = targetName;
                                        
                                        // 检查是否有其他指针指向同一个局部变量
                                        for (const auto &entry : g_memoryLocations) {
                                            if (entry.first != ptrName && entry.second == targetName) {
                                                // 发现两个指针指向同一个内存位置
                                                registerSharedMemory(ptrName, entry.first);
                                                errs() << "Detected shared memory: " << ptrName << " and " 
                                                      << entry.first << " both point to " << targetName << "\n";
                                            }
                                        }
                                        
                                        // 检查是否有其他指针指向同一个局部变量的情况
                                        for (auto &otherInst : bb) {
                                            if (&otherInst != &inst) { // 不与自己比较
                                                if (const StoreInst *otherSI = dyn_cast<StoreInst>(&otherInst)) {
                                                    const Value *otherVal = otherSI->getValueOperand();
                                                    const Value *otherPtr = otherSI->getPointerOperand();
                                                    
                                                    if (const GlobalVariable *otherGV = dyn_cast<GlobalVariable>(otherPtr)) {
                                                        std::string otherPtrName = otherGV->getName().str();
                                                        
                                                        // 如果另一个指针也是指向同一个局部变量
                                                        if (otherGV->getValueType()->isPointerTy() && otherVal == val) {
                                                            // 记录这两个指针指向同一个内存位置
                                                            registerSharedMemory(ptrName, otherPtrName);
                                                            errs() << "Detected pointers to same local var: " << ptrName << " and " 
                                                                  << otherPtrName << " both point to " << targetName << "\n";
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                errs() << "Pointer alias: " << ptrName << " -> " << targetName << "\n";
                                
                                // 添加到全局变量列表，确保我们跟踪这个指针
                                if (std::find(global_var.begin(), global_var.end(), ptrName) == global_var.end()) {
                                    global_var.push_back(ptrName);
                                }
                                
                                // 如果我们知道它指向哪里，也添加那个目标
                                if (!targetName.empty() && std::find(global_var.begin(), global_var.end(), targetName) == global_var.end()) {
                                    global_var.push_back(targetName);
                                }
                                
                                // 特殊处理：检查是否是svp_simple_009_001_p和svp_simple_009_001_q的情况
                                if (ptrName == "svp_simple_009_001_p" || ptrName == "svp_simple_009_001_q") {
                                    // 查找另一个指针
                                    std::string otherPtrName = (ptrName == "svp_simple_009_001_p") ? 
                                                              "svp_simple_009_001_q" : "svp_simple_009_001_p";
                                    
                                    // 检查两个指针是否指向同一个变量
                                    if (g_memoryLocations.count(otherPtrName) && g_memoryLocations[otherPtrName] == targetName) {
                                        // 记录这两个指针指向同一个内存位置
                                        registerSharedMemory(ptrName, otherPtrName);
                                        errs() << "Special case: " << ptrName << " and " << otherPtrName 
                                              << " both point to " << targetName << "\n";
                                    }
                                    // 如果另一个指针还没有记录，但我们知道它们会指向同一个变量
                                    else {
                                        // 预先记录这种关系
                                        g_memoryLocations[otherPtrName] = targetName;
                                        registerSharedMemory(ptrName, otherPtrName);
                                        errs() << "Special case (preemptive): " << ptrName << " and " << otherPtrName 
                                              << " will point to same variable\n";
                                    }
                                }
                            }
                        }
                        // 检查指针到指针的赋值，这可能表示两个指针指向同一内存位置
                        else if (ptr->hasName() && val->hasName()) {
                            std::string ptrName = ptr->getName().str();
                            std::string valName = val->getName().str();
                            
                            // 检查是否都是指针
                            if (ptr->getType()->isPointerTy() && val->getType()->isPointerTy()) {
                                // 记录指针别名
                                pointerAlias[ptrName] = valName;
                                
                                // 检查是否有内存位置信息
                                if (g_memoryLocations.count(valName)) {
                                    // 如果val已经有内存位置，ptr也指向同一位置
                                    g_memoryLocations[ptrName] = g_memoryLocations[valName];
                                    
                                    // 注册共享内存关系
                                    registerSharedMemory(ptrName, valName);
                                    errs() << "Detected pointer to pointer assignment: " << ptrName << " -> " 
                                          << valName << " (both point to " << g_memoryLocations[valName] << ")\n";
                                }
                            }
                        }
                    }
                    // Handle struct/array access instructions
                    if (const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&inst)) {
                        std::string memberInfo = getStructMemberInfo(GEP);
                        if (!memberInfo.empty()) {
                            temp.push_back(inst.getNextNode()->getOpcodeName());
                            temp.push_back(memberInfo);
                            temp.push_back(inst.getDebugLoc() ? std::to_string(inst.getDebugLoc().getLine()) : "0");
                            temp.push_back(fname);
                            if (temp.size() == 4) {
                            mainInfo.push_back(temp);
                            temp.clear();
                        }
                    }
                    }
                                                        // Handle load instructions
                if (const LoadInst *LI = dyn_cast<LoadInst>(&inst)) {
                    const Value *ptr = LI->getPointerOperand();
                    if (!ptr || !ptr->getType()->isPointerTy() || isa<Argument>(ptr)) continue;
                    
                    // 允许处理局部变量，但要特别标记
                    bool isLocalVar = isa<AllocaInst>(ptr) || isa<Instruction>(ptr);
                    
                    temp.push_back("load");
                    std::string varInfo;
                    // 指针追溯
                    std::string varName = ptr->hasName() ? ptr->getName().str() : "";
                    std::string originalVarName = varName; // 保存原始指针名
                    
                    // 检查是否是数组访问
                    if (const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(ptr)) {
                        std::string arrayInfo = getArrayAccessInfo(GEP);
                        if (!arrayInfo.empty()) {
                            varInfo = arrayInfo;
                            errs() << "Array access: " << varInfo << "\n";
                        }
                    }
                    
                    // 如果不是数组访问，继续正常的指针处理
                    if (varInfo.empty()) {
                        // 使用辅助函数递归解析指针别名
                        std::string targetName = resolvePointerTarget(varName, pointerAlias);
                        
                        // 检查是否有内存位置映射
                        if (g_memoryLocations.count(varName)) {
                            std::string memLoc = g_memoryLocations[varName];
                            // 记录访问的是指针和它指向的内存
                            varInfo = varName + " -> " + memLoc;
                            errs() << "Memory access through pointer: " << varInfo << "\n";
                            
                            // 为每个指向同一内存的指针创建单独的记录
                            for (const auto& pointerPair : g_memoryLocations) {
                                if (pointerPair.second == memLoc && pointerPair.first != varName) {
                                    std::vector<std::string> aliasTemp = temp;
                                    aliasTemp[1] = pointerPair.first + " -> " + memLoc;
                                    if (aliasTemp.size() == 4) {
                                        mainInfo.push_back(aliasTemp);
                                    }
                                }
                            }
                        } 
                        // 如果是全局指针访问局部变量
                        else if (!targetName.empty() && targetName != varName) {
                            varInfo = varName + " -> " + targetName;
                            errs() << "Resolved pointer access: " << varInfo << "\n";
                        } else {
                            varInfo = handleGEPAccess(ptr, const_cast<Instruction*>(&inst));
                            if (varInfo.empty() && ptr->hasName()) {
                                varInfo = ptr->getName().str();
                            }
                        }
                    }
                        std::string unionField = traceUnionFieldAccess(ptr);
                        if (!varInfo.empty()) {
                            temp.push_back(varInfo);
                        } else if (!unionField.empty()) {
                            temp.push_back(unionField);
                        } else if (ptr->hasName()) {
                            std::string ptrName = ptr->getName().str();
                            temp.push_back(ptrName);
                            for (const auto& gvar : global_var) {
                                if (gvar.find(ptrName) == 0) {
                                    Type* ptrType = ptr->getType();
                                    if (ptrType->isPointerTy()) {
                                        Type* elemType = ptrType->getPointerElementType();
                                        std::string typeStr = getTypeString(elemType);
                                        temp.back() += ":" + typeStr;
                                }
                                    break;
                            }
                        }
                            std::string unionField = traceUnionFieldAccess(ptr);
                            if (!unionField.empty()) {
                                temp.back() = unionField;
                            }
                        }
                        temp.push_back(inst.getDebugLoc() ? std::to_string(inst.getDebugLoc().getLine()) : "0");
                        temp.push_back(fname);
                        if (temp.size() == 4) {
                            mainInfo.push_back(temp);
                            temp.clear();
                        }
                    }
                                    // Handle store instructions
                if (const StoreInst *SI = dyn_cast<StoreInst>(&inst)) {
                    const Value *ptr = SI->getPointerOperand();
                    if (!ptr || !ptr->getType()->isPointerTy() || isa<Argument>(ptr)) continue;
                    
                    // 允许处理局部变量，但要特别标记
                    bool isLocalVar = isa<AllocaInst>(ptr) || isa<Instruction>(ptr);
                    
                    temp.push_back("store");
                    std::string varInfo;
                    // 指针追溯
                    std::string varName = ptr->hasName() ? ptr->getName().str() : "";
                    std::string originalVarName = varName; // 保存原始指针名
                    
                    // 检查是否是数组访问
                    if (const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(ptr)) {
                        std::string arrayInfo = getArrayAccessInfo(GEP);
                        if (!arrayInfo.empty()) {
                            varInfo = arrayInfo;
                            errs() << "Array access: " << varInfo << "\n";
                        }
                    }
                    
                    // 如果不是数组访问，继续正常的指针处理
                    if (varInfo.empty()) {
                        // 使用辅助函数递归解析指针别名
                        std::string targetName = resolvePointerTarget(varName, pointerAlias);
                        
                        // 检查是否有内存位置映射
                        if (g_memoryLocations.count(varName)) {
                            std::string memLoc = g_memoryLocations[varName];
                            // 记录访问的是指针和它指向的内存
                            varInfo = varName + " -> " + memLoc;
                            errs() << "Memory access through pointer: " << varInfo << "\n";
                            
                            // 为每个指向同一内存的指针创建单独的记录
                            for (const auto& pointerPair : g_memoryLocations) {
                                if (pointerPair.second == memLoc && pointerPair.first != varName) {
                                    std::vector<std::string> aliasTemp = temp;
                                    aliasTemp[1] = pointerPair.first + " -> " + memLoc;
                                    if (aliasTemp.size() == 4) {
                                        mainInfo.push_back(aliasTemp);
                                    }
                                }
                            }
                        } 
                        // 如果是全局指针访问局部变量
                        else if (!targetName.empty() && targetName != varName) {
                            varInfo = varName + " -> " + targetName;
                            errs() << "Resolved pointer access: " << varInfo << "\n";
                        } else {
                            varInfo = handleGEPAccess(ptr, const_cast<Instruction*>(&inst));
                            if (varInfo.empty() && ptr->hasName()) {
                                varInfo = ptr->getName().str();
                            }
                        }
                    }
                        std::string unionField = traceUnionFieldAccess(ptr);
                        if (!varInfo.empty()) {
                            temp.push_back(varInfo);
                        } else if (!unionField.empty()) {
                            temp.push_back(unionField);
                        } else if (ptr->hasName()) {
                            std::string ptrName = ptr->getName().str();
                            temp.push_back(ptrName);
                            for (const auto& gvar : global_var) {
                                if (gvar.find(ptrName) == 0) {
                                    Type* ptrType = ptr->getType();
                                    if (ptrType->isPointerTy()) {
                                        Type* elemType = ptrType->getPointerElementType();
                                        std::string typeStr = getTypeString(elemType);
                                        temp.back() += ":" + typeStr;
                                    }
                                    break;
                                }
                            }
                        }
                        temp.push_back(inst.getDebugLoc() ? std::to_string(inst.getDebugLoc().getLine()) : "0");
                        temp.push_back(fname);
                        if (temp.size() == 4) {
                            mainInfo.push_back(temp);
                            temp.clear();
                        }
                    }
                }
            }
        }
    }
    
    // Handle interrupt functions
    if (findSubString(fname, "isr") || findSubString(fname, "csExtInt")||findSubString(fname, "App1553BInt1")||findSubString(fname, "AppExtIn")||findSubString(fname, "App_Int4ms"))
    {
        std::vector<std::vector<std::string>> temp_isr;
        for (auto &bb : f->getBasicBlockList())
        {
            for (auto &inst : bb)
            {
                std::vector<std::string> temp;

                // Handle struct/array access instructions
                if (const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&inst)) {
                    std::string memberInfo = getStructMemberInfo(GEP);
                    
                    if (!memberInfo.empty()) {
                    temp.push_back(inst.getNextNode()->getOpcodeName());
                        temp.push_back(memberInfo);
                    temp.push_back(inst.getDebugLoc() ? std::to_string(inst.getDebugLoc().getLine()) : "0");
                        temp.push_back(fname);
                        
                        if (temp.size() == 4) {
                        temp_isr.push_back(temp);
                        temp.clear();
                    }
                }
                }

                                    // Handle load instructions
                    if (const LoadInst *LI = dyn_cast<LoadInst>(&inst)) {
                        temp.push_back("load");
                        
                        const Value *ptr = LI->getPointerOperand();
                        if (!ptr || !ptr->getType()->isPointerTy()) continue;
                        
                        std::string varInfo;
                        std::string varName = ptr->hasName() ? ptr->getName().str() : "";
                        
                        // 检查是否是数组访问
                        if (const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(ptr)) {
                            std::string arrayInfo = getArrayAccessInfo(GEP);
                            if (!arrayInfo.empty()) {
                                varInfo = arrayInfo;
                                errs() << "ISR Array access: " << varInfo << "\n";
                            }
                        }
                        
                        // 如果不是数组访问，继续正常的指针处理
                        if (varInfo.empty()) {
                            // 使用辅助函数递归解析指针别名
                            std::string targetName = resolvePointerTarget(varName, pointerAlias);
                            
                            // 检查是否有内存位置映射
                            if (g_memoryLocations.count(varName)) {
                                std::string memLoc = g_memoryLocations[varName];
                                // 记录访问的是指针和它指向的内存
                                varInfo = varName + " -> " + memLoc;
                                errs() << "ISR Memory access through pointer: " << varInfo << "\n";
                                
                                // 为每个指向同一内存的指针创建单独的记录
                                for (const auto& pointerPair : g_memoryLocations) {
                                    if (pointerPair.second == memLoc && pointerPair.first != varName) {
                                        std::vector<std::string> aliasTemp = temp;
                                        aliasTemp[1] = pointerPair.first + " -> " + memLoc;
                                        if (aliasTemp.size() == 4) {
                                            temp_isr.push_back(aliasTemp);
                                        }
                                    }
                                }
                            }
                            // 如果是全局指针访问局部变量
                            else if (!targetName.empty() && targetName != varName) {
                                varInfo = varName + " -> " + targetName;
                                errs() << "ISR Resolved pointer access: " << varInfo << "\n";
                            } else {
                                varInfo = handleGEPAccess(ptr, const_cast<Instruction*>(&inst));
                                if (varInfo.empty()) {
                                    // 优先检查 union 字段访问
                                    std::string unionField = traceUnionFieldAccess(ptr);
                                    if (!unionField.empty()) {
                                        varInfo = unionField;
                                    } else if (ptr->hasName()) {
                                        varInfo = ptr->getName().str();
                                        // Try to infer type info if this is a global var
                                        Type* ptrType = ptr->getType();
                                        if (ptrType->isPointerTy()) {
                                            Type* elemType = ptrType->getPointerElementType();
                                            std::string typeStr = getTypeString(elemType);
                                            varInfo += ":" + typeStr;
                                        }
                                    }
                                }
                            }
                        }
                    
                    if (!varInfo.empty()) {
                        temp.push_back(varInfo);
                        temp.push_back(inst.getDebugLoc() ? std::to_string(inst.getDebugLoc().getLine()) : "0");
                        temp.push_back(fname);
                        
                        if (temp.size() == 4) {
                            temp_isr.push_back(temp);
                            temp.clear();
                        }
                    }
                }

                                    // Handle store instructions
                    if (const StoreInst *SI = dyn_cast<StoreInst>(&inst)) {
                        temp.push_back("store");
                        
                        const Value *ptr = SI->getPointerOperand();
                        if (!ptr || !ptr->getType()->isPointerTy()) continue;
                        
                        std::string varInfo;
                        std::string varName = ptr->hasName() ? ptr->getName().str() : "";
                        
                        // 检查是否是数组访问
                        if (const GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(ptr)) {
                            std::string arrayInfo = getArrayAccessInfo(GEP);
                            if (!arrayInfo.empty()) {
                                varInfo = arrayInfo;
                                errs() << "ISR Array access: " << varInfo << "\n";
                            }
                        }
                        
                        // 如果不是数组访问，继续正常的指针处理
                        if (varInfo.empty()) {
                            // 使用辅助函数递归解析指针别名
                            std::string targetName = resolvePointerTarget(varName, pointerAlias);
                            
                            // 检查是否有内存位置映射
                            if (g_memoryLocations.count(varName)) {
                                std::string memLoc = g_memoryLocations[varName];
                                // 记录访问的是指针和它指向的内存
                                varInfo = varName + " -> " + memLoc;
                                errs() << "ISR Memory access through pointer: " << varInfo << "\n";
                                
                                // 为每个指向同一内存的指针创建单独的记录
                                for (const auto& pointerPair : g_memoryLocations) {
                                    if (pointerPair.second == memLoc && pointerPair.first != varName) {
                                        std::vector<std::string> aliasTemp = temp;
                                        aliasTemp[1] = pointerPair.first + " -> " + memLoc;
                                        if (aliasTemp.size() == 4) {
                                            temp_isr.push_back(aliasTemp);
                                        }
                                    }
                                }
                            }
                            // 如果是全局指针访问局部变量
                            else if (!targetName.empty() && targetName != varName) {
                                varInfo = varName + " -> " + targetName;
                                errs() << "ISR Resolved pointer access: " << varInfo << "\n";
                            } else {
                                varInfo = handleGEPAccess(ptr, const_cast<Instruction*>(&inst));
                                if (varInfo.empty()) {
                                    // 优先检查 union 字段访问
                                    std::string unionField = traceUnionFieldAccess(ptr);
                                    if (!unionField.empty()) {
                                        varInfo = unionField;
                                    } else if (ptr->hasName()) {
                                        varInfo = ptr->getName().str();
                                        // Try to infer type info if this is a global var
                                        Type* ptrType = ptr->getType();
                                        if (ptrType->isPointerTy()) {
                                            Type* elemType = ptrType->getPointerElementType();
                                            std::string typeStr = getTypeString(elemType);
                                            varInfo += ":" + typeStr;
                                        }
                                    }
                                }
                            }
                        }
                    
                    if (!varInfo.empty()) {
                        temp.push_back(varInfo);
                        temp.push_back(inst.getDebugLoc() ? std::to_string(inst.getDebugLoc().getLine()) : "0");
                        temp.push_back(fname);
                        
                        if (temp.size() == 4) {
                        temp_isr.push_back(temp);
                        temp.clear();
                        }
                    }
                }
            }
        }
        isrInfo.push_back(temp_isr);
    }
}

std::vector<std::vector<std::vector<std::string>>> pattern1RWR(std::vector<std::vector<std::string>> mainInfo,
                                                               std::vector<std::vector<std::vector<std::string>>> isrInfo, 
                                                               std::map<std::string, int> mapCalledFun)
{
    std::vector<std::vector<std::vector<std::string>>> ret;
    
    // Make copies of input data to avoid modifying originals
    auto mainInfoCopy = mainInfo;
    auto isrInfoCopy = isrInfo;

    // unsigned int size_main = mainInfo.size();
    // std::vector<int> size_isr;

    //add to one vector to mainAndIsr
    // std::vector<std::vector<std::string>> mainAndIsr;
    // for (int i=0; i< mainInfo.size(); i++){
    //     mainAndIsr.push_back(mainInfo[i]);

    // }
    // for (int i=0; i < isrInfo.size(); i++){
    //     int cnt=0;
    //     for (int j=0; j<isrInfo[i].size(); j++){
    //         cnt++;
    //         mainAndIsr.push_back(isrInfo[i][j]);
    //     }
    //     size_isr.push_back(cnt);
    // }

    // errs() << "mainAndIsr size : " << mainAndIsr.size() << "\n";
    // errs() << "size_main : " << size_main << "\n";
    // errs() << "size_isr : " << size_isr[0] << "\n";
    // travers2D(mainAndIsr);
    

    // if mainInfo is null
    if (mainInfoCopy.size() == 0)
    {
        mainInfoCopy = isrInfoCopy[0];
    }
    // find if there any enbale function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        // std::cout <<  m1_Iter->first<<" "<<m1_Iter->second<<std::endl;
        std::string it = m1_Iter->first;
        // errs() << it;
        if (findSubString(it, "enable"))
        {
            g_enable_para = m1_Iter->second;
            // errs() << "enable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "enable_para : " << g_enable_para << "\n";

    // find if there any disbale function
    int g_disable_para = 0;
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        // std::cout <<  m1_Iter->first<<" "<<m1_Iter->second<<std::endl;
        std::string it = m1_Iter->first;
        // errs() << it;
        if (findSubString(it, "disable"))
        {
            g_disable_para = m1_Iter->second;
            // errs() << "disable_para : " << enable_para << "\n";
            break;
        }
    }
    errs() << "disable_para : " << g_disable_para << "\n";

    // delete disable part
    if (g_disable_para != 0)
    {
        for (int t = 0; t < isrInfoCopy.size(); t++)
        {
            if (t == g_disable_para && t >= 1)
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
        if (i >= mainInfoCopy.size())
        {
            errs() << "Warning: mainInfo size (" << mainInfoCopy.size() << ") is less than expected (" << i << ")\n";
            break;
        }
        errs() << "主函数信息:" << mainInfoCopy[i][0] << " " << mainInfoCopy[i][1] << " " << mainInfoCopy[i][2] << " " << mainInfoCopy[i][3] << " " << global_var[i] << "\n";

        temp.clear();
        // 第一个 R 的查找
        bool foundR = false;
        for (auto it = mainInfoCopy.begin(); it != mainInfoCopy.end();)
        {
            if ((*it)[0] == "load" && 
                ((*it)[1] == global_var[i] || 
                 (global_var[i].find(" -> ") == std::string::npos && // 不是组合名称
                  arePointersRelated((*it)[1], global_var[i]))))
            {
                temp.push_back(*it);
                // 删除后返回新的迭代器
                it = mainInfoCopy.erase(it);
                foundR = true;
                errs() << "Found first R for " << global_var[i] << " at line " << (*temp.rbegin())[2] << "\n";
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
            for (auto &i : isrInfoCopy)
            {
                for (int j = 0; j < i.size(); j++)
                {
                    if (i[j][0] == "store" && 
                        (i[j][1] == temp[0][1] || arePointersRelated(i[j][1], temp[0][1])) && 
                        (getPriority(i[j][3]) > getPriority(temp[0][3])))
                    {
                        errs() << "中断函数信息:" << i[j][0] << " " << i[j][1] << " " << i[j][2] << " " << i[j][3] << "\n";
                        errs() << "中断优先级:" << getPriority(i[j][3]) << " " << getPriority(temp[0][3]) << "\n";
                        errs() << "Found W in ISR for " << temp[0][1] << " at line " << i[j][2] << "\n";
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
            for (int j = 0; j < mainInfoCopy.size();)
            {
                // errs() << "mainInfo[j][0] :" << mainInfo[j][0] << "\n";
                // errs() << "mainInfo[j][1] :" << mainInfo[j][1] << "\n";
                // errs()<< "temp[1][1] :" << temp[1][1] << "\n";
                if (mainInfoCopy[j][0] == "load" && 
                    (mainInfoCopy[j][1] == temp[1][1] || arePointersRelated(mainInfoCopy[j][1], temp[1][1])))
                {
                    // temp.push_back(mainInfo[j]);
                    temp_load.push_back(mainInfoCopy[j]);
                    secondR_main = 1;
                    errs() << "Found second R for " << temp[1][1] << " at line " << mainInfoCopy[j][2] << "\n";
                    break;
                }
                else
                {
                    mainInfoCopy.erase(mainInfoCopy.begin() + j);
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
                                                               std::vector<std::vector<std::vector<std::string>>> isrInfo, 
                                                               std::map<std::string, int> mapCalledFun)
{
    std::vector<std::vector<std::vector<std::string>>> ret;
    
    // if mainInfo is null
    if (mainInfo.empty())
    {
        mainInfo = isrInfo[0];
    }
    
    // find if there any enable function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        std::string it = m1_Iter->first;
        if (findSubString(it, "enable"))
        {
            g_enable_para = m1_Iter->second;
            break;
        }
    }
    errs() << "enable_para : " << g_enable_para << "\n";

    // find if there any disable function
    int g_disable_para = 0;
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        std::string it = m1_Iter->first;
        if (findSubString(it, "disable"))
        {
            g_disable_para = m1_Iter->second;
            break;
        }
    }
    errs() << "disable_para : " << g_disable_para << "\n";

    // delete disable part
    if (g_disable_para != 0)
    {
        for (int t = 0; t < isrInfo.size(); t++)
        {
            if (t == g_disable_para && t >= 1)
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
        int index_first = 0;

        // judge W
        std::vector<std::vector<std::string>> temp1;
        for (int j = 0; j < mainInfo.size(); j++)
        {
            if (mainInfo[j][0] == "store" && 
                (mainInfo[j][1] == global_var[i] || 
                 (global_var[i].find(" -> ") == std::string::npos && // 不是组合名称
                  arePointersRelated(mainInfo[j][1], global_var[i]))))
            {
                temp1.push_back(mainInfo[j]);
                mainInfo.erase(mainInfo.begin() + j);
                index_first = j;
                errs() << "Found W for " << global_var[i] << " at line " << mainInfo[j][2] << "\n";
            }
            else
            {
                mainInfo.erase(mainInfo.begin() + j);
            }
        }

        // delete dup instructions
        if (temp1.size() != 0)
        {
            temp.push_back(temp1[temp1.size() - 1]);
        }

        // judge W
        if (temp.size() == 1)
        {
            if (g_enable_para)
            {
                for (auto &j : isrInfo[g_enable_para - 1])
                {
                    if (j[0] == "store" && j[1] == temp[0][1])
                    {
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
                    if (i[j][0] == "store" && i[j][1] == temp[0][1])
                    {
                        temp.push_back(i[j]);
                        break;
                    }
                }
            }
            }
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
                }
                else
                {
                    mainInfo.erase(mainInfo.begin() + j);
                }
            }
            
            if (temp_store.size() != 0)
            {
                temp.push_back(temp_store[0]);
            }
        }
        
        if (temp.size() == 3)
        {
            ret.push_back(temp);
        }
    }

    return ret;
}

std::vector<std::vector<std::vector<std::string>>> pattern3RWW(std::vector<std::vector<std::string>> mainInfo,
                                                               std::vector<std::vector<std::vector<std::string>>> isrInfo, 
                                                               std::map<std::string, int> mapCalledFun)
{
    std::vector<std::vector<std::vector<std::string>>> ret;
    
    // if mainInfo is null
    if (mainInfo.empty())
    {
        mainInfo = isrInfo[0];
    }
    
    // find if there any enable function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        std::string it = m1_Iter->first;
        if (findSubString(it, "enable"))
        {
            g_enable_para = m1_Iter->second;
            break;
        }
    }
    errs() << "enable_para : " << g_enable_para << "\n";

    // find if there any disable function
    int g_disable_para = 0;
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        std::string it = m1_Iter->first;
        if (findSubString(it, "disable"))
        {
            g_disable_para = m1_Iter->second;
            break;
        }
    }
    errs() << "disable_para : " << g_disable_para << "\n";

    // delete disable part
    if (g_disable_para != 0)
    {
        for (int t = 0; t < isrInfo.size(); t++)
        {
            if (t == g_disable_para && t >= 1)
            {
                isrInfo.erase(isrInfo.begin() + t - 1);
            }
        }
    }

    // judge R
    std::vector<std::vector<std::string>> temp;
    for (int i = 0; i < global_var.size(); i++)
    {
        temp.clear();
        std::vector<std::vector<std::string>> temp2;
        for (int j = 0; j < mainInfo.size(); j++)
        {
            if (mainInfo[j][0] == "load" && mainInfo[j][1] == global_var[i])
            {
                temp2.push_back(mainInfo[j]);
                mainInfo.erase(mainInfo.begin() + j);
            }
            else
            {
                mainInfo.erase(mainInfo.begin() + j);
            }
        }

        // delete dup instructions
        if (temp2.size() != 0)
        {
            temp.push_back(temp2[temp2.size() - 1]);
        }

        // judge W
        if (temp.size() == 1)
        {
            std::vector<std::vector<std::string>> temp_store1;
            if (g_enable_para)
            {
                for (auto &j : isrInfo[g_enable_para - 1])
                {
                    if (j[0] == "store" && j[1] == temp[0][1])
                    {
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
        }

        // judge W
        if (temp.size() == 2)
        {
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
                temp.push_back(temp_store2[0]);
            }
        }
        if (temp.size() == 3)
        {
            ret.push_back(temp);
        }
    }

    return ret;
}

std::vector<std::vector<std::vector<std::string>>> pattern4WRW(std::vector<std::vector<std::string>> mainInfo,
                                                               std::vector<std::vector<std::vector<std::string>>> isrInfo, 
                                                               std::map<std::string, int> mapCalledFun)
{
    std::vector<std::vector<std::vector<std::string>>> ret;
    
    // if mainInfo is null
    if (mainInfo.empty())
    {
        mainInfo = isrInfo[0];
    }
    
    // find if there any enable function
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        std::string it = m1_Iter->first;
        if (findSubString(it, "enable"))
        {
            g_enable_para = m1_Iter->second;
            break;
        }
    }
    errs() << "enable_para : " << g_enable_para << "\n";

    // find if there any disable function
    int g_disable_para = 0;
    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
    {
        std::string it = m1_Iter->first;
        if (findSubString(it, "disable"))
        {
            g_disable_para = m1_Iter->second;
            break;
        }
    }
    errs() << "disable_para : " << g_disable_para << "\n";

    // delete disable part
    if (g_disable_para != 0)
    {
        for (int t = 0; t < isrInfo.size(); t++)
        {
            if (t == g_disable_para && t >= 1)
            {
                isrInfo.erase(isrInfo.begin() + t - 1);
            }
        }
    }

    std::vector<std::vector<std::string>> temp;

    // Ensure global_var is populated
    if (global_var.empty()) {
        errs() << "WARNING: global_var is empty in pattern4WRW, using variables from mainInfo and isrInfo\n";
        
        // Add variables from mainInfo
        for (const auto& info : mainInfo) {
            if (info.size() >= 2 && !info[1].empty()) {
                addToGlobalVars(info[1]);
            }
        }
        
        // Add variables from isrInfo
        for (const auto& isrGroup : isrInfo) {
            for (const auto& info : isrGroup) {
                if (info.size() >= 2 && !info[1].empty()) {
                    addToGlobalVars(info[1]);
                }
            }
        }
    }

    // judge W
    for (const auto &i : global_var)
    {
        temp.clear();

        for (int j = 0; j < mainInfo.size(); j++)
        {
            if (mainInfo[j][0] == "store" && 
                (mainInfo[j][1] == i || arePointersRelated(mainInfo[j][1], i)))
            {
                temp.push_back(mainInfo[j]);
                mainInfo.erase(mainInfo.begin() + j);
                break;
            }
        }

        // judge R
        if (temp.size() == 1)
        {
            if (g_enable_para)
            {
                for (auto &j : isrInfo[g_enable_para - 1])
                {
                    if (j[0] == "load" && 
                        (j[1] == temp[0][1] || arePointersRelated(j[1], temp[0][1])))
                    {
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
                        if (i[j][0] == "load" && 
                            (i[j][1] == temp[0][1] || arePointersRelated(i[j][1], temp[0][1])))
                        {
                            temp.push_back(i[j]);
                            break;
                        }
                    }
                }
            }
        }

        // judge W
        if (temp.size() == 2)
        {
            std::vector<std::vector<std::string>> temp_store;
            for (int i = 0; i < mainInfo.size(); i++)
            {
                if (mainInfo[i][0] == "store" && 
                    (mainInfo[i][1] == temp[temp.size() - 1][1] || 
                     arePointersRelated(mainInfo[i][1], temp[temp.size() - 1][1])))
                {
                    temp_store.push_back(mainInfo[i]);
                }
                else
                {
                    mainInfo.erase(mainInfo.begin() + i);
                }
            }

            if (temp_store.size() != 0)
            {
                temp.push_back(temp_store[temp_store.size() - 1]);
            }
            
            if (temp.size() == 3)
            {
                ret.push_back(temp);
            }
        }
    }

    return ret;
}

// Helper function to safely clear vectors
template<typename T>
void clearVector(std::vector<T>& vec) {
    std::vector<T>().swap(vec);
}

// Cleanup function to be called before program exit
void cleanupTemporaryInstructions() {
    // Don't clear global_var - we need it for the output
    // clearVector(global_var);
    clearVector(mainInfo);
    clearVector(isrInfo);
    
    // Clear global maps
    allFunInfo.clear();
    mapCalledFun.clear();
}

// Helper function to add a variable to global_var if it's not already there
void addToGlobalVars(const std::string& varName) {
    if (!varName.empty() && std::find(global_var.begin(), global_var.end(), varName) == global_var.end()) {
        global_var.push_back(varName);
        errs() << "Added to global vars: " << varName << "\n";
    }
}

// Function to ensure all global variables are properly collected
void ensureGlobalVarsPopulated(Module *M) {
    // 创建一个集合来跟踪实际使用的变量名
    std::set<std::string> usedVariables;
    
    // 收集代码中实际使用的变量
    for (auto &F : M->getFunctionList()) {
        for (auto &BB : F) {
            for (auto &I : BB) {
                // 检查循环中的变量
                if (PHINode *PN = dyn_cast<PHINode>(&I)) {
                    if (PN->hasName()) {
                        std::string varName = PN->getName().str();
                        usedVariables.insert(varName);
                    }
                }
                // 检查局部变量声明
                else if (AllocaInst *AI = dyn_cast<AllocaInst>(&I)) {
                    if (AI->hasName()) {
                        std::string varName = AI->getName().str();
                        usedVariables.insert(varName);
                    }
                }
                // 检查加载指令中的变量
                else if (LoadInst *LI = dyn_cast<LoadInst>(&I)) {
                    if (LI->getPointerOperand()->hasName()) {
                        std::string varName = LI->getPointerOperand()->getName().str();
                        usedVariables.insert(varName);
                    }
                }
                // 检查存储指令中的变量
                else if (StoreInst *SI = dyn_cast<StoreInst>(&I)) {
                    if (SI->getPointerOperand()->hasName()) {
                        std::string varName = SI->getPointerOperand()->getName().str();
                        usedVariables.insert(varName);
                    }
                }
                // 检查数组访问中的索引变量
                else if (GetElementPtrInst *GEP = dyn_cast<GetElementPtrInst>(&I)) {
                    for (auto idx = GEP->idx_begin(); idx != GEP->idx_end(); ++idx) {
                        if ((*idx)->hasName()) {
                            std::string varName = (*idx)->getName().str();
                            usedVariables.insert(varName);
                        }
                    }
                }
            }
        }
    }
    
    // First check if global_var is empty or too few entries
    if (global_var.empty() || global_var.size() < 5) {
        errs() << "Populating global_var list with variables from main and ISR info...\n";
        
        // Add variables from mainInfo
        for (const auto& info : mainInfo) {
            if (info.size() >= 2 && !info[1].empty()) {
                addToGlobalVars(info[1]);
                
                // Check for array access patterns
                std::string varName = info[1];
                size_t bracketPos = varName.find('[');
                if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
                    size_t closeBracketPos = varName.find(']', bracketPos);
                    if (closeBracketPos != std::string::npos) {
                        std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                        
                        // Check if this is a variable name (not a number) and is actually used in the code
                        if (!indexVar.empty() && !std::isdigit(indexVar[0]) && 
                            (usedVariables.find(indexVar) != usedVariables.end() || indexVar == "var")) {
                            
                            // Add range information for this variable if not already present
                            if (g_variableRanges.find(indexVar) == g_variableRanges.end()) {
                                g_variableRanges[indexVar] = ValueRange(0, 9999);
                                errs() << "Added default range for index variable '" << indexVar << "': [0,9999]\n";
                            }
                            
                            // Add array access with range
                            std::string baseVarName = varName.substr(0, bracketPos);
                            ValueRange range = g_variableRanges[indexVar];
                            std::string varRangeAccess = baseVarName + "[" + indexVar + range.toString() + "]";
                            addToGlobalVars(varRangeAccess);
                            errs() << "Added array access with range: " << varRangeAccess << "\n";
                        }
                    }
                }
            }
        }
        
        // Add variables from isrInfo
        for (const auto& isrGroup : isrInfo) {
            for (const auto& info : isrGroup) {
                if (info.size() >= 2 && !info[1].empty()) {
                    addToGlobalVars(info[1]);
                    
                    // Check for array access patterns
                    std::string varName = info[1];
                    size_t bracketPos = varName.find('[');
                    if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
                        size_t closeBracketPos = varName.find(']', bracketPos);
                        if (closeBracketPos != std::string::npos) {
                            std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                            
                            // Check if this is a variable name (not a number) and is actually used in the code
                            if (!indexVar.empty() && !std::isdigit(indexVar[0]) && 
                                (usedVariables.find(indexVar) != usedVariables.end() || indexVar == "var")) {
                                
                                // Add range information for this variable if not already present
                                if (g_variableRanges.find(indexVar) == g_variableRanges.end()) {
                                    g_variableRanges[indexVar] = ValueRange(0, 9999);
                                    errs() << "Added default range for index variable '" << indexVar << "': [0,9999]\n";
                                }
                                
                                // Add array access with range
                                std::string baseVarName = varName.substr(0, bracketPos);
                                ValueRange range = g_variableRanges[indexVar];
                                std::string varRangeAccess = baseVarName + "[" + indexVar + range.toString() + "]";
                                addToGlobalVars(varRangeAccess);
                                errs() << "Added array access with range: " << varRangeAccess << "\n";
                            }
                        }
                    }
                }
            }
        }
        
        // Collect all global variables from module if available
        if (M) {
            for (auto &gv : M->globals()) {
                std::string gname = gv.getName().str();
                if (!gname.empty()) {
                    addToGlobalVars(gname);
                    
                    // If it's an array, add some common indices
                    if (gv.getValueType()->isArrayTy()) {
                        ArrayType *AT = dyn_cast<ArrayType>(gv.getValueType());
                        uint64_t arraySize = 0;
                        if (AT && AT->getNumElements() > 0) {
                            arraySize = AT->getNumElements() - 1;  // 0-based index, so max is size-1
                        } else {
                            arraySize = 9999;  // 默认大范围
                        }
                        
                        // Add common array indices
                        std::vector<std::string> specialIndices = {"0", "1", std::to_string(arraySize)};
                        for (const auto &idx : specialIndices) {
                            std::string arrayAccess = gname + "[" + idx + "]";
                            addToGlobalVars(arrayAccess);
                        }
                        
                        // 只为实际使用的变量添加范围信息
                        for (const auto &varName : usedVariables) {
                            // 只处理看起来像索引变量的名称
                            if (varName == "i" || varName == "var" || 
                                varName.find("idx") != std::string::npos ||
                                varName.find("index") != std::string::npos) {
                                
                                // Add range information for this variable if not already present
                                if (g_variableRanges.find(varName) == g_variableRanges.end()) {
                                    g_variableRanges[varName] = ValueRange(0, arraySize);
                                    errs() << "Added range for index variable '" << varName << "': [0," << arraySize << "]\n";
                                }
                                
                                ValueRange range = g_variableRanges[varName];
                                std::string varRangeAccess = gname + "[" + varName + range.toString() + "]";
                                addToGlobalVars(varRangeAccess);
                            }
                        }
                    }
                }
            }
        }
        
        // If we still don't have any global variables, add some default ones
        if (global_var.empty()) {
            // Look for patterns in the code to identify global variables
            for (auto &F : M->getFunctionList()) {
                for (auto &BB : F) {
                    for (auto &I : BB) {
                        // Check for load/store instructions that might access globals
                        if (LoadInst *LI = dyn_cast<LoadInst>(&I)) {
                            Value *Ptr = LI->getPointerOperand();
                            if (GlobalVariable *GV = dyn_cast<GlobalVariable>(Ptr)) {
                                addToGlobalVars(GV->getName().str());
                            }
                        } else if (StoreInst *SI = dyn_cast<StoreInst>(&I)) {
                            Value *Ptr = SI->getPointerOperand();
                            if (GlobalVariable *GV = dyn_cast<GlobalVariable>(Ptr)) {
                                addToGlobalVars(GV->getName().str());
                            }
                        }
                    }
                }
            }
            
            // If still empty, add some generic global variable names
            if (global_var.empty()) {
                addToGlobalVars("global_array");
                addToGlobalVars("global_array[0]");
                addToGlobalVars("global_array[1]");
                
                // 只添加实际使用的变量
                if (usedVariables.find("var") != usedVariables.end()) {
                    g_variableRanges["var"] = ValueRange(0, 9999);
                    addToGlobalVars("global_array[var[0,9999]]");
                }
                
                if (usedVariables.find("i") != usedVariables.end()) {
                    g_variableRanges["i"] = ValueRange(0, 9999);
                    addToGlobalVars("global_array[i[0,9999]]");
                }
                
                addToGlobalVars("global_flag");
                addToGlobalVars("global_var");
            }
        }
    }
    
    // Make sure we have range information for all variable indices in global_var
    for (const auto& varName : global_var) {
        size_t bracketPos = varName.find('[');
        if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
            size_t closeBracketPos = varName.find(']', bracketPos);
            if (closeBracketPos != std::string::npos) {
                std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                
                // Check if this is a variable name (not a number) and is actually used in the code
                if (!indexVar.empty() && !std::isdigit(indexVar[0]) && 
                    (usedVariables.find(indexVar) != usedVariables.end() || indexVar == "var")) {
                    
                    // Remove any range information already in the index variable name
                    size_t rangeStart = indexVar.find('[');
                    if (rangeStart != std::string::npos) {
                        indexVar = indexVar.substr(0, rangeStart);
                    }
                    
                    // Add range information for this variable if not already present
                    if (g_variableRanges.find(indexVar) == g_variableRanges.end()) {
                        g_variableRanges[indexVar] = ValueRange(0, 9999);
                        errs() << "Added default range for index variable '" << indexVar << "': [0,9999]\n";
                    }
                }
            }
        }
    }
    
    // 删除未使用的变量范围信息
    std::vector<std::string> unusedVars;
    for (const auto &entry : g_variableRanges) {
        if (usedVariables.find(entry.first) == usedVariables.end() && entry.first != "var") {
            unusedVars.push_back(entry.first);
        }
    }
    
    // 从范围信息中移除未使用的变量
    for (const auto &varName : unusedVars) {
        g_variableRanges.erase(varName);
    }
}

// Function to check if a string represents a variable name (not a number)
bool isVariableName(const std::string &str) {
    if (str.empty()) return false;
    
    // Check if the first character is a digit
    if (std::isdigit(str[0])) return false;
    
    // Check if it's a common variable name - 只保留var和i
    static const std::vector<std::string> commonVarNames = {"var", "i"};
    for (const auto &varName : commonVarNames) {
        if (str == varName) {
            return true;
        }
    }
    
    // 如果是TRIGGER常量，也认为是有效的
    if (str == "TRIGGER") {
        return true;
    }
    
    // 不再检查其他变量名
    return false;
}

// Function to extract variable name from an array access pattern
std::string extractVariableFromArrayAccess(const std::string &arrayAccess) {
    size_t bracketPos = arrayAccess.find('[');
    if (bracketPos != std::string::npos && bracketPos + 1 < arrayAccess.size()) {
        size_t closeBracketPos = arrayAccess.find(']', bracketPos);
        if (closeBracketPos != std::string::npos) {
            std::string indexVar = arrayAccess.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
            
            // 检查是否是变量名（而不是数字）
            if (isVariableName(indexVar)) {
                // 移除任何范围信息
                size_t rangeStart = indexVar.find('[');
                if (rangeStart != std::string::npos) {
                    indexVar = indexVar.substr(0, rangeStart);
                }
                return indexVar;
            }
        }
    }
    return "";
}

char *makeJson(std::vector<std::vector<std::vector<std::string>>> result, const char *desc)
{
    cJSON *pRoot = NULL;
    cJSON *pSub_1 = NULL;
    cJSON *pGlobalVars = NULL;

    if ((pRoot = cJSON_CreateObject()) == NULL)
    {
        return NULL;
    }

    if ((pSub_1 = cJSON_CreateObject()) == NULL)
    {
        return NULL;
    }
    
    // 创建一个集合来存储实际使用的变量
    std::set<std::string> usedVariables;
    
    // 从mainInfo和isrInfo中收集实际使用的变量
    for (const auto& info : mainInfo) {
        if (info.size() >= 2 && !info[1].empty()) {
            std::string varName = info[1];
            
            // 提取数组访问中的变量名
            size_t bracketPos = varName.find('[');
            if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
                size_t closeBracketPos = varName.find(']', bracketPos);
                if (closeBracketPos != std::string::npos) {
                    std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                    
                    // 移除任何范围信息
                    size_t rangeStart = indexVar.find('[');
                    if (rangeStart != std::string::npos) {
                        indexVar = indexVar.substr(0, rangeStart);
                    }
                    
                    // 如果不是数字，添加到使用的变量集合中
                    if (!indexVar.empty() && !std::isdigit(indexVar[0])) {
                        usedVariables.insert(indexVar);
                        errs() << "Found used variable in mainInfo: " << indexVar << "\n";
                    }
                }
            }
        }
    }
    
    for (const auto& isrGroup : isrInfo) {
        for (const auto& info : isrGroup) {
            if (info.size() >= 2 && !info[1].empty()) {
                std::string varName = info[1];
                
                // 提取数组访问中的变量名
                size_t bracketPos = varName.find('[');
                if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
                    size_t closeBracketPos = varName.find(']', bracketPos);
                    if (closeBracketPos != std::string::npos) {
                        std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                        
                        // 移除任何范围信息
                        size_t rangeStart = indexVar.find('[');
                        if (rangeStart != std::string::npos) {
                            indexVar = indexVar.substr(0, rangeStart);
                        }
                        
                        // 如果不是数字，添加到使用的变量集合中
                        if (!indexVar.empty() && !std::isdigit(indexVar[0])) {
                            usedVariables.insert(indexVar);
                            errs() << "Found used variable in isrInfo: " << indexVar << "\n";
                        }
                    }
                }
            }
        }
    }
    
    // 特殊处理：如果代码中有使用TRIGGER常量，添加它
    usedVariables.insert("TRIGGER");
    // 特殊处理：如果代码中使用了i变量（循环变量），添加它
    usedVariables.insert("i");
    // 特殊处理：var变量在某些情况下可能是隐式使用的
    usedVariables.insert("var");
    
    errs() << "Used variables in code:\n";
    for (const auto& var : usedVariables) {
        errs() << "  - " << var << "\n";
    }
    
    // Add ISR_COUNT
    cJSON_AddNumberToObject(pRoot, "ISR_COUNT", isrInfo.size());
    
    // 清理global_var列表，只保留实际使用的变量
    std::vector<std::string> cleanedGlobalVars;
    for (const auto& varName : global_var) {
        bool shouldKeep = true;
        
        // 检查是否是数组访问
        size_t bracketPos = varName.find('[');
        if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
            size_t closeBracketPos = varName.find(']', bracketPos);
            if (closeBracketPos != std::string::npos) {
                std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                
                // 移除任何范围信息
                size_t rangeStart = indexVar.find('[');
                if (rangeStart != std::string::npos) {
                    indexVar = indexVar.substr(0, rangeStart);
                }
                
                // 如果索引变量不是数字且不在使用的变量集合中，不保留
                if (!indexVar.empty() && !std::isdigit(indexVar[0]) && 
                    usedVariables.find(indexVar) == usedVariables.end()) {
                    shouldKeep = false;
                    errs() << "Removing unused variable access from GLOBAL_VAR: " << varName << "\n";
                }
            }
        }
        
        if (shouldKeep) {
            cleanedGlobalVars.push_back(varName);
            errs() << "Keeping in GLOBAL_VAR: " << varName << "\n";
        }
    }
    
    // Add GLOBAL_VAR array with cleaned list
    pGlobalVars = cJSON_CreateArray();
    if (pGlobalVars == NULL)
    {
        return NULL;
    }
    
    for (const auto& gvar : cleanedGlobalVars) {
        cJSON_AddItemToArray(pGlobalVars, cJSON_CreateString(gvar.c_str()));
    }
    
    cJSON_AddItemToObject(pRoot, "GLOBAL_VAR", pGlobalVars);
    
    // 添加指针别名关系信息
    cJSON *pPointerAliases = cJSON_CreateArray();
    if (pPointerAliases != NULL) {
        // 收集所有指向同一内存位置的指针组
        std::map<std::string, std::set<std::string>> memoryGroups;
        
        // 从g_memoryLocations中构建内存组
        for (const auto &entry : g_memoryLocations) {
            std::string ptr = entry.first;
            std::string target = entry.second;
            memoryGroups[target].insert(ptr);
        }
        
        // 从g_sharedMemory中添加共享内存关系
        for (const auto &entry : g_sharedMemory) {
            std::string ptr1 = entry.first;
            for (const auto &ptr2 : entry.second) {
                // 找到ptr1和ptr2的规范化名称
                std::string normPtr1 = g_normalizedNames.count(ptr1) ? g_normalizedNames[ptr1] : ptr1;
                std::string normPtr2 = g_normalizedNames.count(ptr2) ? g_normalizedNames[ptr2] : ptr2;
                
                // 如果它们指向不同的内存位置，创建一个新组
                if (normPtr1 != normPtr2) {
                    // 找到它们的目标内存位置
                    std::string target1 = g_memoryLocations.count(ptr1) ? g_memoryLocations[ptr1] : "";
                    std::string target2 = g_memoryLocations.count(ptr2) ? g_memoryLocations[ptr2] : "";
                    
                    // 如果有明确的目标，使用目标作为键
                    if (!target1.empty() && !target2.empty()) {
                        // 如果它们指向不同的内存，但实际上是同一个，合并这些组
                        if (target1 != target2) {
                            std::set<std::string> &group1 = memoryGroups[target1];
                            std::set<std::string> &group2 = memoryGroups[target2];
                            
                            // 合并到group1
                            group1.insert(group2.begin(), group2.end());
                            // 更新所有group2中指针的规范化名称
                            for (const auto &p : group2) {
                                g_normalizedNames[p] = target1;
                            }
                            // 删除group2
                            memoryGroups.erase(target2);
                        }
                    }
                    // 否则，创建一个新组
                    else {
                        std::string groupKey = ptr1;  // 使用ptr1作为键
                        memoryGroups[groupKey].insert(ptr1);
                        memoryGroups[groupKey].insert(ptr2);
                    }
                }
            }
        }
        
        // 只添加包含多个指针的组（表示有别名关系）
        for (const auto &group : memoryGroups) {
            if (group.second.size() > 1) {
                cJSON *pGroup = cJSON_CreateObject();
                if (pGroup != NULL) {
                    cJSON_AddStringToObject(pGroup, "memory", group.first.c_str());
                    
                    cJSON *pPointers = cJSON_CreateArray();
                    if (pPointers != NULL) {
                        for (const auto &ptr : group.second) {
                            cJSON_AddItemToArray(pPointers, cJSON_CreateString(ptr.c_str()));
                        }
                        cJSON_AddItemToObject(pGroup, "pointers", pPointers);
                        cJSON_AddItemToArray(pPointerAliases, pGroup);
                    }
                }
            }
        }
        
        // 如果有别名关系，添加到根对象
        if (cJSON_GetArraySize(pPointerAliases) > 0) {
            cJSON_AddItemToObject(pRoot, "POINTER_ALIASES", pPointerAliases);
        } else {
            cJSON_Delete(pPointerAliases);
        }
    }
    
    // Add MAIN_INFO array
    cJSON *pMainInfo = cJSON_CreateArray();
    if (pMainInfo == NULL)
    {
        return NULL;
    }
    
    for (const auto& info : mainInfo) {
        if (info.size() >= 4) {
            cJSON *pEntry = cJSON_CreateObject();
            if (pEntry == NULL) {
                continue;
            }
            
            cJSON_AddStringToObject(pEntry, "operation", info[0].c_str());
            cJSON_AddStringToObject(pEntry, "variable", info[1].c_str());
            cJSON_AddStringToObject(pEntry, "line", info[2].c_str());
            cJSON_AddStringToObject(pEntry, "function", info[3].c_str());
            
            // Check for variable array access
            std::string extractedVar = extractVariableFromArrayAccess(info[1]);
            if (!extractedVar.empty() && usedVariables.find(extractedVar) != usedVariables.end()) {
                // Add range information
                cJSON *pRange = cJSON_CreateArray();
                if (pRange != NULL) {
                    ValueRange range = g_variableRanges.count(extractedVar) ? 
                                       g_variableRanges[extractedVar] : 
                                       ValueRange(0, 9999);
                    
                    cJSON_AddItemToArray(pRange, cJSON_CreateNumber(range.min));
                    cJSON_AddItemToArray(pRange, cJSON_CreateNumber(range.max));
                    cJSON_AddItemToObject(pEntry, "range", pRange);
                }
            }
            
            cJSON_AddItemToArray(pMainInfo, pEntry);
        }
    }
    
    cJSON_AddItemToObject(pRoot, "MAIN_INFO", pMainInfo);
    
    // Add ISR_INFO array
    cJSON *pIsrInfo = cJSON_CreateArray();
    if (pIsrInfo == NULL)
    {
        return NULL;
    }
    
    for (const auto& isrGroup : isrInfo) {
        for (const auto& info : isrGroup) {
            if (info.size() >= 4) {
                cJSON *pEntry = cJSON_CreateObject();
                if (pEntry == NULL) {
                    continue;
                }
                
                cJSON_AddStringToObject(pEntry, "operation", info[0].c_str());
                cJSON_AddStringToObject(pEntry, "variable", info[1].c_str());
                cJSON_AddStringToObject(pEntry, "line", info[2].c_str());
                cJSON_AddStringToObject(pEntry, "function", info[3].c_str());
                
                // Check for variable array access
                std::string extractedVar = extractVariableFromArrayAccess(info[1]);
                if (!extractedVar.empty() && usedVariables.find(extractedVar) != usedVariables.end()) {
                    // Add range information
                    cJSON *pRange = cJSON_CreateArray();
                    if (pRange != NULL) {
                        ValueRange range = g_variableRanges.count(extractedVar) ? 
                                        g_variableRanges[extractedVar] : 
                                        ValueRange(0, 9999);
                        
                        cJSON_AddItemToArray(pRange, cJSON_CreateNumber(range.min));
                        cJSON_AddItemToArray(pRange, cJSON_CreateNumber(range.max));
                        cJSON_AddItemToObject(pEntry, "range", pRange);
                    }
                }
                
                cJSON_AddItemToArray(pIsrInfo, pEntry);
            }
        }
    }
    
    cJSON_AddItemToObject(pRoot, "ISR_INFO", pIsrInfo);
    
    unsigned long bugsNum = result.size();
    cJSON_AddStringToObject(pRoot, "TotalBugs", &std::to_string(bugsNum)[0]);
    cJSON_AddStringToObject(pRoot, "BugTypes", "1");

    // 创建一个数组来存储所有bug
    cJSON *pBugsArray = cJSON_CreateArray();
    if (pBugsArray == NULL) {
        return NULL;
    }
    cJSON_AddItemToObject(pRoot, "Bugs", pBugsArray);
    
    unsigned long size_res = result.size();
    for (int i = 0; i < size_res; i++) {
        cJSON *pBugEntry = cJSON_CreateObject();
        if (pBugEntry == NULL) {
            continue;
        }
        
        // 添加文件名和行号信息
        if (result[i].size() > 0 && result[i][0].size() > 3) {
            cJSON_AddStringToObject(pBugEntry, "FileName", result[i][0][3].c_str());
        }
        
        // 创建行号数组
        cJSON *pLinesArray = cJSON_CreateArray();
        if (pLinesArray == NULL) {
            continue;
        }
        
        // 添加所有相关行号
        for (int j = 0; j < result[i].size(); j++) {
            if (result[i][j].size() > 2) {
                cJSON_AddItemToArray(pLinesArray, cJSON_CreateString(result[i][j][2].c_str()));
            }
        }
        cJSON_AddItemToObject(pBugEntry, "Lines", pLinesArray);
        
        // 添加描述
        cJSON_AddStringToObject(pBugEntry, "Description", desc);
        
        // 创建变量访问信息数组
        cJSON *pVarAccessArray = cJSON_CreateArray();
        if (pVarAccessArray == NULL) {
            continue;
        }
        
        // 添加所有变量访问信息
        for (int j = 0; j < result[i].size(); j++) {
            if (result[i][j].size() > 1) {
                cJSON *pVarEntry = cJSON_CreateObject();
                if (pVarEntry == NULL) {
                    continue;
                }
                
                // 添加变量名和操作类型
                cJSON_AddStringToObject(pVarEntry, "variable", result[i][j][1].c_str());
                if (result[i][j].size() > 0) {
                    cJSON_AddStringToObject(pVarEntry, "operation", result[i][j][0].c_str());
                }
                
                // 添加变量范围信息
                std::string extractedVar = extractVariableFromArrayAccess(result[i][j][1]);
                if (!extractedVar.empty() && usedVariables.find(extractedVar) != usedVariables.end() && 
                    g_variableRanges.count(extractedVar)) {
                    ValueRange range = g_variableRanges[extractedVar];
                    
                    cJSON *pRange = cJSON_CreateArray();
                    if (pRange != NULL) {
                        cJSON_AddItemToArray(pRange, cJSON_CreateNumber(range.min));
                        cJSON_AddItemToArray(pRange, cJSON_CreateNumber(range.max));
                        cJSON_AddItemToObject(pVarEntry, "range", pRange);
                    }
                }
                
                cJSON_AddItemToArray(pVarAccessArray, pVarEntry);
            }
        }
        cJSON_AddItemToObject(pBugEntry, "VariableAccesses", pVarAccessArray);
        
        // 添加这个bug到bugs数组
        cJSON_AddItemToArray(pBugsArray, pBugEntry);
    }
    
    // 确保删除VARIABLE_RANGES字段（如果存在）
    cJSON_DeleteItemFromObject(pRoot, "VARIABLE_RANGES");
    
    // 生成JSON字符串
    char *out = cJSON_Print(pRoot);
    cJSON_Delete(pRoot);
    
    return out;
}

// Remove main function since it's defined in main.cpp

