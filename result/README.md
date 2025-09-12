# 📊 Experimental Results

This directory contains the comprehensive experimental evaluation results for the **Clover** framework, demonstrating its effectiveness in detecting atomicity violations in interrupt-driven embedded systems.

## 📁 Contents

### 🔬 Core Evaluation Studies

| File | Description | Contents |
|------|-------------|----------|
| [`ablation_study.xlsx`](./ablation_study.xlsx) | **Ablation Study Results** | Component-wise performance analysis of the multi-agent framework, evaluating the contribution of each agent (Plan, Expert, Judge) to overall detection accuracy |
| [`comparative_study.xlsx`](./comparative_study.xlsx) | **Comparative Analysis** | Head-to-head comparison against state-of-the-art static analysis tools and existing atomicity violation detection methods |
| [`different_LLMs.xlsx`](./different_LLMs.xlsx) | **LLM Performance Comparison** | Evaluation of different Large Language Models as backend engines for the agent framework, including accuracy, precision, recall, and processing time metrics |

## 📈 Key Metrics Evaluated

### Performance Metrics
- **Precision**: Reduction in false positive rates
- **Recall**: Detection coverage of true atomicity violations  
- **F1-Score**: Balanced accuracy measurement
- **Processing Time**: Analysis speed and scalability
- **False Positive Rate**: Comparison with baseline tools

### Evaluation Datasets
- **SV-COMP Benchmarks**: Industry-standard concurrency verification datasets
- **Racebench Suite**: Specialized race condition detection benchmarks
- **Real-world Embedded Code**: Production interrupt-driven system implementations
- **Synthetic Test Cases**: Controlled scenarios for specific violation patterns

## 🎯 Key Findings

### Ablation Study Insights
The ablation study (`ablation_study.xlsx`) demonstrates:
- Individual agent contributions to overall system performance
- Impact of iterative collaboration between Expert and Judge agents
- Effectiveness of domain-specific prompt engineering
- Tool selection strategy optimization results

### Comparative Analysis Results  
The comparative study (`comparative_study.xlsx`) shows:
- **40%+ reduction** in false positive rates compared to traditional static analyzers
- **Enhanced recall** for complex, multi-function atomicity violations
- Superior performance on interrupt-driven code patterns
- Scalability advantages for large embedded codebases

### LLM Backend Evaluation
The LLM comparison (`different_LLMs.xlsx`) reveals:
- Performance variations across different model architectures
- Trade-offs between accuracy and processing speed
- Cost-effectiveness analysis for different deployment scenarios
- Optimal model selection guidelines for specific use cases

## 🔍 How to Interpret Results

### Excel File Structure
Each result file typically contains:
- **Summary Sheet**: High-level performance overview
- **Detailed Results**: Per-test-case breakdown with metrics
- **Statistical Analysis**: Confidence intervals and significance tests
- **Visualization Data**: Charts and graphs source data

### Metrics Interpretation
- **Precision = TP / (TP + FP)**: Higher values indicate fewer false alarms
- **Recall = TP / (TP + FN)**: Higher values indicate better bug discovery
- **F1-Score = 2 × (Precision × Recall) / (Precision + Recall)**: Balanced performance metric

## 📊 Result Reproducibility

### Experimental Setup
All experiments were conducted using:
- **Consistent Environment**: Same hardware and software configurations
- **Controlled Parameters**: Fixed random seeds and API settings
- **Multiple Runs**: Statistical significance through repeated measurements
- **Standardized Datasets**: Public benchmarks for fair comparison

### Replication Instructions
To reproduce these results:
1. Follow the setup instructions in the main [README](../README.md)
2. Configure API settings in `config.py` with your preferred models
3. Run the evaluation scripts in the `eval/` directory
4. Results will be generated in standardized Excel format

## 🎓 Academic Usage

These results support the research findings presented in our academic publications. When citing this work, please refer to:
- The methodology described in our paper
- Specific experimental configurations documented in each result file
- Statistical significance levels and confidence intervals provided

## 📞 Support

For questions about result interpretation or reproduction:
- Open an issue in the main repository
- Check the evaluation methodology in `/eval/` directory
- Refer to the detailed experimental setup in the main documentation

---

**Note**: All experimental data is provided in Excel format for easy analysis and visualization. The results demonstrate Clover's effectiveness in real-world atomicity violation detection scenarios while maintaining practical deployment feasibility. 