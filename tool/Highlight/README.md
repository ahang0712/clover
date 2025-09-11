# Code Filter

## Overview

The Code Filter processes incoming code snippets by removing blank lines and comment-only lines while preserving the mapping between read/write operation line numbers and the displayed code. This is crucial for analyzer accuracy and readability of results.

## Key Features

1. **Remove blanks and comment-only lines**: Automatically detects and removes:
   - Blank lines
   - Comment-only lines (`//`, `/* */`, `*`)
   - Non-essential preprocessor directives (retains important ones like `#include`, `#define`)

2. **Preserve line mapping**: Maintains the mapping between original and filtered line numbers

3. **Update analysis results**: Automatically updates line numbers in analysis JSON to match the filtered code

4. **Detailed statistics**: Provides comprehensive before/after statistics and mapping info

## Usage

### CLI

```bash
# Basic: filter code only
python code_filter.py <input_file> <output_file>

# Full: filter code and update analysis
python code_filter.py <input_file> <output_file> <analysis_file> <updated_analysis_file>
```

### Example

```bash
# Filter wdt_pci_1.c and update analysis results
python tool/Highlight/code_filter.py \
    dataset/RWIP/wdt/wdt_pci_1.c \
    wdt_pci_1_filtered.c \
    tool/Highlight/output_wdt_pci_1.json \
    wdt_pci_1_updated_analysis.json
```

## Output

### Statistics
After running, you will see:
- Original line count
- Filtered line count
- Deleted line count
- Line mapping examples

### Sample output
```
Filter completed:
  Original lines: 1113
  Filtered lines: 128
  Deleted lines: 985
  Analysis updated: wdt_pci_1_updated_analysis.json
  Mapping examples (first 10):
    82 -> 1
    117 -> 2
    185 -> 3
    188 -> 4
    190 -> 5
    ...
```

## Updated Analysis JSON

The updated analysis JSON contains:

1. **Updated defect info**: All line numbers mapped to the filtered code
2. **Line mapping table**: Full original → filtered line mapping
3. **Stats**:
   - `total_original_lines`: original code line count
   - `total_filtered_lines`: filtered code line count

### Mapping structure
```json
{
  "line_mapping": {
    "original_to_filtered": {
      "1025": 104,
      "1031": 106
    },
    "filtered_to_original": {
      "104": 1025,
      "106": 1031
    },
    "total_original_lines": 1113,
    "total_filtered_lines": 128
  }
}
```

## Python API

```python
from code_filter import CodeFilter, filter_code_file

# Option 1: helper function
result = filter_code_file(
    input_file="input.c",
    output_file="output.c", 
    analysis_file="analysis.json",
    updated_analysis_file="updated_analysis.json"
)

# Option 2: class API
filter = CodeFilter()

# Read and filter code
with open("input.c", 'r') as f:
    lines = f.readlines()
filtered_lines = filter.filter_code(lines)

# Update analysis results
with open("analysis.json", 'r') as f:
    analysis = json.load(f)
updated_analysis = filter.update_analysis_result(analysis)

# Get mapping info
mapping_info = filter.get_line_mapping_info()
```

## Notes

1. **Encoding**: Handles UTF-8 and Latin-1 automatically
2. **Preserve important content**: Will not remove important preprocessor directives like `#include`, `#define`
3. **Mapping integrity**: If some lines in the analysis cannot be mapped, original line numbers are retained with a warning flag
4. **Backup**: Recommended to back up files before filtering

## Use Cases

1. **Code presentation**: Produce compact code snippets for demos or docs
2. **Align analysis results**: Ensure analyzer outputs match displayed code line numbers
3. **Reduce noise**: Remove irrelevant blanks/comments to highlight core logic
4. **Save space**: Show more effective code in limited display space

## Implementation Notes

- **Regex-based detection**: Precise regex patterns to detect comment forms
- **Bidirectional mapping**: Maintain original→filtered and filtered→original mappings
- **Error handling**: Gracefully handle encoding and file access issues
- **Type hints**: Use Python type hints for API safety 