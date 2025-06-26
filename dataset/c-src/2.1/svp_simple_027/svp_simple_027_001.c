#include "../common.h"

void svp_simple_027_001_init();

volatile int svp_simple_027_001_gloable_var;
void svp_simple_027_001_main() {
  disable_isr(-1);
  svp_simple_027_001_init();

  enable_isr(1);
  if (svp_simple_027_001_gloable_var > 12) {  
    svp_simple_027_001_gloable_var = 0;       
  }

  return ;
}

void svp_simple_027_001_init() {
  // svp_simple_027_001_gloable_var = rand();

  init();
}

void svp_simple_027_001_isr_1() {
  svp_simple_027_001_gloable_var++;  
  enable_isr(2);
}
void svp_simple_027_001_isr_2() {
  svp_simple_027_001_gloable_var += 2;  
}
void svp_simple_027_001_isr_3() {
  svp_simple_027_001_gloable_var += 3;  
}
