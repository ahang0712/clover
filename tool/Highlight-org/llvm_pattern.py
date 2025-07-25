#!/usr/bin/env python3
"""
改进版的并发缺陷模式检测工具 - 基于LLVM IR的分析
该工具读取LLVM IR并使用更精确的程序分析方法来检测并发缺陷
"""

import json
import sys
import os
import re
import subprocess
from typing import List, Dict, Any, Set, Tuple, Optional
from collections import defaultdict

# LLVM IR解析类
class LLVMIRParser:
    def __init__(self, ir_file: str):
        """初始化LLVM IR解析器"""
        self.ir_file = ir_file
        self.ir_content = ""
        self.functions = {}  # 函数名 -> {基本块, 指令}
        self.call_graph = {}  # 函数名 -> 调用的函数集合
        self.global_vars = set()  # 全局变量集合
        self.access_map = {}  # 全局变量 -> {函数: [(操作类型, 基本块, 指令行号, 依赖变量)]}
        self.isr_functions = set()  # 中断函数集合
        self.main_function = None  # 主函数
        
    def parse(self) -> bool:
        """解析LLVM IR文件"""
        try:
            with open(self.ir_file, 'r') as f:
                self.ir_content = f.read()
            
            # 1. 提取全局变量
            self._extract_global_variables()
            
            # 2. 提取函数定义和基本块
            self._extract_functions()
            
            # 3. 构建调用图
            self._build_call_graph()
            
            # 4. 分析全局变量访问
            self._analyze_variable_access()
            
            # 5. 识别主函数和中断函数
            self._identify_special_functions()
            
            return True
        except Exception as e:
            print(f"解析LLVM IR失败: {str(e)}")
            return False
    
    def _extract_global_variables(self) -> None:
        """提取LLVM IR中的全局变量"""
        # 匹配全局变量定义
        global_var_pattern = re.compile(r'@([a-zA-Z_][a-zA-Z0-9_]*)\s*=')
        for match in global_var_pattern.finditer(self.ir_content):
            var_name = match.group(1)
            self.global_vars.add(var_name)
    
    def _extract_functions(self) -> None:
        """提取函数定义和基本块"""
        # 匹配函数定义
        func_pattern = re.compile(r'define\s+[^@]*@([a-zA-Z_][a-zA-Z0-9_]*)\s*\([^{]*\)[^{]*\{(.*?)\n\}', re.DOTALL)
        
        for match in func_pattern.finditer(self.ir_content):
            func_name = match.group(1)
            func_body = match.group(2)
            
            # 解析基本块
            self.functions[func_name] = self._parse_basic_blocks(func_body)
    
    def _parse_basic_blocks(self, func_body: str) -> Dict[str, List[str]]:
        """解析函数体中的基本块"""
        basic_blocks = {}
        
        # 基本块通常以标签开始: "bb_name:"
        block_pattern = re.compile(r'([a-zA-Z0-9_\.]+):\s*(?:\n|\r\n)(.*?)(?=\n[a-zA-Z0-9_\.]+:|\Z)', re.DOTALL)
        
        # 处理函数入口基本块 (可能没有显式标签)
        entry_block_match = re.match(r'\s*(.*?)(?=\n[a-zA-Z0-9_\.]+:|\Z)', func_body, re.DOTALL)
        if entry_block_match:
            entry_instructions = [line.strip() for line in entry_block_match.group(1).split('\n') if line.strip()]
            if entry_instructions:
                basic_blocks["entry"] = entry_instructions
        
        # 处理其他基本块
        for match in block_pattern.finditer(func_body):
            block_name = match.group(1)
            block_content = match.group(2)
            instructions = [line.strip() for line in block_content.split('\n') if line.strip()]
            basic_blocks[block_name] = instructions
        
        return basic_blocks
    
    def _build_call_graph(self) -> None:
        """构建函数调用图"""
        for func_name, blocks in self.functions.items():
            self.call_graph[func_name] = set()
            
            # 检查所有基本块中的调用指令
            for block_name, instructions in blocks.items():
                for instr in instructions:
                    if "call " in instr:
                        # 提取被调用的函数名
                        call_match = re.search(r'call\s+[^@]*@([a-zA-Z_][a-zA-Z0-9_]*)', instr)
                        if call_match:
                            callee = call_match.group(1)
                            self.call_graph[func_name].add(callee)
    
    def _analyze_variable_access(self) -> None:
        """分析全局变量的访问情况"""
        print("分析全局变量访问...")
        
        # 初始化访问映射
        for var in self.global_vars:
            self.access_map[var] = {}
        
        # 分析每个函数中的全局变量访问
        for func_name, blocks in self.functions.items():
            print(f"  分析函数 {func_name} 中的变量访问")
            
            for var in self.global_vars:
                self.access_map[var][func_name] = []
            
            for block_name, instructions in blocks.items():
                for i, instr in enumerate(instructions):
                    # 检查存储指令 (写操作) - 使用更通用的模式
                    # 匹配 store (volatile) type value, type* @var 或 store (volatile) type value, type* getelementptr...@var
                    store_match = re.search(r'store\s+(?:volatile\s+)?[^,]*,\s*[^@]*@([a-zA-Z_][a-zA-Z0-9_]*)', instr)
                    if store_match:
                        var_name = store_match.group(1)
                        # 检查变量名是否在全局变量列表中，或者是否是全局数组的一部分
                        matched_var = None
                        for global_var in self.global_vars:
                            if var_name == global_var or var_name.startswith(global_var + "_"):
                                matched_var = global_var
                                break
                        
                        if matched_var:
                            print(f"    发现写操作: {func_name} 写入 {matched_var} (基本块 {block_name})")
                            
                            # 尝试找出依赖变量
                            dep_vars = self._find_dependencies(instr)
                            self.access_map[matched_var][func_name].append(
                                ("store", block_name, i, dep_vars)
                            )
                    
                    # 检查加载指令 (读操作) - 使用更通用的模式
                    # 匹配 %var = load (volatile) type, type* @var 或 %var = load (volatile) type, type* getelementptr...@var
                    load_match = re.search(r'=\s*load\s+(?:volatile\s+)?[^,]*,\s*[^@]*@([a-zA-Z_][a-zA-Z0-9_]*)', instr)
                    if load_match:
                        var_name = load_match.group(1)
                        # 检查变量名是否在全局变量列表中，或者是否是全局数组的一部分
                        matched_var = None
                        for global_var in self.global_vars:
                            if var_name == global_var or var_name.startswith(global_var + "_"):
                                matched_var = global_var
                                break
                        
                        if matched_var:
                            print(f"    发现读操作: {func_name} 读取 {matched_var} (基本块 {block_name})")
                            
                            self.access_map[matched_var][func_name].append(
                                ("load", block_name, i, set())
                            )
        
        # 打印汇总信息
        print("变量访问汇总:")
        for var_name in self.global_vars:
            print(f"  变量 {var_name}:")
            for func_name, accesses in self.access_map[var_name].items():
                if accesses:
                    reads = sum(1 for access in accesses if access[0] == "load")
                    writes = sum(1 for access in accesses if access[0] == "store")
                    print(f"    函数 {func_name}: {reads} 次读取, {writes} 次写入")
    
    def _find_dependencies(self, instr: str) -> Set[str]:
        """找出指令中依赖的变量"""
        deps = set()
        # 检查指令中的所有变量引用
        var_refs = re.finditer(r'%([a-zA-Z0-9_]+)', instr)
        for match in var_refs:
            deps.add(match.group(1))
        return deps
    
    def _identify_special_functions(self) -> None:
        """识别主函数和中断函数"""
        # 识别主函数 (名为main或包含main)
        for func_name in self.functions:
            if func_name == "main" or "main" in func_name:
                self.main_function = func_name
            
            # 识别中断函数 (包含isr、interrupt或_irq)
            if "isr" in func_name.lower() or "interrupt" in func_name.lower() or "_irq" in func_name.lower():
                self.isr_functions.add(func_name)
    
    def get_reachable_functions(self, start_funcs: Set[str]) -> Set[str]:
        """获取从给定函数集合可达的所有函数"""
        reachable = set()
        queue = list(start_funcs)
        
        while queue:
            current = queue.pop(0)
            if current in reachable:
                continue
            
            reachable.add(current)
            
            # 将所有被调用的函数加入队列
            if current in self.call_graph:
                for callee in self.call_graph[current]:
                    if callee not in reachable:
                        queue.append(callee)
        
        return reachable

