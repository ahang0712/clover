# utils.py

import os

def read_file(filepath): # Read the contents of a file
    with open(filepath, 'r') as f:
        return f.read()

def read_json(filepath): # Read the contents of a JSON file
    import json
    with open(filepath, 'r') as f:
        return json.load(f)

def write_file(filepath, content, mode='w'):
    # Ensure parent directory exists
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, mode) as f:
        f.write(content)

def add_line_numbers(lines): # Add line numbers to a list of strings
    return [f"{i+1}: {line.strip()}" for i, line in enumerate(lines)]

def load_prompt(path, **kwargs): # Load a prompt file and format it with kwargs
    with open(path, 'r') as f:
        text = f.read()
    if kwargs:
        text = text.format(**kwargs)
    return text
