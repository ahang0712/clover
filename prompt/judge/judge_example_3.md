# Example 3

Consider the following C code:

```c
void main() {
	disable_isr(-1);
    int reader = globalvar;
	enable_isr(1);  
}
void isr_1() {
	globalvar += 2;
}
void isr_2() {
	globalvar++;
}
```

In Example 3, `disable_isr(-1)` disables all interrupts until `enable_isr(1)` is executed. After executing `enable_isr(1)`, the interrupt for ISR1 is enabled, allowing ISR1 to preempt and execute. However, since ISR2 is not explicitly enabled, it remains disabled and cannot preempt and execute.
