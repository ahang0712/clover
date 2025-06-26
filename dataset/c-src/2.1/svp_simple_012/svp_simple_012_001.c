
#include "../common.h"

int svp_simple_012_001_global_var;

int svp_simple_012_001_global_pointer;

void svp_simple_012_001_main() {
  init();
  int *p = &svp_simple_012_001_global_var;

  svp_simple_012_001_global_var = 0x01;

  *p = 0x02;
}

void svp_simple_012_001_isr_1() {
  int reader1;
  reader1 = svp_simple_012_001_global_var;
}