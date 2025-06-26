# Example 1

Consider the following C code:

```c
volatile int globalvar;
volatile int condition = 0;
void main() {
    if (condition == 1)
        globalvar = 1;
}
```

In this example, the statement `globalvar = 1;` is guarded by the condition `if (condition == 1)`.
However, since `condition` is initialized to 0 and never updated anywhere in the program, the condition `condition == 1` is always false during execution.  
Therefore, the assignment `globalvar = 1;` can never be executed at runtime.

As a result, any reported atomicity violation involving the assignment `globalvar = 1;` in this context is a false positive and should be excluded from the defect report.
