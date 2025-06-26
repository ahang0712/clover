# Example 4

Consider the following C code:

```c
void main() {
	disable_isr(-1); // Disable all interrupts.
	int reader = globalvar;
	enable_isr(1); // Enable interrupt isr1.
}
void isr_1() {
	enable_isr(2); // Enable interrupt isr2.
	globalvar += 2;
}
void isr_2() {
	globalvar++;
}
```

In Example 4, `disable_isr(-1)` disables all interrupts until `enable_isr(1)` is executed. After executing `enable_isr(1)`, ISR1’s interrupt is enabled, allowing ISR1 to preempt and execute. During ISR1 execution, calling `enable_isr(2)` opens ISR2’s interrupt switch, allowing ISR2 to preempt the main function and ISR1.

