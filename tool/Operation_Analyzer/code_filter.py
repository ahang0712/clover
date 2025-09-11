#!/usr/bin/env python3
"""
代码过滤器 - 删除空行和只有注释的行，同时保持读写操作的行号对应关系
"""

import re
import json
import sys
from typing import List, Dict, Tuple, Optional


class CodeFilter:
    """代码过滤器，处理代码片段并保持操作行号映射"""
    
    def __init__(self):
        self.line_mapping = {}  # 原始行号 -> 新行号的映射
        self.reverse_mapping = {}  # 新行号 -> 原始行号的映射
    
    def is_empty_or_comment_only(self, line: str) -> bool:
        """判断一行是否为空行或只有注释的行"""
        stripped = line.strip()
        
        # 空行
        if not stripped:
            return True
        
        # 只有注释的行
        comment_patterns = [
            r'^\s*//',           # 单行注释 //
            r'^\s*/\*.*\*/',     # 单行多行注释 /* ... */
            r'^\s*/\*',          # 多行注释开始 /*
            r'^\s*\*',           # 多行注释内容 *
            r'^\s*\*/',          # 多行注释结束 */
            r'^\s*#(?!include|define|ifdef|ifndef|endif|pragma)',  # 非关键预处理指令
        ]
        
        for pattern in comment_patterns:
            if re.match(pattern, line):
                return True
        
        return False
    
    def is_commented_out_code(self, line: str) -> bool:
        """判断是否为被注释掉的代码行（更严格的过滤）"""
        stripped = line.strip()
        
        # 空行
        if not stripped:
            return True
            
        # 以 // 开头的所有行都认为是注释
        if stripped.startswith('//'):
            return True
            
        # 多行注释相关
        if re.match(r'^\s*/\*', stripped):  # 多行注释开始
            return True
        if re.match(r'^\s*\*(?![a-zA-Z_])', stripped):   # 多行注释内容或结束（排除指针解引用）
            return True
            
        # 预处理指令（除了关键的include/define等）
        if re.match(r'^\s*#(?!include|define|ifdef|ifndef|endif|pragma)', stripped):
            return True
            
        return False
    
    def filter_code(self, code_lines: List[str], strict_mode: bool = False) -> List[str]:
        """
        过滤代码行，删除空行和只有注释的行
        
        Args:
            code_lines: 原始代码行列表
            strict_mode: 是否使用严格模式（过滤所有被注释掉的代码）
            
        Returns:
            过滤后的代码行列表
        """
        filtered_lines = []
        new_line_num = 1
        
        # 选择过滤函数
        filter_func = self.is_commented_out_code if strict_mode else self.is_empty_or_comment_only
        
        for original_line_num, line in enumerate(code_lines, 1):
            if not filter_func(line):
                # 保留这一行
                filtered_lines.append(line)
                
                # 建立行号映射
                self.line_mapping[original_line_num] = new_line_num
                self.reverse_mapping[new_line_num] = original_line_num
                
                new_line_num += 1
        
        return filtered_lines
    
    def update_analysis_result(self, analysis_json: Dict, keep_unmapped: bool = False) -> Dict:
        """
        更新分析结果中的行号，使其与过滤后的代码对应
        
        Args:
            analysis_json: 原始分析结果JSON
            keep_unmapped: 是否保留无法映射的缺陷
            
        Returns:
            更新后的分析结果JSON
        """
        updated_analysis = analysis_json.copy()
        updated_defects = []
        
        if 'defects' in analysis_json:
            for defect in analysis_json['defects']:
                if 'lines' in defect:
                    original_lines = defect['lines']
                    new_lines = []
                    can_map_all = True
                    
                    # 检查是否所有行号都能映射
                    for line_num in original_lines:
                        if line_num in self.line_mapping:
                            new_lines.append(self.line_mapping[line_num])
                        else:
                            can_map_all = False
                            if keep_unmapped:
                                # 保留原始行号但添加警告标记
                                new_lines.append(f"UNMAPPED_{line_num}")
                            break
                    
                    # 只有在所有行号都能映射或者允许保留未映射项时，才保留这个缺陷
                    if can_map_all or (keep_unmapped and new_lines):
                        updated_defect = defect.copy()
                        updated_defect['lines'] = new_lines
                        if not can_map_all:
                            updated_defect['warning'] = f"Some lines could not be mapped: {original_lines}"
                        updated_defects.append(updated_defect)
        
        updated_analysis['defects'] = updated_defects
        updated_analysis['defect_count'] = len(updated_defects)
        
        
        # 处理Operation_Analyzer格式的 MAIN_INFO 和 ISR_INFO
        for info_key in ['MAIN_INFO', 'ISR_INFO']:
            if info_key in analysis_json:
                updated_info = []
                for operation in analysis_json[info_key]:
                    if 'line' in operation:
                        original_line_str = operation['line']  # 保持字符串格式以供输出
                        original_line_int = int(original_line_str)  # 转换为整数进行映射查找
                        if original_line_int in self.line_mapping:
                            updated_operation = operation.copy()
                            updated_operation['line'] = str(self.line_mapping[original_line_int])
                            updated_info.append(updated_operation)
                        elif keep_unmapped:
                            updated_operation = operation.copy()
                            updated_operation['line'] = f"UNMAPPED_{original_line_str}"
                            updated_operation['warning'] = f"Line {original_line_str} could not be mapped"
                            updated_info.append(updated_operation)
                
                updated_analysis[info_key] = updated_info
        # 添加映射信息
        updated_analysis['line_mapping'] = {
            'original_to_filtered': self.line_mapping,
            'filtered_to_original': self.reverse_mapping,
            'total_original_lines': len(self.line_mapping) + len([i for i in range(1, max(self.line_mapping.keys()) + 1) if i not in self.line_mapping]),
            'total_filtered_lines': len(self.reverse_mapping)
        }
        
        return updated_analysis
    
    def get_line_mapping_info(self) -> Dict:
        """获取行号映射信息"""
        return {
            'original_to_filtered': self.line_mapping,
            'filtered_to_original': self.reverse_mapping,
            'removed_lines_count': len([i for i in range(1, max(self.line_mapping.keys()) + 1) if i not in self.line_mapping]) if self.line_mapping else 0,
            'kept_lines_count': len(self.line_mapping)
        }


