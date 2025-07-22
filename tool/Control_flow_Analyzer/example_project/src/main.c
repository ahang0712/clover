/**
 * 多文件示例项目 - 主文件
 */

#include <stdio.h>
#include "utils.h"
#include "math_ops.h"

// 主函数
int main() {
    // 调用math_ops.c中的函数
    int a = 10;
    int b = 5;
    
    printf("Starting calculations...\n");
    
    // 调用数学运算函数
    int sum = add(a, b);
    int diff = subtract(a, b);
    int prod = multiply(a, b);
    
    // 调用工具函数
    print_result("Sum", sum);
    print_result("Difference", diff);
    print_result("Product", prod);
    
    // 调用日志函数
    log_message("All calculations completed successfully");
    
    return 0;
} 