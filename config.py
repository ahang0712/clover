# config.py

# 模型路径（本地模型路径）
MODEL_PATH = "/mnt/dolphinfs/hdd_pool/docker/share/huggingface.co/Qwen/Qwen2.5-Math-7B-Instruct"

# 模型类型选择（'local' 或 'online'）
MODEL_TYPE = "online"  # 如果使用在线模型，设置为 "online"；本地模型设置为 "local"

# API 配置（仅用于在线模型）
API_HOST = "https://aigc.sankuai.com/v1/openai/native"
# API_HOST = "us.ifopen.ai"
API_MODEL = "gpt-4.1"
# API_MODEL = "anthropic.claude-opus-4"
# API_MODEL = "deepseek-ai/DeepSeek-V3"

# 多个API密钥
API_KEYS = [
    "1895345305106186257",
    "1895345305298714671",
    "1895345358939709463",
    "1895345420105261077",
    "1734415800163192918"
]

# 兼容旧代码
API_AUTH = API_KEYS[0]  # 默认使用第一个密钥

# 文件路径配置
BASE_SRC_PATH = './dataset/c-src/'
RESULT_PATH = './dataset/c-src/result-1'
RESPONSE_PATH = './dataset/c-src/response-1/qwen3-235b'

NUM_RESPONSES = 1
MAX_NEW_TOKENS = 1024
BATCH_SIZE = 32  # 每次处理的prompt数量