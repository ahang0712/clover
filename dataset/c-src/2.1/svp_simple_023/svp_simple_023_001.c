
#include "../common.h"

volatile int svp_simple_023_001_global_var;
void svp_simple_023_001_func_1(int x);
void svp_simple_023_001_init();

void svp_simple_023_001_main() {
  svp_simple_023_001_init();
  svp_simple_023_001_func_1(svp_simple_023_001_global_var);
}
void svp_simple_023_001_init() {
  // svp_simple_023_001_global_var = rand();

  init();
}

void svp_simple_023_001_func_1(int var) {
  if (var > 0 && var < 12) {
    svp_simple_023_001_global_var = svp_simple_023_001_global_var + 1;
  }
}
void svp_simple_023_001_isr_1() {
  svp_simple_023_001_global_var = 0;
}