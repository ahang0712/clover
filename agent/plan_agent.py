import json
from typing import Any, Dict
from agent.agent_base import AgentBase
from tool.runner import run_tool_mcp

class PlanAgent(AgentBase):
    """
    PlanAgent:
      - Sequentially invokes Code_Extractor, Read_Write_Analyzer, Defect_Highlight, and Control_flow_Analyzer tools.
      - Uses LLM to fuse all tool outputs into a unified plan_result.
      - Requires api_client and model for LLM integration.
    """

    # Toolchain: (tool_name, output file suffix, output key)
    TOOL_CONFIG = [
        ("Code_Extractor", "-snippets.json", "Code_Extractor"),                      # 1. Code Extractor - Extracts key code snippets
        ("Read_Write_Analyzer", "-analysis.json", "Read_Write_Analyzer"),            # 2. Read/Write Analyzer - Analyzes read/write operations of code snippets
        ("Defect_Highlight", "-candidates.json", "Defect_Highlight"),                # 3. Defect Highlight - Generates defect candidates
        ("Control_flow_Analyzer", "-calls.json", "Control_flow_Analyzer"),           # 4. Control-flow Analyzer - Generates function call information
    ]

    def __init__(self, api_client, model, name: str = "PlanAgent"):
        """
        Initialize PlanAgent with the specified api_client and model for LLM fusion.
        """
        super().__init__(name)
        if not api_client or not model:
            raise ValueError("PlanAgent requires api_client and model for LLM fusion.")
        self.api_client = api_client
        self.model = model

    def decide_tools(self, source_file: str) -> Dict[str, Any]:
        """
        Executes the toolchain and invokes LLM to fuse tool outputs.

        Toolchain steps:
            1. Code Extractor - Extracts key code snippets
            2. Read/Write Analyzer - Analyzes read/write operations of code snippets
            3. Defect Highlight - Generates defect candidates
            4. Control-flow Analyzer - Generates function call information

        Returns:
            plan_result: Unified output containing all tool results with keys:
                - Read_Write_Analyzer
                - Defect_Highlight
                - Control_flow_Analyzer
                - Code_Extractor
        """
        outputs = {}
        for tool_name, suffix, output_key in self.TOOL_CONFIG:
            out_path = source_file.replace('.c', suffix)
            try:
                self.add_message("plan", f"Running {tool_name} on {source_file}")
                run_tool_mcp(self._resolve_tool_path(tool_name), [source_file, out_path])
                with open(out_path, 'r') as f:
                    outputs[output_key] = json.load(f)
            except Exception as e:
                self.add_message("plan_error", f"{tool_name} failed: {str(e)}")
                outputs[output_key] = {}

        # LLM fusion
        prompt = self._build_llm_prompt(
            read_write_analyzer=outputs.get("Read_Write_Analyzer", {}),
            defect_highlight=outputs.get("Defect_Highlight", {}),
            control_flow_analyzer=outputs.get("Control_flow_Analyzer", {}),
            code_extractor=outputs.get("Code_Extractor", {}),
        )
        self.add_message("plan_prompt", prompt)
        try:
            llm_resp = self.api_client.send_messages(
                self.model,
                [
                    {"role": "system", "content": "You are the plan agent."},
                    {"role": "user", "content": prompt}
                ]
            )
            llm_data = json.loads(llm_resp)
            # Use LLM outputs with fallback to local tool outputs
            plan_result = {
                "Read_Write_Analyzer": llm_data.get('Read_Write_Analyzer', outputs.get("Read_Write_Analyzer", {})),
                "Defect_Highlight": llm_data.get('Defect_Highlight', outputs.get("Defect_Highlight", {})),
                "Control_flow_Analyzer": llm_data.get('Control_flow_Analyzer', outputs.get("Control_flow_Analyzer", {})),
                "Code_Extractor": llm_data.get('Code_Extractor', outputs.get("Code_Extractor", {})),
            }
        except Exception as e:
            self.add_message("plan_warning", f"LLM fusion failed: {str(e)}; returning toolchain outputs directly.")
            plan_result = {
                "Read_Write_Analyzer": outputs.get("Read_Write_Analyzer", {}),
                "Defect_Highlight": outputs.get("Defect_Highlight", {}),
                "Control_flow_Analyzer": outputs.get("Control_flow_Analyzer", {}),
                "Code_Extractor": outputs.get("Code_Extractor", {}),
            }
        return plan_result

    def _resolve_tool_path(self, tool_name: str) -> str:
        """
        Returns the executable path for the specified tool.
        """
        tool_map = {
            "Read_Write_Analyzer": "./tool/Read_Write_Analyzer",
            "Defect_Highlight": "./tool/Defect_Highlight",
            "Control_flow_Analyzer": "./tool/Control_flow_Analyzer",
            "Code_Extractor": "./tool/Code_Extractor",
        }
        if tool_name not in tool_map:
            raise ValueError(f"Unknown tool_name: {tool_name}")
        return tool_map[tool_name]

    def _build_llm_prompt(self, read_write_analyzer, defect_highlight, control_flow_analyzer, code_extractor) -> str:
        """
        Builds the fusion prompt for LLM based on tool outputs.
        """
        return (
            "Please fuse the following tool outputs into final Read_Write_Analyzer, Defect_Highlight, Control_flow_Analyzer, and Code_Extractor, and output as JSON:\n"
            f"Read_Write_Analyzer: {json.dumps(read_write_analyzer, ensure_ascii=False, indent=2)}\n"
            f"Defect_Highlight: {json.dumps(defect_highlight, ensure_ascii=False, indent=2)}\n"
            f"Control_flow_Analyzer: {json.dumps(control_flow_analyzer, ensure_ascii=False, indent=2)}\n"
            f"Code_Extractor: {json.dumps(code_extractor, ensure_ascii=False, indent=2)}"
        )
