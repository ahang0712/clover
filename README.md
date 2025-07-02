# <img src="assets/icon.svg" alt="Project logo" width="120"> Automated detection of atomicity violations in large-scale systems

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
