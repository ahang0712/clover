# config.py

# 模型路径（本地模型路径）
MODEL_PATH = "/mnt/dolphinfs/hdd_pool/docker/share/huggingface.co/Qwen/Qwen2.5-Math-7B-Instruct"

# 模型类型选择（'local' 或 'online'）
MODEL_TYPE = "online"  # 如果使用在线模型，设置为 "online"；本地模型设置为 "local"

# API 配置（仅用于在线模型）

API_MODEL = "deepseek-r1-friday"
# API_MODEL = "anthropic.claude-opus-4"
# API_MODEL = "deepseek-ai/DeepSeek-V3"


# 文件路径配置
BASE_SRC_PATH = '/Users/hehang03/code/clover/dataset/c-src/'
RESULT_PATH = '/Users/hehang03/code/clover/dataset/c-src/result-1'
RESPONSE_PATH = '/Users/hehang03/code/clover/dataset/c-src/response-1/qwen3-235b'
