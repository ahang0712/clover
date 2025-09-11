#!/usr/bin/env python3
"""
Code Annotator for Operation Analyzer
将Operation_Analyzer的分析结果以注释形式添加到源代码中
"""

import json
import sys
import re
from typing import Dict, List, Tuple, Set
from collections import defaultdict


class CodeAnnotator:
    def __init__(self, source_file: str, analysis_json: str):
        """
        初始化代码注释器
        
        Args:
            source_file: 源代码文件路径
            analysis_json: Operation_Analyzer分析结果JSON文件路径
        """
        self.source_file = source_file
        self.analysis_json = analysis_json
        self.source_lines = []
        self.analysis_data = {}
        self.line_operations = defaultdict(list)  # line_num -> [(operation, variable, function_type)]
        
    def load_source(self):
        """加载源代码文件"""
        try:
            with open(self.source_file, 'r', encoding='utf-8') as f:
                self.source_lines = f.readlines()
        except Exception as e:
            raise Exception(f"无法读取源代码文件 {self.source_file}: {e}")
    
    def load_analysis(self):
        """加载分析结果JSON文件"""
        try:
            with open(self.analysis_json, 'r', encoding='utf-8') as f:
                self.analysis_data = json.load(f)
        except Exception as e:
            raise Exception(f"无法读取分析结果文件 {self.analysis_json}: {e}")
    
    def parse_operations(self):
        """解析操作信息，按行号组织"""
        # 使用正确的数据格式：variable_accesses
        variable_accesses = self.analysis_data.get('variable_accesses', [])
        
        for access_info in variable_accesses:
            line_num = access_info.get('line')
            if line_num is not None:
                # 确保line_num是整数
                if isinstance(line_num, str) and line_num.isdigit():
                    line_num = int(line_num)
                elif isinstance(line_num, int):
                    pass  # 已经是整数
                else:
                    continue  # 跳过无效的行号
                
                # 验证行号是否在有效范围内
                if line_num <= 0 or line_num > len(self.source_lines):
                    print(f"Warning: Line number {line_num} is out of range (1-{len(self.source_lines)})")
                    continue
                
                # 支持不同的字段名格式
                access_type = access_info.get('access_type', '') or access_info.get('op', '')
                variable = access_info.get('variable', '')
                function = access_info.get('function', '')
                is_isr = access_info.get('is_isr', False)
                
                # 确定操作类型和函数类型
                # 支持多种操作类型格式：read/write, Read/Write, load/store
                if access_type.lower() in ['read', 'load']:
                    op_type = 'Read'
                elif access_type.lower() in ['write', 'store']:
                    op_type = 'Write'
                else:
                    op_type = access_type.title()
                
                # 确定函数类型
                if is_isr:
                    function_type = 'ISR'
                elif function and ('isr' in function.lower() or 'interrupt' in function.lower()):
                    function_type = 'ISR'
                else:
                    function_type = 'Main'
                
                self.line_operations[line_num].append((op_type, variable, function_type))
        
        # 如果没有variable_accesses数据，尝试使用旧格式作为备选
        if not variable_accesses:
            print("Warning: No variable_accesses found, trying legacy format...")
            
            # 处理主函数中的操作（备选格式）
            for op_info in self.analysis_data.get('MAIN_INFO', []):
                line_num = op_info.get('line')
                if line_num and str(line_num).isdigit():
                    line_num = int(line_num)
                    if line_num <= 0 or line_num > len(self.source_lines):
                        continue
                        
                    operation = op_info.get('operation', '')
                    variable = op_info.get('variable', '')
                    
                    op_type = 'Read' if operation == 'load' else 'Write' if operation == 'store' else operation
                    function_type = 'Main'
                    
                    self.line_operations[line_num].append((op_type, variable, function_type))
            
            # 处理中断函数中的操作（备选格式）
        for op_info in self.analysis_data.get('ISR_INFO', []):
            line_num = op_info.get('line')
            if line_num and str(line_num).isdigit():
                line_num = int(line_num)
                if line_num <= 0 or line_num > len(self.source_lines):
                    continue
                
                operation = op_info.get("operation", "")
                variable = op_info.get("variable", "")
                
                op_type = 'Read' if operation == 'load' else 'Write' if operation == 'store' else operation
                function_type = 'ISR'
                
                self.line_operations[line_num].append((op_type, variable, function_type))
    
    def format_comment(self, operations: List[Tuple[str, str, str]]) -> str:
        """
        格式化操作注释
        
        Args:
            operations: [(operation_type, variable, function_type), ...]
            
        Returns:
            格式化的注释字符串
        """
        if not operations:
            return ""
        
        # 去重并排序
        unique_ops = list(set(operations))
        unique_ops.sort(key=lambda x: (x[0], x[1], x[2]))  # 按操作类型、变量名、函数类型排序
        
        if len(unique_ops) == 1:
            op_type, variable, func_type = unique_ops[0]
            return f"// {op_type} '{variable}' in {func_type}"
        else:
            # 多个操作，使用 "Operations:" 前缀
            op_strings = []
            for op_type, variable, func_type in unique_ops:
                op_strings.append(f"{op_type} '{variable}' in {func_type}")
            return f"// Operations: {'; '.join(op_strings)}"
    
    def has_existing_comment(self, line: str) -> bool:
        """检查行是否已经有注释"""
        # 简单检查是否已经有以 // 开头的注释
        stripped = line.strip()
        return '//' in stripped
    
    def add_comment_to_line(self, line: str, comment: str) -> str:
        """
        在代码行添加注释
        
        Args:
            line: 原始代码行
            comment: 要添加的注释
            
        Returns:
            添加注释后的代码行
        """
        # 移除行尾的换行符
        line = line.rstrip('\n\r')
        
        # 如果行已经有注释，在现有注释前添加
        if '//' in line:
            # 找到第一个 // 的位置
            comment_pos = line.find('//')
            before_comment = line[:comment_pos].rstrip()
            existing_comment = line[comment_pos:]
            return f"{before_comment}  {comment}  {existing_comment}\n"
        else:
            # 检查行是否以分号结尾，如果是，在分号后添加注释
            if line.rstrip().endswith(';'):
                return f"{line}  {comment}\n"
            elif line.rstrip().endswith('{') or line.rstrip().endswith('}'):
                # 对于大括号结尾的行，在大括号后添加注释
                return f"{line}  {comment}\n"
            else:
                # 其他情况，在行尾添加注释
                return f"{line}  {comment}\n"
    
    def annotate_code(self, output_file: str = None) -> str:
        """
        为代码添加注释
        
        Args:
            output_file: 输出文件路径，如果为None则返回注释后的代码字符串
            
        Returns:
            注释后的代码字符串
        """
        self.load_source()
        self.load_analysis()
        self.parse_operations()
        
        # 首先生成带注释的完整代码（保持原始行号）
        annotated_lines = []
        
        for line_num, line in enumerate(self.source_lines, 1):
            if line_num in self.line_operations:
                # 该行有操作，添加注释
                operations = self.line_operations[line_num]
                comment = self.format_comment(operations)
                
                if comment:
                    annotated_line = self.add_comment_to_line(line, comment)
                    annotated_lines.append(annotated_line)
                else:
                    annotated_lines.append(line)
            else:
                # 该行没有操作，保持原样
                annotated_lines.append(line)
        
        # 然后过滤掉空行和只包含注释的行
        filtered_lines = []
        
        for line in annotated_lines:
            stripped_line = line.strip()
            is_empty_or_comment_only = (
                not stripped_line or  # 空行
                (stripped_line.startswith('//') and not any(op in line for op in ['Read', 'Write'])) or  # 纯注释行（不包含操作注释）
                stripped_line.startswith('/*') or  # 多行注释开始
                (stripped_line.startswith('*') and not any(c.isalnum() for c in stripped_line[1:3])) or   # 多行注释内容（排除指针解引用）
                (stripped_line.startswith('#') and not any(op in line for op in ['Read', 'Write']))  # 预处理指令（不包含操作注释）
            )
            
            if not is_empty_or_comment_only:
                filtered_lines.append(line)
        
        annotated_code = ''.join(filtered_lines)
        
        # 如果指定了输出文件，写入文件
        if output_file:
            try:
                with open(output_file, 'w', encoding='utf-8') as f:
                    f.write(annotated_code)
                print(f"注释后的代码已保存到: {output_file}")
            except Exception as e:
                raise Exception(f"无法写入输出文件 {output_file}: {e}")
        
        return annotated_code
    
    def get_statistics(self) -> Dict:
        """获取注释统计信息"""
        stats = {
            'total_lines': len(self.source_lines),
            'annotated_lines': len(self.line_operations),
            'total_operations': sum(len(ops) for ops in self.line_operations.values()),
            'read_operations': 0,
            'write_operations': 0,
            'main_operations': 0,
            'isr_operations': 0
        }
        
        for operations in self.line_operations.values():
            for op_type, _, func_type in operations:
                if op_type == 'Read':
                    stats['read_operations'] += 1
                elif op_type == 'Write':
                    stats['write_operations'] += 1
                
                if func_type == 'Main':
                    stats['main_operations'] += 1
                elif func_type == 'ISR':
                    stats['isr_operations'] += 1
        
        return stats


