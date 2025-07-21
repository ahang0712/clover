### Output Format Requirements:
IMPORTANT: Your response MUST strictly follow one of these two formats:

1. If defects are found:
```json
{{
    "violations": [
        {{
            "sharedVariable": "variable_name",
            "accessPattern": {access_pattern},
            "lines": [line1, line2, line3]
        }}
    ]
}}

```

2. If no defects are found:
```plaintext
No defects.
```

- Do NOT include any explanations, reasoning, or additional text outside these formats.
- Each branch scenario that may lead to a violation should be output as a separate entry in the "violations" array.
- The "accessPattern" field must be an array of operation types (e.g., ["Write", "Read", "Write"]), and must strictly match the actual access types in the code.
- The "lines" field must be an array of integers, indicating the line numbers of the operations in the order they occur.
- If the pattern is invalid or does not match, do NOT output anything for it.
- Output must be valid JSON (double quotes, no trailing commas, no comments).

### Code Example:
{pattern_example}