# clover/agent/plan_agent.py

import json
from agent.agent_base import AgentBase
from utils import read_json

class PlanAgent(AgentBase):
    """
    PlanAgent determines the optimal scheduling plan for expert/judge agents
    based on the output of a static analysis report.
    """

    def __init__(self, static_report_path, name="PlanAgent"):
        super().__init__(name)
        self.static_report_path = static_report_path

    def parse_report(self):
        """
        Parse the static analysis report (JSON) and extract patterns/variables.
        Uses utils.read_json for robust file reading.
        Returns:
            patterns: set of unique defect patterns
            variables: set of unique variable names involved in defects
            pattern_to_variables: dict {pattern: set of variables for that pattern}
            variable_to_patterns: dict {variable: set of patterns for that variable}
        """
        data = read_json(self.static_report_path)
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

    def decide_plan(self, type_threshold=3, variable_threshold=5):
        """
        Decide parallelization plan based on pattern and variable counts.
        """
        patterns, variables, pattern_to_variables, variable_to_patterns = self.parse_report()
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
