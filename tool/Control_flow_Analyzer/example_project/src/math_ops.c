/**
 * 多文件示例项目 - 数学运算实现
 */

#include "math_ops.h"
#include "utils.h"
#include <stdio.h>

// 内部辅助函数
static void validate_input(int a, int b, const char* operation) {
    if (operation == NULL) {
        log_error("Invalid operation");
        return;
    }
    
    // 针对除法的特殊检查
    if (b == 0 && (operation[0] == 'd' || operation[0] == 'D')) {
        log_error("Division by zero");
    }
}

/**
 * 计算两个数的和
 */
int add(int a, int b) {
    validate_input(a, b, "add");
    return a + b;
}

/**
 * 计算两个数的差
 */
int subtract(int a, int b) {
    validate_input(a, b, "subtract");
    return a - b;
}

/**
 * 计算两个数的积
 */
int multiply(int a, int b) {
    validate_input(a, b, "multiply");
    return a * b;
}

/**
 * 计算两个数的商
 */
float divide(int a, int b) {
    validate_input(a, b, "divide");
    
    if (b == 0) {
        log_error("Division by zero");
        return 0.0f;
    }
    
    return (float)a / (float)b;
} 