def annotate_code(source_file: str, analysis_json: str, output_file: str = None) -> Dict:
    """
    MCP接口函数：为代码添加读写操作注释
    
    Args:
        source_file: 源代码文件路径
        analysis_json: Operation_Analyzer分析结果JSON文件路径
        output_file: 输出文件路径，如果为None则使用默认命名
        
    Returns:
        包含状态和结果信息的字典
    """
    try:
        # 如果没有指定输出文件，生成默认文件名
        if output_file is None:
            if source_file.endswith('.c'):
                output_file = source_file[:-2] + '_annotated.c'
            elif source_file.endswith('.cpp') or source_file.endswith('.cc'):
                output_file = source_file.rsplit('.', 1)[0] + '_annotated.' + source_file.rsplit('.', 1)[1]
            else:
                output_file = source_file + '_annotated'
        
        # 创建注释器并执行注释
        annotator = CodeAnnotator(source_file, analysis_json)
        annotated_code = annotator.annotate_code(output_file)
        
        # 获取统计信息
        stats = annotator.get_statistics()
        
        return {
            'status': 'success',
            'message': f'代码注释完成，输出文件: {output_file}',
            'output_file': output_file,
            'statistics': stats,
            'annotated_code_preview': annotated_code[:500] + ('...' if len(annotated_code) > 500 else '')
        }
        
    except Exception as e:
        return {
            'status': 'error',
            'message': str(e),
            'output_file': None,
            'statistics': None
        }


