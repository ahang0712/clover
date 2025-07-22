/**
 * 示例C文件，用于测试控制流分析器
 */

#include <stdio.h>
#include <stdlib.h>

// 全局变量
int global_var = 10;

// 函数声明
void helper_function(int value);
int calculate_sum(int a, int b);
void print_result(int result);

/**
 * 主函数
 */
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

/**
 * 辅助函数，展示函数调用
 */
void helper_function(int value) {
    printf("Helper function called with value: %d\n", value);
    
    // 递归调用示例
    if (value > 0) {
        helper_function(value - 1);
    }
}

/**
 * 计算两个数的和
 */
int calculate_sum(int a, int b) {
    return a + b;
}

/**
 * 打印结果
 */
void print_result(int result) {
    printf("Result: %d\n", result);
    
    // 调用外部函数
    if (result > 10) {
        system("echo 'Large result!'");
    }
} 