
#include "../common.h"

volatile int svp_simple_025_001_global_var;
volatile int *svp_simple_025_001_global_array[100];
void svp_simple_025_001_func_1(int *array);
void svp_simple_025_001_init();

void svp_simple_025_001_main() {
  svp_simple_025_001_init();
  svp_simple_025_001_func_1(&svp_simple_025_001_global_var);
}
void svp_simple_025_001_init() {
  // svp_simple_025_001_global_var = rand();

  init();
}

void svp_simple_025_001_func_1(int *ptr_var) {
  *ptr_var = *ptr_var + 1;
}
void svp_simple_025_001_isr_1() {
  svp_simple_025_001_global_var = 0;
}
