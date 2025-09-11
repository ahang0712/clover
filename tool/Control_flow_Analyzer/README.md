# Control Flow Analyzer

An LLVM-based control flow analysis tool for C code that extracts function call relationships. It can analyze a single C file or an entire repository and generate call graphs.

## Features

- Analyze function call relationships in a single C file
- Analyze function call relationships across a repository
- Distinguish between defined (internal) and external functions
- Support JSON and DOT outputs
- Visualize call graphs (Graphviz required)
- Support MCP (Multi-Call Protocol)

## Dependencies

- LLVM 10.0.0
- Clang 10.0.0
- Python 3.6+
- Graphviz (optional, for PNG rendering)

## Installation

1. Ensure LLVM and Clang 10.0.0 are installed:

```bash
# Download prebuilt LLVM/Clang
curl -L https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-apple-darwin.tar.xz -o llvm10.tar.xz
mkdir -p ~/llvm10
tar -xf llvm10.tar.xz -C ~/llvm10
```

2. Add LLVM tools to PATH:

```bash
export PATH="$HOME/llvm10/clang+llvm-10.0.0-x86_64-apple-darwin/bin:$PATH"
```

3. Install Graphviz (optional):

```bash
# macOS
brew install graphviz

# Ubuntu/Debian
# sudo apt-get install graphviz
```

## Usage

### Analyze a single C file

```bash
./run.sh example.c
```

### Analyze an entire repository

```bash
./run.sh -m repo path/to/repository
```

### Specify output directory

```bash
./run.sh -o output_dir example.c
```

### Generate DOT output

```bash
./run.sh -f dot example.c
```

### Full CLI options

```bash
./run.sh --help
```

### MCP (Multi-Call Protocol)

Call from Python:

```python
from tool.Control_flow_Analyzer.analyzer import analyze_control_flow

# Call MCP function
result = analyze_control_flow(c_file_path, output_json_path)

# Check result
if result['status'] == 'success':
    print("Analysis succeeded")
    print(f"Generated call graph file: {result.get('callgraph_file', '')}")
else:
    print(f"Analysis failed: {result.get('message', '')}")
```

## Output Formats

### JSON

The JSON output includes:

- `files`: analyzed files and their functions
- `functions`: all functions with type (`defined` or `external`)
- `call_graph`: call relationships
- `main_functions`: identified main functions
- `isr_functions`: identified interrupt service routines

Example:

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

### DOT

DOT output is a visual call graph. Convert to PNG using Graphviz:

```bash
dot -Tpng output/example_callgraph.dot -o output/example_callgraph.png
```

## Examples

Two examples are provided:

1. `example.c`: single-file example
2. `example_project/`: multi-file example project

### Run examples

```bash
# Single-file
./run.sh example.c

# Multi-file project
./run.sh -m repo example_project
```

## Integration with PlanAgent

This tool is integrated with PlanAgent and can be invoked via MCP. PlanAgent compiles and analyzes C files and adds the results to facts.

## Notes

- The tool analyzes LLVM IR, so input C files must compile successfully
- Complex projects may require additional compile flags or include paths
- Calls via function pointers cannot be fully resolved by static analysis
- Function type identification uses simple name-based heuristics (e.g., names containing "main" for main and "isr" for ISR) 