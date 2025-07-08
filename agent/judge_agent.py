# agent/judge_agent.py
# This file contains the JudgeAgent class which inherits from AgentBase

from agent.agent_base import AgentBase

class JudgeAgent(AgentBase):
    def __init__(self, api_client, model, name="JudgeAgent"):
        super().__init__(name)
        self.api_client = api_client
        self.model = model

    def judge(self, judge_prompt):
        messages = [
            {"role": "system", "content": "You are the judge agent."},
            {"role": "user", "content": judge_prompt}
        ]
        # print(judge_prompt)
        result = self.api_client.send_messages(self.model, messages)
        self.add_message("judge", "Judgement completed.")
        return result
