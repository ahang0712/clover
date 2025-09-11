#!/usr/bin/env python3
"""
Operation_Analyzer 和代码注释功能的完整演示
"""

import os
import json
import tempfile
from analyzer import analyze_rw, annotate_code

def create_demo_code():
    """创建演示用的C代码"""
    demo_code = """#include <stdio.h>

// 全局变量
int counter = 0;
int status_flag = 0;
int data_buffer[100];

void main() {
    int i;
    
    // 初始化计数器
    counter = 0;
    status_flag = 1;
    
    // 填充数据缓冲区
    for (i = 0; i < 10; i++) {
        data_buffer[i] = i * 2;
        if (status_flag > 0) {
            counter++;
        }
    }
    
    printf("Processing completed. Counter: %d\\n", counter);
}

void timer_isr() {
    // 定时器中断处理
    counter++;
    status_flag = 0;
}

void data_isr() {
    // 数据中断处理
    if (counter > 5) {
        data_buffer[0] = counter;
        status_flag = 1;
    }
}
"""
    return demo_code

def create_demo_analysis():
    """创建对应的分析结果"""
    demo_analysis = {
        "ISR_COUNT": 2,
        "GLOBAL_VAR": [
            "counter",
            "status_flag", 
            "data_buffer"
        ],
        "MAIN_INFO": [
            {"operation": "store", "variable": "counter", "line": "12", "function": "main"},
            {"operation": "store", "variable": "status_flag", "line": "13", "function": "main"},
            {"operation": "store", "variable": "data_buffer", "line": "17", "function": "main"},
            {"operation": "load", "variable": "status_flag", "line": "18", "function": "main"},
            {"operation": "store", "variable": "counter", "line": "19", "function": "main"},
            {"operation": "load", "variable": "counter", "line": "23", "function": "main"}
        ],
        "ISR_INFO": [
            {"operation": "store", "variable": "counter", "line": "28", "function": "timer_isr"},
            {"operation": "store", "variable": "status_flag", "line": "29", "function": "timer_isr"},
            {"operation": "load", "variable": "counter", "line": "34", "function": "data_isr"},
            {"operation": "load", "variable": "counter", "line": "35", "function": "data_isr"},
            {"operation": "store", "variable": "data_buffer", "line": "35", "function": "data_isr"},
            {"operation": "store", "variable": "status_flag", "line": "36", "function": "data_isr"}
        ]
    }
    return demo_analysis

def run_complete_demo():
    """运行完整的演示"""
    print("🚀 Operation_Analyzer 完整功能演示")
    print("=" * 50)
    
    # 步骤1: 创建演示文件
    print("\n📝 步骤1: 创建演示C代码文件")
    demo_code = create_demo_code()
    
    with open('demo.c', 'w') as f:
        f.write(demo_code)
    print("✅ 已创建: demo.c")
    
    # 步骤2: 模拟Operation_Analyzer的分析结果
    print("\n🔍 步骤2: 生成分析结果 (模拟Operation_Analyzer输出)")
    demo_analysis = create_demo_analysis()
    
    with open('demo_analysis.json', 'w') as f:
        json.dump(demo_analysis, f, indent=2)
    print("✅ 已创建: demo_analysis.json")
    
    # 步骤3: 显示分析结果统计
    print("\n📊 步骤3: 分析结果统计")
    print(f"  ISR 数量: {demo_analysis['ISR_COUNT']}")
    print(f"  全局变量: {', '.join(demo_analysis['GLOBAL_VAR'])}")
    print(f"  主函数操作: {len(demo_analysis['MAIN_INFO'])}")
    print(f"  中断函数操作: {len(demo_analysis['ISR_INFO'])}")
    
    # 步骤4: 运行代码注释器
    print("\n🎨 步骤4: 运行代码注释器")
    result = annotate_code('demo.c', 'demo_analysis.json', 'demo_annotated.c')
    
    if result['status'] == 'success':
        print("✅ 代码注释成功!")
        print(f"📁 输出文件: {result['output_file']}")
        
        # 显示统计信息
        stats = result['statistics']
        print(f"\n📈 注释统计:")
        print(f"  总行数: {stats['total_lines']}")
        print(f"  注释行数: {stats['annotated_lines']}")
        print(f"  总操作数: {stats['total_operations']}")
        print(f"  读操作: {stats['read_operations']}")
        print(f"  写操作: {stats['write_operations']}")
        print(f"  主函数操作: {stats['main_operations']}")
        print(f"  中断函数操作: {stats['isr_operations']}")
        
        # 步骤5: 显示注释后的代码
        print(f"\n📄 步骤5: 注释后的代码预览")
        print("-" * 50)
        with open(result['output_file'], 'r') as f:
            annotated_code = f.read()
            print(annotated_code)
        print("-" * 50)
        
        # 步骤6: 展示关键注释
        print(f"\n🔍 步骤6: 关键操作注释说明")
        print("  - 'Write' 表示变量写入操作 (store)")
        print("  - 'Read' 表示变量读取操作 (load)")
        print("  - 'Main' 表示主函数中的操作")
        print("  - 'ISR' 表示中断函数中的操作")
        print("  - 'Operations:' 表示同一行有多个操作")
        
    else:
        print(f"❌ 代码注释失败: {result['message']}")
    
    print(f"\n🎯 演示完成!")
    print("💡 提示: Operation_Analyzer现在支持自动为代码添加读写操作注释")
    print("🔧 可通过MCP接口或命令行使用此功能")

if __name__ == "__main__":
    try:
        run_complete_demo()
    except Exception as e:
        print(f"❌ 演示过程中出现错误: {e}")
    finally:
        # 清理演示文件 (可选)
        cleanup = input("\n🧹 是否清理演示文件? (y/N): ").lower().strip()
        if cleanup == 'y':
            for file in ['demo.c', 'demo_analysis.json', 'demo_annotated.c']:
                if os.path.exists(file):
                    os.unlink(file)
                    print(f"🗑️  已删除: {file}")
            print("✅ 清理完成!") 