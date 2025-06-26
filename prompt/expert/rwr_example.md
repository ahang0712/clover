3. **Atomicity Violation Pattern `<Read, Write, Write>`**:
- The pattern consists of:
    - **a1**: Read operation on a global shared variable by a relatively lower-priority task (can be main function or a lower priority ISR).
    - **a2**: Write operation on the same global shared variable by a higher-priority ISR.
    - **a3**: Write operation on the same global shared variable by the same relatively lower-priority task as a1.
    **a1** and **a3** should be consecutive. The read and write operations are considered "consecutive" if:
    They operate on the same memory location (including the same array element).
    No other read/write to that specific memory location occurs between a1 adn a3.
    They are executed sequentially by the same relatively lower-priority task
- Description: A local write follows a read operation and is interrupted by another write operation. The local write operation depends on the value read by the local read operation (e.g., conditional branch based on the read value), and the interleaved write modifies this value.
''',
                'pattern_example':'''     ```c
1:  volatile int globalvar1;
2:  volatile int globalvar2;
3:  void main() {
4:      if(globalvar1 > 1) { // Read operation on globalvar1.
5:          globalvar1 = 0; // Write operation on globalvar1.
6:      }
7:  }
8:  void isr_1() { //priority: 1
9:      globalvar2++; // Read operation on globalvar2. Write operation on globalvar2.
10:     globalvar1 = 2; // Write operation on globalvar1.
11: }
12: void isr_2() { //priority: 2
13:     globalvar2--; // Read operation on globalvar2. Write operation on globalvar2.
14: }
    ```
The global variables to focus on in the code:
[globalvar1, globalvar2]

The global variable read/write operations, line numbers, and function information are as follows:
globalvar1: line 4, Read Operation, main
globalvar1: line 5, Read Operation, main
globalvar1: line 10, Write Operation, isr_1
globalvar2: line 9, Read Operation, isr_1
globalvar2: line 9, Write Operation, isr_1
globalvar2: line 13, Read Operation, isr_2
globalvar2: line 13, Write Operation, isr_2

- Defect Analysis: 
Defect 1: The `if(globalvar1 > 1)` statement performs a read (line 4) followed by a write (line 5). ISR1 (line 10) can preempt between these operations, modifying `globalvar1` and leading to an inconsistent state.
Defect 2: ISR1 has the statement globalvar2++ (line 9), which is a compound operation that reads the current value of globalvar2, increments it by one, and writes the new value back to globalvar2. Similarly, ISR2 has the statement globalvar2-- (line 13), which reads the current value of globalvar2, decrements it by one, and writes the new value back to globalvar2. If ISR1’s globalvar2++ is executed and is preempted by ISR2’s globalvar2-- after the read but before the write, there could be a race condition leading to incorrect behavior. 
- JSON Output:

        ```json
{
    "violations": [
        {
            "sharedVariable": "globalvar1",
            "accessPattern": ["Read", "Write", "Write"],
            "details": [
                {
                    "codeSnippet": "if(globalvar1 > 1){",
                    "function": "main",
                    "lineNumber": "4",
                    "accessType": "Read",
                    "priority": "0"
                },
                {
                    "codeSnippet": "globalvar1 = 2;",
                    "function": "isr_1",
                    "lineNumber": "10",
                    "accessType": "Write",
                    "priority": "1"
                },
                {
                    "codeSnippet": "globalvar1 = 0;",
                    "function": "main",
                    "lineNumber": "5",
                    "accessType": "Write",
                    "priority": "0"
                }
            ],
            "triggerCount": 1
        },
        {
            "sharedVariable": "globalvar2",
            "accessPattern": ["Read", "Write", "Write"],
            "details": [
                {
                    "codeSnippet": "globalvar2++;",
                    "function": "isr_1",
                    "accessType": "Read",
                    "lineNumber": "9",
                    "priority": "1"
                },
                {
                    "codeSnippet": "globalvar2--;",
                    "function": "isr_2",
                    "accessType": "Write",
                    "lineNumber": "13",
                    "priority": "2"
                },
                {
                    "codeSnippet": "globalvar2++;",
                    "function": "isr_1",
                    "accessType": "Write",
                    "lineNumber": "9",
                    "priority": "1"
                }
            ],
            "triggerCount": 1
        }
    ]
}

    ```