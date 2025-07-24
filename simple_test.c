#include "../common.h"

void svp_simple_005_001_main() {
  init();
  svp_simple_005_001_global_var = 0x01;
  svp_simple_005_001_global_var = 0x05;
}

void svp_simple_005_001_isr_1() {
  idlerun();
  int reader = svp_simple_005_001_global_var;
}
