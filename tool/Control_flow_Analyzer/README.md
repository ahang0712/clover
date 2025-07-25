# 控制流分析器 (Control Flow Analyzer)

这是一个基于LLVM的控制流分析工具，用于分析C代码的函数调用关系。它可以分析单个C文件或整个代码仓库，并生成函数调用图。

## 功能特点

- 分析单个C文件的函数调用关系
- 分析整个代码仓库的函数调用关系
- 识别内部函数和外部函数
- 支持JSON和DOT格式输出
- 可视化函数调用图（需要安装Graphviz）
- 支持MCP (Multi-Call Protocol) 调用方式

## 依赖项

- LLVM 10.0.0
- Clang 10.0.0
- Python 3.6+
- Graphviz（可选，用于生成PNG图像）

## 安装

1. 确保已安装LLVM和Clang 10.0.0：

```bash
# 下载预编译的LLVM和Clang
curl -L https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-apple-darwin.tar.xz -o llvm10.tar.xz
mkdir -p ~/llvm10
tar -xf llvm10.tar.xz -C ~/llvm10
```

2. 将LLVM工具添加到PATH：

```bash
export PATH="$HOME/llvm10/clang+llvm-10.0.0-x86_64-apple-darwin/bin:$PATH"
```

3. 安装Graphviz（可选）：

```bash
# macOS
brew install graphviz

# Ubuntu/Debian
# sudo apt-get install graphviz
```

## 使用方法

### 分析单个C文件

```bash
./run.sh example.c
```

### 分析整个代码仓库

```bash
./run.sh -m repo path/to/repository
```

### 指定输出目录

```bash
./run.sh -o output_dir example.c
```

### 生成DOT格式输出

```bash
./run.sh -f dot example.c
```

### 完整的命令行选项

```bash
./run.sh --help
```

### MCP (Multi-Call Protocol) 调用

该工具支持MCP调用方式，可以通过以下方式在Python代码中调用：

```python
from tool.Control_flow_Analyzer.analyzer import analyze_control_flow

# 调用MCP函数
result = analyze_control_flow(c_file_path, output_json_path)

# 检查结果
if result['status'] == 'success':
    print("分析成功")
    print(f"生成的调用图文件: {result.get('callgraph_file', '')}")
else:
    print(f"分析失败: {result.get('message', '')}")
```

## 输出格式

### JSON格式

JSON输出包含以下部分：

- `files`：分析的文件列表及其包含的函数
- `functions`：所有函数的列表，包括类型（defined或external）
- `call_graph`：函数调用关系列表
- `main_functions`：识别出的主函数列表
- `isr_functions`：识别出的中断函数列表

示例JSON输出：

```json
{
  "files": {
    "example.c": ["main", "foo", "bar"]
  },
  "functions": {
    "main": {"type": "defined", "file": "example.c"},
    "foo": {"type": "defined", "file": "example.c"},
    "bar": {"type": "defined", "file": "example.c"},
    "printf": {"type": "external"}
  },
  "call_graph": {
    "main": ["foo", "printf"],
    "foo": ["bar", "printf"],
    "bar": ["printf"]
  },
  "main_functions": ["main"],
  "isr_functions": []
}
```

### DOT格式

DOT输出是一个可视化的函数调用图，可以使用Graphviz工具将其转换为PNG等图像格式：

```bash
dot -Tpng output/example_callgraph.dot -o output/example_callgraph.png
```

## 示例

项目包含两个示例：

1. `example.c`：单文件示例
2. `example_project/`：多文件示例项目

### 运行示例

```bash
# 单文件示例
./run.sh example.c

# 多文件示例
./run.sh -m repo example_project
```

## 集成到PlanAgent

该工具已集成到PlanAgent中，可以通过MCP方式调用。PlanAgent会自动处理C文件编译和分析过程，并将结果添加到facts中。

## 注意事项

- 该工具依赖于LLVM IR进行分析，因此需要能够成功编译C文件
- 对于复杂的项目，可能需要提供编译标志或包含路径
- 函数指针调用无法在静态分析中完全解析
- 工具会根据函数名称规则（如包含"main"的为主函数，包含"isr"的为中断函数）识别函数类型 