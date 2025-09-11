# config.py

# Model path (local model path)
MODEL_PATH = "/path/to/your/local/model/Qwen2.5-Math-7B-Instruct"

# Model type selection ('local' or 'online')
MODEL_TYPE = "online"  # Set to 'online' for online models; set to 'local' for local models

# API configuration (for online models only)
API_HOST = "your_host"
# API_HOST = "us.ifopen.ai"
# API_MODEL = "gpt-4.1"
# API_MODEL = "anthropic.claude-3.5-sonnet"
# API_MODEL = "anthropic.claude-opus-4"
API_MODEL = "anthropic.claude-4-sonnet"
# API_MODEL = "kimi-k2-instruct-example"
# API_MODEL = "qwen-max-latest"
# API_MODEL = "deepseek-v3-friday"
# API_MODEL = "gemini-2.5-pro"
# API_MODEL = "LongCat-Large-32K-Chat"

# Model configuration for different Agents
AGENT_MODELS = {
    "plan": "anthropic.claude-sonnet-4",    # Plan Agent uses Claude-4-Sonnet
    "expert": "anthropic.claude-sonnet-4",  # Expert Agent uses Claude-4-Sonnet
    "judge": "anthropic.claude-sonnet-4",    # Judge Agent uses Claude-4-Sonnet
    # "plan": "anthropic.claude-3.5-sonnet",  
    # "expert": "anthropic.claude-3.5-sonnet",  # Expert Agent uses Claude-3.5-Sonnet
    # "judge": "anthropic.claude-3.5-sonnet"    # Judge Agent uses Claude-3.5-Sonnet
    # "plan": "LongCat-Large-32K-Chat",
    # "expert": "LongCat-Large-32K-Chat",
    # "judge": "LongCat-Large-32K-Chat"
    # "plan": "qwen-max-latest",
    # "expert": "qwen-max-latest",
    # "judge": "qwen-max-latest"
    # "plan": "anthropic.claude-3.5-sonnet",
    # "expert": "anthropic.claude-3.5-sonnet",
    # "judge": "anthropic.claude-3.5-sonnet"
    # "plan": "kimi-k2-instruct-example",
    # "expert": "kimi-k2-instruct-example",
    # "judge": "kimi-k2-instruct-example"
    # "plan": "gemini-2.5-pro",
    # "expert": "gemini-2.5-pro",
    # "judge": "gemini-2.5-pro"
    # "plan": "deepseek-v3-friday",
    # "expert": "deepseek-v3-friday",
    # "judge": "deepseek-v3-friday"
    # "plan": "gpt-4o-2024-11-20",
    # "expert": "gpt-4o-2024-11-20",
    # "judge": "gpt-4o-2024-11-20"
    # "plan":"glm-4.5",
    # "expert":"glm-4.5",
    # "judge":"glm-4.5"
}

# Multiple API keys (example keys, please replace with your actual keys)
API_KEYS = [
    # Example API keys
    "your_key_1",
    "your_key_2",
    "your_key_3",
    "your_key_4",
    "your_key_5",
    "your_key_6",
    "your_key_7",
    "your_key_8",
    "your_key_9",
    "your_key_10"
]

# Compatibility with legacy code
API_AUTH = API_KEYS[0]  # Use first key by default

# File path configuration
BASE_SRC_PATH = './dataset/c-src/'
RESPONSE_PATH = './output/claude-4-sonnet'
NUM_RESPONSES = 1
MAX_NEW_TOKENS = 65536
# MAX_NEW_TOKENS = 8192
BATCH_SIZE = 32 