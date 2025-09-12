#!/usr/bin/env python3
import os
import json
import csv
from pathlib import Path

def analyze_file_status():
    """分析每个文件的状态和报错情况"""
    results = []
    
    # 获取所有.c文件
    c_files = list(Path('.').glob('*.c'))
    
    for c_file in c_files:
        base_name = c_file.stem
        ll_file = Path(f"{base_name}.ll")
        json_file = Path(f"{base_name}_analysis.json")
        
        # 检查文件存在性
        has_c = c_file.exists()
        has_ll = ll_file.exists()
        has_json = json_file.exists()
        
        # 分析JSON文件内容
        defect_count = 0
        defect_types = []
        error_message = ""
        
        if has_json:
            try:
                with open(json_file, 'r') as f:
                    data = json.load(f)
                    # 检查是否有缺陷
                    if "defects" in data and data["defects"]:
                        defect_count = len(data["defects"])
                        defect_types = []
                        for defect in data["defects"]:
                            if "type" in defect:
                                defect_types.append(defect["type"])
                    else:
                        defect_count = 0
                        defect_types = []
            except Exception as e:
                error_message = f"JSON解析错误: {str(e)}"
        else:
            error_message = "缺少分析结果文件"
        
        # 检查LL文件大小
        ll_size = ll_file.stat().st_size if has_ll else 0
        
        # 检查JSON文件大小
        json_size = json_file.stat().st_size if has_json else 0
        
        results.append({
            '文件名': base_name,
            'C文件存在': has_c,
            'LL文件存在': has_ll,
            'JSON文件存在': has_json,
            'LL文件大小(KB)': round(ll_size / 1024, 2) if has_ll else 0,
            'JSON文件大小(B)': json_size,
            '缺陷数量': defect_count,
            '缺陷类型': ', '.join(defect_types) if defect_types else '无',
            '错误信息': error_message
        })
    
    return results

def generate_error_summary(results):
    """生成错误统计摘要"""
    total_files = len(results)
    files_with_c = sum(1 for r in results if r['C文件存在'])
    files_with_ll = sum(1 for r in results if r['LL文件存在'])
    files_with_json = sum(1 for r in results if r['JSON文件存在'])
    files_with_errors = sum(1 for r in results if r['错误信息'])
    files_with_defects = sum(1 for r in results if r['缺陷数量'] > 0)
    
    # 统计缺陷类型
    defect_type_counts = {}
    for r in results:
        if r['缺陷类型'] != '无':
            types = r['缺陷类型'].split(', ')
            for t in types:
                defect_type_counts[t] = defect_type_counts.get(t, 0) + 1
    
    # 统计错误类型
    error_counts = {}
    for r in results:
        if r['错误信息']:
            error_counts[r['错误信息']] = error_counts.get(r['错误信息'], 0) + 1
    
    summary = {
        '总文件数': total_files,
        'C文件数': files_with_c,
        'LL文件数': files_with_ll,
        'JSON文件数': files_with_json,
        '有错误的文件数': files_with_errors,
        '有缺陷的文件数': files_with_defects,
        '缺陷类型统计': defect_type_counts,
        '错误类型统计': error_counts
    }
    
    return summary

def save_to_csv(results, filename):
    """保存结果到CSV文件"""
    if not results:
        return
    
    fieldnames = results[0].keys()
    
    with open(filename, 'w', newline='', encoding='utf-8-sig') as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(results)

def main():
    print("开始分析文件状态...")
    
    # 分析文件状态
    results = analyze_file_status()
    
    # 生成摘要
    summary = generate_error_summary(results)
    
    # 保存为CSV
    save_to_csv(results, 'file_analysis_table.csv')
    
    # 保存摘要
    with open('error_summary.json', 'w', encoding='utf-8') as f:
        json.dump(summary, f, ensure_ascii=False, indent=2)
    
    # 打印摘要
    print("\n=== 文件分析摘要 ===")
    print(f"总文件数: {summary['总文件数']}")
    print(f"C文件数: {summary['C文件数']}")
    print(f"LL文件数: {summary['LL文件数']}")
    print(f"JSON文件数: {summary['JSON文件数']}")
    print(f"有错误的文件数: {summary['有错误的文件数']}")
    print(f"有缺陷的文件数: {summary['有缺陷的文件数']}")
    
    print("\n=== 缺陷类型统计 ===")
    for defect_type, count in summary['缺陷类型统计'].items():
        print(f"{defect_type}: {count}")
    
    print("\n=== 错误类型统计 ===")
    for error_type, count in summary['错误类型统计'].items():
        print(f"{error_type}: {count}")
    
    print(f"\n详细结果已保存到: file_analysis_table.csv")
    print(f"摘要已保存到: error_summary.json")

if __name__ == "__main__":
    main() 