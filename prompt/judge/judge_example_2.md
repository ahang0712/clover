# Example 2

Consider the following C code:

```c
volatile int globalvar; 
volatile int condition = 1;
void isr1(){
	disable_isr(2); // disable isr2
	condition = 0;
	enable_isr(2); // enable isr2
}
void isr2(){
	if (condition == 1)
		globalvar = 1;
}
```

In Example 2, note that interrupt `isr1` will change the value of condition, thereby altering the truth value of the control condition in `isr2`. Therefore, it is necessary to consider whether the control condition in `isr2` could be true after `isr1` is executed.
