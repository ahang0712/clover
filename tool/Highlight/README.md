# Defect Highlight Tool

这个工具用于检测并高亮C代码中潜在的并发缺陷，特别是与原子性违规相关的模式。

## 支持的缺陷模式

该工具可以检测以下四种标准缺陷模式：

1. **RWR (Read-Write-Read)**: 读-写-读模式，当一个函数读取变量后，被另一个函数写入，然后再次读取时可能导致不一致。
2. **RWW (Read-Write-Write)**: 读-写-写模式，当一个函数读取变量并写入后，被另一个函数写入时可能导致数据丢失。
3. **WRW (Write-Read-Write)**: 写-读-写模式，当一个函数写入变量后，被另一个函数读取，然后再次写入时可能导致数据不一致。
4. **WWR (Write-Write-Read)**: 写-写-读模式，当一个函数写入变量后，被另一个函数写入，然后读取时可能导致读取到错误的值。

## 使用方法

### 命令行使用

```bash
python pattern.py <input_json_file> [<input_json_file2> ...]
```

输入文件应该是JSON格式，包含以下字段：
- `GLOBAL_VAR`: 全局变量列表
- `MAIN_INFO`: 主函数中的操作列表
- `ISR_INFO`: 中断函数中的操作列表
- `ISR_COUNT`: 中断函数数量

每个操作应该包含以下字段：
- `variable`: 变量名
- `function`: 函数名
- `operation`: 操作类型，"load"表示读取，"store"表示写入

### MCP (Multi-Call Protocol) 调用

该工具现在支持MCP调用方式，可以通过以下方式在Python代码中调用：

```python
from tool.Highlight.pattern import detect_defects

# 调用MCP函数
result = detect_defects(input_file_path, output_file_path)

# 检查结果
if result['status'] == 'success':
    print("缺陷检测成功")
    if 'data' in result and result['data'].get('defects_found', False):
        print(f"发现 {result['data'].get('defect_count', 0)} 个缺陷")
    else:
        print("未发现缺陷")
else:
    print(f"缺陷检测失败: {result.get('message', '')}")
```

## 输出格式

工具会生成一个文本文件，列出所有检测到的缺陷，每个缺陷包含以下信息：

```
Defect_Pattern: <缺陷模式>
Variable: <变量名>
Location: <位置>
Description: <描述>
---
```

如果输出文件以`.json`结尾，还会生成一个JSON格式的输出，包含以下字段：

```json
{
  "status": "success",
  "defects_found": true,
  "defect_count": 2,
  "defects": [
    {
      "variable": "global_var",
      "type": "WRW",
      "location": "main",
      "description": "WRW defect found: consecutive writes in main function with read in isr_1"
    },
    ...
  ]
}
```

## 集成到PlanAgent

该工具已集成到PlanAgent中，可以通过MCP方式调用。PlanAgent会自动处理输入和输出文件，并将结果添加到facts中。 