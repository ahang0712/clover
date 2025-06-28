**Atomicity Violation Pattern `<Write, Write, Read>`**:
- The pattern consists of:
    - **a1**: A write operation on a global shared variable by a relatively lower-priority task (can be main function or a lower priority ISR).
    - **a2**: A write operation on the same global shared variable by a high-priority ISR.
    - **a3**: A read operation on the same global shared variable by the same relatively lower-priority task as a1.
    **a1** and **a3** should be consecutive. The write and read operations are considered "consecutive" if:
    They operate on the same memory location (including the same array element).
    No other read/write to that specific memory location occurs between a1 adn a3.
    They are executed sequentially by the same relatively lower-priority task.

**Goal**: Detect instances where a local read `a3` follows a write operation `a1` and is interrupted by another write operation `a2`. The expectation of the local read `a3` to read the assigned value is violated by the interleaved write operation. 

```c
    1:  volatile unsigned long shared_case;
    2:  void case_main(){ //Main
    3:      unsigned char tmp;
    4:      shared_case = 0; // `a1`: Write operation on `shared_case`.
    5:      tmp = shared_case; // `a3`: Read operation on `shared_case`.
    6:  }
    7:  void case_isr1(){ //ISR1, priority: 1
    8:      shared_case = 1; // `a2`: Write operation on `shared_case`.
    9:  }
```
    The global variables to focus on in the code:
    [shared_case]

    The global variable read/write operations, line numbers, and function information are as follows:
    shared_case: line 4, Write Operation, case_main
    shared_case: line 5, Read Operation, case_main
    shared_case: line 8, Write Operation, case_isr1
    
    - Defect Analysis: The main function writes 0 to `shared_case` and expects to read it back. However, before the read occurs, ISR1 preempts and writes 1 to `shared_case`. This causes the read operation to return 1 instead of the expected 0.
    - JSON Output:

```json
{
    "violations": [
        {
            "sharedVariable": "shared_case",
            "accessPattern": ["Write", "Write", "Read"],
            "details": [
                {
                    "codeSnippet": "shared_case = 0;",
                    "function": "main",
                    "lineNumber": "4",
                    "accessType": "Write",
                    "priority": "0"
                },
                {
                    "codeSnippet": "shared_case = 1;",
                    "function": "isr_1",
                    "lineNumber": "8",
                    "accessType": "Write",
                    "priority": "1"
                },
                {
                    "codeSnippet": "tmp = shared_case;",
                    "function": "main",
                    "lineNumber": "5",
                    "accessType": "Read",
                    "priority": "0"
                }
            ],
            "triggerCount": 1
        }
    ]
}
```