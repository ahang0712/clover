import subprocess
import json
import os

def run_tool_mcp(tool_path, args, env=None, timeout=300, output_files=None):
    """
    Run a tool with MCP protocol interface.
    Arguments:
        tool_path (str): 工具的实际可执行路径
        args (list): 传递给工具的命令行参数
        env (dict): 额外的环境变量
        timeout (int): 子进程超时时间
        output_files (list[str]): 可选，分析完需要自动读取哪些输出文件内容

    Returns:
        dict: MCP标准响应
    """
    mcp_request = {
        "protocol": "mcp",
        "tool_path": tool_path,
        "args": args,
        "env": env or {},
        "timeout": timeout
    }
    try:
        # 子进程调用
        proc = subprocess.run(
            [tool_path] + args,
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

        # 自动附加部分输出文件内容
        if output_files:
            mcp_response['outputs'] = {}
            for fpath in output_files:
                if os.path.exists(fpath):
                    try:
                        # 优先尝试json，否则按文本读
                        with open(fpath, 'r', encoding='utf-8') as f:
                            if fpath.endswith('.json'):
                                mcp_response['outputs'][os.path.basename(fpath)] = json.load(f)
                            else:
                                mcp_response['outputs'][os.path.basename(fpath)] = f.read()
                    except Exception as e:
                        mcp_response['outputs'][os.path.basename(fpath)] = f'Failed to read: {e}'

        return mcp_response
    except subprocess.TimeoutExpired:
        return {
            "protocol": "mcp",
            "result": "timeout",
            "error": f"Tool {tool_path} timed out after {timeout} seconds"
        }
    except Exception as e:
        return {
            "protocol": "mcp",
            "result": "exception",
            "error": str(e)
        }
    