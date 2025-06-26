# expert_agent.py
# This file defines the ExpertAgent class, which is a subclass of AgentBase

from agent_base import AgentBase

class ExpertAgent(AgentBase): # ExpertAgent is a subclass of AgentBase
    def __init__(self, api_client, model): # ExpertAgent takes in an api_client and a model
        super().__init__("ExpertAgent")
        self.api_client = api_client
        self.model = model

    def analyze(self, system_prompt, prompt): # analyze takes in a system prompt and a prompt
        self.add_message("system", system_prompt)
        self.add_message("user", prompt)
        print(prompt)
        response = self.api_client.send_messages(self.model, self.messages)
        print(response)
        self.add_message("assistant", response)
        return response
