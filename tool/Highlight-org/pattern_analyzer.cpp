#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <set>
#include <regex>
#include <sstream>
#include <algorithm>

// 定义操作类型
enum OpType {
    READ,
    WRITE
};

// 定义操作结构，增加数组索引字段
struct Operation {
    OpType type;
    std::string variable;
    std::string function;
    std::string basicBlock;
    std::string arrayIndex;  // 新增：数组索引
    int line;

    // 判断两个操作是否操作同一个内存位置
    bool isSameMemoryLocation(const Operation& other) const {
        if (variable != other.variable) return false;
        
        // 如果数组索引为空或者相同，则认为是相同位置
        if (arrayIndex.empty() || other.arrayIndex.empty()) 
            return true;
            
        return arrayIndex == other.arrayIndex;
    }
};

// 定义缺陷结构
struct Defect {
    std::string type;        // "RWR", "RWW", "WRW", "WWR"
    std::string variable;
    std::string location;
    std::string description;
    std::string arrayIndex;  // 新增：数组索引
};

// 主分析类
class PatternAnalyzer {
public:
    PatternAnalyzer(const std::string& irFile) : irFilePath(irFile) {
        // 解析LLVM IR文件
        parseIRFile();
        
        // 识别主函数和中断函数
        identifySpecialFunctions();
    }
    
    // 提取数组访问的索引信息
    std::string extractArrayIndex(const std::string& line) {
        // 检查LLVM IR中的getelementptr指令中的索引
        // 格式: getelementptr inbounds ([10 x i32], [10 x i32]* @global_array, i64 0, i64 1)
        std::regex gepRegex("getelementptr\\s+(?:inbounds\\s+)?\\([^,]*,[^,]*,[^,]*\\s+i\\d+\\s+\\d+,\\s+i\\d+\\s+(\\d+)\\)");
        std::smatch match;
        if (std::regex_search(line, match, gepRegex)) {
            return match[1];  // 返回索引值
        }
        
        // 更简单的正则表达式，寻找 i64 0, i64 X 模式
        std::regex simpleGepRegex("i64\\s+0,\\s+i64\\s+(\\d+)");
        if (std::regex_search(line, match, simpleGepRegex)) {
            return match[1];  // 返回索引值
        }
        
        // 检查是否包含传统数组访问 [数字]
        std::regex arrayAccessRegex("\\[(\\d+)\\]");
        if (std::regex_search(line, match, arrayAccessRegex)) {
            return match[1];  // 返回索引值
        }
        
        return "";  // 如果不是数组访问或无法提取索引，返回空字符串
    }

