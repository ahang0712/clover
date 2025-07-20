import os
# from vllm.config import KVTransferConfig
from vllm import AsyncLLMEngine, SamplingParams
from vllm.engine.arg_utils import AsyncEngineArgs
from transformers import AutoTokenizer
import asyncio
import time
import uuid

class LocalModel:
    def __init__(self, model_path, pipeline_parallel_size=8):
        """初始化本地模型（适配vLLM 0.8.5的单提示词输入）"""
        # LMCache环境变量
        # os.environ["LMCACHE_CHUNK_SIZE"] = "256"
        # os.environ["LMCACHE_LOCAL_CPU"] = "True"
        # os.environ["LMCACHE_MAX_LOCAL_CPU_SIZE"] = "32.0"

        # LMCache集成
        # kv_transfer_config = KVTransferConfig(
        #     kv_connector="LMCacheConnectorV1",
        #     kv_role="kv_both",
        # )
        print(f"[ModelLoader] 开始初始化模型，路径: {model_path}")
        print(f"[ModelLoader] 并行配置: 流水线={pipeline_parallel_size}")
        
        init_start_time = time.time()
        
        # 引擎参数配置
        self.engine_args = AsyncEngineArgs(
            model=model_path,
            dtype="half",
            pipeline_parallel_size=pipeline_parallel_size,
            trust_remote_code=True,
            gpu_memory_utilization=0.9,
            max_num_seqs=100,  # 批量处理
            max_num_batched_tokens=32768,
            enable_prefix_caching=True,  # 按需启用前缀缓存
            block_size=32,  # 优化KV缓存块大小
            swap_space=8,  # 配置交换空间大小
            enforce_eager=True,  # 强制即时执行
            # kv_transfer_config=kv_transfer_config,
        )
        
        # 初始化引擎
        try:
            self.engine = AsyncLLMEngine.from_engine_args(self.engine_args)
            print(f"[ModelLoader] AsyncLLMEngine创建成功")
        except Exception as e:
            print(f"[ModelLoader Critical Error] 引擎初始化失败: {str(e)}")
            import traceback
            print(traceback.format_exc())
            raise
        
        # 加载分词器
        try:
            self.tokenizer = AutoTokenizer.from_pretrained(
                model_path,
                trust_remote_code=True,
                use_fast=True
            )
            if self.tokenizer.pad_token is None:
                self.tokenizer.pad_token = self.tokenizer.eos_token
            print(f"[ModelLoader] 分词器加载成功")
        except Exception as e:
            print(f"[ModelLoader Critical Error] 分词器加载失败: {str(e)}")
            raise
        
        print(f"[ModelLoader] 初始化完成，耗时: {time.time()-init_start_time:.2f}秒")

    async def generate_responses(self, prompt, max_tokens=4096, temperature=0.01, num_responses=1, stream=False, system_prompt=None):
        """
        强制单提示词处理，支持实时流式输出
        :param prompt: 用户提示词
        :param system_prompt: 系统提示词（可选）
        :param stream: 是否实时输出token（默认False）
        """
        generate_start = time.time()
        
        # 处理提示词格式
        if isinstance(prompt, list):
            if len(prompt) > 1:
                print(f"[ModelLoader Warning] 仅处理首个提示词")
            prompt = prompt[0]
        if not isinstance(prompt, str):
            prompt = str(prompt)
        
        # 构建聊天消息
        if system_prompt:
            messages = [
                {"role": "system", "content": system_prompt},
                {"role": "user", "content": prompt}
            ]
            # 应用聊天模板
            final_prompt = self.tokenizer.apply_chat_template(messages, tokenize=False, add_generation_prompt=True)
        else:
            # 使用默认系统提示词
            messages = [
                {"role": "system", "content": "Please reason step by step, and put your final answer within \\boxed{}."},
                {"role": "user", "content": prompt}
            ]
            final_prompt = self.tokenizer.apply_chat_template(messages, tokenize=False, add_generation_prompt=True)
        
        print(f"[ModelLoader] 处理单提示词，长度: {len(final_prompt)}, 前50字符: {final_prompt[:50]}...")
        request_id = str(uuid.uuid4())
        print(f"[ModelLoader] 请求ID: {request_id}")
        
        # 配置采样参数
        sampling_params = SamplingParams(
            temperature=temperature,
            max_tokens=max_tokens,
            n=num_responses,
            top_p=0.1,
            stop_token_ids=[self.tokenizer.eos_token_id],
            # repetition_penalty=1.2
            
        )
        
        try:
            responses = []
            full_response = ""  # 用于收集完整响应
            print(f"[ModelLoader] 提交生成请求（实时输出开启）:\n")
            
            # 异步遍历生成过程（核心：实时获取token）
            async for request_output in self.engine.generate(
                final_prompt,
                sampling_params,
                request_id=request_id
            ):
                # 实时输出每个新生成的token
                if stream:
                    for output in request_output.outputs:
                        # 计算新增的token（总长度 - 已收集长度）
                        new_text = output.text[len(full_response):]
                        if new_text:
                            print(new_text, end="", flush=True)  # 实时打印，不换行
                            full_response = output.text  # 更新完整响应
                
                # 生成完成后收集结果
                if request_output.finished:
                    responses = [output.text for output in request_output.outputs]
                    print(f"\n[ModelLoader] 生成完成，响应数量: {len(responses)}")
            
            generate_time = time.time() - generate_start
            print(f"[ModelLoader] 耗时: {generate_time:.2f}秒")
            return responses[0] if num_responses == 1 else responses
        
        except Exception as e:
            print(f"[ModelLoader Critical Error] 生成失败: {str(e)}")
            import traceback
            print(traceback.format_exc())
            raise

    async def close(self):
        """释放资源"""
        if hasattr(self.engine, "_engine"):
            try:
                self.engine._engine.destroy()
                print(f"[ModelLoader] 资源已释放")
            except Exception as e:
                print(f"[ModelLoader Error] 释放失败: {str(e)}")

