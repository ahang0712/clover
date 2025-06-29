### **Atomicity Violation Pattern `<Read, Write, Write>`**:
- The pattern consists of:
    - **a1**: Read operation on a global shared variable by a relatively lower-priority task (can be main function or a lower priority ISR).
    - **a2**: Write operation on the same global shared variable by a higher-priority ISR.
    - **a3**: Write operation on the same global shared variable by the same relatively lower-priority task as a1.
    **a1** and **a3** should be consecutive. The read and write operations are considered "consecutive" if:
They operate on the same memory location (including the same array element).
No other read/write to that specific memory location occurs between a1 adn a3.
They are executed sequentially by the same relatively lower-priority task.

- Description: A local write follows a read operation and is interrupted by another write operation. The local write operation depends on the value read by the local read operation (e.g., conditional branch based on the read value), and the interleaved write modifies this value.