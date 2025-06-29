# judge_agent.py
# This file contains the JudgeAgent class which inherits from AgentBase

from clover.agent.agent_base import AgentBase
from clover.utils import write_file

class JudgeAgent(AgentBase):
    """
    JudgeAgent is responsible for evaluating the expert agent's analysis.
    Demonstrates using utils.write_file to save judgement.
    """
    def __init__(self, task_info, name="JudgeAgent"):
        super().__init__(name)
        self.task_info = task_info

    def run(self):
        """
        Main logic for judge agent.
        Here, just creates a mock judgement and writes it to a file using write_file.
        """
        self.add_message("system", f"Judging result for {self.task_info}")
        # Replace with real checking/LLM logic
        result = f"JudgeAgent({self.task_info}) result"
        result_path = f"results/judge_{str(self.task_info).replace(' ', '_')}.txt"
        write_file(result_path, result)
        self.add_message("judgement", f"Judgement saved to {result_path}")
        return result

