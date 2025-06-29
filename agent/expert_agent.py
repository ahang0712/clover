# expert_agent.py
# This file defines the ExpertAgent class, which is a subclass of AgentBase

from clover.agent.agent_base import AgentBase
from clover.utils import write_file

class ExpertAgent(AgentBase):
    """
    ExpertAgent is responsible for in-depth defect analysis on a given pattern or variable.
    Demonstrates how to use utils.write_file for result output.
    """
    def __init__(self, task_info, name="ExpertAgent"):
        super().__init__(name)
        self.task_info = task_info

    def run(self):
        """
        Main logic for expert agent.
        Here, just creates a mock result and writes it to a file using write_file.
        """
        self.add_message("system", f"Running expert analysis on {self.task_info}")
        # Replace with real logic (LLM call, static analysis, etc.)
        result = f"ExpertAgent({self.task_info}) result"
        # Save to file (example path, should be adapted)
        result_path = f"results/expert_{str(self.task_info).replace(' ', '_')}.txt"
        write_file(result_path, result)
        self.add_message("result", f"Result saved to {result_path}")
        return result

