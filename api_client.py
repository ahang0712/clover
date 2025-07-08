# api_client.py

# class APIClient: # Define the API client class
#     def __init__(self, headers=None): # Define the constructor method
#         self.conn = http.client.HTTPSConnection(API_HOST)
#         self.headers = headers or {
#             'Accept': 'application/json',
#             'Authorization': API_AUTH,
#             'Content-Type': 'application/json'
#         }

#     def send_messages(self, model, messages, temperature=0.0): # Define the send_messages method
#         # Create a payload with the model, temperature, and messages
#         payload = json.dumps({
#             "model": model,
#             "temperature": temperature,
#             "messages": messages
#         })
#         # Send a POST request to the API with the payload and headers
#         self.conn.request("POST", "/v1/chat/completions", payload, self.headers)
#         # Get the response from the API
#         res = self.conn.getresponse()
#         # Decode the response and load it as a JSON object
#         data = json.loads(res.read().decode("utf-8"))
#         # Get the response from the API
#         response = data['choices'][0]['message']['content']
#         # Return the response
#         return response

# api_client.py
import json
from config import API_HOST, API_AUTH, API_MODEL, MODEL_TYPE, MODEL_PATH
from openai import OpenAI
# from model_loader import LocalModel  # 导入本地模型

class APIClient:
    def __init__(self, api_key=None, base_url=None, model=None, max_tokens=8192, temperature=0.0):
        # 使用配置文件中的模型类型
        self.model_type = MODEL_TYPE  # 获取配置的模型类型（'local' 或 'online'）
        
        if self.model_type == "online":
            # 初始化 OpenAI 客户端（在线模型）
            self.client = OpenAI(
                api_key= API_AUTH,
                base_url= API_HOST
            )
            self.model = API_MODEL
        else:
            # 本地模型
            self.local_model = LocalModel(MODEL_PATH)  # 使用本地模型加载类
            self.model = "local-model"

        # 配置默认参数
        self.max_tokens = max_tokens
        self.temperature = temperature
        self.messages = []

    def add_message(self, role, content):
        """向消息列表添加消息"""
        self.messages.append({"role": role, "content": content})

    def send_messages(self, model=None, messages=None):
        """根据模型类型发送消息"""
        model = model or self.model
        messages = messages or self.messages
        
        if self.model_type == "online":
            # 在线模型推理
            response = self.client.chat.completions.create(
                model=model,
                max_tokens=self.max_tokens,
                temperature=self.temperature,
                messages=messages
            )
            return response.choices[0].message.content
        else:
            # 本地模型推理
            responses = self.local_model.generate_responses(
                [msg['content'] for msg in messages],
                max_tokens=self.max_tokens,
                temperature=self.temperature,
                num_responses=1
            )
            return responses[0]

    def clear_messages(self):
        """清空消息列表"""
        self.messages = []
