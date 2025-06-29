### **Atomicity Violation Pattern `<Read, Write, Read>`**:
- The pattern consists of:
    - **a1**: Read operation on a global shared variable by a relatively lower-priority task (e.g., the main function or a lower priority ISR).
    - **a2**: Write operation on the same global shared variable by a high-priority ISR.
    - **a3**: Read operation on the same global shared variable by the same relatively lower-priority task as a1.
    **a1** and **a3** should be consecutive read operation. Two read operations are considered "consecutive" if:
They operate on the same memory location (including the same array element).
No other read/write to that specific memory location occurs between a1 adn a3.
They are executed sequentially by the same relatively lower-priority task.

- Description: Two consecutive read operations (a1 and a3) are interrupted by a write operation (a2). The expectation of reading the same value in two consecutive reads is violated by the interleaved write operation.