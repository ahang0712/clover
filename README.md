# <img src="assets/icon.svg" alt="Project logo" width="100"> Clover: Automated Detection of Atomicity Violations in Interrupt-Driven Systems

<p align="center">
    <a href="https://arxiv.org/pdf/2504.00521"><img src="https://img.shields.io/badge/arXiv-2504.08001-a55fed.svg"></a>
    <a href="https://huggingface.co/datasets/ahang518/Racebench"><img src="https://img.shields.io/badge/🤗%20Hugging%20Face-Racebench-%23ff8811.svg"></a>
    <img src="https://img.shields.io/badge/LLVM-10.0.0-blue.svg">
    <img src="https://img.shields.io/badge/Python-3.10+-green.svg">
</p>

![Framework](assets/overview.png)

## 🎯 About

**Clover** is a cutting-edge framework that integrates **static analysis tools** with **collaborative LLM agents** to detect atomicity violations in interrupt-driven embedded systems. Through iterative multi-agent collaboration, it addresses the fundamental challenges of concurrency bug detection in critical applications where traditional approaches fall short due to:

- **Vast program state spaces** in interrupt-driven environments
- **Complex inter-function dependencies** across ISR boundaries  
- **Domain-specific knowledge** required for embedded system analysis
- **High false-positive rates** in existing static analysis tools

### Key Innovation
Clover employs a **multi-agent collaborative framework** with iterative refinement:
1. **Plan Agent** - Orchestrates program analysis tool selection and subsequent agentic workflow
2. **Expert Agent** - Generates atomicity violation defect reports based on domain knowledge
3. **Judge Agent** - Validates detected defect reports through execution trace analysis
4. **Iterative Refinement** - Expert and Judge agents collaborate until consensus or iteration limit

> [!IMPORTANT]
> 🚧 **Active Development**: We are continuously improving documentation and adding new features. Stay tuned for updates!

