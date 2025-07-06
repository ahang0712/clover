import json
from typing import Any, Dict, Optional
from agent.agent_base import AgentBase
from tool.runner import run_tool_mcp
from utils import load_prompt

class PlanAgent(AgentBase):
    """
    PlanAgent:
      - First asks LLM (with a well-designed plan prompt) whether it can produce structured code facts directly.
      - If LLM is confident, use its output directly.
      - Otherwise, sequentially invokes static tools (Code_Extractor, Read_Write_Analyzer, Defect_Highlight, Control_flow_Analyzer)
        and asks LLM to fuse tool outputs into a unified facts summary.
      - Requires api_client and model.
    """

    TOOL_CONFIG = [
        ("Code_Extractor", "-snippets.json", "Code_Extractor"),
        ("Read_Write_Analyzer", "-analysis.json", "Read_Write_Analyzer"),
        ("Defect_Highlight", "-candidates.json", "Defect_Highlight"),
        ("Control_flow_Analyzer", "-calls.json", "Control_flow_Analyzer"),
    ]

    def __init__(self, api_client, model, name: str = "PlanAgent"):
        super().__init__(name)
        if not api_client or not model:
            raise ValueError("PlanAgent requires api_client and model.")
        self.api_client = api_client
        self.model = model

    def decide_tools(self, code: str, known_patterns: Optional[list] = None) -> Dict[str, Any]:
        """
        1. Ask LLM (via plan.md prompt) if it can confidently output facts directly.
        2. If yes, use LLM output.
        3. If not (LLM says tool invocation is needed), run static tools, then ask LLM to fuse their outputs.
        Returns plan_result: {"facts": {...}, "used_tools": [...]}.
        """
        # === 1. Compose the plan prompt ===
        plan_prompt_template = load_prompt("prompt/plan/plan.md")
        patterns_str = ", ".join(known_patterns) if known_patterns else ""
        plan_prompt = plan_prompt_template.format(
            code=code if len(code) < 2000 else code[:2000] + "\n... [truncated]",  # 防止太长
            known_patterns=patterns_str
        )
        self.add_message("plan_prompt", plan_prompt)

        # === 2. Ask LLM to decide and generate facts directly ===
        resp = self.api_client.send_messages(
            self.model,
            [
                {"role": "system", "content": "You are the Plan Agent."},
                {"role": "user", "content": plan_prompt}
            ]
        )

        # Try to parse facts from LLM response
        try:
            llm_json_start = resp.find("{")
            llm_json = resp[llm_json_start:] if llm_json_start >= 0 else resp
            llm_result = json.loads(llm_json)
            if "facts" in llm_result and isinstance(llm_result["facts"], dict):
                self.add_message("plan_info", "LLM generated facts directly, no tool invocation needed.")
                return {"facts": llm_result["facts"], "used_tools": []}
        except Exception as e:
            self.add_message("plan_warning", f"LLM direct facts parse failed: {str(e)}. Proceeding to static tools.")

        # === 3. LLM did not/cannot produce facts: run toolchain ===
        outputs = {}
        for tool_name, suffix, output_key in self.TOOL_CONFIG:
            out_path = "input.c".replace('.c', suffix)  # 你可改为你的代码路径逻辑
            try:
                self.add_message("plan", f"Running {tool_name} on code")
                run_tool_mcp(self._resolve_tool_path(tool_name), [code, out_path])
                with open(out_path, 'r') as f:
                    outputs[output_key] = json.load(f)
            except Exception as e:
                self.add_message("plan_error", f"{tool_name} failed: {str(e)}")
                outputs[output_key] = {}

        # === 4. Fuse tool outputs using LLM ===
        fusion_prompt = self._build_llm_fusion_prompt(outputs)
        self.add_message("plan_fusion_prompt", fusion_prompt)
        resp2 = self.api_client.send_messages(
            self.model,
            [
                {"role": "system", "content": "You are the Plan Agent."},
                {"role": "user", "content": fusion_prompt}
            ]
        )
        try:
            llm_json_start = resp2.find("{")
            llm_json = resp2[llm_json_start:] if llm_json_start >= 0 else resp2
            facts = json.loads(llm_json).get("facts", {})
        except Exception as e:
            self.add_message("plan_error", f"LLM fusion facts parse failed: {str(e)}. Returning raw tool outputs.")
            facts = outputs  # fallback

        return {"facts": facts, "used_tools": [name for name, _, _ in self.TOOL_CONFIG]}

    def _resolve_tool_path(self, tool_name: str) -> str:
        tool_map = {
            "Read_Write_Analyzer": "./tool/Read_Write_Analyzer",
            "Defect_Highlight": "./tool/Defect_Highlight",
            "Control_flow_Analyzer": "./tool/Control_flow_Analyzer",
            "Code_Extractor": "./tool/Code_Extractor",
        }
        if tool_name not in tool_map:
            raise ValueError(f"Unknown tool_name: {tool_name}")
        return tool_map[tool_name]

    def _build_llm_fusion_prompt(self, outputs: dict) -> str:
        """
        Prompt for LLM to fuse static tool outputs into a single facts summary.
        """
        return (
            "Given the following outputs from static code analysis tools, please fuse them into a single structured JSON object named 'facts', "
            "containing only information needed for atomicity violation reasoning (omit unnecessary or redundant fields):\n\n"
            f"Read_Write_Analyzer:\n{json.dumps(outputs.get('Read_Write_Analyzer', {}), ensure_ascii=False, indent=2)}\n"
            f"Defect_Highlight:\n{json.dumps(outputs.get('Defect_Highlight', {}), ensure_ascii=False, indent=2)}\n"
            f"Control_flow_Analyzer:\n{json.dumps(outputs.get('Control_flow_Analyzer', {}), ensure_ascii=False, indent=2)}\n"
            f"Code_Extractor:\n{json.dumps(outputs.get('Code_Extractor', {}), ensure_ascii=False, indent=2)}"
        )
