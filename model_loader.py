# model_loader.py
# from vllm import LLM, SamplingParams
# from transformers import AutoTokenizer

# class LocalModel:
#     def __init__(self, model_path):
        # 加载本地模型
    #     self.llm = LLM(model=model_path, dtype="half")
    #     self.tokenizer = AutoTokenizer.from_pretrained(model_path)
    
    # def generate_responses(self, prompts, max_tokens=8192, temperature=0.0, num_responses=1):
    #     # 转换提示为文本
    #     messages = [
    #         {
    #             "role": "system", 
    #             "content": "Please reason step by step, and put your final answer within \\boxed{}."
    #         },
    #         {"role": "user", "content": prompt}
    #     ]
        
    #     texts = [
    #         self.tokenizer.apply_chat_template(msg, tokenize=False, add_generation_prompt=True)
    #         for msg in messages
    #     ]
        
    #     sampling_params = SamplingParams(
    #         temperature=temperature,
    #         top_p=0.0,
    #         max_tokens=max_tokens,
    #         n=num_responses
    #     )
        
        # outputs = self.llm.generate(texts, sampling_params)
        
        # responses = [output.outputs[0].text for output in outputs]
        # return responses