    // 解析IR文件
    void parseIRFile() {
        std::ifstream irFile(irFilePath);
        if (!irFile.is_open()) {
            std::cerr << "Error: Could not open IR file: " << irFilePath << std::endl;
            return;
        }
        
        std::string line;
        std::string currentFunction;
        std::string currentBasicBlock;
        int lineNum = 0;
        
        std::regex funcDefRegex("define\\s+[^@]*@([a-zA-Z_][a-zA-Z0-9_]*)\\s*\\(");
        std::regex bbLabelRegex("([0-9]+):\\s*;");
        std::regex globalVarRegex("@([a-zA-Z_][a-zA-Z0-9_]*)\\s*=.*global");
        std::regex storeRegex("store\\s+(?:volatile\\s+)?[^,]*,\\s*[^@]*@([a-zA-Z_][a-zA-Z0-9_]*)");
        std::regex arrayStoreRegex("store\\s+(?:volatile\\s+)?[^,]*,\\s*[^@]*\\*\\s*%\\d+\\s*,");
        std::regex loadRegex("=\\s*load\\s+(?:volatile\\s+)?[^,]*,\\s*[^@]*@([a-zA-Z_][a-zA-Z0-9_\\[\\]\\*]*)");
        std::regex getelementRegex("getelementptr\\s+inbounds\\s+\\[\\d+\\s+x\\s+i\\d+\\],\\s*\\[\\d+\\s+x\\s+i\\d+\\]\\*\\s+@([a-zA-Z_][a-zA-Z0-9_]*)");
        
        // 用于跟踪getelementptr指令的变量和寄存器
        std::map<std::string, std::string> regToVarMap;
        std::map<std::string, std::string> regToIndexMap;
        
        // 为调试添加计数器
        int mainStoreCount = 0;
        int isrStoreCount = 0;
        
        // 读取IR文件内容
        while (std::getline(irFile, line)) {
            lineNum++;
            
            // 匹配全局变量
            std::smatch globalMatch;
            if (std::regex_search(line, globalMatch, globalVarRegex)) {
                std::string varName = globalMatch[1];
                globalVars.insert(varName);
                std::cout << "Found global variable: " << varName << std::endl;
                continue;
            }
            
            // 匹配函数定义
            std::smatch funcMatch;
            if (std::regex_search(line, funcMatch, funcDefRegex)) {
                currentFunction = funcMatch[1];
                currentBasicBlock = "entry";
                functions.insert(currentFunction);
                std::cout << "Found function: " << currentFunction << std::endl;
                continue;
            }
            
            // 匹配基本块标签
            std::smatch bbMatch;
            if (std::regex_search(line, bbMatch, bbLabelRegex)) {
                currentBasicBlock = bbMatch[1];
                continue;
            }
            
            // 匹配存储指令（写操作）
            std::smatch storeMatch;
            if (std::regex_search(line, storeMatch, storeRegex) && !currentFunction.empty()) {
                std::string varRef = storeMatch[1];
                std::string arrayIndex = extractArrayIndex(line);
                std::string varName = extractBaseVarName(varRef);
                
                // 检查是否是全局变量或其一部分
                for (const auto& globalVar : globalVars) {
                    if (varName == globalVar || varName.find(globalVar + "_") == 0) {
                        // 添加写操作
                        Operation op;
                        op.type = WRITE;
                        op.variable = globalVar;  // 使用匹配到的全局变量名
                        op.function = currentFunction;
                        op.basicBlock = currentBasicBlock;
                        op.arrayIndex = arrayIndex;  // 保存数组索引
                        op.line = lineNum;
                        operations.push_back(op);
                        
                        // 调试信息：统计不同函数中的写操作
                        if (currentFunction.find("main") != std::string::npos) {
                            mainStoreCount++;
                        } else if (currentFunction.find("isr") != std::string::npos) {
                            isrStoreCount++;
                        }
                        
                        std::cout << "Found WRITE: " << currentFunction << " writes to " 
                                  << globalVar;
                        if (!arrayIndex.empty()) {
                            std::cout << "[" << arrayIndex << "]";
                        }
                        std::cout << " (line " << lineNum << ")" << std::endl;
                        break;
                    }
                }
            }
            
            // 匹配加载指令（读操作）
            std::smatch loadMatch;
            if (std::regex_search(line, loadMatch, loadRegex) && !currentFunction.empty()) {
                std::string varRef = loadMatch[1];
                std::string arrayIndex = extractArrayIndex(line);
                std::string varName = extractBaseVarName(varRef);
                
                // 检查是否是全局变量或其一部分
                for (const auto& globalVar : globalVars) {
                    if (varName == globalVar || varName.find(globalVar + "_") == 0) {
                        // 添加读操作
                        Operation op;
                        op.type = READ;
                        op.variable = globalVar;  // 使用匹配到的全局变量名
                        op.function = currentFunction;
                        op.basicBlock = currentBasicBlock;
                        op.arrayIndex = arrayIndex;  // 保存数组索引
                        op.line = lineNum;
                        operations.push_back(op);
                        
                        std::cout << "Found READ: " << currentFunction << " reads from " 
                                  << globalVar;
                        if (!arrayIndex.empty()) {
                            std::cout << "[" << arrayIndex << "]";
                        }
                        std::cout << " (line " << lineNum << ")" << std::endl;
                        break;
                    }
                }
            }

            // 匹配getelementptr指令（数组元素访问）
            std::smatch getElemMatch;
            if (std::regex_search(line, getElemMatch, getelementRegex)) {
                std::string varName = getElemMatch[1];
                
                // 尝试提取寄存器和索引
                std::regex regAssignRegex("%([0-9]+)\\s*=\\s*getelementptr");
                std::regex indexRegex("i64\\s+0,\\s+i64\\s+([0-9]+)");
                
                std::smatch regMatch, indexMatch;
                std::string reg;
                std::string index;
                
                if (std::regex_search(line, regMatch, regAssignRegex)) {
                    reg = "%" + regMatch[1].str();
                }
                
                if (std::regex_search(line, indexMatch, indexRegex)) {
                    index = indexMatch[1];
                }
                
                if (!reg.empty()) {
                    regToVarMap[reg] = varName;
                    if (!index.empty()) {
                        regToIndexMap[reg] = index;
                    }
                }
                
                std::cout << "Found getelementptr: " << currentFunction << " accesses " << varName;
                if (!index.empty()) {
                    std::cout << "[" << index << "]";
                }
                std::cout << " stored in register " << reg << " (line " << lineNum << ")" << std::endl;
                
                continue;
            }
            
            // 匹配数组存储操作
            std::smatch arrayStoreMatch;
            if (std::regex_search(line, arrayStoreMatch, arrayStoreRegex) && !currentFunction.empty()) {
                // 尝试找到使用的寄存器
                std::regex ptrRegRegex("i32\\*\\s+(%[0-9]+)");
                std::smatch ptrMatch;
                
                if (std::regex_search(line, ptrMatch, ptrRegRegex)) {
                    std::string ptrReg = ptrMatch[1];
                    
                    // 如果这个寄存器是一个我们跟踪的数组访问
                    if (regToVarMap.find(ptrReg) != regToVarMap.end()) {
                        std::string varName = regToVarMap[ptrReg];
                        std::string arrayIndex = regToIndexMap.count(ptrReg) ? regToIndexMap[ptrReg] : "";
                        
                        // 添加写操作
                        Operation op;
                        op.type = WRITE;
                        op.variable = varName;
                        op.function = currentFunction;
                        op.basicBlock = currentBasicBlock;
                        op.arrayIndex = arrayIndex;
                        op.line = lineNum;
                        operations.push_back(op);
                        
                        // 调试信息：统计不同函数中的写操作
                        if (currentFunction.find("main") != std::string::npos) {
                            mainStoreCount++;
                        } else if (currentFunction.find("isr") != std::string::npos) {
                            isrStoreCount++;
                        }
                        
                        std::cout << "Found ARRAY WRITE: " << currentFunction << " writes to " 
                                  << varName;
                        if (!arrayIndex.empty()) {
                            std::cout << "[" << arrayIndex << "]";
                        }
                        std::cout << " (line " << lineNum << ")" << std::endl;
                    }
                }
            }
        }
        
        irFile.close();
        
        // 输出解析结果摘要
        std::cout << "Parsed IR file: " << irFilePath << std::endl;
        std::cout << "Found " << globalVars.size() << " global variables" << std::endl;
        std::cout << "Found " << functions.size() << " functions" << std::endl;
        std::cout << "Found " << operations.size() << " operations" << std::endl;
        std::cout << "Main function write operations: " << mainStoreCount << std::endl;
        std::cout << "ISR function write operations: " << isrStoreCount << std::endl;
    }
    
