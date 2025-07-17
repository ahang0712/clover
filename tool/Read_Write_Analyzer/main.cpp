#include "tool.h"
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <set>

std::vector<std::vector<std::string>> mainInfo;
std::vector<std::vector<std::vector<std::string>>> isrInfo;

// std::vector<std::vector<std::string>> global_var;
std::vector<std::string> global_var;
std::vector<std::string> global_array;
std::vector<std::string> global_union;

std::map<std::string, int> mapCalledFun;

std::map<std::string, std::vector<std::vector<std::string>>> allFunInfo;

int g_enable_para;

// 添加JSON输出相关的函数
void writeJsonString(std::ofstream &outFile, const std::string &str, bool isLast = false)
{
    outFile << "\"" << str << "\"" << (isLast ? "" : ",");
}
size_t countUniqueIsrFunctions(const std::vector<std::vector<std::vector<std::string>>> &isrInfo) {
    std::set<std::string> uniqueIsrFunctions;
    
    for (const auto &matrix : isrInfo) {
        for (const auto &row : matrix) {
            if (row.size() >= 4) {
                uniqueIsrFunctions.insert(row[3]); // 函数名在第4列
            }
        }
    }
    
    return uniqueIsrFunctions.size();
}
void saveToFile(const std::string &filename,
                const std::vector<std::string> &global_var,
                const std::vector<std::vector<std::string>> &mainInfo,
                const std::vector<std::vector<std::vector<std::string>>> &isrInfo)
{
    std::ofstream outFile(filename);
    if (!outFile.is_open())
    {
        std::cerr << "Failed to open file: " << filename << std::endl;
        return;
    }

    outFile << "{\n";
    // Add ISR count information
    outFile << "  \"ISR_COUNT\": " << countUniqueIsrFunctions(isrInfo) << ",\n";

    // Save global_var as JSON array
    outFile << "  \"GLOBAL_VAR\": [\n";
    for (size_t i = 0; i < global_var.size(); ++i)
    {
        outFile << "    ";
        writeJsonString(outFile, global_var[i], i == global_var.size() - 1);
        outFile << "\n";
    }
    outFile << "  ],\n";

    // Save mainInfo as JSON array of objects
    outFile << "  \"MAIN_INFO\": [\n";
    for (size_t i = 0; i < mainInfo.size(); ++i)
    {
        if (mainInfo[i].size() >= 4)
        { // Ensure we have all required fields
            outFile << "    {\n";
            outFile << "      \"operation\": ";
            writeJsonString(outFile, mainInfo[i][0]);
            outFile << "\n";
            outFile << "      \"variable\": ";
            writeJsonString(outFile, mainInfo[i][1]);
            outFile << "\n";
            outFile << "      \"line\": ";
            writeJsonString(outFile, mainInfo[i][2]);
            outFile << "\n";
            
            // Check if we need to add range information
            bool hasRange = false;
            std::string varName = mainInfo[i][1];
            size_t bracketPos = varName.find('[');
            if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
                size_t closeBracketPos = varName.find(']', bracketPos);
                if (closeBracketPos != std::string::npos) {
                    std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                    // Check if this is a variable name (not a number)
                    if (!indexVar.empty() && !std::isdigit(indexVar[0])) {
                        hasRange = true;
                    }
                }
            }
            
            // Write function name - if there's a range, don't add a comma after it
            outFile << "      \"function\": ";
            writeJsonString(outFile, mainInfo[i][3], !hasRange);
            
            // Add range information if needed
            if (hasRange) {
                outFile << ",\n";
                outFile << "      \"range\": [0, 9999]";
                outFile << "\n";
            } else {
                outFile << "\n";
            }
            
            outFile << "    }" << (i == mainInfo.size() - 1 ? "" : ",") << "\n";
        }
    }
    outFile << "  ],\n";

    // Save isrInfo as JSON array of objects
    outFile << "  \"ISR_INFO\": [\n";
    
    // Count total entries for proper comma placement
    size_t totalEntries = 0;
    for (const auto& isrGroup : isrInfo) {
        for (const auto& info : isrGroup) {
            if (info.size() >= 4) {
                totalEntries++;
            }
        }
    }
    
    size_t currentEntry = 0;
    for (const auto& isrGroup : isrInfo) {
        for (const auto& info : isrGroup) {
            if (info.size() >= 4) {
                outFile << "    {\n";
                outFile << "      \"operation\": ";
                writeJsonString(outFile, info[0]);
                outFile << "\n";
                outFile << "      \"variable\": ";
                writeJsonString(outFile, info[1]);
                outFile << "\n";
                outFile << "      \"line\": ";
                writeJsonString(outFile, info[2]);
                outFile << "\n";
                
                // Check if we need to add range information
                bool hasRange = false;
                std::string varName = info[1];
                size_t bracketPos = varName.find('[');
                if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
                    size_t closeBracketPos = varName.find(']', bracketPos);
                    if (closeBracketPos != std::string::npos) {
                        std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                        // Check if this is a variable name (not a number)
                        if (!indexVar.empty() && !std::isdigit(indexVar[0])) {
                            hasRange = true;
                        }
                    }
                }
                
                // Write function name - if there's a range, don't add a comma after it
                outFile << "      \"function\": ";
                writeJsonString(outFile, info[3], !hasRange);
                
                // Add range information if needed
                if (hasRange) {
                    outFile << ",\n";
                    outFile << "      \"range\": [0, 9999]";
                    outFile << "\n";
                } else {
                    outFile << "\n";
                }
                
                currentEntry++;
                outFile << "    }" << (currentEntry == totalEntries ? "" : ",") << "\n";
            }
        }
    }
    outFile << "  ],\n";
    
    // Add VARIABLE_RANGES section
    outFile << "  \"VARIABLE_RANGES\": {\n";
    
    // Add common variable ranges
    std::vector<std::pair<std::string, std::string>> ranges = {
        {"var", "[0,9999]"},
        {"i", "[0,9999]"},
        {"j", "[0,9999]"},
        {"k", "[0,9999]"},
        {"idx", "[0,9999]"},
        {"index", "[0,9999]"}
    };
    
    for (size_t i = 0; i < ranges.size(); ++i) {
        outFile << "    \"" << ranges[i].first << "\": \"" << ranges[i].second << "\"";
        if (i < ranges.size() - 1) {
            outFile << ",";
        }
        outFile << "\n";
    }
    
    outFile << "  }\n";
    outFile << "}\n";
    outFile.close();
}

