# Code Extractor

A static-analysis-based C code extraction and compaction tool designed to optimize inputs for AI models.

## Features

- **Preserve original line numbers**: Comments out unneeded code instead of deleting it, so line numbers exactly match the original file
- **Key function extraction**: Automatically identifies and extracts the main function and interrupt service routines (ISRs)
- **Dependency retention**: Automatically analyzes and keeps all functions called by the main and ISR functions
- **Intelligent variable detection**: Automatically analyzes and retains variables used in the main/ISR and their callees to preserve code integrity
- **Function inlining**: Optionally inline function calls to reduce redundancy
- **Type and struct retention**: Keep necessary typedefs and struct definitions
- **Global variable identification**: Automatically extracts relevant global variables
- **Preprocessor handling**: Preserve necessary macros and conditional compilation directives
- **MCP support**: Supports Multi-Call Protocol for easy integration with other tools

## Usage

### Basic

```bash
./run.sh example.c
```

This extracts the main/ISR functions and their dependencies from `example.c`, and generates `example_extracted.c`.

### Advanced Options

```bash
./run.sh [options] <input_file> [output_file]
```

Options:
- `-i, --inline` - Inline all called functions
- `-m, --main <name>` - Specify the main function name (if not the standard `main`)
- `-v, --verbose` - Verbose output
- `-k, --keep-all` - Keep all original lines (comment out unneeded parts)
- `-h, --help` - Show help

### Examples

1) Extract with inlining and verbose output:
```bash
./run.sh -i -v example.c
```

2) Specify a non-standard main function:
```bash
./run.sh -m svp_simple_021_001_main wdt_pci_1.c
```

3) Keep all original lines (via comments):
```bash
./run.sh -k example.c output.c
```

4) Full example:
```bash
./run.sh -i -k -v -m main example.c example_extracted.c
```

### MCP (Multi-Call Protocol)

You can call the tool via MCP from Python:

```python
from tool.Code_Extractor.extractor import extract_code

# Call MCP function
result = extract_code(input_file_path, output_file_path)

# Check result
if result['status'] == 'success':
    print("Code extraction succeeded")
    print(f"Extracted code saved to: {output_file_path}")
else:
    print(f"Code extraction failed: {result.get('message', '')}")
```

Optional parameters:

```python
# Full parameter example
result = extract_code(
    input_file_path,
    output_file_path,
    inline=True,           # Inline functions
    keep_all=True,         # Keep all lines
    main_function="svp_simple_001_001_main",  # Specify main function
    verbose=True           # Verbose output
)
```

## How It Works

1. Use regex + static analysis to detect and extract function definitions
2. Build a call graph to analyze inter-function dependencies
3. Identify main and ISR functions
4. Recursively find all functions directly or indirectly called by main/ISR
5. Analyze variables used by main/ISR and their callees; preserve their declarations/definitions
6. Keep all code lines but comment out unneeded parts
7. Optionally inline function calls to reduce redundancy
8. Guarantee exact line-number parity with the original file for traceability and debugging

## Line Number Preservation

Two modes to preserve original line numbers:

1. **Full Retention Mode (-k)**
   - Keep all original lines
   - Unneeded code is commented out rather than deleted
   - Line numbers match the original exactly

2. **Standard Mode**
   - Extract key functions and necessary code
   - Unneeded code is deleted
   - Smaller output, but line numbers will change

## Variable Handling

1. **Keep used variables**
   - Analyze all variables used in main/ISR and their callees
   - Automatically keep their definitions and declarations
   - Keep struct field definitions that are used

2. **Handle unused variables**
   - Comment out definitions of variables not used by the necessary functions
   - Preserve context while reducing noise

## Function Dependencies

1. **Main and ISR**
   - Automatically identify main (e.g., `main`) and ISR functions
   - Treat them as program entry points

2. **Keep called functions**
   - Recursively analyze all functions called directly or indirectly by main/ISR
   - Preserve complete call chains for correctness
   - In inline mode, only inline within main/ISR to keep call relations clear

3. **Handle unused functions**
   - Comment out functions not called by main/ISR
   - Reduce unrelated code while preserving context via comments

## Use Cases

- Compact code for AI model input (e.g., for Expert-Judge systems)
- Analyses requiring strict line-number consistency
- Extract key parts from large codebases
- Understand and visualize function call relationships in complex code

## Integration with PlanAgent

This tool is integrated with PlanAgent and can be invoked via MCP. PlanAgent will handle extraction and add results to facts.

## Output Example

The extracted code preserves original line numbers and comments out irrelevant parts:

```c
#include <stdio.h>

// Preserved global variable
volatile int global_var;

// Unused variable commented out
// int unused_var;

// Preserved function definition
void isr_function() {
    global_var = 1;  // Operation in ISR
}

int main() {
    global_var = 0;  // Operation in main
    
    // Some business logic
    printf("Value: %d\n", global_var);
    
    return 0;
}

// Unused function commented out
// void unused_function() {
//     unused_var = 10;
// }
```

## Notes

- The tool uses static analysis and may struggle with highly dynamic patterns (e.g., function pointers)
- Complex preprocessor macros may reduce extraction accuracy
- For best results, the input should be free of syntax errors
- The `-k` option keeps all lines and can produce larger outputs than the input
- Inlining may increase the output size but reduce dependency complexity 