# 缺陷检测类
class DefectDetector:
    def __init__(self, parser: LLVMIRParser):
        """初始化缺陷检测器"""
        self.parser = parser
        self.defects = []  # 检测到的缺陷
        
    def detect_all_defects(self) -> List[Dict[str, Any]]:
        """检测所有类型的缺陷"""
        self.defects = []
        
        # 检测各种类型的缺陷
        self._detect_rwr_defects()
        self._detect_rww_defects()
        self._detect_wrw_defects()
        self._detect_wwr_defects()
        
        return self.defects
    
    def _has_access_pattern(self, func_name: str, var_name: str, access_types: List[str]) -> bool:
        """
        简化版检测函数，只检查是否有特定类型的访问，不考虑顺序
        例如：access_types = ["load", "load"] 只需要有两次读操作即可，不需要连续
        """
        if func_name not in self.parser.functions or var_name not in self.parser.access_map:
            return False
        
        # 获取所有操作
        accesses = self.parser.access_map[var_name].get(func_name, [])
        operations = [access[0] for access in accesses]
        
        # 计算每种操作的次数
        op_counts = {}
        for op_type in set(access_types):
            op_counts[op_type] = operations.count(op_type)
        
        # 检查是否满足所需的操作次数
        for op_type in set(access_types):
            required_count = access_types.count(op_type)
            if op_counts.get(op_type, 0) < required_count:
                return False
        
        return True
    
    def _has_operation(self, func_name: str, var_name: str, op_type: str) -> bool:
        """检查指定函数是否对变量进行了指定类型的操作"""
        if func_name not in self.parser.functions or var_name not in self.parser.access_map:
            return False
        
        accesses = self.parser.access_map[var_name].get(func_name, [])
        return any(access[0] == op_type for access in accesses)
    
    def _detect_rwr_defects(self) -> None:
        """检测RWR (Read-Write-Read) 缺陷"""
        print("\n检测RWR (Read-Write-Read) 缺陷...")
        
        for var_name in self.parser.global_vars:
            print(f"  检查变量 {var_name}:")
            
            # 检查主函数中是否有两次读操作
            if self.parser.main_function:
                main_reads = sum(1 for access in self.parser.access_map[var_name].get(self.parser.main_function, [])
                              if access[0] == "load")
                print(f"    主函数中读取次数: {main_reads}")
                
                if self._has_access_pattern(self.parser.main_function, var_name, ["load", "load"]):
                    print(f"    主函数中有多次读取")
                    # 检查是否有中断函数写这个变量
                    for isr in self.parser.isr_functions:
                        isr_writes = sum(1 for access in self.parser.access_map[var_name].get(isr, [])
                                     if access[0] == "store")
                        print(f"    中断函数 {isr} 中写入次数: {isr_writes}")
                        
                        if self._has_operation(isr, var_name, "store"):
                            print(f"    发现RWR缺陷: 主函数中多次读取，中断函数 {isr} 中有写入")
                            self.defects.append({
                                "variable": var_name,
                                "type": "RWR",
                                "location": self.parser.main_function,
                                "description": f"RWR defect: multiple reads in {self.parser.main_function} with write in {isr}"
                            })
                            break
            
            # 检查中断函数之间的RWR缺陷
            isr_list = sorted(self.parser.isr_functions)  # 假设按优先级排序
            
            for i, low_isr in enumerate(isr_list[:-1]):  # 除了最高优先级的中断
                low_reads = sum(1 for access in self.parser.access_map[var_name].get(low_isr, [])
                            if access[0] == "load")
                print(f"    中断函数 {low_isr} 中读取次数: {low_reads}")
                
                if self._has_access_pattern(low_isr, var_name, ["load", "load"]):
                    print(f"    中断函数 {low_isr} 中有多次读取")
                    
                    for high_isr in isr_list[i+1:]:  # 更高优先级的中断
                        high_writes = sum(1 for access in self.parser.access_map[var_name].get(high_isr, [])
                                      if access[0] == "store")
                        print(f"    中断函数 {high_isr} 中写入次数: {high_writes}")
                        
                        if self._has_operation(high_isr, var_name, "store"):
                            print(f"    发现RWR缺陷: 中断函数 {low_isr} 中多次读取，更高优先级中断函数 {high_isr} 中有写入")
                            self.defects.append({
                                "variable": var_name,
                                "type": "RWR",
                                "location": low_isr,
                                "description": f"RWR defect: multiple reads in {low_isr} with write in {high_isr}"
                            })
                            break
    
    def _detect_rww_defects(self) -> None:
        """检测RWW (Read-Write-Write) 缺陷"""
        for var_name in self.parser.global_vars:
            # 检查主函数中是否有读和写操作
            if self.parser.main_function and self._has_operation(self.parser.main_function, var_name, "load") and self._has_operation(self.parser.main_function, var_name, "store"):
                # 检查是否有中断函数写这个变量
                for isr in self.parser.isr_functions:
                    if self._has_operation(isr, var_name, "store"):
                        self.defects.append({
                            "variable": var_name,
                            "type": "RWW",
                            "location": self.parser.main_function,
                            "description": f"RWW defect: read and write in {self.parser.main_function} with write in {isr}"
                        })
                        break
            
            # 检查中断函数之间的RWW缺陷
            isr_list = sorted(self.parser.isr_functions)  # 假设按优先级排序
            
            for i, low_isr in enumerate(isr_list[:-1]):  # 除了最高优先级的中断
                if self._has_operation(low_isr, var_name, "load") and self._has_operation(low_isr, var_name, "store"):
                    for high_isr in isr_list[i+1:]:  # 更高优先级的中断
                        if self._has_operation(high_isr, var_name, "store"):
                            self.defects.append({
                                "variable": var_name,
                                "type": "RWW",
                                "location": low_isr,
                                "description": f"RWW defect: read and write in {low_isr} with write in {high_isr}"
                            })
                            break
    
    def _detect_wrw_defects(self) -> None:
        """检测WRW (Write-Read-Write) 缺陷"""
        for var_name in self.parser.global_vars:
            # 检查主函数中是否有两次写操作
            if self.parser.main_function and self._has_access_pattern(
                self.parser.main_function, var_name, ["store", "store"]
            ):
                # 检查是否有中断函数读这个变量
                for isr in self.parser.isr_functions:
                    if self._has_operation(isr, var_name, "load"):
                        self.defects.append({
                            "variable": var_name,
                            "type": "WRW",
                            "location": self.parser.main_function,
                            "description": f"WRW defect: multiple writes in {self.parser.main_function} with read in {isr}"
                        })
                        break
            
            # 检查中断函数之间的WRW缺陷
            isr_list = sorted(self.parser.isr_functions)  # 假设按优先级排序
            
            for i, low_isr in enumerate(isr_list[:-1]):  # 除了最高优先级的中断
                if self._has_access_pattern(low_isr, var_name, ["store", "store"]):
                    for high_isr in isr_list[i+1:]:  # 更高优先级的中断
                        if self._has_operation(high_isr, var_name, "load"):
                            self.defects.append({
                                "variable": var_name,
                                "type": "WRW",
                                "location": low_isr,
                                "description": f"WRW defect: multiple writes in {low_isr} with read in {high_isr}"
                            })
                            break
    
    def _detect_wwr_defects(self) -> None:
        """检测WWR (Write-Write-Read) 缺陷"""
        for var_name in self.parser.global_vars:
            # 检查主函数中是否有写和读操作
            if self.parser.main_function and self._has_operation(self.parser.main_function, var_name, "store") and self._has_operation(self.parser.main_function, var_name, "load"):
                # 检查是否有中断函数写这个变量
                for isr in self.parser.isr_functions:
                    if self._has_operation(isr, var_name, "store"):
                        self.defects.append({
                            "variable": var_name,
                            "type": "WWR",
                            "location": self.parser.main_function,
                            "description": f"WWR defect: write and read in {self.parser.main_function} with write in {isr}"
                        })
                        break
            
            # 检查中断函数之间的WWR缺陷
            isr_list = sorted(self.parser.isr_functions)  # 假设按优先级排序
            
            for i, low_isr in enumerate(isr_list[:-1]):  # 除了最高优先级的中断
                if self._has_operation(low_isr, var_name, "store") and self._has_operation(low_isr, var_name, "load"):
                    for high_isr in isr_list[i+1:]:  # 更高优先级的中断
                        if self._has_operation(high_isr, var_name, "store"):
                            self.defects.append({
                                "variable": var_name,
                                "type": "WWR",
                                "location": low_isr,
                                "description": f"WWR defect: write and read in {low_isr} with write in {high_isr}"
                            })
                            break

