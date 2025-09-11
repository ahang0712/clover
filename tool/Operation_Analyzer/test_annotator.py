#!/usr/bin/env python3
"""
测试代码注释器功能
"""

import os
import json
import tempfile
from code_annotator import annotate_code

def create_test_source():
    """创建测试用的C源代码"""
    test_code = """#include <stdio.h>

int global_var = 0;
int global_array[10];

void main() {
    int i;
    
    global_var = 5;
    
    for (i = 0; i < 10; i++) {
        global_array[i] = i;
        if (global_var > 0) {
            printf("Value: %d\\n", global_array[i]);
        }
    }
}

void isr_1() {
    global_var = 100;
    global_array[0] = global_var;
}
"""
    return test_code

def create_test_analysis():
    """创建测试用的分析结果JSON"""
    test_analysis = {
        "ISR_COUNT": 1,
        "GLOBAL_VAR": [
            "global_var",
            "global_array"
        ],
        "MAIN_INFO": [
            {
                "operation": "store",
                "variable": "global_var",
                "line": "9",
                "function": "main"
            },
            {
                "operation": "store",
                "variable": "global_array",
                "line": "12",
                "function": "main"
            },
            {
                "operation": "load",
                "variable": "global_var",
                "line": "13",
                "function": "main"
            },
            {
                "operation": "load",
                "variable": "global_array",
                "line": "14",
                "function": "main"
            }
        ],
        "ISR_INFO": [
            {
                "operation": "store",
                "variable": "global_var",
                "line": "20",
                "function": "isr_1"
            },
            {
                "operation": "load",
                "variable": "global_var",
                "line": "21",
                "function": "isr_1"
            },
            {
                "operation": "store",
                "variable": "global_array",
                "line": "21",
                "function": "isr_1"
            }
        ]
    }
    return test_analysis

def test_annotator():
    """测试代码注释功能"""
    print("🧪 开始测试代码注释器...")
    
    # 创建临时文件
    with tempfile.NamedTemporaryFile(mode='w', suffix='.c', delete=False) as source_file:
        source_file.write(create_test_source())
        source_path = source_file.name
    
    with tempfile.NamedTemporaryFile(mode='w', suffix='.json', delete=False) as analysis_file:
        json.dump(create_test_analysis(), analysis_file, indent=2)
        analysis_path = analysis_file.name
    
    output_path = source_path.replace('.c', '_annotated.c')
    
    try:
        # 运行代码注释器
        result = annotate_code(source_path, analysis_path, output_path)
        
        print(f"📊 注释结果: {result['status']}")
        
        if result['status'] == 'success':
            print(f"✅ 注释成功!")
            print(f"📁 输出文件: {result['output_file']}")
            
            # 显示统计信息
            stats = result['statistics']
            print(f"\n📈 统计信息:")
            print(f"  总行数: {stats['total_lines']}")
            print(f"  注释行数: {stats['annotated_lines']}")
            print(f"  总操作数: {stats['total_operations']}")
            print(f"  读操作: {stats['read_operations']}")
            print(f"  写操作: {stats['write_operations']}")
            print(f"  主函数操作: {stats['main_operations']}")
            print(f"  中断函数操作: {stats['isr_operations']}")
            
            # 显示注释后的代码
            print(f"\n📝 注释后的代码:")
            with open(result['output_file'], 'r') as f:
                annotated_code = f.read()
                print(annotated_code)
        else:
            print(f"❌ 注释失败: {result['message']}")
    
    finally:
        # 清理临时文件
        for file_path in [source_path, analysis_path, output_path]:
            if os.path.exists(file_path):
                os.unlink(file_path)
        print("\n🧹 已清理临时文件")

if __name__ == "__main__":
    test_annotator() 