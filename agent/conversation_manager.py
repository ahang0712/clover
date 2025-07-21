# agent/conversation_manager.py
# 管理专家代理和判断代理之间的对话流程

import time
import asyncio
import os
from agent.agent_base import AgentBase
from agent.expert_agent import ExpertAgent
from agent.judge_agent import JudgeAgent
from output import save_response

class ConversationManager(AgentBase):
    """
    对话管理器：负责协调专家代理和判断代理之间的多轮对话
    """
    
    def __init__(self, api_client, model, name="ConversationManager"):
        super().__init__(name)
        self.api_client = api_client
        self.model = model
        self.expert_agent = ExpertAgent(api_client, model)
        self.judge_agent = JudgeAgent(api_client, model)
        
        # 定义每轮任务说明
        self.expert_purposes = [
            "Detect atomicity violations in the code.",
            "Refine the report based on judge feedback, re-check for missed or false defects.",
            "Final expert review for any remaining issues."
        ]
        self.judge_purposes = [
            "Validate the expert's defect report and check control/interrupt conditions.",
            "Final validation and correction of the refined report.",
            "Final judge review for any remaining issues."
        ]
    
    async def run_conversation(self, defect_mode, context, start_time):
        """
        运行专家代理和判断代理之间的多轮对话
        
        参数:
        - defect_mode: 缺陷模式
        - context: 上下文信息，包含代码、变量等
        - start_time: 开始时间
        
        返回:
        - (defect_mode, intermediate_responses): 缺陷模式和对话结果
        """
        print(f"\n{'#'*80}\n# 开始处理缺陷模式: {defect_mode}\n{'#'*80}")
        self.add_message("info", f"开始处理缺陷模式: {defect_mode}")
        
        # 记录函数开始时间
        func_start_time = time.time()
        # 中间结果缓存（即使超时也能保存）
        intermediate_responses = ""
        response_file_path = context.get("response_file_path", "")
        
        # 加载专家代理提示词
        prompts = self.expert_agent.load_expert_prompts(defect_mode)
        if not prompts:
            self.add_message("error", f"无法加载模式信息: {defect_mode}")
            return (defect_mode, "Error: Pattern info not found")
        
        pattern_info = prompts["pattern_info"]
        expert_system_prompt = prompts["system_prompt"]
        
        # 构建专家代理用户提示词
        expert_user_prompt = self.expert_agent.build_expert_user_prompt(context)
        print(f"\n{'*'*80}\n* 专家代理提示词准备完成\n* 模式名称: {pattern_info['pattern_name']}\n* 访问模式: {pattern_info['access_pattern']}\n{'*'*80}")
        
        # 单个任务的独立会话历史
        history = []
        round_id = 1  # 初始化轮次计数器
        # messages变量在此处没有实际用途，移除
        
        try:
            # 专家代理第一轮响应
            self.add_message("info", f"专家代理第{round_id}轮分析开始")
            response_expert = await self.expert_agent.analyze_async(
                expert_system_prompt, 
                expert_user_prompt
            )
            
            # 检查是否返回了错误消息
            if response_expert.startswith("Expert analysis failed:"):
                self.add_message("error", f"专家代理分析失败: {response_expert}")
                intermediate_responses += f"[System] Error: {response_expert}\n"
                print(f"\n{'!'*80}\n! 专家代理分析失败: {response_expert}\n{'!'*80}\n")
                if response_file_path:
                    save_response(response_file_path, intermediate_responses, time.time() - start_time)
                return (defect_mode, intermediate_responses)
            
            # 缓存第一轮结果，历史存输出内容和purpose
            expert_history_item = {
                "role": "expert",
                "round": round_id,
                "purpose": self.expert_purposes[0],
                "content": response_expert
            }
            history.append(expert_history_item)
            intermediate_responses = f"[Expert R{round_id}] ({self.expert_purposes[0]})\n{response_expert}\n\n"
            # 打印专家代理第一轮输出
            print(f"\n{'='*50}\n[Expert R{round_id}] ({self.expert_purposes[0]})\n{'-'*50}\n{response_expert}\n{'='*50}\n")
            
            # 若专家判定无缺陷，直接结束
            if "No defects." in response_expert:
                intermediate_responses += f"[Expert R{round_id}] No defects found. Ending the conversation.\n"
                if response_file_path:
                    save_response(response_file_path, intermediate_responses, time.time() - start_time)
                self.add_message("info", f"未发现缺陷，任务完成，耗时={time.time() - func_start_time:.2f}秒")
                return (defect_mode, intermediate_responses)
            
            # 加载判断代理提示词
            judge_system_prompt = self.judge_agent.load_judge_prompts_with_pattern(pattern_info)
            
            # 多轮对话循环（最多3轮）
            while round_id < 3:
                # 格式化历史记录
                judge_history = self.judge_agent.format_history_for_round(history)
                
                # 构建判断代理用户提示词
                judge_user_prompt = self.judge_agent.build_judge_user_prompt(
                    context, 
                    judge_history, 
                    round_id
                )
                
                # 获取判断代理响应
                self.add_message("info", f"判断代理第{round_id}轮分析开始")
                response_judge = await self.judge_agent.judge_async(
                    judge_system_prompt,
                    judge_user_prompt
                )
                
                # 检查是否返回了错误消息
                if response_judge.startswith("Judge analysis failed:"):
                    self.add_message("error", f"判断代理分析失败: {response_judge}")
                    intermediate_responses += f"[System] Error: {response_judge}\n"
                    print(f"\n{'!'*80}\n! 判断代理分析失败: {response_judge}\n{'!'*80}\n")
                    # 判断代理失败，但我们可以继续让专家代理继续分析
                    response_judge = "Judge analysis failed. Expert should continue without judge feedback."
                
                # 缓存判断代理结果，历史存输出内容和purpose
                judge_history_item = {
                    "role": "judge",
                    "round": round_id,
                    "purpose": self.judge_purposes[round_id-1] if round_id-1 < len(self.judge_purposes) else self.judge_purposes[-1],
                    "content": response_judge
                }
                history.append(judge_history_item)
                intermediate_responses += f"[Judge R{round_id}] ({judge_history_item['purpose']})\n{response_judge}\n\n"
                # 打印判断代理输出
                print(f"\n{'='*50}\n[Judge R{round_id}] ({judge_history_item['purpose']})\n{'-'*50}\n{response_judge}\n{'='*50}\n")
                
                # 构建专家代理后续提示
                expert_history = self.judge_agent.format_history_for_round(history)
                expert_followup_system_prompt = self.expert_agent.build_followup_system_prompt(pattern_info['pattern_name'])
                expert_followup_user_prompt = self.expert_agent.build_followup_user_prompt(context, expert_history)
                
                # 轮次递增
                round_id += 1
                
                # 获取专家代理后续响应
                self.add_message("info", f"专家代理第{round_id}轮分析开始")
                response_expert = await self.expert_agent.analyze_async(
                    expert_followup_system_prompt,
                    expert_followup_user_prompt
                )
                
                # 检查是否返回了错误消息
                if response_expert.startswith("Expert analysis failed:"):
                    self.add_message("error", f"专家代理后续分析失败: {response_expert}")
                    intermediate_responses += f"[System] Error: {response_expert}\n"
                    print(f"\n{'!'*80}\n! 专家代理后续分析失败: {response_expert}\n{'!'*80}\n")
                    # 专家代理失败，终止循环
                    break
                
                # 缓存专家代理结果，历史存输出内容和purpose
                expert_history_item = {
                    "role": "expert",
                    "round": round_id,
                    "purpose": self.expert_purposes[round_id-1] if round_id-1 < len(self.expert_purposes) else self.expert_purposes[-1],
                    "content": response_expert
                }
                history.append(expert_history_item)
                intermediate_responses += f"[Expert R{round_id}] ({expert_history_item['purpose']})\n{response_expert}\n\n"
                # 打印专家代理后续轮次输出
                print(f"\n{'='*50}\n[Expert R{round_id}] ({expert_history_item['purpose']})\n{'-'*50}\n{response_expert}\n{'='*50}\n")
                
                # 若专家放弃，终止循环
                if "abstain" in response_expert.lower():
                    self.add_message("info", f"专家放弃，轮次={round_id}")
                    break
        
        except asyncio.CancelledError:
            # 捕获超时导致的任务取消异常
            self.add_message("warning", f"任务 {defect_mode} 超时，正在保存当前结果...")
            print(f"\n{'!'*80}\n! 任务 {defect_mode} 超时，正在保存当前结果...\n{'!'*80}\n")
            # 强制保存中间结果
            if response_file_path:
                save_response(
                    response_file_path, 
                    intermediate_responses + f"\n[System R{round_id}] Task timed out. Partial results saved.", 
                    time.time() - start_time
                )
            return (defect_mode, intermediate_responses + f"\n[System R{round_id}] Task timed out.")
        except Exception as e:
            self.add_message("error", f"任务执行异常: {str(e)}")
            import traceback
            error_trace = traceback.format_exc()
            self.add_message("error", error_trace)
            print(f"\n{'!'*80}\n! 任务执行异常: {str(e)}\n{error_trace}\n{'!'*80}\n")
            # 异常时保存已有结果
            if response_file_path:
                save_response(
                    response_file_path, 
                    intermediate_responses + f"\n[System R{round_id}] Task failed: {str(e)}", 
                    time.time() - start_time
                )
            raise
        finally:
            # 正常结束时保存最终结果（确保一定会执行）
            if response_file_path and (not os.path.exists(response_file_path) or os.path.getsize(response_file_path) == 0):
                save_response(response_file_path, intermediate_responses, time.time() - start_time)
                self.add_message("info", "最终结果已保存")
        
        self.add_message("info", f"任务完成，总耗时={time.time() - func_start_time:.2f}秒")
        print(f"\n{'#'*80}\n# 缺陷模式 {defect_mode} 处理完成，总耗时={time.time() - func_start_time:.2f}秒\n{'#'*80}\n")
        return (defect_mode, intermediate_responses) 
        
    async def run_batch_conversation(self, defect_modes, contexts, start_time):
        """
        批量运行多个缺陷模式的分析任务
        
        参数:
        - defect_modes: 缺陷模式列表
        - contexts: 上下文信息列表，与defect_modes一一对应
        - start_time: 开始时间
        
        返回:
        - 结果列表，每个元素为(defect_mode, intermediate_responses)
        """
        print(f"\n{'#'*80}\n# 开始批量处理 {len(defect_modes)} 个缺陷模式\n{'#'*80}")
        self.add_message("info", f"开始批量处理 {len(defect_modes)} 个缺陷模式")
        
        # 记录函数开始时间
        func_start_time = time.time()
        
        # 准备所有任务的专家代理提示词
        expert_system_prompts = []
        expert_user_prompts = []
        pattern_infos = []
        valid_indices = []  # 有效任务的索引
        results = []  # 最终结果
        
        # 预先填充结果列表，确保返回结果顺序与输入一致
        for _ in range(len(defect_modes)):
            results.append(None)
        
        # 第一步：准备所有任务的提示词
        for i, (defect_mode, context) in enumerate(zip(defect_modes, contexts)):
            # 加载专家代理提示词
            prompts = self.expert_agent.load_expert_prompts(defect_mode)
            if not prompts:
                self.add_message("error", f"无法加载模式信息: {defect_mode}")
                results[i] = (defect_mode, "Error: Pattern info not found")
                continue
            
            pattern_info = prompts["pattern_info"]
            expert_system_prompt = prompts["system_prompt"]
            
            # 构建专家代理用户提示词
            expert_user_prompt = self.expert_agent.build_expert_user_prompt(context)
            
            # 添加到列表
            expert_system_prompts.append(expert_system_prompt)
            expert_user_prompts.append(expert_user_prompt)
            pattern_infos.append(pattern_info)
            valid_indices.append(i)
            
            print(f"[BatchProcess] 准备任务 {i+1}/{len(defect_modes)}: {defect_mode}")
        
        if not valid_indices:
            self.add_message("error", "没有有效的任务")
            return results
        
        # 创建任务历史记录字典，键为任务索引
        histories = {i: [] for i in valid_indices}
        round_ids = {i: 1 for i in valid_indices}  # 每个任务的当前轮次
        intermediate_responses_dict = {i: "" for i in valid_indices}  # 每个任务的中间结果
        
        try:
            # 第二步：批量执行专家代理第一轮分析
            self.add_message("info", "批量执行专家代理第一轮分析")
            
            # 构建批量消息
            batch_messages = []
            for sys_prompt, user_prompt in zip(expert_system_prompts, expert_user_prompts):
                batch_messages.append([
                    {"role": "system", "content": sys_prompt},
                    {"role": "user", "content": user_prompt}
                ])
            
            # 批量发送请求
            expert_responses = await self.api_client.send_messages(self.model, batch_messages)
            
            # 处理专家代理响应
            active_indices = []  # 需要继续处理的任务索引
            for idx, (i, response_expert) in enumerate(zip(valid_indices, expert_responses)):
                defect_mode = defect_modes[i]
                context = contexts[i]
                response_file_path = context.get("response_file_path", "")
                
                # 检查是否返回了错误消息
                if response_expert is None or response_expert.startswith("Expert analysis failed:"):
                    error_msg = response_expert if response_expert else "Expert analysis returned None"
                    self.add_message("error", f"任务 {i} ({defect_mode}) 专家代理分析失败: {error_msg}")
                    intermediate_responses_dict[i] = f"[System] Error: {error_msg}\n"
                    print(f"\n{'!'*80}\n! 任务 {i} ({defect_mode}) 专家代理分析失败: {error_msg}\n{'!'*80}\n")
                    if response_file_path:
                        save_response(response_file_path, intermediate_responses_dict[i], time.time() - start_time)
                    results[i] = (defect_mode, intermediate_responses_dict[i])
                    continue
                
                # 缓存第一轮结果
                expert_history_item = {
                    "role": "expert",
                    "round": 1,
                    "purpose": self.expert_purposes[0],
                    "content": response_expert
                }
                histories[i].append(expert_history_item)
                intermediate_responses_dict[i] = f"[Expert R1] ({self.expert_purposes[0]})\n{response_expert}\n\n"
                
                # 打印专家代理第一轮输出
                print(f"\n{'='*50}\n[任务 {i}] [Expert R1] ({self.expert_purposes[0]})\n{'-'*50}\n{response_expert}\n{'='*50}\n")
                
                # 若专家判定无缺陷，直接结束该任务
                if "No defects." in response_expert:
                    intermediate_responses_dict[i] += f"[Expert R1] No defects found. Ending the conversation.\n"
                    if response_file_path:
                        save_response(response_file_path, intermediate_responses_dict[i], time.time() - start_time)
                    self.add_message("info", f"任务 {i} ({defect_mode}) 未发现缺陷，任务完成")
                    results[i] = (defect_mode, intermediate_responses_dict[i])
                else:
                    # 需要继续处理的任务
                    active_indices.append(i)
            
            # 如果没有需要继续处理的任务，直接返回结果
            if not active_indices:
                self.add_message("info", f"所有任务已完成，总耗时={time.time() - func_start_time:.2f}秒")
                return [(defect_modes[i], intermediate_responses_dict[i]) if i in valid_indices else results[i] for i in range(len(defect_modes))]
            
            # 第三步：继续处理需要多轮对话的任务
            # 由于多轮对话的复杂性，这里改为逐个处理剩余的任务
            for i in active_indices:
                defect_mode = defect_modes[i]
                context = contexts[i]
                pattern_info = pattern_infos[valid_indices.index(i)]
                
                # 加载判断代理提示词
                judge_system_prompt = self.judge_agent.load_judge_prompts_with_pattern(pattern_info)
                
                # 多轮对话循环（最多3轮）
                while round_ids[i] < 3:
                    # 格式化历史记录
                    judge_history = self.judge_agent.format_history_for_round(histories[i])
                    
                    # 构建判断代理用户提示词
                    judge_user_prompt = self.judge_agent.build_judge_user_prompt(
                        context, 
                        judge_history, 
                        round_ids[i]
                    )
                    
                    # 获取判断代理响应
                    self.add_message("info", f"任务 {i} ({defect_mode}) 判断代理第{round_ids[i]}轮分析开始")
                    response_judge = await self.judge_agent.judge_async(
                        judge_system_prompt,
                        judge_user_prompt
                    )
                    
                    # 检查是否返回了错误消息
                    if response_judge.startswith("Judge analysis failed:"):
                        self.add_message("error", f"任务 {i} ({defect_mode}) 判断代理分析失败: {response_judge}")
                        intermediate_responses_dict[i] += f"[System] Error: {response_judge}\n"
                        print(f"\n{'!'*80}\n! 任务 {i} ({defect_mode}) 判断代理分析失败: {response_judge}\n{'!'*80}\n")
                        # 判断代理失败，但我们可以继续让专家代理继续分析
                        response_judge = "Judge analysis failed. Expert should continue without judge feedback."
                    
                    # 缓存判断代理结果
                    judge_history_item = {
                        "role": "judge",
                        "round": round_ids[i],
                        "purpose": self.judge_purposes[round_ids[i]-1] if round_ids[i]-1 < len(self.judge_purposes) else self.judge_purposes[-1],
                        "content": response_judge
                    }
                    histories[i].append(judge_history_item)
                    intermediate_responses_dict[i] += f"[Judge R{round_ids[i]}] ({judge_history_item['purpose']})\n{response_judge}\n\n"
                    
                    # 打印判断代理输出
                    print(f"\n{'='*50}\n[任务 {i}] [Judge R{round_ids[i]}] ({judge_history_item['purpose']})\n{'-'*50}\n{response_judge}\n{'='*50}\n")
                    
                    # 构建专家代理后续提示
                    expert_history = self.judge_agent.format_history_for_round(histories[i])
                    expert_followup_system_prompt = self.expert_agent.build_followup_system_prompt(pattern_info['pattern_name'])
                    expert_followup_user_prompt = self.expert_agent.build_followup_user_prompt(context, expert_history)
                    
                    # 轮次递增
                    round_ids[i] += 1
                    
                    # 获取专家代理后续响应
                    self.add_message("info", f"任务 {i} ({defect_mode}) 专家代理第{round_ids[i]}轮分析开始")
                    response_expert = await self.expert_agent.analyze_async(
                        expert_followup_system_prompt,
                        expert_followup_user_prompt
                    )
                    
                    # 检查是否返回了错误消息
                    if response_expert.startswith("Expert analysis failed:"):
                        self.add_message("error", f"任务 {i} ({defect_mode}) 专家代理后续分析失败: {response_expert}")
                        intermediate_responses_dict[i] += f"[System] Error: {response_expert}\n"
                        print(f"\n{'!'*80}\n! 任务 {i} ({defect_mode}) 专家代理后续分析失败: {response_expert}\n{'!'*80}\n")
                        # 专家代理失败，终止循环
                        break
                    
                    # 缓存专家代理结果
                    expert_history_item = {
                        "role": "expert",
                        "round": round_ids[i],
                        "purpose": self.expert_purposes[round_ids[i]-1] if round_ids[i]-1 < len(self.expert_purposes) else self.expert_purposes[-1],
                        "content": response_expert
                    }
                    histories[i].append(expert_history_item)
                    intermediate_responses_dict[i] += f"[Expert R{round_ids[i]}] ({expert_history_item['purpose']})\n{response_expert}\n\n"
                    
                    # 打印专家代理后续轮次输出
                    print(f"\n{'='*50}\n[任务 {i}] [Expert R{round_ids[i]}] ({expert_history_item['purpose']})\n{'-'*50}\n{response_expert}\n{'='*50}\n")
                    
                    # 若专家放弃，终止循环
                    if "abstain" in response_expert.lower():
                        self.add_message("info", f"任务 {i} ({defect_mode}) 专家放弃，轮次={round_ids[i]}")
                        break
                
                # 保存最终结果
                response_file_path = context.get("response_file_path", "")
                if response_file_path:
                    save_response(response_file_path, intermediate_responses_dict[i], time.time() - start_time)
                
                # 更新结果
                results[i] = (defect_mode, intermediate_responses_dict[i])
                self.add_message("info", f"任务 {i} ({defect_mode}) 完成")
        
        except asyncio.CancelledError:
            # 捕获超时导致的任务取消异常
            self.add_message("warning", "批量任务超时，正在保存当前结果...")
            print(f"\n{'!'*80}\n! 批量任务超时，正在保存当前结果...\n{'!'*80}\n")
            
            # 保存所有任务的中间结果
            for i in valid_indices:
                if results[i] is None:  # 只处理尚未完成的任务
                    defect_mode = defect_modes[i]
                    context = contexts[i]
                    response_file_path = context.get("response_file_path", "")
                    
                    if response_file_path:
                        save_response(
                            response_file_path, 
                            intermediate_responses_dict.get(i, "") + f"\n[System R{round_ids.get(i, 1)}] Task timed out. Partial results saved.", 
                            time.time() - start_time
                        )
                    
                    results[i] = (defect_mode, intermediate_responses_dict.get(i, "") + f"\n[System R{round_ids.get(i, 1)}] Task timed out.")
            
            return results
            
        except Exception as e:
            self.add_message("error", f"批量任务执行异常: {str(e)}")
            import traceback
            error_trace = traceback.format_exc()
            self.add_message("error", error_trace)
            print(f"\n{'!'*80}\n! 批量任务执行异常: {str(e)}\n{error_trace}\n{'!'*80}\n")
            
            # 保存所有任务的中间结果
            for i in valid_indices:
                if results[i] is None:  # 只处理尚未完成的任务
                    defect_mode = defect_modes[i]
                    context = contexts[i]
                    response_file_path = context.get("response_file_path", "")
                    
                    if response_file_path:
                        save_response(
                            response_file_path, 
                            intermediate_responses_dict.get(i, "") + f"\n[System R{round_ids.get(i, 1)}] Task failed: {str(e)}", 
                            time.time() - start_time
                        )
                    
                    results[i] = (defect_mode, intermediate_responses_dict.get(i, "") + f"\n[System R{round_ids.get(i, 1)}] Task failed: {str(e)}")
            
            raise
        
        self.add_message("info", f"所有批量任务完成，总耗时={time.time() - func_start_time:.2f}秒")
        print(f"\n{'#'*80}\n# 批量处理 {len(defect_modes)} 个缺陷模式完成，总耗时={time.time() - func_start_time:.2f}秒\n{'#'*80}\n")
        
        # 返回非None的结果
        return [r if r is not None else (defect_modes[i], "Error: Task not processed") for i, r in enumerate(results)] 