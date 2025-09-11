# agent/workflow_manager.py
import asyncio
import json
from typing import Dict, List, Any, Optional
from dataclasses import dataclass
from enum import Enum

from agent.expert_agent import ExpertAgent
from agent.judge_agent import JudgeAgent
from agent.agent_base import AgentBase
from config import AGENT_MODELS

class TaskStatus(Enum):
    PENDING = "pending"
    RUNNING = "running" 
    COMPLETED = "completed"
    FAILED = "failed"

@dataclass
class Task:
    """Represents a single task for an Expert-Judge pair"""
    id: str
    variables: List[str]
    pattern: str
    defect_count: int
    status: TaskStatus = TaskStatus.PENDING
    expert_agent: Optional[ExpertAgent] = None
    judge_agent: Optional[JudgeAgent] = None
    result: Optional[Dict[str, Any]] = None
    error: Optional[str] = None

@dataclass
class WorkflowResult:
    """Aggregated results from all tasks"""
    total_tasks: int
    completed_tasks: int
    failed_tasks: int
    results: List[Dict[str, Any]]
    errors: List[str]

class WorkflowManager:
    """
    Manages the allocation and execution of Expert-Judge pairs based on strategy output
    """
    
    def __init__(self, api_client, model):
        """
        Initialize the WorkflowManager
        
        :param api_client: APIClient instance for model communication
        :param model: Model to use for agents
        """
        self.api_client = api_client
        self.model = model
        self.tasks: List[Task] = []
        self.max_concurrent_tasks = 20  # Maximum concurrent tasks (optimized for 27 API keys)
        self.has_defects = False  # Track if there are any defects to analyze
        
    def parse_strategy_output(self, strategy_json: str) -> Dict[str, Any]:
        """
        Parse the JSON output from the plan agent
        
        :param strategy_json: JSON string from plan agent
        :return: Parsed strategy dictionary
        """
        try:
            return json.loads(strategy_json)
        except json.JSONDecodeError as e:
            raise ValueError(f"Invalid JSON format in strategy output: {e}")
    
    def create_tasks_from_strategy(self, strategy_output: Dict[str, Any]) -> List[Task]:
        """
        Create Task objects from strategy output
        
        :param strategy_output: Parsed strategy dictionary
        :return: List of Task objects
        """
        # 支持两种格式：新格式(expert_judge_tasks)和旧格式(strategy+tasks)
        if "expert_judge_tasks" in strategy_output:
            tasks_data = strategy_output["expert_judge_tasks"]
            # 新格式不需要strategy字段
        else:
            strategy = strategy_output.get("strategy")
            tasks_data = strategy_output.get("tasks", [])
            # 旧格式需要检查strategy字段
            if not strategy:
                raise ValueError("Invalid strategy output: missing strategy field")
        
        if not tasks_data:
            raise ValueError("Invalid strategy output: no tasks found")
        
        tasks = []
        for i, task_data in enumerate(tasks_data):
            # 处理PlanAgent格式：{sharedVariables: [...], accessPattern: ["Read", "Write", "Read"]}
            if "sharedVariables" in task_data and "accessPattern" in task_data:
                access_pattern = task_data.get("accessPattern", [])
                # 将accessPattern列表转换为pattern字符串
                pattern_str = self._convert_access_pattern_to_string(access_pattern)
                
                task = Task(
                    id=f"task_{i+1}",  # 自动生成ID
                    variables=task_data.get("sharedVariables", []),
                    pattern=pattern_str,
                    defect_count=len(task_data.get("sharedVariables", []))
                )
            # 处理WorkflowManager原始格式：{id: "...", variables: [...], pattern: "...", count: N}
            else:
                task = Task(
                        id=task_data.get("id", f"task_{i+1}"),  # 如果没有ID则生成一个
                    variables=task_data.get("variables", []),
                    pattern=task_data.get("pattern"),
                    defect_count=task_data.get("count", 0)
                )
            tasks.append(task)
        
        return tasks
    
    def _convert_access_pattern_to_string(self, access_pattern: List[str]) -> str:
        """
        将accessPattern列表转换为pattern字符串
        
        :param access_pattern: 访问模式列表，如["Read", "Write", "Read"]
        :return: 模式字符串，如"RWR"
        """
        if not access_pattern:
            return "RWR"  # 默认模式
        
        pattern_chars = []
        for action in access_pattern:
            action_lower = action.lower()
            if action_lower == "read":
                pattern_chars.append("R")
            elif action_lower == "write":
                pattern_chars.append("W")
            else:
                pattern_chars.append("R")  # 未知操作默认为Read
        
        return "".join(pattern_chars)
    
    def allocate_agents(self, tasks: List[Task]) -> List[Task]:
        """
        Allocate Expert and Judge agents to each task with independent API clients
        
        :param tasks: List of Task objects
        :return: List of tasks with allocated agents
        """
        for i, task in enumerate(tasks):
            # 根据API客户端类型选择模型
            if self.api_client.model_type == "online":
                expert_model = AGENT_MODELS.get("expert", self.model)
                judge_model = AGENT_MODELS.get("judge", self.model)
                
                # 🚀 为每个任务创建独立的API客户端，确保真正并行
                print(f"[WorkflowManager] 为任务 {task.id} 创建独立API客户端")
                
                from api_client import APIClient
                from thinking_config import get_config
                
                # Expert Agent独立API客户端
                expert_api_client = APIClient(thinking_config=get_config("disabled"))
                expert_api_client.current_key_index = (i * 2) % len(expert_api_client.api_keys)
                expert_api_client.set_concurrency_profile("expert_optimized")
                
                # Judge Agent独立API客户端  
                judge_api_client = APIClient(thinking_config=get_config("disabled"))
                judge_api_client.current_key_index = (i * 2 + 1) % len(judge_api_client.api_keys)
                judge_api_client.set_concurrency_profile("expert_optimized")
                
                print(f"[WorkflowManager] Expert API起始密钥: {expert_api_client.current_key_index}, Judge API起始密钥: {judge_api_client.current_key_index}")
                
            else:
                expert_model = self.model  # 本地模型模式下使用传入的模型
                judge_model = self.model
                expert_api_client = self.api_client  # 本地模式共享API客户端
                judge_api_client = self.api_client
            
            # Create Expert Agent specialized for this pattern
            expert_agent = ExpertAgent(
                api_client=expert_api_client,
                model=expert_model,
                name=f"ExpertAgent_{task.pattern}_{task.id}"
            )
            
            # Create Judge Agent for this pattern
            judge_agent = JudgeAgent(
                api_client=judge_api_client,
                model=judge_model,
                name=f"JudgeAgent_{task.pattern}_{task.id}"
            )
            
            task.expert_agent = expert_agent
            task.judge_agent = judge_agent
            
            # Log allocation
            expert_agent.add_message("info", f"Allocated to task {task.id} for pattern {task.pattern}")
            judge_agent.add_message("info", f"Allocated to task {task.id} for pattern {task.pattern}")
        
        return tasks
    
    def check_defects_exist(self, context: Dict[str, Any]) -> bool:
        """
        Check if there are any defects in the Defect_Highlight results
        
        :param context: Execution context containing facts with Defect_Highlight
        :return: True if defects exist, False otherwise
        """
        facts = context.get("facts", {})
        defect_highlight = facts.get("Defect_Highlight", {})
        all_defects = defect_highlight.get("defects", [])
        
        # 检查是否有实际的缺陷
        has_defects = len(all_defects) > 0
        
        print(f"[INFO] Defect Highlight检查结果: 发现 {len(all_defects)} 个缺陷")
        if not has_defects:
            print("[INFO] 没有发现缺陷，将跳过Expert-Judge分析")
        
        return has_defects
    
    def setup_workflow(self, strategy_json: str, context: Dict[str, Any] = None) -> List[Task]:
        """
        Complete workflow setup from strategy JSON
        
        :param strategy_json: JSON string from plan agent
        :param context: Optional execution context to check for defects
        :return: List of allocated tasks (empty if no defects found)
        """
        # 如果提供了context，先检查是否有缺陷
        if context is not None:
            self.has_defects = self.check_defects_exist(context)
            if not self.has_defects:
                print("[INFO] 由于没有发现缺陷，跳过任务分配")
                self.tasks = []
                return []
        
        # Parse strategy
        strategy_output = self.parse_strategy_output(strategy_json)
        
        # Create tasks
        tasks = self.create_tasks_from_strategy(strategy_output)
        
        # Validate task constraints
        self._validate_tasks(tasks)
        
        # Allocate agents
        tasks = self.allocate_agents(tasks)
        
        # Store tasks
        self.tasks = tasks
        self.has_defects = True  # If we reach here, we assume there are defects to analyze
        
        return tasks
    
    def _validate_tasks(self, tasks: List[Task]):
        """
        Validate tasks meet the constraints
        """
        if len(tasks) > 25:
            raise ValueError(f"Too many tasks: {len(tasks)} > 25 maximum")
        
        # Check that each task has only one pattern type
        for task in tasks:
            if not task.pattern:
                raise ValueError(f"Task {task.id} missing pattern type")
            
            if not task.variables:
                raise ValueError(f"Task {task.id} has no variables assigned")
        
        # Verify no pattern mixing within tasks (should be guaranteed by strategy)
        pattern_counts = {}
        for task in tasks:
            if task.pattern not in pattern_counts:
                pattern_counts[task.pattern] = 0
            pattern_counts[task.pattern] += 1
    
    def _filter_defects_for_task(self, task: Task, context: Dict[str, Any]) -> List[Dict[str, Any]]:
        """
        Filter defects from Defect_Highlight results based on task variables
        
        :param task: Task with assigned variables
        :param context: Execution context containing facts with Defect_Highlight
        :return: List of defects relevant to this task's variables
        """
        # Get Defect_Highlight data from facts
        facts = context.get("facts", {})
        defect_highlight = facts.get("Defect_Highlight", {})
        all_defects = defect_highlight.get("defects", [])
        
        print(f"[DEBUG] _filter_defects_for_task: task variables = {task.variables}")
        print(f"[DEBUG] _filter_defects_for_task: facts keys = {list(facts.keys())}")
        print(f"[DEBUG] _filter_defects_for_task: defect_highlight keys = {list(defect_highlight.keys()) if defect_highlight else 'None'}")
        print(f"[DEBUG] _filter_defects_for_task: all_defects count = {len(all_defects)}")
        
        if not all_defects:
            print(f"[DEBUG] _filter_defects_for_task: No defects found, returning empty list")
            return []
        
        # Filter defects that involve any of the task's variables
        task_defects = []
        for i, defect in enumerate(all_defects):
            shared_variable = defect.get("sharedVariable", "")
            print(f"[DEBUG] _filter_defects_for_task: defect {i+1}: sharedVariable = '{shared_variable}'")
            # Check if this defect involves any of the task's variables
            if shared_variable in task.variables:
                print(f"[DEBUG] _filter_defects_for_task: defect {i+1} matches task variable, adding to task_defects")
                task_defects.append(defect)
            else:
                print(f"[DEBUG] _filter_defects_for_task: defect {i+1} does not match any task variable")
        
        print(f"[DEBUG] _filter_defects_for_task: returning {len(task_defects)} filtered defects")
        return task_defects
    
    def _format_defects_for_context(self, defects: List[Dict[str, Any]]) -> str:
        """
        Format defects for inclusion in expert agent context
        
        :param defects: List of filtered defects
        :return: Formatted string describing the defects
        """
        if not defects:
            return "No specific defects highlighted for the assigned variables."
        
        formatted_lines = ["Defect Highlight Results for assigned variables:"]
        
        for i, defect in enumerate(defects, 1):
            variable = defect.get("sharedVariable", "unknown")
            defect_type = defect.get("type", "unknown")
            access_pattern = defect.get("accessPattern", [])
            lines = defect.get("lines", [])
            array_info = defect.get("arrayInfo", [])
            is_array_access = defect.get("isArrayAccess", [])
            
            formatted_lines.append(f"  Defect {i}:")
            formatted_lines.append(f"    Variable: {variable}")
            formatted_lines.append(f"    Pattern: {defect_type}")
            formatted_lines.append(f"    Access Pattern: {' -> '.join(access_pattern)}")
            formatted_lines.append(f"    Line Numbers: {', '.join(map(str, lines))}")
            
            # 添加数组索引信息
            if is_array_access and array_info and len(is_array_access) == len(array_info):
                array_indices = []
                for k, (is_array, info) in enumerate(zip(is_array_access, array_info)):
                    if is_array and info and info.strip():
                        # 解析数组信息格式 "dim][index" -> "array[dim][index"
                        if '][' in info:
                            array_indices.append(f"{variable}[{info}")
                        else:
                            array_indices.append(f"{variable}[{info}]")
                    else:
                        array_indices.append("-")
                
                if any(idx != "-" for idx in array_indices):
                    formatted_lines.append(f"    Array Indices: {', '.join(array_indices)}")
            
            formatted_lines.append("")
        
        return "\n".join(formatted_lines)
    
    async def execute_task(self, task: Task, context: Dict[str, Any]) -> Dict[str, Any]:
        """
        Execute a single task with its Expert-Judge pair
        
        :param task: Task to execute
        :param context: Execution context (code, operations, etc.)
        :return: Task execution result
        """
        task.status = TaskStatus.RUNNING
        
        try:
            # Build task-specific context with variables_text
            task_context = context.copy()
            task_context["variables_text"] = ", ".join(task.variables)
            
            # Filter defects relevant to this task's variables
            task_defects = self._filter_defects_for_task(task, context)
            task_context["defects_text"] = self._format_defects_for_context(task_defects)
            task_context["defects_data"] = task_defects  # Raw data for potential future use
            
            # Also ensure other required context fields exist
            if "code_str" not in task_context:
                task_context["code_str"] = task_context.get("code", "")
            if "operations_text" not in task_context:
                task_context["operations_text"] = str(task_context.get("operations", {}))
            
            # Load expert prompts for this pattern
            expert_prompts = task.expert_agent.load_expert_prompts(task.pattern)
            if not expert_prompts:
                raise ValueError(f"Failed to load expert prompts for pattern {task.pattern}")
            
            # Build user prompt for expert
            expert_user_prompt = task.expert_agent.build_expert_user_prompt(task_context)
            
            # Expert analysis
            expert_result = await task.expert_agent.analyze_async(
                expert_prompts["system_prompt"], 
                expert_user_prompt
            )
            
            # Load judge prompts
            judge_system_prompt = task.judge_agent.load_judge_prompts_with_pattern(
                expert_prompts["pattern_info"]
            )
            
            # Prepare judge history with expert result
            judge_history = f"[Expert Analysis]\n{expert_result}\n"
            
            # Build user prompt for judge
            judge_user_prompt = task.judge_agent.build_judge_user_prompt(
                task_context, judge_history
            )
            
            # Judge analysis
            judge_result = await task.judge_agent.judge_async(
                judge_system_prompt,
                judge_user_prompt
            )
            
            # Compile results
            result = {
                "task_id": task.id,
                "pattern": task.pattern,
                "variables": task.variables,
                "expert_analysis": expert_result,
                "judge_decision": judge_result,
                "status": "completed"
            }
            
            # 在控制台显示expert/judge的输出
            print(f"\n{'='*60}")
            print(f"Task {task.id} ({task.pattern}) - Expert Analysis:")
            print(f"{'='*60}")
            print(f"Expert Analysis:\n{expert_result}")
            print(f"\n{'='*60}")
            print(f"Task {task.id} ({task.pattern}) - Judge Decision:")
            print(f"{'='*60}")
            print(f"Judge Decision:\n{judge_result}")
            print(f"{'='*60}\n")
            
            task.result = result
            task.status = TaskStatus.COMPLETED
            
            return result
            
        except Exception as e:
            error_msg = f"Task {task.id} failed: {str(e)}"
            task.error = error_msg
            task.status = TaskStatus.FAILED
            
            return {
                "task_id": task.id,
                "pattern": task.pattern,
                "variables": task.variables,
                "status": "failed",
                "error": error_msg
            }
    
    async def execute_all_tasks(self, context: Dict[str, Any]) -> WorkflowResult:
        """
        Execute all allocated tasks concurrently
        
        :param context: Execution context shared across all tasks
        :return: Aggregated workflow results
        """
        # 如果没有缺陷，直接返回空结果
        if not self.has_defects:
            print("[INFO] 没有缺陷需要分析，直接返回空结果")
            return WorkflowResult(
                total_tasks=0,
                completed_tasks=0,
                failed_tasks=0,
                results=[],
                errors=[]
            )
        
        if not self.tasks:
            raise ValueError("No tasks allocated. Call setup_workflow first.")
        
        # Create semaphore to limit concurrent tasks
        semaphore = asyncio.Semaphore(self.max_concurrent_tasks)
        
        async def execute_with_semaphore(task):
            async with semaphore:
                return await self.execute_task(task, context)
        
        # Execute all tasks concurrently
        results = await asyncio.gather(
            *[execute_with_semaphore(task) for task in self.tasks],
            return_exceptions=True
        )
        
        # Process results
        completed_results = []
        errors = []
        completed_count = 0
        failed_count = 0
        
        for i, result in enumerate(results):
            if isinstance(result, Exception):
                error_msg = f"Task {self.tasks[i].id} exception: {str(result)}"
                errors.append(error_msg)
                failed_count += 1
            elif result.get("status") == "completed":
                completed_results.append(result)
                completed_count += 1
            else:
                errors.append(result.get("error", f"Task {result.get('task_id')} failed"))
                failed_count += 1
        
        return WorkflowResult(
            total_tasks=len(self.tasks),
            completed_tasks=completed_count,
            failed_tasks=failed_count,
            results=completed_results,
            errors=errors
        )
    
    def get_task_status(self) -> Dict[str, Any]:
        """
        Get current status of all tasks
        
        :return: Status summary
        """
        status_summary = {
            "total_tasks": len(self.tasks),
            "pending": sum(1 for t in self.tasks if t.status == TaskStatus.PENDING),
            "running": sum(1 for t in self.tasks if t.status == TaskStatus.RUNNING),
            "completed": sum(1 for t in self.tasks if t.status == TaskStatus.COMPLETED),
            "failed": sum(1 for t in self.tasks if t.status == TaskStatus.FAILED),
            "tasks": [
                {
                    "id": task.id,
                    "pattern": task.pattern,
                    "variables": task.variables,
                    "status": task.status.value,
                    "error": task.error
                }
                for task in self.tasks
            ]
        }
        
        return status_summary
    
    def reset(self):
        """
        Reset the workflow manager for a new run
        """
        self.tasks.clear()
        self.has_defects = False

# Usage example and factory function
def create_workflow_manager(api_client, model) -> WorkflowManager:
    """
    Factory function to create a WorkflowManager instance
    
    :param api_client: APIClient instance
    :param model: Model to use
    :return: WorkflowManager instance
    """
    return WorkflowManager(api_client, model) 

# Example usage with defect checking:
"""
# 创建WorkflowManager
workflow_manager = create_workflow_manager(api_client, model)

# 准备上下文（包含Defect_Highlight结果）
context = {
    "code": code_str,
    "operations": operations_data,
    "facts": {
        "Defect_Highlight": {
            "defects": []  # 如果为空列表，将跳过expert-judge分析
        }
    }
}

# 设置工作流程（如果没有缺陷，将返回空任务列表）
tasks = workflow_manager.setup_workflow(strategy_json, context)

if not tasks:
    print("没有发现缺陷，跳过分析")
else:
    # 执行分析
    result = await workflow_manager.execute_all_tasks(context)
""" 