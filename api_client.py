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
import time
import asyncio
import random
from config import API_HOST, API_MODEL, MODEL_TYPE, MODEL_PATH, API_KEYS
from openai import OpenAI
from model_loader import LocalModel  # 导入本地模型

class APIClient:
    def __init__(self, api_key=None, base_url=None, model=None, max_tokens=512, temperature=0.0):
        # 使用配置文件中的模型类型
        self.model_type = MODEL_TYPE  # 获取配置的模型类型（'local' 或 'online'）
        
        # API密钥轮换设置
        self.api_keys = API_KEYS
        self.current_key_index = 0
        
        if self.model_type == "online":
            # 初始化 OpenAI 客户端（在线模型）
            self.client = OpenAI(
                api_key=self.get_next_api_key(),
                base_url=API_HOST
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

    def get_next_api_key(self):
        """获取下一个API密钥（简单轮换）"""
        if not self.api_keys:
            return None
            
        # 获取当前密钥
        key = self.api_keys[self.current_key_index]
        
        # 更新索引，实现轮换
        self.current_key_index = (self.current_key_index + 1) % len(self.api_keys)
        
        print(f"[APIClient] 使用API密钥: {key[:5]}... (索引: {self.current_key_index})")
        return key

    def add_message(self, role, content):
        """向消息列表添加消息"""
        self.messages.append({"role": role, "content": content})

    async def send_messages(self, model=None, messages=None):
        """根据模型类型发送消息"""
        model = model or self.model
        messages = messages or self.messages
        
        if self.model_type == "online":
            # 在线模型推理
            return await self._send_online_messages(model, messages)
        else:
            # 本地模型推理 - 提取system和user内容
            return await self._send_local_messages(messages)
    
    async def _send_online_messages(self, model, messages):
        """发送在线API请求，支持密钥轮换和重试"""
        # 尝试所有API密钥
        errors = []
        
        # 从当前索引开始，尝试所有密钥
        for _ in range(len(self.api_keys)):
            api_key = self.get_next_api_key()
            self.client.api_key = api_key
            
            try:
                response = self.client.chat.completions.create(
                    model=model,
                    max_tokens=self.max_tokens,
                    temperature=self.temperature,
                    messages=messages
                )
                return response.choices[0].message.content
            except Exception as e:
                error_msg = f"API密钥 {api_key[:5]}... 请求失败: {str(e)}"
                print(f"[APIClient Error] {error_msg}")
                errors.append(error_msg)
                
                # 短暂等待后尝试下一个密钥
                await asyncio.sleep(0.5)
        
        # 如果所有密钥都失败，返回错误信息
        error_summary = "\n".join(errors)
        print(f"[APIClient Critical Error] 所有API密钥都失败:\n{error_summary}")
        return f"API请求失败，所有密钥都无法使用。错误信息:\n{error_summary}"
            
    async def _send_local_messages(self, messages):
        """发送本地模型请求"""
        # 检查是否是批量消息
        if isinstance(messages, list) and len(messages) > 0 and isinstance(messages[0], list):
            # 批量处理多个消息组
            print(f"[APIClient] 检测到批量消息，数量: {len(messages)}")
            system_contents = []
            user_contents = []
            
            # 从每组消息中提取system和user内容
            for msg_group in messages:
                sys_content = None
                usr_content = None
                
                for msg in msg_group:
                    if msg["role"] == "system":
                        sys_content = msg["content"]
                    elif msg["role"] == "user":
                        usr_content = msg["content"]
                
                # 如果没有找到user内容，使用最后一条消息作为user内容
                if not usr_content and msg_group:
                    usr_content = msg_group[-1]["content"]
                
                system_contents.append(sys_content)
                user_contents.append(usr_content)
            
            try:
                # 使用批量处理方法
                responses = await self.local_model.generate_batch_responses(
                    prompts=user_contents,
                    system_prompts=system_contents,
                    max_tokens=self.max_tokens,
                    temperature=self.temperature
                )
                return responses
            except Exception as e:
                print(f"[APIClient Error] 本地模型批量推理失败: {str(e)}")
                # 批量处理失败时，不尝试在线API（复杂度过高），直接抛出异常
                raise
        
        # 单个消息组处理（原有逻辑）
        system_content = None
        user_content = None
        
        for msg in messages:
            if msg["role"] == "system":
                system_content = msg["content"]
            elif msg["role"] == "user":
                user_content = msg["content"]
        
        # 如果没有找到user内容，使用最后一条消息作为user内容
        if not user_content and messages:
            user_content = messages[-1]["content"]
        
        try:
            # 使用修改后的generate_responses方法
            response = await self.local_model.generate_responses(
                prompt=user_content,
                system_prompt=system_content,
                max_tokens=self.max_tokens,
                temperature=self.temperature
            )
            return response
        except Exception as e:
            print(f"[APIClient Error] 本地模型推理失败: {str(e)}")
            
            # 如果本地模型失败且有在线API密钥，尝试使用在线API
            if self.api_keys and len(self.api_keys) > 0:
                print("[APIClient Info] 本地模型失败，尝试使用在线API作为备用")
                try:
                    # 临时切换到在线模式
                    original_model_type = self.model_type
                    self.model_type = "online"
                    
                    # 使用在线API
                    result = await self._send_online_messages(API_MODEL, messages)
                    
                    # 恢复原始模式
                    self.model_type = original_model_type
                    
                    return result
                except Exception as online_error:
                    print(f"[APIClient Error] 备用在线API也失败: {str(online_error)}")
                    # 恢复原始模式
                    self.model_type = original_model_type
            
            # 如果所有尝试都失败，抛出原始异常
            raise

    def clear_messages(self):
        """清空消息列表"""
        self.messages = []
        
    def print_api_keys_status(self):
        """打印API密钥状态"""
        print("\n=== API密钥状态 ===")
        print(f"总密钥数量: {len(self.api_keys)}")
        print(f"当前使用索引: {self.current_key_index}")
        
        for i, key in enumerate(self.api_keys):
            status = "当前使用中" if i == self.current_key_index else "待用"
            print(f"密钥 {i}: {key[:5]}... - {status}")
            
        print("==================\n")