def filter_code_file(input_file: str, output_file: str, analysis_file: str = None, 
                    updated_analysis_file: str = None, strict_mode: bool = True) -> Dict:
    """
    过滤代码文件
    
    Args:
        input_file: 输入代码文件路径
        output_file: 输出过滤后代码文件路径
        analysis_file: 分析结果JSON文件路径（可选）
        updated_analysis_file: 更新后分析结果输出路径（可选）
        strict_mode: 是否使用严格模式（默认True，过滤所有被注释掉的代码）
        
    Returns:
        过滤结果统计信息，包含 status 字段
    """
    try:
        filter = CodeFilter()
        
        # 读取原始代码
        try:
            with open(input_file, 'r', encoding='utf-8') as f:
                original_lines = f.readlines()
        except UnicodeDecodeError:
            with open(input_file, 'r', encoding='latin-1') as f:
                original_lines = f.readlines()
        
        # 过滤代码
        filtered_lines = filter.filter_code(original_lines, strict_mode=strict_mode)
        
        # 写入过滤后的代码
        with open(output_file, 'w', encoding='utf-8') as f:
            f.writelines(filtered_lines)
        
        # 处理分析结果（如果提供）
        if analysis_file and updated_analysis_file:
            try:
                with open(analysis_file, 'r', encoding='utf-8') as f:
                    analysis_data = json.load(f)
                
                updated_analysis = filter.update_analysis_result(analysis_data, keep_unmapped=True)
                
                with open(updated_analysis_file, 'w', encoding='utf-8') as f:
                    json.dump(updated_analysis, f, indent=2, ensure_ascii=False)
                    
            except Exception as e:
                print(f"Warning: Could not process analysis file: {e}")
        
        # 返回统计信息
        mapping_info = filter.get_line_mapping_info()
        return {
            'status': 'success',
            'original_lines': len(original_lines),
            'filtered_lines': len(filtered_lines),
            'removed_lines': mapping_info['removed_lines_count'],
            'line_mapping': mapping_info,
            'message': f'Successfully filtered {len(original_lines)} lines to {len(filtered_lines)} lines'
        }
    
    except Exception as e:
        return {
            'status': 'error',
            'message': f'Error filtering code file: {str(e)}',
            'original_lines': 0,
            'filtered_lines': 0,
            'removed_lines': 0
        }


def main():
    """命令行主函数"""
    if len(sys.argv) < 3:
        print("Usage: python code_filter.py <input_file> <output_file> [analysis_file] [updated_analysis_file]")
        print("Example: python code_filter.py input.c output.c analysis.json updated_analysis.json")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    analysis_file = sys.argv[3] if len(sys.argv) > 3 else None
    updated_analysis_file = sys.argv[4] if len(sys.argv) > 4 else None
    
    try:
        result = filter_code_file(input_file, output_file, analysis_file, updated_analysis_file)
        
        print(f"代码过滤完成:")
        print(f"  原始行数: {result['original_lines']}")
        print(f"  过滤后行数: {result['filtered_lines']}")
        print(f"  删除行数: {result['removed_lines']}")
        
        if analysis_file and updated_analysis_file:
            print(f"  分析结果已更新: {updated_analysis_file}")
        
        # 显示部分行号映射示例
        mapping = result['line_mapping']['original_to_filtered']
        if mapping:
            print(f"  行号映射示例 (前10个):")
            for i, (orig, new) in enumerate(list(mapping.items())[:10]):
                print(f"    {orig} -> {new}")
            if len(mapping) > 10:
                print(f"    ... 还有 {len(mapping) - 10} 个映射")
        
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main() 