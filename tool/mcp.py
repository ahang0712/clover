import functools
import os
import subprocess
import json
from typing import Callable, List, Dict, Any, Optional

def tool(name: str = None, description: str = None):
    """
    Decorator to mark a function as an MCP tool.
    
    Args:
        name (str, optional): The name of the tool. Defaults to the function name.
        description (str, optional): A description of what the tool does. Defaults to None.
    
    Returns:
        Callable: The decorated function.
    """
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kwargs):
            # Get the actual tool name
            tool_name = name or func.__name__
            
            # Execute the function
            result = func(*args, **kwargs)
            
            # Return the result
            return result
        
        # Add metadata to the function
        wrapper.is_mcp_tool = True
        wrapper.tool_name = name or func.__name__
        wrapper.tool_description = description or func.__doc__
        
        return wrapper
    
    return decorator 