# import torch
# import time
# import uuid
# from transformers import AutoModelForCausalLM, AutoTokenizer, StoppingCriteria, StoppingCriteriaList

# class LocalModel:
#     def __init__(self, model_path, pipeline_parallel_size=8):
#         """初始化本地模型（基于transformers原生推理）"""
#         print(f"[ModelLoader] 开始初始化模型，路径: {model_path}")
#         print(f"[ModelLoader] 并行配置参数已忽略（当前使用单进程推理）")
        
#         init_start_time = time.time()
        
#         # 加载模型
#         try:
#             self.model = AutoModelForCausalLM.from_pretrained(
#                 model_path,
#                 torch_dtype=torch.float16,
#                 device_map="auto",
#                 trust_remote_code=True
#             )
#             self.model.eval()
#             print(f"[ModelLoader] 模型加载成功")
#         except Exception as e:
#             print(f"[ModelLoader Critical Error] 模型加载失败: {str(e)}")
#             import traceback
#             print(traceback.format_exc())
#             raise
        
#         # 加载分词器
#         try:
#             self.tokenizer = AutoTokenizer.from_pretrained(
#                 model_path,
#                 trust_remote_code=True,
#                 use_fast=True
#             )
#             if self.tokenizer.pad_token is None:
#                 self.tokenizer.pad_token = self.tokenizer.eos_token
#             print(f"[ModelLoader] 分词器加载成功")
#         except Exception as e:
#             print(f"[ModelLoader Critical Error] 分词器加载失败: {str(e)}")
#             raise
        
#         print(f"[ModelLoader] 初始化完成，耗时: {time.time()-init_start_time:.2f}秒")

#     async def generate_responses(self, prompts, max_tokens=4096, temperature=0.01, num_responses=1, stream=True):
#         """
#         生成模型响应（支持实时流式输出）
#         :param stream: 是否实时输出生成的内容（默认True）
#         """
#         generate_start = time.time()
        
#         if isinstance(prompts, str):
#             prompts = [prompts]
        