    // 识别主函数和中断函数
    void identifySpecialFunctions() {
        for (const auto& func : functions) {
            // 识别主函数 (名为main或包含main)
            if (func == "main" || func.find("main") != std::string::npos) {
                mainFunction = func;
            }
            
            // 识别中断函数 (包含isr、interrupt或_irq)
            std::string lowerFunc = func;
            std::transform(lowerFunc.begin(), lowerFunc.end(), lowerFunc.begin(), ::tolower);
            if (lowerFunc.find("isr") != std::string::npos || 
                lowerFunc.find("interrupt") != std::string::npos || 
                lowerFunc.find("_irq") != std::string::npos) {
                isrFunctions.insert(func);
            }
        }
        
        if (!mainFunction.empty()) {
            std::cout << "Main function: " << mainFunction << std::endl;
        } else {
            std::cout << "No main function found" << std::endl;
        }
        
        std::cout << "ISR functions: ";
        if (isrFunctions.empty()) {
            std::cout << "none";
        } else {
            for (const auto& isr : isrFunctions) {
                std::cout << isr << " ";
            }
        }
        std::cout << std::endl;
    }
    
    // 检测 RWR (Read-Write-Read) 缺陷
    void detectRWRDefects(std::vector<Defect>& defects) {
        std::cout << "\nDetecting RWR (Read-Write-Read) defects..." << std::endl;
        
        // 按变量分组的操作
        std::map<std::string, std::vector<Operation>> opsByVar;
        for (const auto& op : operations) {
            opsByVar[op.variable].push_back(op);
        }
        
        // 遍历每个变量
        for (const auto& var : globalVars) {
            std::cout << "Checking variable " << var << std::endl;
            
            // 获取此变量的所有操作
            const auto& varOps = opsByVar[var];
            
            // 按数组索引分组
            std::map<std::string, std::vector<Operation>> opsByIndex;
            for (const auto& op : varOps) {
                opsByIndex[op.arrayIndex].push_back(op);
            }
            
            // 检查每个索引的操作
            for (const auto& indexEntry : opsByIndex) {
                const auto& indexOps = indexEntry.second;
                std::string indexInfo = indexEntry.first.empty() ? "" : "[" + indexEntry.first + "]";
                
                // 分离主函数和中断函数操作
                std::map<std::string, std::vector<Operation>> funcOps;
                for (const auto& op : indexOps) {
                    funcOps[op.function].push_back(op);
                }
                
                // 检查主函数中是否有多次读操作
                if (!mainFunction.empty() && funcOps.find(mainFunction) != funcOps.end()) {
                    int readCount = 0;
                    for (const auto& op : funcOps[mainFunction]) {
                        if (op.type == READ) readCount++;
                    }
                    
                    if (readCount >= 2) {
                        std::cout << "Main function has multiple reads of " << var << indexInfo << std::endl;
                        
                        // 检查是否有中断函数写这个变量
                        for (const auto& isr : isrFunctions) {
                            if (funcOps.find(isr) != funcOps.end()) {
                                bool hasWrite = false;
                                for (const auto& op : funcOps[isr]) {
                                    if (op.type == WRITE) {
                                        hasWrite = true;
                                        break;
                                    }
                                }
                                
                                if (hasWrite) {
                                    std::cout << "Found RWR defect: multiple reads in main with write in " 
                                             << isr << " for " << var << indexInfo << std::endl;
                                    
                                    // 添加缺陷
                                    Defect defect;
                                    defect.type = "RWR";
                                    defect.variable = var;
                                    defect.location = mainFunction;
                                    defect.arrayIndex = indexEntry.first;
                                    defect.description = "RWR defect: multiple reads in " + mainFunction + 
                                                      " with write in " + isr + 
                                                      " for " + var + indexInfo;
                                    defects.push_back(defect);
                                    break;
                                }
                            }
                        }
                    }
                }
                
                // 检查中断函数之间的RWR缺陷
                std::vector<std::string> isrList(isrFunctions.begin(), isrFunctions.end());
                std::sort(isrList.begin(), isrList.end());  // 假设按优先级排序
                
                for (size_t i = 0; i < isrList.size(); i++) {
                    const std::string& lowIsr = isrList[i];
                    
                    if (funcOps.find(lowIsr) != funcOps.end()) {
                        int readCount = 0;
                        for (const auto& op : funcOps[lowIsr]) {
                            if (op.type == READ) readCount++;
                        }
                        
                        if (readCount >= 2) {
                            std::cout << "ISR " << lowIsr << " has multiple reads of " 
                                     << var << indexInfo << std::endl;
                            
                            for (size_t j = i + 1; j < isrList.size(); j++) {
                                const std::string& highIsr = isrList[j];
                                
                                if (funcOps.find(highIsr) != funcOps.end()) {
                                    bool hasWrite = false;
                                    for (const auto& op : funcOps[highIsr]) {
                                        if (op.type == WRITE) {
                                            hasWrite = true;
                                            break;
                                        }
                                    }
                                    
                                    if (hasWrite) {
                                        std::cout << "Found RWR defect: multiple reads in " << lowIsr 
                                                 << " with write in " << highIsr 
                                                 << " for " << var << indexInfo << std::endl;
                                        
                                        // 添加缺陷
                                        Defect defect;
                                        defect.type = "RWR";
                                        defect.variable = var;
                                        defect.location = lowIsr;
                                        defect.arrayIndex = indexEntry.first;
                                        defect.description = "RWR defect: multiple reads in " + lowIsr + 
                                                          " with write in " + highIsr +
                                                          " for " + var + indexInfo;
                                        defects.push_back(defect);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
                
                // 新增: 检查主函数中写-中断函数读-主函数写的情况 (WRW 模式)
                if (!mainFunction.empty() && funcOps.find(mainFunction) != funcOps.end()) {
                    std::vector<Operation> mainWrites;
                    for (const auto& op : funcOps[mainFunction]) {
                        if (op.type == WRITE) {
                            mainWrites.push_back(op);
                        }
                    }
                    
                    if (mainWrites.size() >= 2) {
                        // 主函数中有多次写操作，检查中断函数是否在这之间读取
                        for (const auto& isr : isrFunctions) {
                            if (funcOps.find(isr) != funcOps.end()) {
                                bool hasRead = false;
                                for (const auto& op : funcOps[isr]) {
                                    if (op.type == READ) {
                                        hasRead = true;
                                        break;
                                    }
                                }
                                
                                if (hasRead) {
                                    std::cout << "Found Main-WRW defect: writes in main interrupted by read in " 
                                             << isr << " for " << var << indexInfo << std::endl;
                                    
                                    // 添加缺陷
                                    Defect defect;
                                    defect.type = "Main-WRW";
                                    defect.variable = var;
                                    defect.location = mainFunction;
                                    defect.arrayIndex = indexEntry.first;
                                    defect.description = "Main-WRW defect: multiple writes in " + mainFunction + 
                                                    " with potential interrupting read in " + isr + 
                                                    " for " + var + indexInfo;
                                    defects.push_back(defect);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 检测主函数内部与中断函数之间的交错执行引起的缺陷
    void detectInterleaveDefects(std::vector<Defect>& defects) {
        std::cout << "\nDetecting Interleave defects (main function operations interrupted by ISRs)..." << std::endl;
        
        // 按变量分组的操作
        std::map<std::string, std::vector<Operation>> opsByVar;
        for (const auto& op : operations) {
            opsByVar[op.variable].push_back(op);
        }
        
        // 遍历每个变量
        for (const auto& var : globalVars) {
            std::cout << "Checking interleave for variable " << var << std::endl;
            
            // 获取此变量的所有操作
            const auto& varOps = opsByVar[var];
            
            // 如果是数组，则找出所有明确的索引
            std::set<std::string> allIndices;
            for (const auto& op : varOps) {
                if (!op.arrayIndex.empty()) {
                    allIndices.insert(op.arrayIndex);
                }
            }
            
            // 分离主函数和中断函数操作
            std::map<std::string, std::vector<Operation>> funcOps;
            for (const auto& op : varOps) {
                funcOps[op.function].push_back(op);
            }
            
            // 对于每个索引以及未指定索引的情况
            std::set<std::string> indicesToCheck;
            
            // 如果有明确的索引，则只检查明确的索引
            if (!allIndices.empty()) {
                indicesToCheck = allIndices;
            } else {
                // 否则只检查未指定索引的情况
                indicesToCheck.insert("");
            }
            
            // 用于跟踪已经报告的缺陷，避免重复
            std::set<std::pair<std::string, std::string>> reportedDefects;
            
            for (const std::string& indexStr : indicesToCheck) {
                std::string indexInfo = indexStr.empty() ? "" : "[" + indexStr + "]";
                std::cout << "  Checking index " << (indexInfo.empty() ? "(none)" : indexInfo) << std::endl;
                
                // 收集主函数中写此索引的操作
                std::vector<Operation> mainWrites;
                if (!mainFunction.empty() && funcOps.find(mainFunction) != funcOps.end()) {
                    for (const auto& op : funcOps[mainFunction]) {
                        // 只收集对特定索引的写操作，确保索引匹配
                        if (op.type == WRITE && op.arrayIndex == indexStr) {
                            mainWrites.push_back(op);
                        }
                    }
                }
                
                // 输出找到的写操作数量
                std::cout << "  Found " << mainWrites.size() << " write operations to exact index in main function" << std::endl;
                
                // 只有当主函数中有多次写操作时才检查可能的交错执行问题
                if (mainWrites.size() >= 2) {
                    std::cout << "  Multiple writes to same index detected in main function" << std::endl;
                    
                    // 检查中断函数是否有读此索引的操作
                    for (const auto& isr : isrFunctions) {
                        if (funcOps.find(isr) != funcOps.end()) {
                            // 收集中断函数中读此索引的操作
                            std::vector<Operation> isrReads;
                            for (const auto& op : funcOps[isr]) {
                                // 只收集对特定索引的读操作，确保索引匹配
                                if (op.type == READ && op.arrayIndex == indexStr) {
                                    isrReads.push_back(op);
                                }
                            }
                            
                            if (!isrReads.empty()) {
                                std::cout << "  Found " << isrReads.size() << " read operations in " << isr << std::endl;
                                
                                // 检查是否已经报告过这个变量和中断函数的组合
                                std::pair<std::string, std::string> defectKey = std::make_pair(var + indexInfo, isr);
                                if (reportedDefects.find(defectKey) != reportedDefects.end()) {
                                    std::cout << "  Skipping duplicate defect for " << var << indexInfo << std::endl;
                                    continue;
                                }
                                
                                // 添加WRW模式的缺陷（主函数写-中断读-主函数写）
                                Defect defect;
                                defect.type = "WRW";  // 使用标准的WRW模式名称
                                defect.variable = var;
                                defect.location = mainFunction;  // 主函数是主要位置
                                defect.arrayIndex = indexStr;
                                defect.description = "WRW defect: multiple writes in " + mainFunction + 
                                                   " with interrupting read in " + isr + 
                                                   " for " + var + indexInfo;
                                defects.push_back(defect);
                                
                                // 记录已报告的缺陷
                                reportedDefects.insert(defectKey);
                                
                                std::cout << "  Found WRW defect: multiple writes in main with interrupting read in " 
                                         << isr << " for " << var << indexInfo << std::endl;
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 检测 RWW (Read-Write-Write) 缺陷
    void detectRWWDefects(std::vector<Defect>& defects) {
        std::cout << "\nDetecting RWW (Read-Write-Write) defects..." << std::endl;
        
        // 按变量分组的操作
        std::map<std::string, std::vector<Operation>> opsByVar;
        for (const auto& op : operations) {
            opsByVar[op.variable].push_back(op);
        }
        
        // 遍历每个变量
        for (const auto& var : globalVars) {
            // 获取此变量的所有操作
            const auto& varOps = opsByVar[var];
            
            // 按数组索引分组
            std::map<std::string, std::vector<Operation>> opsByIndex;
            for (const auto& op : varOps) {
                opsByIndex[op.arrayIndex].push_back(op);
            }
            
            // 检查每个索引的操作
            for (const auto& indexEntry : opsByIndex) {
                const auto& indexOps = indexEntry.second;
                std::string indexInfo = indexEntry.first.empty() ? "" : "[" + indexEntry.first + "]";
                
                // 分离主函数和中断函数操作
                std::map<std::string, std::vector<Operation>> funcOps;
                for (const auto& op : indexOps) {
                    funcOps[op.function].push_back(op);
                }
                
                // 检查主函数中是否有读和写操作
                if (!mainFunction.empty() && funcOps.find(mainFunction) != funcOps.end()) {
                    bool hasRead = false;
                    bool hasWrite = false;
                    
                    for (const auto& op : funcOps[mainFunction]) {
                        if (op.type == READ) hasRead = true;
                        if (op.type == WRITE) hasWrite = true;
                    }
                    
                    if (hasRead && hasWrite) {
                        // 检查是否有中断函数写这个变量
                        for (const auto& isr : isrFunctions) {
                            if (funcOps.find(isr) != funcOps.end()) {
                                bool hasIsrWrite = false;
                                for (const auto& op : funcOps[isr]) {
                                    if (op.type == WRITE) {
                                        hasIsrWrite = true;
                                        break;
                                    }
                                }
                                
                                if (hasIsrWrite) {
                                    std::cout << "Found RWW defect: read and write in main with write in " 
                                             << isr << " for " << var << indexInfo << std::endl;
                                    
                                    // 添加缺陷
                                    Defect defect;
                                    defect.type = "RWW";
                                    defect.variable = var;
                                    defect.location = mainFunction;
                                    defect.arrayIndex = indexEntry.first;
                                    defect.description = "RWW defect: read and write in " + mainFunction + 
                                                       " with write in " + isr +
                                                       " for " + var + indexInfo;
                                    defects.push_back(defect);
                                    break;
                                }
                            }
                        }
                    }
                }
                
                // 检查中断函数之间的RWW缺陷
                std::vector<std::string> isrList(isrFunctions.begin(), isrFunctions.end());
                std::sort(isrList.begin(), isrList.end());  // 假设按优先级排序
                
                for (size_t i = 0; i < isrList.size(); i++) {
                    const std::string& lowIsr = isrList[i];
                    
                    if (funcOps.find(lowIsr) != funcOps.end()) {
                        bool hasRead = false;
                        bool hasWrite = false;
                        
                        for (const auto& op : funcOps[lowIsr]) {
                            if (op.type == READ) hasRead = true;
                            if (op.type == WRITE) hasWrite = true;
                        }
                        
                        if (hasRead && hasWrite) {
                            for (size_t j = i + 1; j < isrList.size(); j++) {
                                const std::string& highIsr = isrList[j];
                                
                                if (funcOps.find(highIsr) != funcOps.end()) {
                                    bool hasHighIsrWrite = false;
                                    for (const auto& op : funcOps[highIsr]) {
                                        if (op.type == WRITE) {
                                            hasHighIsrWrite = true;
                                            break;
                                        }
                                    }
                                    
                                    if (hasHighIsrWrite) {
                                        std::cout << "Found RWW defect: read and write in " << lowIsr 
                                                 << " with write in " << highIsr 
                                                 << " for " << var << indexInfo << std::endl;
                                        
                                        // 添加缺陷
                                        Defect defect;
                                        defect.type = "RWW";
                                        defect.variable = var;
                                        defect.location = lowIsr;
                                        defect.arrayIndex = indexEntry.first;
                                        defect.description = "RWW defect: read and write in " + lowIsr + 
                                                           " with write in " + highIsr +
                                                           " for " + var + indexInfo;
                                        defects.push_back(defect);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 检测 WRW (Write-Read-Write) 缺陷
    void detectWRWDefects(std::vector<Defect>& defects) {
        std::cout << "\nDetecting WRW (Write-Read-Write) defects..." << std::endl;
        
        // 按变量分组的操作
        std::map<std::string, std::vector<Operation>> opsByVar;
        for (const auto& op : operations) {
            opsByVar[op.variable].push_back(op);
        }
        
        // 遍历每个变量
        for (const auto& var : globalVars) {
            // 获取此变量的所有操作
            const auto& varOps = opsByVar[var];
            
            // 按数组索引分组
            std::map<std::string, std::vector<Operation>> opsByIndex;
            for (const auto& op : varOps) {
                opsByIndex[op.arrayIndex].push_back(op);
            }
            
            // 检查每个索引的操作
            for (const auto& indexEntry : opsByIndex) {
                const auto& indexOps = indexEntry.second;
                std::string indexInfo = indexEntry.first.empty() ? "" : "[" + indexEntry.first + "]";
                
                // 分离主函数和中断函数操作
                std::map<std::string, std::vector<Operation>> funcOps;
                for (const auto& op : indexOps) {
                    funcOps[op.function].push_back(op);
                }
                
                // 检查主函数中是否有多次写操作
                if (!mainFunction.empty() && funcOps.find(mainFunction) != funcOps.end()) {
                    int writeCount = 0;
                    for (const auto& op : funcOps[mainFunction]) {
                        if (op.type == WRITE) writeCount++;
                    }
                    
                    if (writeCount >= 2) {
                        // 检查是否有中断函数读这个变量
                        for (const auto& isr : isrFunctions) {
                            if (funcOps.find(isr) != funcOps.end()) {
                                bool hasIsrRead = false;
                                for (const auto& op : funcOps[isr]) {
                                    if (op.type == READ) {
                                        hasIsrRead = true;
                                        break;
                                    }
                                }
                                
                                if (hasIsrRead) {
                                    std::cout << "Found WRW defect: multiple writes in main with read in " 
                                             << isr << " for " << var << indexInfo << std::endl;
                                    
                                    // 添加缺陷
                                    Defect defect;
                                    defect.type = "WRW";
                                    defect.variable = var;
                                    defect.location = mainFunction;
                                    defect.arrayIndex = indexEntry.first;
                                    defect.description = "WRW defect: multiple writes in " + mainFunction + 
                                                       " with read in " + isr +
                                                       " for " + var + indexInfo;
                                    defects.push_back(defect);
                                    break;
                                }
                            }
                        }
                    }
                }
                
                // 检查中断函数之间的WRW缺陷
                std::vector<std::string> isrList(isrFunctions.begin(), isrFunctions.end());
                std::sort(isrList.begin(), isrList.end());  // 假设按优先级排序
                
                for (size_t i = 0; i < isrList.size(); i++) {
                    const std::string& lowIsr = isrList[i];
                    
                    if (funcOps.find(lowIsr) != funcOps.end()) {
                        int writeCount = 0;
                        for (const auto& op : funcOps[lowIsr]) {
                            if (op.type == WRITE) writeCount++;
                        }
                        
                        if (writeCount >= 2) {
                            for (size_t j = i + 1; j < isrList.size(); j++) {
                                const std::string& highIsr = isrList[j];
                                
                                if (funcOps.find(highIsr) != funcOps.end()) {
                                    bool hasHighIsrRead = false;
                                    for (const auto& op : funcOps[highIsr]) {
                                        if (op.type == READ) {
                                            hasHighIsrRead = true;
                                            break;
                                        }
                                    }
                                    
                                    if (hasHighIsrRead) {
                                        std::cout << "Found WRW defect: multiple writes in " << lowIsr 
                                                 << " with read in " << highIsr 
                                                 << " for " << var << indexInfo << std::endl;
                                        
                                        // 添加缺陷
                                        Defect defect;
                                        defect.type = "WRW";
                                        defect.variable = var;
                                        defect.location = lowIsr;
                                        defect.arrayIndex = indexEntry.first;
                                        defect.description = "WRW defect: multiple writes in " + lowIsr + 
                                                           " with read in " + highIsr +
                                                           " for " + var + indexInfo;
                                        defects.push_back(defect);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 检测 WWR (Write-Write-Read) 缺陷
    void detectWWRDefects(std::vector<Defect>& defects) {
        std::cout << "\nDetecting WWR (Write-Write-Read) defects..." << std::endl;
        
        // 按变量分组的操作
        std::map<std::string, std::vector<Operation>> opsByVar;
        for (const auto& op : operations) {
            opsByVar[op.variable].push_back(op);
        }
        
        // 遍历每个变量
        for (const auto& var : globalVars) {
            // 获取此变量的所有操作
            const auto& varOps = opsByVar[var];
            
            // 按数组索引分组
            std::map<std::string, std::vector<Operation>> opsByIndex;
            for (const auto& op : varOps) {
                opsByIndex[op.arrayIndex].push_back(op);
            }
            
            // 检查每个索引的操作
            for (const auto& indexEntry : opsByIndex) {
                const auto& indexOps = indexEntry.second;
                std::string indexInfo = indexEntry.first.empty() ? "" : "[" + indexEntry.first + "]";
                
                // 分离主函数和中断函数操作
                std::map<std::string, std::vector<Operation>> funcOps;
                for (const auto& op : indexOps) {
                    funcOps[op.function].push_back(op);
                }
                
                // 检查主函数中是否有写和读操作
                if (!mainFunction.empty() && funcOps.find(mainFunction) != funcOps.end()) {
                    bool hasWrite = false;
                    bool hasRead = false;
                    
                    for (const auto& op : funcOps[mainFunction]) {
                        if (op.type == WRITE) hasWrite = true;
                        if (op.type == READ) hasRead = true;
                    }
                    
                    if (hasWrite && hasRead) {
                        // 检查是否有中断函数写这个变量
                        for (const auto& isr : isrFunctions) {
                            if (funcOps.find(isr) != funcOps.end()) {
                                bool hasIsrWrite = false;
                                for (const auto& op : funcOps[isr]) {
                                    if (op.type == WRITE) {
                                        hasIsrWrite = true;
                                        break;
                                    }
                                }
                                
                                if (hasIsrWrite) {
                                    std::cout << "Found WWR defect: write and read in main with write in " 
                                             << isr << " for " << var << indexInfo << std::endl;
                                    
                                    // 添加缺陷
                                    Defect defect;
                                    defect.type = "WWR";
                                    defect.variable = var;
                                    defect.location = mainFunction;
                                    defect.arrayIndex = indexEntry.first;
                                    defect.description = "WWR defect: write and read in " + mainFunction + 
                                                       " with write in " + isr +
                                                       " for " + var + indexInfo;
                                    defects.push_back(defect);
                                    break;
                                }
                            }
                        }
                    }
                }
                
                // 检查中断函数之间的WWR缺陷
                std::vector<std::string> isrList(isrFunctions.begin(), isrFunctions.end());
                std::sort(isrList.begin(), isrList.end());  // 假设按优先级排序
                
                for (size_t i = 0; i < isrList.size(); i++) {
                    const std::string& lowIsr = isrList[i];
                    
                    if (funcOps.find(lowIsr) != funcOps.end()) {
                        bool hasWrite = false;
                        bool hasRead = false;
                        
                        for (const auto& op : funcOps[lowIsr]) {
                            if (op.type == WRITE) hasWrite = true;
                            if (op.type == READ) hasRead = true;
                        }
                        
                        if (hasWrite && hasRead) {
                            for (size_t j = i + 1; j < isrList.size(); j++) {
                                const std::string& highIsr = isrList[j];
                                
                                if (funcOps.find(highIsr) != funcOps.end()) {
                                    bool hasHighIsrWrite = false;
                                    for (const auto& op : funcOps[highIsr]) {
                                        if (op.type == WRITE) {
                                            hasHighIsrWrite = true;
                                            break;
                                        }
                                    }
                                    
                                    if (hasHighIsrWrite) {
                                        std::cout << "Found WWR defect: write and read in " << lowIsr 
                                                 << " with write in " << highIsr 
                                                 << " for " << var << indexInfo << std::endl;
                                        
                                        // 添加缺陷
                                        Defect defect;
                                        defect.type = "WWR";
                                        defect.variable = var;
                                        defect.location = lowIsr;
                                        defect.arrayIndex = indexEntry.first;
                                        defect.description = "WWR defect: write and read in " + lowIsr + 
                                                           " with write in " + highIsr +
                                                           " for " + var + indexInfo;
                                        defects.push_back(defect);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    // 检测所有缺陷
    std::vector<Defect> detectAllDefects() {
        std::vector<Defect> defects;
        
        // 检测各种模式的缺陷
        detectRWRDefects(defects);
        detectRWWDefects(defects);
        detectWRWDefects(defects);
        detectWWRDefects(defects);
        
        // 新增: 检测主函数与中断函数之间的交错执行导致的缺陷
        detectInterleaveDefects(defects);
        
        return defects;
    }
    
    // 保存检测结果到文件
    void saveResults(const std::vector<Defect>& defects, const std::string& outputFile) {
        std::ofstream outFile(outputFile);
        if (!outFile.is_open()) {
            std::cerr << "Error: Could not open output file: " << outputFile << std::endl;
            return;
        }
        
        if (defects.empty()) {
            outFile << "No defects!" << std::endl;
        } else {
            outFile << "Found defects in " << irFilePath << ":" << std::endl << std::endl;
            
            // 按缺陷类型分组
            std::map<std::string, std::vector<Defect>> defectsByType;
            for (const auto& defect : defects) {
                defectsByType[defect.type].push_back(defect);
            }
            
            for (const auto& pair : defectsByType) {
                const std::string& defectType = pair.first;
                const std::vector<Defect>& typeDefects = pair.second;
                
                for (const auto& defect : typeDefects) {
                    outFile << "Defect_Pattern: " << defect.type << std::endl;
                    outFile << "Variable: " << defect.variable;
                    if (!defect.arrayIndex.empty()) {
                        outFile << "[" << defect.arrayIndex << "]";
                    }
                    outFile << std::endl;
                    outFile << "Location: " << defect.location << std::endl;
                    outFile << "Description: " << defect.description << std::endl;
                    outFile << "---" << std::endl;
                }
            }
        }
        
        outFile.close();
        std::cout << "Results saved to: " << outputFile << std::endl;
    }

private:
    std::string irFilePath;
    std::set<std::string> globalVars;
    std::set<std::string> functions;
    std::vector<Operation> operations;
    std::string mainFunction;
    std::set<std::string> isrFunctions;

    // 从变量引用中提取基本变量名（去除数组访问等）
    std::string extractBaseVarName(const std::string& varRef) {
        // 如果包含[，提取[前面的部分
        size_t bracketPos = varRef.find('[');
        if (bracketPos != std::string::npos) {
            return varRef.substr(0, bracketPos);
        }
        return varRef;
    }
};

// 生成输出文件名
std::string generateOutputFilename(const std::string& inputPath) {
    // 获取不包含路径的文件名
    std::string filename = inputPath;
    size_t lastSlash = filename.find_last_of("/\\");
    if (lastSlash != std::string::npos) {
        filename = filename.substr(lastSlash + 1);
    }
    
    // 移除扩展名
    size_t lastDot = filename.find_last_of(".");
    if (lastDot != std::string::npos) {
        filename = filename.substr(0, lastDot);
    }
    
    // 添加输出扩展名
    filename += "_defects.txt";
    
    return filename;
}

// 主函数
int main(int argc, char** argv) {
    // 检查命令行参数
    if (argc < 2) {
        std::cerr << "Usage: " << argv[0] << " <IR_FILE_PATH> [OUTPUT_FILE_PATH]" << std::endl;
        return 1;
    }
    
    // 获取输入和输出文件路径
    std::string irFilePath = argv[1];
    std::string outputFilePath;
    if (argc >= 3) {
        outputFilePath = argv[2];
    } else {
        outputFilePath = generateOutputFilename(irFilePath);
    }
    
    std::cout << "Analyzing IR file: " << irFilePath << std::endl;
    std::cout << "Output will be written to: " << outputFilePath << std::endl;
    
    // 创建分析器并运行分析
    PatternAnalyzer analyzer(irFilePath);
    std::vector<Defect> defects = analyzer.detectAllDefects();
    
    std::cout << "Detected " << defects.size() << " defects" << std::endl;
    
    // 保存结果
    analyzer.saveResults(defects, outputFilePath);
    
    return 0;
} 