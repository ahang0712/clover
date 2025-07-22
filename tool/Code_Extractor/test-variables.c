/**
 * 变量提取和保留测试文件
 * 包含多种类型的变量声明和定义，用于测试代码提取器的变量处理功能
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>

/* ---------- 全局变量定义 ---------- */
// 应该被保留的全局变量（在主函数和中断函数中使用）
int g_counter = 0;
volatile bool g_flag = false;
char g_buffer[256];
const float PI = 3.14159;

// 不使用的全局变量（应被注释）
int g_unused_var = 42;
double g_unused_array[10];
struct Complex g_unused_complex;

/* ---------- 类型定义 ---------- */
typedef struct {
    int id;
    char name[32];
    float value;
} SensorData;

typedef enum {
    STATE_IDLE,
    STATE_ACTIVE,
    STATE_ERROR
} SystemState;

/* ---------- 函数声明 ---------- */
void process_data(SensorData* data);
float calculate_value(int input);
void log_event(const char* message);
void isr_timer(void);
void isr_external(void);
SystemState update_state(SystemState current);

/* ---------- 辅助函数实现 ---------- */
/**
 * 处理传感器数据
 */
void process_data(SensorData* data) {
    if (!data) return;
    
    // 局部变量
    float multiplier = 2.5;
    int adjusted_id = data->id * 10;
    
    data->value *= multiplier;
    sprintf(g_buffer, "处理传感器 %s (ID: %d)", data->name, adjusted_id);
    g_counter++;
}

/**
 * 计算某个值
 */
float calculate_value(int input) {
    float result = input * PI;
    return result;
}

/**
 * 记录日志消息
 */
void log_event(const char* message) {
    if (message) {
        printf("[LOG] %s\n", message);
    }
}

/**
 * 更新系统状态
 */
SystemState update_state(SystemState current) {
    switch (current) {
        case STATE_IDLE:
            return STATE_ACTIVE;
        case STATE_ACTIVE:
            if (g_counter > 10) {
                return STATE_ERROR;
            }
            return STATE_ACTIVE;
        default:
            return STATE_IDLE;
    }
}

/* ---------- 中断函数 ---------- */
/**
 * 定时器中断处理函数
 */
void isr_timer(void) { // priority: 1
    // 中断处理
    g_counter++;
    
    // 记录中断
    if (g_counter % 5 == 0) {
        sprintf(g_buffer, "定时器中断 #%d", g_counter);
        log_event(g_buffer);
    }
    
    // 处理传感器数据
    if (g_flag) {
        SensorData temp_sensor = {1, "温度传感器", 25.0};
        process_data(&temp_sensor);
    }
}

/**
 * 外部中断处理函数
 */
void isr_external(void) { // priority: 2
    // 设置标志
    g_flag = !g_flag;
    
    // 记录状态变化
    sprintf(g_buffer, "外部中断 - 标志状态: %s", g_flag ? "开启" : "关闭");
    log_event(g_buffer);
    
    // 使用一个未声明的变量 (测试变量提取能力)
    float calculated = calculate_value(g_counter);
    log_event("计算结果");
}

/* ---------- 主函数 ---------- */
/**
 * 主函数 - 程序入口
 */
int main(int argc, char* argv[]) {
    // 局部变量
    int max_iterations = 5;
    SystemState system_state = STATE_IDLE;
    SensorData sensors[3];
    
    // 初始化
    g_counter = 0;
    g_flag = false;
    strcpy(g_buffer, "系统启动");
    log_event(g_buffer);
    
    // 初始化传感器
    for (int i = 0; i < 3; i++) {
        sensors[i].id = i + 1;
        sprintf(sensors[i].name, "传感器 #%d", i + 1);
        sensors[i].value = 10.0 * (i + 1);
    }
    
    // 模拟系统运行
    for (int i = 0; i < max_iterations; i++) {
        // 更新系统状态
        system_state = update_state(system_state);
        
        // 处理传感器数据
        process_data(&sensors[i % 3]);
        
        // 模拟中断
        if (i % 2 == 0) {
            isr_timer();
        } else {
            isr_external();
        }
        
        // 记录状态
        sprintf(g_buffer, "迭代 #%d - 系统状态: %d, 计数器: %d", 
                i, system_state, g_counter);
        log_event(g_buffer);
    }
    
    return 0;
} 