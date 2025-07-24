/*
 * 自动生成的代码 - 由Code_Extractor提取
 * 保持原始行号 - 不需要的代码被注释
 */

// /**
//  * 简化版示例C文件，用于测试控制流分析器
//  */

// // 函数声明
// void helper_function(int value);
// int calculate_sum(int a, int b);
// void print_result(int result);

// // 全局变量
int global_var = 10;

// /**
//  * 主函数
//  */
int main() {
    int local_var = 5;
    
    // 调用计算函数
    int sum = calculate_sum(local_var, global_var);
    
    // 调用辅助函数
    helper_function(sum);
    
    // 调用打印函数
    print_result(sum);
    
    return 0;
}

// /**
//  * 辅助函数，展示函数调用
//  */
void helper_function(int value) {
    // 递归调用示例
    if (value > 0) {
        helper_function(value - 1);
    }
}

// /**
//  * 计算两个数的和
//  */
int calculate_sum(int a, int b) {
    return a + b;
}

// /**
//  * 打印结果
//  */
void print_result(int result) {
    // 模拟打印
    int temp = result;
    
    // 模拟系统调用
    if (result > 10) {
        // 假设这里调用了system
    }
} 