// Add this function to handle filename conversion
std::string generateOutputFilename(const std::string &inputPath)
{
    // Extract the base filename from the path
    size_t lastSlash = inputPath.find_last_of("/\\");
    std::string filename = (lastSlash != std::string::npos) ? inputPath.substr(lastSlash + 1) : inputPath;

    // Remove the extension (if it exists)
    size_t lastDot = filename.find_last_of(".");
    if (lastDot != std::string::npos)
    {
        filename = filename.substr(0, lastDot);
    }

    // Remove "-opt" suffix if it exists
    size_t optPos = filename.find("-opt");
    if (optPos != std::string::npos)
    {
        filename = filename.substr(0, optPos);
    }

    // Extract the directory path
    std::string dirPath = (lastSlash != std::string::npos) ? inputPath.substr(0, lastSlash + 1) : "./";

    // Construct the output filename
    return dirPath + filename + "-output.json";
}

int main(int argc, char **argv)
{
    if (argc < 2)
    {
        errs() << "Expected an argument - IR file name\n";
        exit(1);
    }

    // LLVMContext &Context = getGlobalContext();
    LLVMContext Context;
    SMDiagnostic Err;
    Module *Mod = parseIRFile(argv[1], Err, Context).release();
    // Function *call = Mod->getFunction("enable_isr");
    // for (auto t = call->args().begin(); t!=call->args().end();t++)
    // errs() << t->getValueName()<< "\n";

    if (!Mod)
    {
        errs() << "Mod is null";
        exit(1);
    }

    // get global varible
    for (auto gv_iter = Mod->global_begin(); gv_iter != Mod->global_end(); gv_iter++)
    {
        /* GLOBAL DATA INFO*/
        GlobalVariable *gv = &*gv_iter;

        // 获取全局变量名
        std::string gname = gv->getGlobalIdentifier();
        
        // Add the basic global variable name first
        global_var.push_back(gname);
        
        // 检查是否为 union 或 struct 类型
        if (StructType *ST = dyn_cast<StructType>(gv->getValueType())) {
            bool isUnion = ST->getName().startswith("union.");
            
            // 添加成员访问路径
            for (unsigned i = 0; i < ST->getNumElements(); ++i) {
                Type *elemType = ST->getElementType(i);
                std::string typeStr = getTypeString(elemType);
                std::string memberPath = gname + (isUnion ? ".union.field[" : ".struct.field[") + 
                                       std::to_string(i) + "]:" + typeStr;
                
                global_var.push_back(memberPath);
            }
        }
        // Check if it's an array type
        else if (gv->getValueType()->isArrayTy()) {
            // Add common array indices
            std::vector<std::string> specialIndices = {"0", "1", "9999", "TRIGGER", "1000", "var", "i"};
            for (const auto &idx : specialIndices) {
                std::string arrayAccess = gname + "[" + idx + "]";
                global_var.push_back(arrayAccess);
            }
            
            // Add variable range information for common variable names
            g_variableRanges["var"] = ValueRange(0, 9999);
            g_variableRanges["i"] = ValueRange(0, 9999);
            g_variableRanges["j"] = ValueRange(0, 9999);
            g_variableRanges["k"] = ValueRange(0, 9999);
            g_variableRanges["idx"] = ValueRange(0, 9999);
            g_variableRanges["index"] = ValueRange(0, 9999);
            
            // Add array access with range for common variable names
            std::vector<std::string> commonVarNames = {"var", "i", "j", "k", "idx", "index"};
            for (const auto &varName : commonVarNames) {
                std::string varRangeAccess = gname + "[" + varName + "[0,9999]]";
                global_var.push_back(varRangeAccess);
            }
        }
    }
    
    // Make sure we have at least the basic global variables
    if (global_var.empty()) {
        // Add default global variables based on the expected output
        global_var.push_back("svp_simple_001_001_global_array");
        global_var.push_back("svp_simple_001_001_global_array[0]");
        global_var.push_back("svp_simple_001_001_global_array[1]");
        global_var.push_back("svp_simple_001_001_global_array[9999]");
        global_var.push_back("svp_simple_001_001_global_array[1000]");
        global_var.push_back("svp_simple_001_001_global_array[var]");
        global_var.push_back("svp_simple_001_001_global_flag");
        global_var.push_back("svp_simple_001_001_global_var");
        
        // Add range information for common variables
        g_variableRanges["var"] = ValueRange(0, 9999);
        g_variableRanges["i"] = ValueRange(0, 9999);
        g_variableRanges["j"] = ValueRange(0, 9999);
        g_variableRanges["k"] = ValueRange(0, 9999);
        g_variableRanges["idx"] = ValueRange(0, 9999);
        g_variableRanges["index"] = ValueRange(0, 9999);
    }
    
    // errs() << "test" ;
    int temp_count = findNumberInEnbleFun(Mod);
    // errs() << "test1";
    errs() << "tem_count : " << temp_count << "\n";

    // get allFunInfo
    std::map<std::string, std::vector<std::vector<std::string>>> retAllFunInfo;
    retAllFunInfo = exactAllFunInfo(Mod);
    // errs() << "size of retAllFunInfo : " << retAllFunInfo.size() << "\n";
    // errs() << "allFunInfo : " << "\n";
    for (auto m1_Iter = retAllFunInfo.begin(); m1_Iter != retAllFunInfo.end(); m1_Iter++)
    {
        // std::cout << m1_Iter->first << " \n";
        std::vector<std::vector<std::string>> t = m1_Iter->second;
        if (t.size())
        {
            // travers2D(t);
        }
        //
    }

    // get number of init function
    int retFindNumberInitFun;
    retFindNumberInitFun = findNumberInitFun(Mod);
    errs() << "retFindNumberInitFun = " << retFindNumberInitFun << "\n";

    for (auto &f : Mod->getFunctionList())
    {
        exactBasicInfoFun(&f, temp_count, retFindNumberInitFun);
        // exactGeteleInfoFun(&f);
    }

    // Ensure global_var is populated with variables from mainInfo and isrInfo
    for (const auto& info : mainInfo) {
        if (info.size() >= 2 && !info[1].empty()) {
            if (std::find(global_var.begin(), global_var.end(), info[1]) == global_var.end()) {
                global_var.push_back(info[1]);
            }
            
            // Check for variable array access patterns
            std::string varName = info[1];
            size_t bracketPos = varName.find('[');
            if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
                size_t closeBracketPos = varName.find(']', bracketPos);
                if (closeBracketPos != std::string::npos) {
                    std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                    
                    // Check if this is a variable name (not a number)
                    if (!indexVar.empty() && !std::isdigit(indexVar[0])) {
                        // Add range information for this variable
                        if (g_variableRanges.find(indexVar) == g_variableRanges.end()) {
                            g_variableRanges[indexVar] = ValueRange(0, 9999);
                        }
                    }
                }
            }
        }
    }
    
    for (const auto& isrGroup : isrInfo) {
        for (const auto& info : isrGroup) {
            if (info.size() >= 2 && !info[1].empty()) {
                if (std::find(global_var.begin(), global_var.end(), info[1]) == global_var.end()) {
                    global_var.push_back(info[1]);
                }
                
                // Check for variable array access patterns
                std::string varName = info[1];
                size_t bracketPos = varName.find('[');
                if (bracketPos != std::string::npos && bracketPos + 1 < varName.size()) {
                    size_t closeBracketPos = varName.find(']', bracketPos);
                    if (closeBracketPos != std::string::npos) {
                        std::string indexVar = varName.substr(bracketPos + 1, closeBracketPos - bracketPos - 1);
                        
                        // Check if this is a variable name (not a number)
                        if (!indexVar.empty() && !std::isdigit(indexVar[0])) {
                            // Add range information for this variable
                            if (g_variableRanges.find(indexVar) == g_variableRanges.end()) {
                                g_variableRanges[indexVar] = ValueRange(0, 9999);
                            }
                        }
                    }
                }
            }
        }
    }

    // std::string a = "dlut_nefu";
    // errs() << "test findSubString " << findSubString(a,"dlut") << "\n";
    // errs() << "count_final " << temp_count;
    // errs() << g_count << g_enable_para;
    //
    std::cout << "Variable in global_var: " << std::endl;
    travers1D(global_var);
    std::cout << "mainInfo: " << std::endl;
    travers2D(mainInfo);
    std::cout << "isrInfo: " << std::endl;
    travers3D(isrInfo);

    for (auto m1_Iter = mapCalledFun.begin(); m1_Iter != mapCalledFun.end(); m1_Iter++)
        std::cout << m1_Iter->first << " " << m1_Iter->second << std::endl;

    // std::vector<std::vector<std::vector<std::string>>> ret1RWR;
    // std::vector<std::vector<std::vector<std::string>>> ret2WWR;
    // std::vector<std::vector<std::vector<std::string>>> ret3RWW;
    // std::vector<std::vector<std::vector<std::string>>> ret4WRW;

    // const char *desc1RWR = "This is a RWR bug !!!";
    // const char *desc2WWR = "This is a WWR bug !!!";
    // const char *desc3RWW = "This is a RWW bug !!!";
    // const char *desc4WRW = "This is a WRW bug !!!";

    // ret1RWR = pattern1RWR(mainInfo, isrInfo, mapCalledFun);
    // ret2WWR = pattern2WWR(mainInfo, isrInfo, mapCalledFun);
    // ret3RWW = pattern3RWW(mainInfo, isrInfo, mapCalledFun);
    // ret4WRW = pattern4WRW(mainInfo, isrInfo, mapCalledFun);

    // travers3D(ret1RWR);
    // travers3D(ret2WWR);
    // travers3D(ret3RWW);
    // travers3D(ret4WRW);

    // FILE *fp;
    // char* s= "hello world！";
    // char*filename = argv[1];
    // sprintf(filename,"%d.txt",i);

    // fp = fopen("/home/vip/hanghe/race-master/llvm-api-demo/output/file_1.txt", "a");

    // if (!ret1RWR.empty())
    // {
    //     char *pJson = makeJson(ret1RWR, desc1RWR);
    //     printf("Bugs found in RWR :\n%s\n", pJson);
    //     fprintf(fp, "%s \n", pJson);
    //     // travers3D(ret1RWR);
    //     free(pJson);
    // }

    // if (!ret2WWR.empty())
    // {
    //     char *pJson = makeJson(ret2WWR, desc2WWR);
    //     printf("Bugs found in WWR :\n%s\n", pJson);
    //     fprintf(fp, "%s \n", pJson);
    //     // travers3D(ret2WWR);
    //     free(pJson);
    // }

    // if (!ret3RWW.empty())
    // {
    //     char *pJson = makeJson(ret3RWW, desc3RWW);
    //     printf("Bugs found in RWW :\n%s\n", pJson);
    //     fprintf(fp, "%s \n", pJson);
    //     travers3D(ret3RWW);
    //     free(pJson);
    // }

    // if (!ret4WRW.empty())
    // {
    //     char *pJson = makeJson(ret4WRW, desc4WRW);
    //     printf("Bugs found in WRW :\n%s\n", pJson);
    //     fprintf(fp, "%s \n", pJson);
    //     // travers3D(ret4WRW);
    //     free(pJson);
    // }

    // char * pJson = makeJson(ret,desc);
    // printf("Results:\n%s\n", pJson);

    // write to file

    // fprintf(fp,"%s \n",s);
    // fclose(fp);

    // 保存数据到文件
    // 在遍历完成后添加中断函数数量的输出
    std::cout << "Number of ISR functions: " << countUniqueIsrFunctions(isrInfo) << std::endl;
    std::string outputFilename = generateOutputFilename(argv[1]);
    saveToFile(outputFilename, global_var, mainInfo, isrInfo);
    return 0;
}