def main():
    """命令行入口函数"""
    if len(sys.argv) < 3:
        print("用法: python code_annotator.py <SOURCE_FILE> <ANALYSIS_JSON_FILE> [OUTPUT_FILE]")
        print("例如: python code_annotator.py input.c input-output.json input_annotated.c")
        sys.exit(1)
    
    source_file = sys.argv[1]
    analysis_json = sys.argv[2]
    output_file = sys.argv[3] if len(sys.argv) > 3 else None
    
    # 调用注释功能
    result = annotate_code(source_file, analysis_json, output_file)
    
    if result['status'] == 'success':
        print("✅ 代码注释成功!")
        print(f"📁 输出文件: {result['output_file']}")
        print("\n📊 统计信息:")
        stats = result['statistics']
        print(f"  总行数: {stats['total_lines']}")
        print(f"  注释行数: {stats['annotated_lines']}")
        print(f"  总操作数: {stats['total_operations']}")
        print(f"  读操作: {stats['read_operations']}")
        print(f"  写操作: {stats['write_operations']}")
        print(f"  主函数操作: {stats['main_operations']}")
        print(f"  中断函数操作: {stats['isr_operations']}")
        
        if result.get('annotated_code_preview'):
            print("\n📝 代码预览:")
            print(result['annotated_code_preview'])
    else:
        print(f"❌ 代码注释失败: {result['message']}")
        sys.exit(1)


if __name__ == "__main__":
    main() 