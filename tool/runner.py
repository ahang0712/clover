import subprocess
import json
import os

def run_tool_mcp(tool_name, args, env=None, timeout=300):
    """
    Run tool with MCP protocol interface. Return standardized MCP result dict.
    """
    mcp_request = {
        "protocol": "mcp",
        "tool": tool_name,
        "args": args,
        "env": env or {},
        "timeout": timeout
    }
    try:
        # 实际调用
        proc = subprocess.run(
            [tool_name] + args,
            capture_output=True,
            text=True,
            env=os.environ if env is None else {**os.environ, **env},
            timeout=timeout
        )
        mcp_response = {
            "protocol": "mcp",
            "result": "success" if proc.returncode == 0 else "error",
            "exit_code": proc.returncode,
            "stdout": proc.stdout,
            "stderr": proc.stderr
        }
        # 可扩展自动查找 output.json/defect.txt 等结果
        return mcp_response
    except Exception as e:
        return {
            "protocol": "mcp",
            "result": "exception",
            "error": str(e)
        }
