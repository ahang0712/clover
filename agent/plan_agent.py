import json
from agent.agent_base import AgentBase
from utils import read_json, load_prompt
from tool.runner import run_tool_mcp

class PlanAgent(AgentBase):
    """
    PlanAgent:
      - 根据目标和代码结构自主决策工具链调用顺序与参数
      - 支持 MCP 协议工具统一调度
      - 可结合规则、LLM、或自定义 prompt 实现自主化决策
    """

    def __init__(self, llm_decision=False, name="PlanAgent"):
        super().__init__(name)
        self.llm_decision = llm_decision  # 是否用LLM决策，否则规则决策

    def decide_tools(self, code_path, task_goal, max_code_length=500):
        """
        根据规则或LLM判断调用哪些工具及顺序
        """
        # 1. 读取代码基本信息
        code_excerpt = self._get_code_excerpt(code_path, max_code_length=60)
        code_length = self._get_code_length(code_path)
        tool_calls = []

        # ----------- 规则决策示例 -----------
        # 1. Extractor: 代码过长就调用
        input_code = code_path
        if code_length > max_code_length:
            short_code = code_path.replace(".c", "_short.c")
            tool_calls.append({
                "tool": "extractor",
                "input": input_code,
                "output": short_code,
                "reason": "Source code exceeds length threshold, need to compress."
            })
            input_code = short_code
        # 2. Analyzer: 必调
        analyzer_json = input_code.replace(".c", "-accesses.json")
        tool_calls.append({
            "tool": "analyzer",
            "input": input_code,
            "output": analyzer_json,
            "reason": "Extract all read/write operations on variables."
        })
        # 3. Callgraph: 如有多个函数或出现调用，则调用
        if self._need_callgraph(code_path):
            callgraph_file = input_code.replace(".c", "-calls.dot")
            tool_calls.append({
                "tool": "callgraph",
                "input": input_code,
                "output": callgraph_file,
                "reason": "Multiple functions or complex call relationships detected."
            })
        # 可选：如用LLM决策，则调用LLM
        if self.llm_decision:
            plan_prompt = load_prompt(
                "prompt/plan_agent_decision.md",
                code_excerpt=code_excerpt,
                task_goal=task_goal
            )
            # send to LLM, parse output为tool_calls
            # 伪代码: tool_calls = your_llm_api.ask(plan_prompt)
            # 如需实现LLM决策，请替换以上规则部分
        return tool_calls

    def run_tools(self, tool_calls):
        """
        依次调用所有列出的工具，每步MCP协议封装
        """
        results = []
        for tool_call in tool_calls:
            tool = tool_call["tool"]
            input_file = tool_call["input"]
            output_file = tool_call["output"]
            reason = tool_call.get("reason", "")
            tool_path = self._resolve_tool_path(tool)
            self.add_message("plan", f"Calling tool: {tool} for {reason}")
            result = run_tool_mcp(tool_path, [input_file, output_file])
            self.add_message("tool_result", {
                "tool": tool, "exit_code": result.get("exit_code"),
                "stdout": result.get("stdout"), "stderr": result.get("stderr")
            })
            results.append({
                "tool": tool,
                "input": input_file,
                "output": output_file,
                "exit_code": result.get("exit_code"),
                "stdout": result.get("stdout"),
                "stderr": result.get("stderr")
            })
        return results

    # ----------- 辅助函数 -----------
    def _get_code_excerpt(self, code_path, max_code_length=60):
        """截取部分代码用于LLM决策或展示"""
        with open(code_path, 'r') as f:
            lines = f.readlines()
        excerpt = ''.join(lines[:max_code_length])
        if len(lines) > max_code_length:
            excerpt += "\n// ... (truncated)"
        return excerpt

    def _get_code_length(self, code_path):
        """代码总行数"""
        with open(code_path, 'r') as f:
            return len(f.readlines())

    def _need_callgraph(self, code_path):
        """
        粗略判断：如有2个及以上函数则认为需要callgraph
        可结合Analyzer产物或直接用AST更严谨
        """
        with open(code_path, 'r') as f:
            text = f.read()
        return text.count("void ") + text.count("int ") + text.count("float ") > 2  # 粗糙示例

    def _resolve_tool_path(self, tool):
        """
        根据工具名找到实际可执行文件路径，可根据项目实际调整
        """
        tool_map = {
            "extractor": "./tool/Extractor",
            "analyzer": "./tool/Analyzer",
            "callgraph": "./tool/Callgraph",
        }
        return tool_map[tool]