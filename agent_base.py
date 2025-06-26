# agent_base.py

class AgentBase: # Define the AgentBase class
    def __init__(self, name): # Initialize the AgentBase class with a name
        self.name = name
        self.messages = []

    def add_message(self, role, content): # Add a message to the messages list
        self.messages.append({"role": role, "content": content})

    def clear(self): # Clear the messages list
        self.messages.clear()
