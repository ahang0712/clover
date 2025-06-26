# judge_agent.py
# This file contains the JudgeAgent class which inherits from AgentBase

from agent_base import AgentBase

class JudgeAgent(AgentBase): # Create a JudgeAgent class that inherits from AgentBase
    def __init__(self, api_client, model):
        super().__init__("JudgeAgent")
        self.api_client = api_client
        self.model = model

    def judge(self, prompt): # Add the prompt to the messages list
        self.add_message("user", prompt)
        print(prompt)
        response = self.api_client.send_messages(self.model, self.messages)
        print(response)
        self.add_message("assistant", response)
        return response
