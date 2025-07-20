//
// Created by tuhaoxin on 2019-11-16.
//

#ifndef TOOL_H
#define TOOL_H
#include <iostream>
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/Analysis/CFG.h"
#include "llvm/IRReader/IRReader.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/Operator.h"
#include <vector>
#include <string>
#include <regex>
#include <cstring>
#include <map>
#include <set>
#include <limits>
#include "cJSON.h"

using namespace llvm;

// ValueRange structure for tracking variable ranges
struct ValueRange {
    int64_t min;
    int64_t max;
    bool isConstant;
    int64_t constantValue;
    
    ValueRange() : min(std::numeric_limits<int64_t>::min()), 
                  max(std::numeric_limits<int64_t>::max()),
                  isConstant(false), constantValue(0) {}
    
    ValueRange(int64_t val) : min(val), max(val), isConstant(true), constantValue(val) {}
    
    ValueRange(int64_t minVal, int64_t maxVal) : min(minVal), max(maxVal), 
                                               isConstant(minVal == maxVal), 
                                               constantValue(minVal) {}
                                               
    std::string toString() const {
        if (isConstant) {
            return std::to_string(constantValue);
        } else if (min == std::numeric_limits<int64_t>::min() && 
                  max == std::numeric_limits<int64_t>::max()) {
            return "unknown";
        } else {
            return "[" + std::to_string(min) + "," + std::to_string(max) + "]";
        }
    }
};

extern std::vector<std::vector<std::string>> mainInfo;
extern std::vector<std::vector<std::vector<std::string>>> isrInfo;

//extern std::vector<std::vector<std::string>> global_var;
extern std::vector<std::string> global_var;
extern std::vector<std::string> global_array;
extern std::vector<std::string> global_union;

extern std::map<std::string,int> mapCalledFun;
extern std::map<std::string,std::vector<std::vector<std::string>>> allFunInfo;

// Map to track variable ranges
extern std::map<std::string, ValueRange> g_variableRanges;

// Map to track pointer-to-variable relationships
extern std::map<std::string, std::string> g_pointerTargets;

// Map to track which local variables are accessed by pointers
extern std::map<std::string, std::vector<std::string>> g_localVarAccesses;

// Map to track memory locations
extern std::map<std::string, std::string> g_memoryLocations;

// Map to track shared memory locations (pointers pointing to the same memory)
extern std::map<std::string, std::set<std::string>> g_sharedMemory;

// Map to normalize variable names (map all related pointers to a canonical name)
extern std::map<std::string, std::string> g_normalizedNames;

extern int g_enable_para;

// Helper function declarations for global variable handling
void addToGlobalVars(const std::string& varName);
void ensureGlobalVarsPopulated(Module *M);
void cleanGlobalVarList(Module *M);
void registerSharedMemory(const std::string &ptr1, const std::string &ptr2);

// 添加 getTypeString 函数的声明
std::string getTypeString(Type *Ty);
std::string getStructMemberInfo(const GetElementPtrInst *GEP);
std::string handleGEPAccess(const Value *ptr, Instruction *insertPoint);
std::string traceUnionFieldAccess(const Value* ptr);

// 添加 analyzeForLoops 函数的声明
void analyzeForLoops(Function *F);

// 添加 extractVariableFromArrayAccess 函数的声明
std::string extractVariableFromArrayAccess(const std::string &arrayAccess);

// 添加 isVariableName 函数的声明
bool isVariableName(const std::string &str);

bool findSubString(std::string str_long,std::string str_short);

void travers1D(std::vector<std::string> vec_1D);

void travers2D(const std::vector<std::vector<std::string>> &vec_2D);

void travers3D(const std::vector<std::vector<std::vector<std::string>>> &vec_3D);

int findNumberInEnbleFun(Module *M);

void exactBasicInfoFun(Function *f,int g_count,int g_init);

void exactGeteleInfoFun(Function *f);

std::map<std::string,std::vector<std::vector<std::string>>> exactAllFunInfo (Module *M);

int findNumberInitFun(Module *M);
//deal with four patterns

std::vector<std::vector<std::vector<std::string>>>  pattern1RWR(std::vector<std::vector<std::string>> mainInfo,
        std::vector<std::vector<std::vector<std::string>>> isrInfo,std::map<std::string,int> mapCalledFun);

std::vector<std::vector<std::vector<std::string>>>  pattern2WWR(std::vector<std::vector<std::string>> mainInfo,
                                    std::vector<std::vector<std::vector<std::string>>> isrInfo,std::map<std::string,int> mapCalledFun);

std::vector<std::vector<std::vector<std::string>>>  pattern3RWW(std::vector<std::vector<std::string>> mainInfo,
                                    std::vector<std::vector<std::vector<std::string>>> isrInfo,std::map<std::string,int> mapCalledFun);

std::vector<std::vector<std::vector<std::string>>>  pattern4WRW(std::vector<std::vector<std::string>> mainInfo,
                                    std::vector<std::vector<std::vector<std::string>>> isrInfo,std::map<std::string,int> mapCalledFun);


char * makeJson_test();

char* makeJson(std::vector<std::vector<std::vector<std::string>>> result,const char* desc);

#endif //TOOL_H
