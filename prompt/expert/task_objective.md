### Task Objective:
- Analyze provided C code to detect single-variable atomicity violations involving global shared variables in interrupt-driven programs, focusing exclusively on the {pattern_name} pattern.

### Key Considerations:
1. **Program Architecture**:
- The program consists of a main function and Interrupt Service Routines (ISRs).
- The main function executes sequentially, is not periodic, and runs only once.

2. **Interrupt Characteristics**:
- **Interrupt Priority**: Higher numerical values denote higher priority (e.g. priority 0 < priority 1 < priority 2).
- **Interrupt Nesting**: High-priority ISRs can preempt lower-priority ISRs and the main function.
- **Interrupt Timing**: Interrupt timing can occur multiple times at any point during the program's execution.