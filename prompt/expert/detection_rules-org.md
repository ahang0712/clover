### Detection Rules:
1. **Inline Function Calls**:
- Identify the function definition and locate the function call within the code.
- Substitute the function call with the corresponding function body.
- Ensure that any parameters passed to the function are correctly replaced with the actual arguments used in the function call.

2. **Global Shared Variables**:
- Detect violations on each global shared variable, like primitive data types, arrays, pointers or struct members accessed by both the main function and ISRs.
- The three operations in the defect must operate on the same address space, For the Atomicity Violation Pattern <a1, a2, a3>:
    For struct: a1, a2, a3 must access the same member; for union: can be different members; for array: must be the same index; for pointer: focus on the pointed variable.
- Monitor every read and write operation on global shared variables and list each of their read and write operations.
- The initial value of initialized global variables is set to 0 by default.

3. **Compound Operations**:
- Decompose compound operations (e.g., x += 1, x++) into separate read and write.
- Identify potential points for atomicity violations in these decomposed operations.
- Check each compound operation for read and write vulnerabilities.

4. **Loop Analysis**:
    - When loop operations involve global shared variables, each independent read/write operation within the loop must be explicitly identified. 
    - Consider the sequence of loop variable initialization, condition check, loop body execution, and variable incrementation strictly in order. It is necessary to account for potential interruptions between each phase of the loop, as well as the possibility of interruptions spanning multiple iterations.
    - Account for interrupt interleavings during loop execution. 
    - Analyze initialization, condition checks, body execution, and updates.
    - Each loop iteration may contain atomicity violations if interrupts preempt the critical sections.
    - When analyzing conditional statements (if-else), consider all possible branches and their impact on the execution path.
    - Pay attention to how variable modifications before a conditional statement affect which branch will be executed.

5. **Priority Level Testing**:
    - Systematically verify all feasible priority level combinations. For instance, with priorities 0, 1, and 2, validate combinations such as (0 → 1 → 0), (0 → 2 → 0), and (1 → 2 → 1).