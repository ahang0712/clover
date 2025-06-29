# agent/expert_agent.py
# This file defines the ExpertAgent class, which is a subclass of AgentBase

from agent.agent_base import AgentBase

from agent.agent_base import AgentBase

class ExpertAgent(AgentBase):
    def __init__(self, api_client, model, name="ExpertAgent"):
        super().__init__(name)
        self.api_client = api_client
        self.model = model

    def analyze(self, system_prompt, user_prompt):
        messages = [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ]
        print(user_prompt)
        result = self.api_client.send_messages(self.model, messages)
        self.add_message("expert", "Expert analysis done.")
        return result

