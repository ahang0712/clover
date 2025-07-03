import json
from agent.agent_base import AgentBase
from tool.runner import run_tool_mcp

class PlanAgent(AgentBase):
    """
    PlanAgent:
      - 依次调用 Extractor, Analyzer, Candidate, Callgraph 工具
      - 用 LLM 融合所有工具产物，返回统一 plan_result
      - api_client 和 model 必须提供
    """
    def __init__(self, api_client, model, name="PlanAgent"):
        super().__init__(name)
        if api_client is None or model is None:
            raise ValueError("PlanAgent 需要 api_client 和 model 参数用于 LLM 融合。")
        self.api_client = api_client
        self.model = model

    def decide_tools(self, source_file: str) -> dict:
        """
        工具链分析流程（全部为本地工具调用）：
        1. Extractor      - 提取关键代码片段
        2. Analyzer       - 生成 analysis_summary
        3. Candidate      - 生成候选缺陷报告
        4. Callgraph      - 生成函数调用信息

        5. LLM 融合四路工具产物，统一生成 plan_result 并返回
        """
        # 1. Extractor
        extract_out = source_file.replace('.c', '-snippets.json')
        self.add_message("plan", f"Running Extractor on {source_file}")
        run_tool_mcp(self._resolve_tool_path('extractor'), [source_file, extract_out])
        with open(extract_out, 'r') as f:
            extracted_code = json.load(f)

        # 2. Analyzer
        analysis_out = source_file.replace('.c', '-analysis.json')
        self.add_message("plan", f"Running Analyzer on {source_file}")
        run_tool_mcp(self._resolve_tool_path('analyzer'), [source_file, analysis_out])
        with open(analysis_out, 'r') as f:
            analysis_summary = json.load(f)

        # 3. Candidate
        cand_out = source_file.replace('.c', '-candidates.json')
        self.add_message("plan", f"Running Candidate on {source_file}")
        run_tool_mcp(self._resolve_tool_path('candidate'), [source_file, cand_out])
        with open(cand_out, 'r') as f:
            candidates = json.load(f)

        # 4. Callgraph
        callgraph_out = source_file.replace('.c', '-calls.json')
        self.add_message("plan", f"Running Callgraph on {source_file}")
        run_tool_mcp(self._resolve_tool_path('callgraph'), [source_file, callgraph_out])
        with open(callgraph_out, 'r') as f:
            callgraph = json.load(f)

        # 5. LLM 融合（必须，若失败则报错）
        if not self.api_client or not self.model:
            raise RuntimeError("PlanAgent requires api_client and model for LLM fusion.")
        prompt = self._build_llm_prompt(analysis_summary, candidates, callgraph, extracted_code)
        self.add_message("plan_prompt", prompt)
        llm_resp = self.api_client.send_messages(
            self.model,
            [
                {"role": "system", "content": "You are the plan agent."},
                {"role": "user", "content": prompt}
            ]
        )
        try:
            llm_data = json.loads(llm_resp)
            analysis_summary.update(llm_data.get('analysis_summary', {}))
            candidates = llm_data.get('candidates', candidates)
            callgraph = llm_data.get('callgraph', callgraph)
            extracted_code = llm_data.get('extracted_code', extracted_code)
        except json.JSONDecodeError:
            self.add_message("plan_warning", "LLM 返回非 JSON，跳过融合。")

        plan_result = {
            "analysis_summary": analysis_summary,
            "candidates": candidates,
            "callgraph": callgraph,
            "extracted_code": extracted_code,
        }
        return plan_result

    def _resolve_tool_path(self, tool_name: str) -> str:
        tool_map = {
            "analyzer": "./tool/Analyzer",
            "candidate": "./tool/Candidate",
            "callgraph": "./tool/Callgraph",
            "extractor": "./tool/Extractor",
        }
        return tool_map[tool_name]

    def _build_llm_prompt(self, analysis, candidates, callgraph, snippets) -> str:
        # 构造给 LLM 的融合 prompt
        return (
            "请基于以下工具产物融合最终的 analysis_summary、candidates、callgraph 和 extracted_code，并输出 JSON 格式：\n"
            f"analysis_summary: {json.dumps(analysis, ensure_ascii=False, indent=2)}\n"
            f"candidates: {json.dumps(candidates, ensure_ascii=False, indent=2)}\n"
            f"callgraph: {json.dumps(callgraph, ensure_ascii=False, indent=2)}\n"
            f"extracted_code: {json.dumps(snippets, ensure_ascii=False, indent=2)}"
        )
