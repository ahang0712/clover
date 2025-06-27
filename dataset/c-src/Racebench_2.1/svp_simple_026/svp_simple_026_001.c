
#include "../common.h"

void svp_simple_026_001_init();

volatile int svp_simple_026_001_gloable_var;
void svp_simple_026_001_main() {
  svp_simple_026_001_init();

  disable_isr(1);
  if (svp_simple_026_001_gloable_var > 12) {  
    svp_simple_026_001_gloable_var = 0;       
  }
  enable_isr(1);

  return ;
}
void svp_simple_026_001_init() {
  disable_isr(-1);
  // svp_simple_026_001_gloable_var = rand();
  init();
  enable_isr(-1);
}
void svp_simple_026_001_isr_1() { //Priority：1
  svp_simple_026_001_gloable_var++;  
}
void svp_simple_026_001_isr_2() { //Priority：2
  svp_simple_026_001_gloable_var--;  
}