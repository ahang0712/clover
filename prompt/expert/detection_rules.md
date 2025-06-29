### Key Rules for Detection:
1. **Inline Function Calls**:
- Identify the function definition and locate the function call within the code.
- Substitute the function call with the corresponding function body.
- Ensure that any parameters passed to the function are correctly replaced with the actual arguments used in the function call.

2. **Global Shared Variables**:
- Detect violations on each global shared variable, like primitive data types, arrays, pointers or struct members accessed by both the main function and ISRs.
- The three operations in the defect must operate on the same address space, For the Atomicity Violation Pattern <a1, a2, a3>:
    For struct variables: The read/write operations in a1, a2, and a3 must point to the same struct member.
    For union variables: The read/write operations in a1, a2, and a3 can point to different union member. In a union, all members share the same memory area.
    For arrays: The read/write operations in a1, a2, and a3 must point to the same array index.
    For pointers: Focus on the variable pointed to by the pointer rather than the pointer itself.
- Monitor every read and write operation on global shared variables and list each of their read and write operations.
- The initial value of initialized global variables is set to 0 by default.

3. **Compound Operations**:
-  Decompose compound operations (+=, -=, ++, *=, /=, %=, &=, |=, ^=, <<=) into their atomic read and write parts. 
    * For example, `x += 1` decomposed as:
    Read operation: `temp = x;`
    Write operation: `x = temp + 1;`

    * For example, `x++` decomposed as:
    Read operation: `temp = x;`
    Write operation: `x = temp + 1;`

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
    - Systematically test all possible priority level combinations. For priorities 0, 1, and 2, for example:
    Check combinations: (0 → 1 → 0), (0 → 2 → 0), and (1 → 2 → 1).