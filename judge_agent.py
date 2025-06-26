# judge_agent.py

from agent_base import AgentBase

class JudgeAgent(AgentBase): # Create a JudgeAgent class that inherits from AgentBase
    def __init__(self, api_client, model):
        super().__init__("JudgeAgent")
        self.api_client = api_client
        self.model = model

    def judge(self, prompt): # Add the prompt to the messages list
        self.add_message("user", prompt)
        response = self.api_client.send_messages(self.model, self.messages)
        self.add_message("assistant", response)
        return response
