# agent/expert_agent.py
# This file defines the ExpertAgent class, which is a subclass of AgentBase

from agent.agent_base import AgentBase
from utils import load_prompt

class ExpertAgent(AgentBase):
    def __init__(self, api_client, model, name="ExpertAgent"):
        super().__init__(name)
        self.api_client = api_client
        self.model = model

    async def analyze(self, system_prompt, user_prompt):
        """基础分析方法，发送单个请求到模型（异步版本）"""
        messages = [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": user_prompt}
        ]
        result = await self.api_client.send_messages(self.model, messages)
        self.add_message("expert", "Expert analysis done.")
        return result
        
    async def analyze_async(self, system_prompt, user_prompt):
        """异步版本的分析方法"""
        try:
            if hasattr(self.api_client, 'model_type') and self.api_client.model_type == "local":
                result = await self.model.generate_responses(
                    prompt=user_prompt,
                    system_prompt=system_prompt
                )
                if isinstance(result, list):
                    result = result[0]
                self.add_message("expert", "Expert async analysis done.")
                return result
            else:
                # 使用基类的通用异步处理方法
                return await self.process_async(self.api_client, self.model, system_prompt, user_prompt)
        except Exception as e:
            self.add_message("error", f"Expert analysis failed: {str(e)}")
            # 记录详细的错误信息
            import traceback
            self.add_message("error", traceback.format_exc())
            # 返回错误信息而不是抛出异常，避免整个流程中断
            return f"Expert analysis failed: {str(e)}"
    
    def load_expert_prompts(self, defect_mode):
        """加载专家代理所需的所有提示词"""
        from defect_patterns import PATTERNS
        
        pattern_info = PATTERNS.get(defect_mode)
        if not pattern_info:
            self.add_message("warning", f"Pattern info not found: {defect_mode}")
            return None
            
        # 加载提示词模板
        system_prompt = load_prompt("prompt/common/system_message.md")
        task_objective = load_prompt("prompt/expert/task_objective.md", pattern_name=pattern_info['pattern_name'])
        detection_rules = load_prompt("prompt/expert/detection_rules.md")
        domain_knowledge = load_prompt(f"prompt/domain_knowledge/{pattern_info['domain_knowledge']}")
        pattern_example = load_prompt(f"prompt/expert/{pattern_info['pattern_example']}")
        output_format = load_prompt(
            "prompt/expert/output_format.md",   
            pattern_name=pattern_info['pattern_name'],
            pattern_example=pattern_example,
            access_pattern=pattern_info['access_pattern']
        )
        
        # 构建专家代理的提示词
        expert_system_prompt = (
            f"{system_prompt}\n"
            f"{task_objective}\n\n"
            f"{domain_knowledge}\n\n"
            f"{detection_rules}\n\n"
            f"{output_format}\n\n"
        )
        
        return {
            "system_prompt": expert_system_prompt,
            "pattern_info": pattern_info
        }
    
    def build_expert_user_prompt(self, context):
        """构建专家代理的用户提示词"""
        expert_user_prompt = (
            f"Global Variables to Focus on:\n[{context['variables_text']}]\n\n"
            f"The global variable read/write operations, line numbers, and function information are as follows:\n{context['operations_text']}\n"
            f"\nThe code to analyze is:\n```c\n{context['code_str']}\n```\n"
            f"/no_think"
        )
        return expert_user_prompt
        
    def build_followup_system_prompt(self, pattern_name):
        """构建专家代理后续轮次的系统提示词"""
        return load_prompt(
            "prompt/expert/expert_followup.md",
            pattern_name=pattern_name
        )
    
    def build_followup_user_prompt(self, context, expert_history):
        """构建专家代理后续轮次的用户提示词"""
        expert_context_info = (
            f"Global Variables to Focus on:\n[{context['variables_text']}]\n\n"
            f"The global variable read/write operations, line numbers, and function information are as follows:\n{context['operations_text']}\n"
            f"\nThe code to analyze is:\n```c\n{context['code_str']}\n```\n"
        )
        
        return f"""
{expert_context_info}
{expert_history}
/no_think
"""

