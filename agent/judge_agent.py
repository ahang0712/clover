# agent/judge_agent.py
# This file contains the JudgeAgent class which inherits from AgentBase

from agent.agent_base import AgentBase
from utils import load_prompt

class JudgeAgent(AgentBase):
    def __init__(self, api_client, model, name="JudgeAgent"):
        super().__init__(name)
        self.api_client = api_client
        self.model = model

    async def judge(self, judge_prompt):
        """基础判断方法，发送单个请求到模型（异步版本）"""
        messages = [
            {"role": "system", "content": "You are the judge agent."},
            {"role": "user", "content": judge_prompt}
        ]
        result = await self.api_client.send_messages(self.model, messages)
        self.add_message("judge", "Judgement completed.")
        return result
        
    async def judge_async(self, system_prompt, user_prompt):
        """异步版本的判断方法"""
        try:
            if hasattr(self.api_client, 'model_type') and self.api_client.model_type == "local":
                result = await self.model.generate_responses(
                    prompt=user_prompt,
                    system_prompt=system_prompt
                )
                if isinstance(result, list):
                    result = result[0]
                self.add_message("judge", "Judge async analysis done.")
                return result
            else:
                # 使用基类的通用异步处理方法
                return await self.process_async(self.api_client, self.model, system_prompt, user_prompt)
        except Exception as e:
            self.add_message("error", f"Judge analysis failed: {str(e)}")
            # 记录详细的错误信息
            import traceback
            self.add_message("error", traceback.format_exc())
            # 返回错误信息而不是抛出异常，避免整个流程中断
            return f"Judge analysis failed: {str(e)}"
        
    def load_judge_prompts(self):
        """加载判断代理所需的所有提示词"""
        # 加载判断代理的提示词
        judge_examples = [
            load_prompt(f"prompt/judge/judge_example_{i}.md") for i in range(1, 5)
        ]
        
        judge_prompt = load_prompt(
            "prompt/judge/judge_steps.md",
            judge_example_1=judge_examples[0],
            judge_example_2=judge_examples[1],
            judge_example_3=judge_examples[2],
            judge_example_4=judge_examples[3],
        )
        
        return judge_prompt
        
    def load_judge_prompts_with_pattern(self, pattern_info):
        """加载包含特定模式信息的判断代理提示词"""
        # 加载判断代理的提示词
        judge_examples = [
            load_prompt(f"prompt/judge/judge_example_{i}.md") for i in range(1, 5)
        ]
        
        judge_prompt = load_prompt(
            "prompt/judge/judge_steps.md",
            access_pattern=pattern_info['access_pattern'],
            judge_example_1=judge_examples[0],
            judge_example_2=judge_examples[1],
            judge_example_3=judge_examples[2],
            judge_example_4=judge_examples[3],
        )
        
        return judge_prompt
        
    def build_judge_user_prompt(self, context, judge_history, round_id=1):
        """构建判断代理的用户提示词"""
        # 拼接变量信息、操作信息、代码内容
        judge_context_info = (
            f"Global Variables to Focus on:\n[{context['variables_text']}]\n\n"
            f"The global variable read/write operations, line numbers, and function information are as follows:\n{context['operations_text']}\n"
            f"\nThe code to analyze is:\n```c\n{context['code_str']}\n```\n"
        )
        
        if round_id == 1:
            judge_user_prompt = (
                f"{judge_context_info}\n"
                f"{judge_history}\n"
            )
        else:
            judge_user_prompt = (
                f"{judge_context_info}\n"
                f"{judge_history}\n/no_think"
            )
            
        return judge_user_prompt
        
    def format_history_for_round(self, history):
        """格式化最近一轮的历史记录"""
        lines = []
        for h in history[-2:]:
            agent = "Expert" if h["role"] == "expert" else "Judge"
            purpose = h.get("purpose", "")
            if purpose:
                lines.append(f"[{agent} R{h['round']}] ({purpose})\n{h['content']}\n")
            else:
                lines.append(f"[{agent} R{h['round']}]\n{h['content']}\n")
        return "\n".join(lines)
