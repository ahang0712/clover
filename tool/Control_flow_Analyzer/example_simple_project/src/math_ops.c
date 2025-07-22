/**
 * 简化版多文件示例项目 - 数学运算实现
 */

#include "math_ops.h"
#include "utils.h"

// 内部辅助函数
static int validate_input(int a, int b) {
    // 简单的验证
    if (b == 0) {
        return 0;
    }
    return 1;
}

/**
 * 计算两个数的和
 */
int add(int a, int b) {
    validate_input(a, b);
    return a + b;
}

/**
 * 计算两个数的差
 */
int subtract(int a, int b) {
    validate_input(a, b);
    return a - b;
}

/**
 * 计算两个数的积
 */
int multiply(int a, int b) {
    validate_input(a, b);
    return a * b;
} 