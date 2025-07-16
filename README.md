# <img src="assets/icon.svg" alt="Project logo" width="100"> Automated detection of atomicity violations in large-scale systems

<p align="center">
    <a href="https://arxiv.org/pdf/2504.00521"><img src="https://img.shields.io/badge/arXiv-2504.08001-a55fed.svg"></a>
    <a href="https://huggingface.co/datasets/ahang518/Racebench"><img src="https://img.shields.io/badge/🤗%20Hugging%20Face-Racebench-%23ff8811.svg"></a>
</p>

![Framework](assets/overview.png)

## About

Clover is a cutting-edge framework that integrates static analysis with large language model (LLM) agents to detect atomicity violations in interrupt-driven systems. Designed for critical embedded applications, Clover addresses the challenges of vast program state spaces, complex code dependencies, and domain-specific knowledge required to identify concurrency bugs.

> [!IMPORTANT]
> We are keeping improving the documents and supporting more features. Please stay tuned for the updates.

**Contact:** [Hang He](hang.he@stu.ecnu.edu.cn), [Chengcheng Wan](https://chengcheng-wan.github.io/).

## News
- [25.04.01] Paper released on [ArXiv](https://arxiv.org/pdf/2504.00521.pdf).

## Environment Setup

**Step 1**

```bash
cd clover
# Init Conda Env
conda create -n clover python=3.10 -y
conda activate clover
# Install Python dependencies
pip3 install -r requirements.txt
```

**Step 2**
```sh
python3 main.py
```

```sh
# Download LLVM-10.0.0
wget https://mirrors.tuna.tsinghua.edu.cn/llvm/releases/10.0.0/llvm-10.0.0.src.tar.xz
# Download Clang-10.0.0
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang-10.0.0.src.tar.xz
# Download CMake-3.13.0
wget https://github.com/Kitware/CMake/releases/download/v3.13.0/cmake-3.13.0-Linux-x86_64.tar.gz

tar -xf llvm-10.0.0.src.tar.xz
tar -xf clang-10.0.0.src.tar.xz
tar -xf cmake-3.13.0-Linux-x86_64.tar.gz

mv clang-10.0.0.src llvm-10.0.0.src/tools/clang
export PATH=/path/to/cmake-3.13.0-Linux-x86_64/bin:$PATH

mkdir /path/to/llvm-build-10
cd /path/to/llvm-build-10

cmake -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/path/to/llvm-10.0.0 \
  ../llvm-10.0.0.src

make -j$(nproc)    # 多核编译，时间较长
make install

clang++ main.cpp tool.cpp cJSON.c -o analyzer \
  `llvm-config --cxxflags --ldflags --libs all` \
  -I. -std=c++17 \
  -I/opt/rh/devtoolset-9/root/usr/include/c++/9 \
  -I/opt/rh/devtoolset-9/root/usr/include/c++/9/x86_64-redhat-linux \
  -L/opt/rh/devtoolset-9/root/usr/lib/gcc/x86_64-redhat-linux/9 \
  -L/opt/rh/devtoolset-9/root/usr/lib64 \
  -lstdc++ -lz -lrt -ldl -lpthread -lm
```

## Features
Multi-Agent: Expert and Judge agents interact and reason step by step.

Prompt-Driven: All prompts are written in Markdown, categorized by role and scenario, and easily editable.

Modular Design: Code is separated into logical modules for configuration, parsing, API interaction, and agents.

Easy Extension: Adding new atomicity patterns, prompts, or agent types is straightforward.

Reproducible and Maintainable: Central configuration, reusable utilities, and file-based prompt management for maximum transparency.

Directory Structure
```sh
clover/
├── main.py
├── config.py
├── utils.py
├── code_parser.py
├── defect_patterns.py
├── agent_base.py
├── expert_agent.py
├── judge_agent.py
├── api_client.py
├── output.py
├── prompt/
│   ├── common/
│   │   └── system_message.md
│   ├── expert/
│   │   ├── task_objective.md
│   │   ├── detection_rules.md
│   │   ├── rww_example.md
│   │   ├── wwr_example.md
│   │   ├── rwr_example.md
│   │   └── wrw_example.md
│   └── judge/
│       ├── judge_steps.md
├── tool/
│   ├── Analyzer/
│   │   ├── cJSON.c
│   │   ├── Makefile
│   │   ├── tool.cpp
│   │   └── main.cpp
│   ├── Callgraph/
│   └── Extractor/
├── dataset/
│   └── c-src/
│       └── SV-COMP-2022-Benchmark/
│           └── goblint-regression/
├── requriements.txt
└── README.md

```

Framework Architecture
Clover employs a three-layer architecture for detecting atomicity violation detection:

Code Extractor: Performs static analysis to identify shared resources and extract critical code snippets.

Expert Agent: Uses LLMs with domain knowledge to detect potential atomicity violations.

Judge Agent: Validates detected violations by analyzing execution traces and interrupt contexts.

## Acknowledgement
We sincerely thank these repositories for providing helpful open-source resources: [Racebench](https://github.com/chenruibuaa/racebench), [CPA4AV](https://github.com/BinYu-Xidian-University/CPA4AV), [intAtom](https://github.com/wangilson/Atom)