# 工具入口
def process_llvm_file(ir_file_path: str, output_path: Optional[str] = None) -> List[Dict[str, Any]]:
    """处理LLVM IR文件并检测缺陷"""
    print(f"处理LLVM IR文件: {ir_file_path}")
    
    # 解析LLVM IR
    parser = LLVMIRParser(ir_file_path)
    if not parser.parse():
        print("解析失败，退出。")
        return []
    
    print(f"发现 {len(parser.global_vars)} 个全局变量")
    print(f"发现 {len(parser.functions)} 个函数")
    
    if parser.main_function:
        print(f"主函数: {parser.main_function}")
    else:
        print("未找到主函数")
    
    print(f"中断函数: {', '.join(parser.isr_functions) if parser.isr_functions else '无'}")
    
    # 检测缺陷
    detector = DefectDetector(parser)
    defects = detector.detect_all_defects()
    
    print(f"检测到 {len(defects)} 个缺陷")
    
    # 输出结果
    if output_path:
        # 确保输出目录存在
        os.makedirs(os.path.dirname(os.path.abspath(output_path)), exist_ok=True)
        
        with open(output_path, 'w') as f:
            if not defects:
                f.write("No defects!")
            else:
                f.write(f"Found defects in {ir_file_path}:\n")
                
                # 按缺陷类型分组输出
                defect_types = sorted(set(defect["type"] for defect in defects))
                for defect_type in defect_types:
                    type_defects = [d for d in defects if d["type"] == defect_type]
                    
                    for defect in type_defects:
                        defect_info = (
                            f"Defect_Pattern: {defect['type']}\n"
                            f"Variable: {defect['variable']}\n"
                            f"Location: {defect['location']}\n"
                            f"Description: {defect['description']}\n"
                            "---\n"
                        )
                        f.write(defect_info)
        
        print(f"结果已保存到: {output_path}")
    
    return defects

def main():
    """主函数"""
    if len(sys.argv) < 2:
        print("用法: python llvm_pattern.py <LLVM IR文件路径> [输出文件路径]")
        sys.exit(1)
    
    ir_file = sys.argv[1]
    output_file = sys.argv[2] if len(sys.argv) > 2 else None
    
    process_llvm_file(ir_file, output_file)

if __name__ == "__main__":
    main() 