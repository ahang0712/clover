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
        candidate_defects_guidance = load_prompt("prompt/expert/candidate_defects_guidance.md")
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
            # f"{candidate_defects_guidance}\n\n"
            f"{domain_knowledge}\n\n"
            f"{detection_rules}\n\n"
            f"{output_format}\n\n"
        )
        
        return {
            "system_prompt": expert_system_prompt,
            "pattern_info": pattern_info
        }
    
    def format_control_flow_info(self, control_flow_data):
        """格式化控制流信息为可读文本"""
        if not control_flow_data:
            return ""
        
        # 提取函数和调用图信息
        functions = control_flow_data.get("functions", [])
        call_graph = control_flow_data.get("call_graph", [])
        
        if not functions and not call_graph:
            return ""
        
        lines = []
        
        # 格式化函数信息
        if functions:
            lines.append("### Function Analysis:")
            defined_funcs = [f for f in functions if f.get("type") == "defined"]
            external_funcs = [f for f in functions if f.get("type") == "external"]
            
            if defined_funcs:
                lines.append("**Defined Functions:**")
                for func in defined_funcs:
                    lines.append(f"  - {func['name']}")
            
            if external_funcs:
                lines.append("**External Functions:**")
                for func in external_funcs:
                    lines.append(f"  - {func['name']}")
        
        # 格式化调用图信息
        if call_graph:
            lines.append("\n### Call Graph Relationships:")
            for call in call_graph:
                caller = call.get("caller", "")
                callee = call.get("callee", "")
                if caller and callee:
                    lines.append(f"  {caller} -> {callee}")
        
        return "\n".join(lines)

    def build_expert_user_prompt(self, context):
        """构建专家代理的用户提示词"""
        # Build basic prompt components
        prompt_parts = [
            f"Global Variables to Focus on:\n[{context['variables_text']}]\n\n"
            f"The global variable read/write operations, line numbers, and function information are as follows:\n{context['operations_text']}\n"
        ]
        
        # Add control flow information if available
        if "control_flow_data" in context and context["control_flow_data"]:
            control_flow_text = self.format_control_flow_info(context["control_flow_data"])
            if control_flow_text:
                prompt_parts.append(
                    f"\n### Control Flow Information:\n"
                    f"The following control flow analysis shows function definitions and call relationships:\n\n"
                    f"{control_flow_text}\n"
                )
        
        # Add defect highlight information if available
        if "defects_text" in context and context["defects_text"]:
            prompt_parts.append(
                f"\n### Candidate Defects for Validation:\n"
                f"The following candidate defects have been identified by static analysis tools. "
                f"Please validate each candidate and perform your own independent analysis:\n\n"
                f"{context['defects_text']}\n"
                f"**Important**: Use these candidates as starting points, but do not limit your analysis to them. "
                f"Validate each candidate and identify any additional violations that may exist.\n"
            )
        else:
            pass # No defect information available for expert prompt
        
        # Add code section
        prompt_parts.append(
            f"\nThe code to analyze is:\n```c\n{context['code_str']}\n```\n"
            # f"/no_think"
        )
        
        final_prompt = "".join(prompt_parts)
        print(final_prompt)
        return final_prompt
        
    def build_followup_system_prompt(self, pattern_name):
        """构建专家代理后续轮次的系统提示词"""
        # 根据pattern_name获取完整的pattern信息
        from defect_patterns import PATTERNS
        
        # 找到对应的defect_mode
        defect_mode = None
        for mode, info in PATTERNS.items():
            if info['pattern_name'] == pattern_name:
                defect_mode = mode
                break
        
        if not defect_mode:
            # 如果找不到对应的模式，回退到原来的简单方式
            return load_prompt(
                "prompt/expert/expert_followup.md",
                pattern_name=pattern_name
            )
        
        pattern_info = PATTERNS[defect_mode]
        
        # 加载与第一轮Expert相同的提示词组件
        system_prompt = load_prompt("prompt/common/system_message.md")
        task_objective = load_prompt("prompt/expert/task_objective.md", pattern_name=pattern_info['pattern_name'])
        detection_rules = load_prompt("prompt/expert/detection_rules.md")
        candidate_defects_guidance = load_prompt("prompt/expert/candidate_defects_guidance.md")
        domain_knowledge = load_prompt(f"prompt/domain_knowledge/{pattern_info['domain_knowledge']}")
        pattern_example = load_prompt(f"prompt/expert/{pattern_info['pattern_example']}")
        output_format = load_prompt(
            "prompt/expert/output_format.md",   
            pattern_name=pattern_info['pattern_name'],
            pattern_example=pattern_example,
            access_pattern=pattern_info['access_pattern']
        )
        
        # 加载后续轮次特定的指导
        expert_followup = load_prompt(
            "prompt/expert/expert_followup.md",
            pattern_name=pattern_name
        )
        
        # 构建完整的后续轮次系统提示词
        followup_system_prompt = (
            f"{system_prompt}\n"
            f"{task_objective}\n\n"
            f"{candidate_defects_guidance}\n\n"
            f"{domain_knowledge}\n\n"
            f"{detection_rules}\n\n"
            f"{output_format}\n\n"
            f"{expert_followup}\n\n"
        )
        
        return followup_system_prompt
    
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
"""

