# agent_base.py

class AgentBase:
    """
    Base class for all agents in the system.
    Provides message history management and basic interface.
    """
    def __init__(self, name):
        """
        Initialize the AgentBase class with a name.
        :param name: str, name of the agent instance
        """
        self.name = name
        self.messages = []

    def add_message(self, role, content):
        """
        Add a message to the agent's message history.
        :param role: str, the role of the message sender (e.g. 'system', 'user', 'agent')
        :param content: str, the message content
        """
        self.messages.append({"role": role, "content": content})

    def clear(self):
        """
        Clear the agent's message history.
        """
        self.messages.clear()
