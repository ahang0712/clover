# utils.py

import os

import os
import json

def read_file(filepath: str) -> str:
    """
    Read the contents of a file and return as a string.
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        return f.read()

def read_json(filepath: str):
    """
    Read and parse a JSON file.
    """
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)

def write_file(filepath: str, content: str, mode: str = 'w'):
    """
    Write content to a file, creating parent directories as needed.
    """
    os.makedirs(os.path.dirname(filepath), exist_ok=True)
    with open(filepath, mode, encoding='utf-8') as f:
        f.write(content)

def add_line_numbers(lines):
    """
    Add line numbers to a list of strings.
    Returns: list of strings in the format 'N: line content'.
    """
    return [f"{i+1}: {line.strip()}" for i, line in enumerate(lines)]

def load_prompt(path: str, **kwargs) -> str:
    """
    Load a prompt file (markdown/txt) and format it with given keyword arguments.
    """
    with open(path, 'r', encoding='utf-8') as f:
        text = f.read()
    if kwargs:
        text = text.format(**kwargs)
    return text
