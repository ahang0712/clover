# agent_base.py
import asyncio

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
        
        # 打印日志，便于调试
        if role in ["error", "warning", "critical"]:
            print(f"[{self.name}] [{role.upper()}] {content}")
        elif role == "info":
            print(f"[{self.name}] {content}")

    def clear(self):
        """
        Clear the agent's message history.
        """
        self.messages.clear()
        
    async def process_async(self, api_client, model, system_prompt, user_prompt):
        """
        通用的异步处理方法，可被子类重写
        
        :param api_client: APIClient实例
        :param model: 使用的模型名称
        :param system_prompt: 系统提示词
        :param user_prompt: 用户提示词
        :return: 模型响应
        """
        messages = [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ]
        
        try:
            result = await api_client.send_messages(model, messages)
            self.add_message("info", f"{self.name} async processing completed")
            return result
        except Exception as e:
            self.add_message("error", f"Async processing failed: {str(e)}")
            raise
