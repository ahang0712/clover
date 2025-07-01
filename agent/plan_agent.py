# clover/agent/plan_agent.py

import os
import json
from agent.agent_base import AgentBase
from utils import read_json

try:
    from tool.runner import run_tool_mcp
except ImportError:
    # Fallback MCP runner实现
    import subprocess
    def run_tool_mcp(tool_name, args, env=None, timeout=300):
        try:
            proc = subprocess.run(
                [tool_name] + args,
                capture_output=True,
                text=True,
                env=os.environ if env is None else {**os.environ, **env},
                timeout=timeout
            )
            return {
                "protocol": "mcp",
                "result": "success" if proc.returncode == 0 else "error",
                "exit_code": proc.returncode,
                "stdout": proc.stdout,
                "stderr": proc.stderr
            }
        except Exception as e:
            return {
                "protocol": "mcp",
                "result": "exception",
                "error": str(e)
            }

class PlanAgent(AgentBase):
    """
    PlanAgent: Tool orchestration and scheduling with MCP protocol.
    """

    def __init__(self, name="PlanAgent"):
        super().__init__(name)
        self.static_report_path = None

    def call_tool_mcp(self, tool_path, input_file, timeout=300):
        """
        Use MCP protocol to call an external static analysis tool.
        Returns MCP response dict.
        """
        # 使用MCP协议调用外部静态分析工具
        mcp_result = run_tool_mcp(
            tool_name=tool_path,
            args=[input_file],
            timeout=timeout
        )
        # 添加消息，记录调用的工具和输入文件以及MCP结果
        self.add_message("tool_call", f"Called tool {tool_path} on {input_file}: {mcp_result['result']}")
        # 返回MCP结果
        return mcp_result

    def find_output_json(self, input_file):
        """
        Heuristically find the tool's output json file from input_file path.
        """
        base = os.path.splitext(input_file)[0]
        candidates = [base + "-output.json", base + "_output.json", base + ".json"]
        for path in candidates:
            if os.path.exists(path):
                self.static_report_path = path
                return path
        raise FileNotFoundError(f"No output json found for {input_file}")

    def plan_and_dispatch(self, tool_path, input_file, type_threshold=3, variable_threshold=5):
        """
        1. Call static analysis tool (MCP protocol)
        2. Parse report
        3. Decide expert/judge agent scheduling plan
        Returns (plan, output_json_path, mcp_result)
        """
        mcp_result = self.call_tool_mcp(tool_path, input_file)
        if mcp_result["result"] != "success":
            raise RuntimeError(f"Tool call failed: {mcp_result}")

        output_json = self.find_output_json(input_file)
        plan = self.decide_plan(
            static_report_path=output_json,
            type_threshold=type_threshold,
            variable_threshold=variable_threshold
        )
        return plan, output_json, mcp_result

    def parse_report(self, static_report_path=None):
        """
        Parse static analysis report JSON, extract patterns and variables.
        """
        path = static_report_path or self.static_report_path
        if not path:
            raise ValueError("No static report path specified.")
        data = read_json(path)
        entries = data.get("defects") or data.get("violations") or []
        patterns = set()
        variables = set()
        pattern_to_variables = dict()
        variable_to_patterns = dict()
        for entry in entries:
            pattern = entry.get("pattern") or entry.get("accessPattern")
            variable = entry.get("variable") or entry.get("sharedVariable")
            if isinstance(pattern, list):
                pattern = ','.join(pattern)
            if pattern is None or variable is None:
                continue
            patterns.add(pattern)
            variables.add(variable)
            pattern_to_variables.setdefault(pattern, set()).add(variable)
            variable_to_patterns.setdefault(variable, set()).add(pattern)
        return patterns, variables, pattern_to_variables, variable_to_patterns

    def decide_plan(self, static_report_path=None, type_threshold=3, variable_threshold=5):
        """
        Decide scheduling plan based on report content.
        """
        patterns, variables, pattern_to_variables, variable_to_patterns = self.parse_report(static_report_path)
        num_patterns = len(patterns)
        num_variables = len(variables)
        if num_patterns == 0 or num_variables == 0:
            return {"mode": "none", "tasks": []}
        if num_patterns <= type_threshold and num_variables <= variable_threshold:
            tasks = [{"pattern": pattern, "variables": list(pattern_to_variables[pattern])} for pattern in patterns]
            self.add_message("plan", f"Plan: {len(tasks)} tasks by pattern.")
            return {"mode": "by_pattern", "tasks": tasks}
        else:
            tasks = [{"variable": var, "patterns": list(variable_to_patterns[var])} for var in variables]
            self.add_message("plan", f"Plan: {len(tasks)} tasks by variable.")
            return {"mode": "by_variable", "tasks": tasks}