#         if not all(isinstance(p, str) for p in prompts):
#             raise TypeError(f"所有提示词必须是字符串类型")
        
#         print(f"[ModelLoader] 处理提示词，数量: {len(prompts)}")
        
#         request_id = str(uuid.uuid4())
#         print(f"[ModelLoader] 请求ID: {request_id}")
        
#         # 生成参数：添加streaming回调支持
#         generate_params = {
#             "max_new_tokens": max_tokens,
#             "temperature": temperature,
#             "num_return_sequences": num_responses,
#             "eos_token_id": self.tokenizer.eos_token_id,
#             "pad_token_id": self.tokenizer.pad_token_id,
#             "streamer": self._get_streamer() if stream else None  # 流式输出回调
#         }
        
#         all_responses = []
#         try:
#             for prompt in prompts:
#                 print(f"[ModelLoader] 处理提示词，长度: {len(prompt)}, 前50字符: {prompt[:50]}...")
#                 print(f"[ModelLoader] 开始生成（实时输出开启）:\n")
                
#                 inputs = self.tokenizer(prompt, return_tensors="pt").to(self.model.device)
#                 input_length = len(inputs.input_ids[0])
                
#                 # 实时输出缓冲区（用于收集流式输出的内容）
#                 stream_buffer = []
                
#                 # 自定义停止条件（可选，用于提前终止）
#                 class StreamStoppingCriteria(StoppingCriteria):
#                     def __call__(self, input_ids, scores, **kwargs):
#                         return False  # 不提前终止，生成到max_new_tokens或eos
                
#                 # 生成响应
#                 with torch.no_grad():
#                     outputs = self.model.generate(
#                        ** inputs,
#                         **generate_params,
#                         stopping_criteria=StoppingCriteriaList([StreamStoppingCriteria()])
#                     )
                
#                 # 解码完整响应（若关闭stream，直接处理；若开启stream，从缓冲区拼接）
#                 responses = []
#                 if stream:
#                     # 流式输出已实时打印，此处从缓冲区拼接完整响应
#                     full_response = ''.join(stream_buffer)
#                     responses.append(full_response)
#                 else:
#                     # 非流式：正常解码
#                     for output in outputs:
#                         generated_tokens = output[input_length:]
#                         response_text = self.tokenizer.decode(generated_tokens, skip_special_tokens=True)
#                         responses.append(response_text)
                
#                 all_responses.extend(responses)
#                 print(f"\n[ModelLoader] 生成完成，响应数量: {len(responses)}")
            
#             generate_time = time.time() - generate_start
#             print(f"[ModelLoader] 总耗时: {generate_time:.2f}秒")
#             return all_responses
        
#         except Exception as e:
#             print(f"[ModelLoader Critical Error] 生成失败: {str(e)}")
#             import traceback
#             print(traceback.format_exc())
#             raise

#     def _get_streamer(self):
#         """创建流式输出回调器，实时打印生成的token"""
#         from transformers import TextIteratorStreamer
#         import threading
        
#         # 初始化流式迭代器
#         streamer = TextIteratorStreamer(
#             self.tokenizer,
#             skip_special_tokens=True,
#             timeout=30.0  # 超时时间
#         )
        
#         # 启动线程实时打印流式输出
#         def print_stream():
#             for token in streamer:
#                 if token:
#                     print(token, end='', flush=True)  # 实时输出，不换行
#                     stream_buffer.append(token)  # 缓存到缓冲区
            
#         # 启动打印线程（注意：全局stream_buffer需在generate_responses中定义）
#         global stream_buffer
#         stream_buffer = []
#         threading.Thread(target=print_stream, daemon=True).start()
        
#         return streamer

#     async def close(self):
#         """释放资源"""
#         try:
#             if hasattr(self, 'model') and self.model is not None:
#                 del self.model
#                 torch.cuda.empty_cache()
#             print(f"[ModelLoader] 资源已释放")
#         except Exception as e:
#             print(f"[ModelLoader Error] 释放失败: {str(e)}")