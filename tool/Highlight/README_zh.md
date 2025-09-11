# 代码过滤器 (Code Filter)

## 功能介绍

代码过滤器用于处理传入的代码片段，删除空行和只有注释的行，同时保持读写操作的行号对应关系不变。这对于分析器的准确性和结果的可读性非常重要。

## 主要特性

1. **删除空行和注释行**: 自动识别并删除：
   - 空行
   - 只包含注释的行 (`//`, `/* */`, `*`)
   - 非关键预处理指令（保留 `#include`, `#define` 等重要指令）

2. **保持行号映射**: 维护原始行号与过滤后行号的映射关系

3. **更新分析结果**: 自动更新分析结果JSON中的行号，使其与过滤后的代码对应

4. **详细统计信息**: 提供过滤前后的详细统计和映射信息

## 使用方法

### 命令行使用

```bash
# 基本用法：只过滤代码
python code_filter.py <input_file> <output_file>

# 完整用法：同时更新分析结果
python code_filter.py <input_file> <output_file> <analysis_file> <updated_analysis_file>
```

### 示例

```bash
# 过滤 wdt_pci_1.c 文件并更新分析结果
python tool/Highlight/code_filter.py \
    dataset/RWIP/wdt/wdt_pci_1.c \
    wdt_pci_1_filtered.c \
    tool/Highlight/output_wdt_pci_1.json \
    wdt_pci_1_updated_analysis.json
```

## 输出结果

### 统计信息
运行后会显示：
- 原始行数
- 过滤后行数  
- 删除的行数
- 行号映射示例

### 示例输出
```
代码过滤完成:
  原始行数: 1113
  过滤后行数: 128
  删除行数: 985
  分析结果已更新: wdt_pci_1_updated_analysis.json
  行号映射示例 (前10个):
    82 -> 1
    117 -> 2
    185 -> 3
    188 -> 4
    190 -> 5
    ...
```

## 更新后的分析结果

更新后的分析结果JSON包含：

1. **更新的缺陷信息**: 所有行号都映射到过滤后的代码
2. **行号映射表**: 完整的原始行号 → 过滤后行号映射
3. **统计信息**: 
   - `total_original_lines`: 原始代码总行数
   - `total_filtered_lines`: 过滤后代码总行数

### 映射信息结构
```json
{
  "line_mapping": {
    "original_to_filtered": {
      "1025": 104,
      "1031": 106,
      ...
    },
    "filtered_to_original": {
      "104": 1025,
      "106": 1031,
      ...
    },
    "total_original_lines": 1113,
    "total_filtered_lines": 128
  }
}
```

## Python API 使用

```python
from code_filter import CodeFilter, filter_code_file

# 方法1: 使用便捷函数
result = filter_code_file(
    input_file="input.c",
    output_file="output.c", 
    analysis_file="analysis.json",
    updated_analysis_file="updated_analysis.json"
)

# 方法2: 使用类接口
filter = CodeFilter()

# 读取并过滤代码
with open("input.c", 'r') as f:
    lines = f.readlines()
filtered_lines = filter.filter_code(lines)

# 更新分析结果
with open("analysis.json", 'r') as f:
    analysis = json.load(f)
updated_analysis = filter.update_analysis_result(analysis)

# 获取映射信息
mapping_info = filter.get_line_mapping_info()
```

## 注意事项

1. **编码支持**: 自动处理UTF-8和Latin-1编码
2. **保留重要内容**: 不会删除包含 `#include`, `#define` 等重要预处理指令的行
3. **映射完整性**: 如果分析结果中的某些行号无法映射，会保留原始行号并添加警告标记
4. **备份建议**: 建议在过滤前备份原始文件

## 应用场景

1. **代码展示**: 为演示或文档生成紧凑的代码片段
2. **分析结果对齐**: 确保分析工具的输出行号与展示的代码一致
3. **减少干扰**: 移除不相关的空行和注释，突出关键代码逻辑
4. **节省空间**: 在有限的显示空间中展示更多有效代码

## 技术实现

- **正则表达式匹配**: 使用精确的正则表达式识别注释模式
- **双向映射**: 维护原始行号→过滤行号和反向映射
- **错误处理**: 优雅处理编码问题和文件访问错误
- **类型安全**: 使用Python类型提示确保API安全性 