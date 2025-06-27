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
            outFile << "      \"function\": ";
            writeJsonString(outFile, mainInfo[i][3], true);
            outFile << "\n";
            outFile << "    }" << (i == mainInfo.size() - 1 ? "" : ",") << "\n";
        }
    }
    outFile << "  ],\n";

    // Save isrInfo as JSON array of objects
    outFile << "  \"ISR_INFO\": [\n";
    size_t totalMatrices = isrInfo.size();
    for (size_t matrixIndex = 0; matrixIndex < totalMatrices; ++matrixIndex)
    {
        const auto &matrix = isrInfo[matrixIndex];
        for (size_t i = 0; i < matrix.size(); ++i)
        {
            if (matrix[i].size() >= 4)
            { // Ensure we have all required fields
                outFile << "    {\n";
                outFile << "      \"operation\": ";
                writeJsonString(outFile, matrix[i][0]);
                outFile << "\n";
                outFile << "      \"variable\": ";
                writeJsonString(outFile, matrix[i][1]);
                outFile << "\n";
                outFile << "      \"line\": ";
                writeJsonString(outFile, matrix[i][2]);
                outFile << "\n";
                outFile << "      \"function\": ";
                writeJsonString(outFile, matrix[i][3], true);
                outFile << "\n";
                outFile << "    }" << ((matrixIndex == totalMatrices - 1 && i == matrix.size() - 1) ? "" : ",") << "\n";
            }
        }
    }
    outFile << "  ]\n";

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

        auto a = Mod->globals();
        std::vector<std::string> temp;

        auto st = Mod->getIdentifiedStructTypes();
        for (int i = 0; i < st.size(); i++)
        {
            // errs() << "Global Struct " << st.at(i)->etName() << "\n";
        }
        // std::cout << "Global varible " << gv->getGlobalIdentifier() <<std::endl;
        temp.push_back(gv->getGlobalIdentifier());
        for (auto &b : a)
        {
            // errs() << *b.getValueType();
            // errs() << b.getName();
            auto &f = *b.getValueType();

            // temp.push_back();
        }
        // get std::string global
        global_var.push_back(gv->getGlobalIdentifier());

        // global_var.push_back(temp);
    }
    // errs() << "test" ;
    int temp_count = findNumberInEnbleFun(Mod);
    // errs() << "test1";
    errs() << "tem_count : " << temp_count << "\n";

    // get allFunInfo
    std::map<std::string, std::vector<std::vector<std::string>>> retAllFunInfo;
    // retAllFunInfo = exactAllFunInfo(Mod);
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