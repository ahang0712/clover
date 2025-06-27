
#include "../common.h"

volatile int svp_simple_016_001_global_var1;

void svp_simple_016_001_main() {
  init();
  int reader1;
  svp_simple_016_001_global_var1 = 0x01;
  reader1 = svp_simple_016_001_global_var1 +
            svp_simple_016_001_global_var1 +
            svp_simple_016_001_global_var1;

}

void svp_simple_016_001_isr_1() {
  idlerun();
  svp_simple_016_001_global_var1 = 0x09;
}