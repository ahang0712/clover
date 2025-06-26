
#include "../common.h"

volatile int svp_simple_020_001_global_var;

volatile int svp_simple_020_001_global_para;

volatile int svp_simple_020_001_global_flag = 0;

void svp_simple_020_001_main() {
  init();
  disable_isr(2);
  int reader1, reader2;
  int svp_simple_020_001_local_var1, svp_simple_020_001_local_var2;
  svp_simple_020_001_local_var1 = rand();
  svp_simple_020_001_local_var2 = rand();
  

  

  if (svp_simple_020_001_local_var1 + svp_simple_020_001_local_var2 > svp_simple_020_001_global_para)
    reader1 = svp_simple_020_001_global_var;

  if (svp_simple_020_001_local_var1 + svp_simple_020_001_local_var2 < svp_simple_020_001_global_para)
    reader2 = svp_simple_020_001_global_var;
}

void svp_simple_020_001_isr_1() {
  svp_simple_020_001_global_var = 0x01;
  
  svp_simple_020_001_global_flag = 1;
  enable_isr(2);
}

void svp_simple_020_001_isr_2() {
  if (svp_simple_020_001_global_flag == 1) {
    svp_simple_020_001_global_para = 11;
    svp_simple_020_001_global_var = 0x05;
  }
}