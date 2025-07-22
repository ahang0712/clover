/**
 * 多文件示例项目 - 工具函数实现
 */

#include "utils.h"
#include <stdio.h>
#include <time.h>

// 内部函数
static void get_current_time(char* buffer, int size) {
    time_t now = time(NULL);
    struct tm* tm_info = localtime(&now);
    strftime(buffer, size, "%Y-%m-%d %H:%M:%S", tm_info);
}

/**
 * 打印结果
 */
void print_result(const char* operation, int value) {
    printf("%s: %d\n", operation, value);
}

/**
 * 记录消息
 */
void log_message(const char* message) {
    char time_buffer[26];
    get_current_time(time_buffer, sizeof(time_buffer));
    
    printf("[INFO] [%s] %s\n", time_buffer, message);
}

/**
 * 记录错误
 */
void log_error(const char* error) {
    char time_buffer[26];
    get_current_time(time_buffer, sizeof(time_buffer));
    
    fprintf(stderr, "[ERROR] [%s] %s\n", time_buffer, error);
} 