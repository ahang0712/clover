/**
 * 代码提取器示例文件
 * 包含主函数、中断函数和辅助函数，用于测试代码提取器
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

// 全局变量定义
int global_counter = 0;
char buffer[100];
volatile bool interrupt_flag = false;

// 结构体定义
typedef struct {
    int id;
    char name[50];
    float value;
} DataItem;

// 辅助函数声明
void initialize_data(DataItem* item, int id, const char* name, float value);
void process_data(DataItem* item);
void log_message(const char* message);
float calculate_average(float* values, int count);
void update_status(void);

/**
 * 初始化数据项
 */
void initialize_data(DataItem* item, int id, const char* name, float value) {
    if (item == NULL) return;
    
    item->id = id;
    strncpy(item->name, name, sizeof(item->name) - 1);
    item->name[sizeof(item->name) - 1] = '\0'; // 确保字符串结束
    item->value = value;
    
    log_message("Data item initialized");
}

/**
 * 处理数据项
 */
void process_data(DataItem* item) {
    if (item == NULL) return;
    
    // 简单处理：增加值并更新全局计数器
    item->value += 1.0f;
    global_counter++;
    
    // 记录日志
    char msg[100];
    sprintf(msg, "Processed item %d: %s (value: %.2f)", item->id, item->name, item->value);
    log_message(msg);
    
    // 更新状态
    update_status();
}

/**
 * 记录消息
 */
void log_message(const char* message) {
    if (message) {
        printf("[LOG] %s\n", message);
    }
}

/**
 * 计算平均值
 */
float calculate_average(float* values, int count) {
    if (values == NULL || count <= 0) return 0.0f;
    
    float sum = 0.0f;
    for (int i = 0; i < count; i++) {
        sum += values[i];
    }
    
    return sum / count;
}

/**
 * 更新状态
 */
void update_status(void) {
    // 更新某些状态信息
    sprintf(buffer, "Status updated (count: %d)", global_counter);
}

/**
 * 中断服务例程1 - 处理高优先级事件
 */
void isr_high_priority(void) { // priority: 1
    // 设置中断标志
    interrupt_flag = true;
    
    // 记录中断
    log_message("High priority interrupt occurred");
    
    // 增加全局计数器
    global_counter += 10;
}

/**
 * 中断服务例程2 - 处理低优先级事件
 */
void isr_low_priority(void) { // priority: 2
    // 处理低优先级中断
    if (interrupt_flag) {
        log_message("Processing pending interrupt");
        interrupt_flag = false;
    }
    
    // 更新状态
    update_status();
}

/**
 * 主函数 - 示例程序入口点
 */
int main(int argc, char* argv[]) {
    // 初始化
    log_message("Application starting");
    
    // 创建数据项
    DataItem items[3];
    initialize_data(&items[0], 1, "Sensor A", 10.5f);
    initialize_data(&items[1], 2, "Sensor B", 20.3f);
    initialize_data(&items[2], 3, "Sensor C", 15.8f);
    
    // 处理数据
    for (int i = 0; i < 3; i++) {
        process_data(&items[i]);
    }
    
    // 计算平均值
    float values[3] = { items[0].value, items[1].value, items[2].value };
    float avg = calculate_average(values, 3);
    
    // 输出结果
    char result[100];
    sprintf(result, "Average value: %.2f", avg);
    log_message(result);
    
    log_message("Application finished");
    return 0;
} 