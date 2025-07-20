import json
from typing import Any, Dict, Optional, List
from agent.agent_base import AgentBase
from tool.runner import run_tool_mcp
from utils import load_prompt

class PlanAgent(AgentBase):
    """
    PlanAgent:
      - 按照固定顺序调用必要的静态分析工具
      - 使用MCP方式调用工具
      - 融合工具输出生成统一的代码分析结果
      - 根据分析结果规划后续expert-judge工作
    """

    # === 固定原子性违规模式 ===
    known_patterns = [
        "<Read, Write, Write>",
        "<Read, Write, Read>",
        "<Write, Write, Read>",
        "<Write, Read, Write>"
    ]

    # 工具配置和调用顺序
    TOOL_CONFIG = [
        # (工具名, 输出文件后缀, 输出字典key, 是否必须)
        ("Code_Extractor", "-snippets.json", "Code_Extractor", True),
        ("Read_Write_Analyzer", "-analysis.json", "Read_Write_Analyzer", True), 
        ("Control_flow_Analyzer", "-calls.json", "Control_flow_Analyzer", True)
    ]

    # 缺陷变量和缺陷数量阈值
    DEFECT_VAR_THRESHOLD = 2  # 潜在缺陷变量数量阈值
    DEFECT_COUNT_THRESHOLD = 10  # 潜在缺陷数量阈值

    def __init__(self, api_client, model, name: str = "PlanAgent"):
        super().__init__(name)
        if not api_client or not model:
            raise ValueError("PlanAgent requires api_client and model.")
        self.api_client = api_client
        self.model = model

    async def decide_tools(self, code: str) -> Dict[str, Any]:
        """
        按顺序调用必要的静态分析工具,生成代码分析结果
        Returns plan_result: {"facts": {...}, "used_tools": [...], "expert_judge_plan": [...]}
        """
        # === 1. 运行工具链 ===
        outputs = {}
        used_tools = []
        
        for tool_name, suffix, output_key, required in self.TOOL_CONFIG:
            out_path = "input.c".replace('.c', suffix)
            try:
                self.add_message("plan", f"Running {tool_name} on code")
                # 使用MCP方式调用工具
                run_tool_mcp(self._resolve_tool_path(tool_name), [code, out_path])
                with open(out_path, 'r') as f:
                    outputs[output_key] = json.load(f)
                used_tools.append(tool_name)
            except Exception as e:
                self.add_message("plan_error", f"{tool_name} failed: {str(e)}")
                if required:
                    raise RuntimeError(f"Required tool {tool_name} failed")
                outputs[output_key] = {}

        # === 2. 融合工具输出 ===
        fusion_prompt = self._build_llm_fusion_prompt(outputs)
        self.add_message("plan_fusion_prompt", fusion_prompt)
        
        # 使用基类的通用异步处理方法
        system_prompt = "You are the Plan Agent."
        resp = await self.process_async(self.api_client, self.model, system_prompt, fusion_prompt)

        try:
            llm_json_start = resp.find("{")
            llm_json = resp[llm_json_start:] if llm_json_start >= 0 else resp
            facts = json.loads(llm_json).get("facts", {})
        except Exception as e:
            self.add_message("plan_error", f"LLM fusion facts parse failed: {str(e)}. Returning raw tool outputs.")
            facts = outputs  # fallback

        # === 3. 规划后续expert-judge工作 ===
        expert_judge_plan = self._plan_expert_judges(facts, outputs.get("Read_Write_Analyzer", {}))
        
        return {
            "facts": facts, 
            "used_tools": used_tools,
            "expert_judge_plan": expert_judge_plan
        }

    def _resolve_tool_path(self, tool_name: str) -> str:
        """解析工具路径"""
        tool_map = {
            "Read_Write_Analyzer": "./tool/Read_Write_Analyzer",
            "Control_flow_Analyzer": "./tool/Control_flow_Analyzer",
            "Code_Extractor": "./tool/Code_Extractor"
        }
        if tool_name not in tool_map:
            raise ValueError(f"Unknown tool_name: {tool_name}")
        return tool_map[tool_name]

    def _build_llm_fusion_prompt(self, outputs: dict) -> str:
        """构建融合工具输出的提示词"""
        prompt = (
            "Given the following outputs from static code analysis tools, please fuse them into a single structured JSON object named 'facts', "
            "containing only information needed for atomicity violation reasoning (omit unnecessary or redundant fields):\n\n"
        )
        
        # 按工具配置顺序添加输出
        for _, _, output_key, _ in self.TOOL_CONFIG:
            if output_key in outputs:
                prompt += f"{output_key}:\n{json.dumps(outputs[output_key], ensure_ascii=False, indent=2)}\n"
        
        return prompt
        
    def _plan_expert_judges(self, facts: Dict[str, Any], rw_analysis: Dict[str, Any]) -> List[Dict[str, Any]]:
        """
        根据Read_Write_Analyzer结果规划后续expert-judge工作
        
        规则:
        1. 当潜在缺陷变量较少，缺陷数量较少时，按照潜在缺陷模式进行安排
        2. 当潜在缺陷变量较多，缺陷数量较多时，除了按照缺陷模式安排外，还需针对某些关键变量单独安排expert-judge
        
        返回expert-judge计划列表，每个元素包含:
        - type: "pattern" 或 "variable"
        - target: 缺陷模式或变量名
        - priority: 优先级（1-5，5最高）
        - reason: 安排原因
        """
        expert_judge_plan = []
        
        # 提取潜在缺陷变量和缺陷数量
        potential_defect_vars = set()
        potential_defect_count = 0
        
        # 从Read_Write_Analyzer结果中提取潜在缺陷变量和数量
        if "shared_variables" in rw_analysis:
            for var_info in rw_analysis.get("shared_variables", []):
                var_name = var_info.get("name")
                if var_name:
                    potential_defect_vars.add(var_name)
                    # 计算该变量的访问次数作为潜在缺陷数量
                    accesses = var_info.get("accesses", [])
                    potential_defect_count += len(accesses)
        
        # 也从facts中提取
        if "global_variables_to_detect" in facts:
            for var_name in facts.get("global_variables_to_detect", []):
                potential_defect_vars.add(var_name)
        
        if "variable_accesses" in facts:
            potential_defect_count = max(potential_defect_count, len(facts.get("variable_accesses", [])))
        
        self.add_message("plan_info", f"Found {len(potential_defect_vars)} potential defect variables and {potential_defect_count} potential defects")
        
        # 1. 首先按照缺陷模式进行安排
        for pattern in self.known_patterns:
            expert_judge_plan.append({
                "type": "pattern",
                "target": pattern,
                "priority": 5,  # 模式检查优先级最高
                "reason": f"Check for atomicity violation pattern {pattern}"
            })
        
        # 2. 当潜在缺陷变量较多或缺陷数量较多时，针对关键变量单独安排expert-judge
        if len(potential_defect_vars) > self.DEFECT_VAR_THRESHOLD or potential_defect_count > self.DEFECT_COUNT_THRESHOLD:
            # 对变量进行排序，找出最关键的变量
            var_importance = {}
            
            # 从facts中计算变量重要性（基于访问次数）
            for access in facts.get("variable_accesses", []):
                var_name = access.get("variable")
                if var_name:
                    var_importance[var_name] = var_importance.get(var_name, 0) + 1
            
            # 按重要性排序并选取前N个变量
            sorted_vars = sorted(var_importance.items(), key=lambda x: x[1], reverse=True)
            top_vars = sorted_vars[:min(5, len(sorted_vars))]  # 最多选5个最重要的变量
            
            # 为每个关键变量安排expert-judge
            for var_name, importance in top_vars:
                expert_judge_plan.append({
                    "type": "variable",
                    "target": var_name,
                    "priority": min(4, importance // 2),  # 根据重要性设置优先级，但不超过4
                    "reason": f"High-frequency variable with {importance} accesses"
                })
        
        return expert_judge_plan
