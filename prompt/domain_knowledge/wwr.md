### **Atomicity Violation Pattern `<Write, Write, Read>`**:
- The pattern consists of:
    - **a1**: A write operation on a global shared variable by a relatively lower-priority task (can be main function or a lower priority ISR).
    - **a2**: A write operation on the same global shared variable by a high-priority ISR.
    - **a3**: A read operation on the same global shared variable by the same relatively lower-priority task as a1.
    **a1** and **a3** should be consecutive. The write and read operations are considered "consecutive" if:
They operate on the same memory location (including the same array element).
No other read/write to that specific memory location occurs between a1 adn a3.
They are executed sequentially by the same relatively lower-priority task.
**Goal**: Detect instances where a local read `a3` follows a write operation `a1` and is interrupted by another write operation `a2`. The expectation of the local read `a3` to read the assigned value is violated by the interleaved write operation. 