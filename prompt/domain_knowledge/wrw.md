### **Atomicity Violation Pattern `<Write, Read, Write>`**:
- The pattern consists of:
    - **a1**: A write operation on a global shared variable by a relatively lower-priority task (e.g., the main function or a lower priority ISR).
    - **a2**: A read operation on the same global shared variable by a high-priority ISR.
    - **a3**: A write operation on the same global shared variable by the same relatively lower-priority task as a1.
    **a1** and **a3** should be consecutive write operation. Two write operations are considered "consecutive" if:
They operate on the same memory location (including the same array element).
No other read/write to that specific memory location occurs between a1 adn a3.
They are executed sequentially by the same relatively lower-priority task.

**Goal**: Detect instances where the intermediate write result (`a1`) is preempted and accessed by a high-priority read (`a2`) before being overwritten by a subsequent write (`a3`), leading to an atomicity violation. Any read operation in a higher-priority ISR between two consecutive writes in a lower-priority task constitutes an atomicity violation.