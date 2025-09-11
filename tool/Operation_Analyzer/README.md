# Operation_Analyzer

这个工具用于分析C/C++代码中的全局变量读写操作，特别关注并发环境下可能导致原子性违规的共享变量访问模式。工具基于LLVM IR进行静态分析，能够准确识别主函数和中断函数中的读写操作。

## 功能特点

- **LLVM IR 分析**：直接分析LLVM IR，无需源代码解析
- **全局变量识别**：自动识别所有全局变量及其访问
- **函数分类**：区分主函数和中断函数(ISR)
- **读写操作跟踪**：记录每个变量的读(load)和写(store)操作
- **数组索引分析**：识别数组访问的具体索引
- **MCP调用支持**：支持Multi-Call Protocol调用方式
- **代码注释功能** ⭐ **新功能**：将读写操作分析结果以注释形式添加到源代码中

## 安装依赖

本工具依赖LLVM库进行IR分析：

```bash
# Ubuntu/Debian
sudo apt-get install llvm-10-dev

# macOS (使用Homebrew)
brew install llvm@10
```

## 编译工具

```bash
# 创建build目录
mkdir -p build
cd build

# 配置并编译
cmake ..
make

# 或者直接使用提供的Makefile
make -f ../Makefile
```

## 使用方法

### 命令行使用

#### 1. 基本分析功能

```bash
# 使用预编译的llvm_api_demo工具
./llvm_api_demo <LLVM_IR_FILE> <OUTPUT_JSON_FILE>

# 例如
./llvm_api_demo input.ll output.json
```

#### 2. Python包装器

```bash
# 使用Python包装器分析C文件
python analyzer.py <C_SOURCE_FILE> <OUTPUT_JSON_FILE>

# 例如
python analyzer.py input.c output.json
```

#### 3. 代码注释功能 ⭐ **新功能**

```bash
# 为源代码添加读写操作注释
python code_annotator.py <SOURCE_FILE> <ANALYSIS_JSON_FILE> [OUTPUT_FILE]

# 例如
python code_annotator.py input.c input-output.json input_annotated.c
```

### MCP (Multi-Call Protocol) 调用

该工具支持MCP调用方式，可以通过以下方式在Python代码中调用：

```python
from tool.Operation_Analyzer.analyzer import analyze_rw, annotate_code

# 调用分析功能
result = analyze_rw(c_file_path, output_json_path)

# 调用注释功能
annotation_result = annotate_code(source_file_path, analysis_json_path, annotated_output_path)

# 检查结果
if result['status'] == 'success':
    print("分析成功")
else:
    print(f"分析失败: {result.get('message', '')}")
```

## 输入格式

工具接受LLVM IR文件作为输入，可以使用clang生成：

```bash
# 生成未优化的LLVM IR
clang -O0 -g -emit-llvm -S input.c -o input.ll

# 生成优化后的LLVM IR
opt -O2 input.ll -S -o input-opt.ll
```

## 输出格式

### 1. JSON分析结果

工具生成JSON格式的输出文件，包含以下主要字段：

```json
{
  "shared_variables": [
    {
      "name": "global_var",
      "type": "int",
      "is_array": false,
      "array_size": 0
    },
    {
      "name": "global_array",
      "type": "int[]",
      "is_array": true,
      "array_size": 10
    }
  ],
  "variable_accesses": [
    {
      "variable": "global_var",
      "function": "main",
      "type": "read",
      "line": 10,
      "array_index": null
    },
    {
      "variable": "global_array",
      "function": "isr_1",
      "type": "write",
      "line": 25,
      "array_index": "5"
    }
  ],
  "functions": {
    "main_functions": ["main", "svp_simple_001_001_main"],
    "isr_functions": ["isr_1", "svp_simple_001_001_isr_1", "svp_simple_001_001_isr_2"]
  }
}
```

### 输出字段说明

- **shared_variables**: 所有共享(全局)变量的列表
  - **name**: 变量名
  - **type**: 变量类型
  - **is_array**: 是否是数组
  - **array_size**: 数组大小(如果是数组)

- **variable_accesses**: 所有变量访问操作的列表
  - **variable**: 被访问的变量名
  - **function**: 执行访问的函数名
  - **type**: 访问类型("read"或"write")
  - **line**: 源代码行号(如果有调试信息)
  - **array_index**: 数组索引(如果访问的是数组元素)

- **functions**: 函数分类
  - **main_functions**: 主函数列表
  - **isr_functions**: 中断函数列表

### 2. 注释代码输出 ⭐ **新功能**

代码注释功能将在源代码中添加读写操作的注释：

```c
void main() {
    init();
    
    global_var = 0;  // Write 'global_var' in Main
    
    for (i = 0; i < MAX; i++) {  // Operations: Read 'i' in Main; Write 'i' in Main
        array[global_var] = i;  // Operations: Read 'global_var' in Main; Write 'array[var]' in Main
    }
}

void isr_1() {
    global_var = TRIGGER;  // Write 'global_var' in ISR
}
```

## 新功能特性

### 代码注释器(Code Annotator)

代码注释器是一个新增功能，可以：

1. **自动注释**：根据Operation_Analyzer的分析结果，自动在源代码对应位置添加读写操作注释
2. **智能去重**：自动去除重复的操作注释
3. **清晰格式**：注释格式清晰，不影响代码可读性
4. **函数类型区分**：清楚标识操作发生在主函数(Main)还是中断函数(ISR)
5. **多操作合并**：同一行的多个操作会被智能合并到一个注释中

### 注释格式说明

- 单个操作：`// Read 'variable_name' in Main`
- 多个操作：`// Operations: Read 'var1' in Main; Write 'var2' in ISR`
- 函数类型：`Main` 表示主函数，`ISR` 表示中断函数

## 集成到PlanAgent

该工具已集成到PlanAgent中，可以通过MCP方式调用。PlanAgent会自动处理LLVM IR生成和分析过程，并将结果添加到facts中。现在还支持代码注释功能，可以生成带有操作注释的源代码文件。

## 实现细节

工具使用C++实现核心分析功能，通过LLVM API解析IR并提取以下信息：

1. 全局变量声明和定义
2. 函数定义和调用关系
3. Load/Store指令的操作数和目标
4. GetElementPtr指令的数组索引计算
5. 函数名称分析(用于识别main和isr函数)

Python包装器(analyzer.py)提供了MCP接口，方便与其他工具集成。新增的代码注释器(code_annotator.py)提供了源代码注释功能。 