**Contact:** [Hang He](mailto:hang.he@stu.ecnu.edu.cn), [Chengcheng Wan](https://chengcheng-wan.github.io/)

## 📰 News
- **[2025.04.01]** 📄 Paper published on [ArXiv](https://arxiv.org/pdf/2504.00521.pdf)

## ✨ Key Features

- **🤖 Multi-Agent Architecture**: Expert and Judge agents collaborate through structured reasoning
- **📝 Prompt-Driven Design**: Markdown-based prompts, categorized by role and easily customizable
- **🧩 Modular Framework**: Clean separation of concerns with logical module organization
- **🔧 Easy Extension**: Straightforward addition of new atomicity patterns and agent types
- **🔄 Reproducible Results**: Centralized configuration and transparent prompt management
- **🎯 High Precision**: Advanced filtering reduces false positives significantly

## 🚀 Quick Start

### Prerequisites
- **Python 3.10+**
- **LLVM 10.0.0** (for static analysis)
- **Conda** (recommended for environment management)

### Installation

**Step 1: Environment Setup**
```bash
git clone https://github.com/your-repo/clover.git
cd clover

# Create and activate conda environment
conda create -n clover python=3.10 -y
conda activate clover

# Install Python dependencies
pip install -r requirements.txt
```

**Step 2: LLVM Installation**
```bash
# Download required components
wget https://mirrors.tuna.tsinghua.edu.cn/llvm/releases/10.0.0/llvm-10.0.0.src.tar.xz
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang-10.0.0.src.tar.xz
wget https://github.com/Kitware/CMake/releases/download/v3.13.0/cmake-3.13.0-Linux-x86_64.tar.gz

# Extract archives
tar -xf llvm-10.0.0.src.tar.xz
tar -xf clang-10.0.0.src.tar.xz  
tar -xf cmake-3.13.0-Linux-x86_64.tar.gz

# Setup LLVM structure
mv clang-10.0.0.src llvm-10.0.0.src/tools/clang
export PATH=/path/to/cmake-3.13.0-Linux-x86_64/bin:$PATH

# Build LLVM (this takes time!)
mkdir /path/to/llvm-build-10 && cd /path/to/llvm-build-10
cmake -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/path/to/llvm-10.0.0 \
  ../llvm-10.0.0.src

make -j$(nproc) && make install
```

**Step 3: Build Analysis Tools**
```bash
cd clover/tool/Read_Write_Analyzer

clang++ main.cpp tool.cpp cJSON.c -o analyzer \
  `llvm-config --cxxflags --ldflags --libs all` \
  -I. -std=c++17 \
  -lstdc++ -lz -lrt -ldl -lpthread -lm
```

**Step 4: Run Clover**
```bash
# Return to project root
cd ../../..

# Run the framework
python main.py
```

### Example Usage
```bash
# Analyze a C source file
clang -O0 -g -emit-llvm -S target_file.c -o target_file.ll
opt -O2 target_file.ll -S -o target_file-opt.ll

# Run Clover analysis
python main.py --input target_file-opt.ll --output results/
```

## 🏗️ Architecture

### Framework Overview
```mermaid
graph TD
    A[Source Code] --> B[Plan Agent]
    B --> C[Tool Manager]
    C --> D[Code Extractor]
    C --> E[Defect Highlighter] 
    C --> F[Operation Analyzer]
    C --> G[Control Flow Analyzer]
    D --> H[Expert Agent]
    E --> H
    F --> H
    G --> H
    H --> I[Judge Agent]
    I --> J{Consensus?}
    J -->|No| H
    J -->|Yes| K[Defect Report]
```

### Multi-Agent Collaborative Architecture

#### 1. **Plan Agent**
- **Workflow Strategy**: Coordinates task management and agent interaction
- **Tool Selection**: On-demand invocation of static analysis tools
- **Code Summary**: Provides contextual information for subsequent agents

#### 2. **Static Analysis Tools** (Tool Manager)
- **Code Extractor**: Identifies shared resources and extracts critical code snippets
- **Defect Highlighter**: Enhanced pattern matching with semantic array index analysis
- **Operation Analyzer**: Memory access pattern detection and classification
- **Control Flow Analyzer**: Basic block-level path analysis and loop detection

#### 3. **Expert Agent**
- **Domain Knowledge**: Embedded systems and interrupt-driven programming expertise
- **AV Pattern Recognition**: Identifies RWR, WRW, WWR, and RWW violation patterns
- **Defect Report Generation**: Creates structured violation reports with evidence

#### 4. **Judge Agent**
- **Execution Trace Validation**: Analyzes program execution paths and feasibility
- **Evidence Assessment**: Validates expert findings through trace analysis
- **Iterative Refinement**: Collaborates with Expert Agent until consensus

## 📁 Project Structure

```
clover/
├── 📄 main.py                        # Main entry point
├── ⚙️ config.py                      # Configuration management
├── 🛠️ utils.py                       # Utility functions
├── 📊 code_parser.py                 # Code parsing logic
├── 🔍 defect_patterns.py             # Atomicity violation patterns
├── 🌐 api_client.py                  # LLM API client
├── 🤖 agent/                         # Multi-agent system
│   ├── agent_base.py                # Base agent class
│   ├── plan_agent.py                # Planning agent
│   ├── conversation_manager.py      # Conversation management
│   └── judge_agent.py               # Validation agent
├── 🔧 preprocessing/                 # Code preprocessing
│   ├── core/                        # Core functionality
│   ├── analyzers/                   # Analysis modules
│   └── tests/                       # Unit tests
├── 💬 prompt/                        # LLM prompt templates
│   ├── common/                      # Shared prompts
│   ├── expert/                      # Expert agent prompts
│   └── judge/                       # Judge agent prompts
├── 🔍 tool/                          # Static analysis tools
│   ├── Code_Extractor/             # Shared resource identification
│   ├── Defect_Highlighter/         # Enhanced pattern matching
│   ├── Operation_Analyzer/         # Memory access analysis  
│   ├── Control_Flow_Analyzer/      # Basic block analysis
│   └── runner.py                   # Tool manager and orchestrator
├── 📊 dataset/                       # Benchmark datasets
├── 📈 results/                       # Analysis results
└── 📋 requirements.txt               # Dependencies
```

## 🔬 Technical Highlights

### Enhanced Static Analysis Tools
- **Semantic Array Index Matching**: Handles `arr[i]` vs `arr[9999]` equivalence in loops
- **TRIGGER Value Recognition**: Identifies test-specific access patterns  
- **Control Flow Precision**: Distinguishes mandatory vs conditional operations
- **ISR-Aware Analysis**: Embedded system interrupt handling expertise

### Multi-Agent Workflow
- **Iterative Collaboration**: Expert and Judge agents repeat analysis until consensus
- **Domain-Specific Reasoning**: Embedded systems knowledge integrated throughout
- **Conversation Management**: Structured dialogue between agents with result tracking
- **Adaptive Tool Selection**: Plan agent selects appropriate analysis tools on-demand

## 📊 Evaluation

Clover has been evaluated on:
- **SV-COMP Benchmarks**: Industry-standard concurrency datasets
- **Real-world Embedded Systems**: Production interrupt-driven applications
- **Comparative Analysis**: Against state-of-the-art static analysis tools

Key improvements:
- **🎯 Higher Precision**: 40%+ reduction in false positives
- **🔍 Better Recall**: Enhanced detection of complex violation patterns  
- **⚡ Practical Applicability**: Handles large-scale embedded codebases

## 🤝 Contributing

We welcome contributions! Please see our [Contributing Guidelines](CONTRIBUTING.md) for details.

### Development Setup
```bash
# Install development dependencies
pip install -r requirements-dev.txt

# Run tests
python -m pytest preprocessing/tests/

# Code formatting
black . && isort .
```

## 📚 Citation

If you use Clover in your research, please cite our paper:

```bibtex
@article{he2024clover,
  title={Clover: Automated Detection of Atomicity Violations in Interrupt-Driven Systems},
  author={He, Hang and Wan, Chengcheng},
  journal={arXiv preprint arXiv:2504.00521},
  year={2024}
}
```

## 🙏 Acknowledgments

We sincerely thank the following projects for their valuable contributions:
- [**Racebench**](https://github.com/chenruibuaa/racebench) - Benchmark datasets
- [**CPA4AV**](https://github.com/BinYu-Xidian-University/CPA4AV) - Atomicity violation detection
- [**intAtom**](https://github.com/wangilson/Atom) - Interrupt-aware analysis

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
<p align="center">
  <b>🌟 Star us on GitHub if you find Clover useful! 🌟</b>
</p>
