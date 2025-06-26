
#include "../common.h"

volatile int svp_simple_019_001_global_condition1 = 1;
volatile int svp_simple_019_001_global_condiiton2 = 1;
volatile int svp_simple_019_001_global_condition3 = 1;

volatile int svp_simple_019_001_global_para1;
volatile int svp_simple_019_001_global_para2;
volatile int svp_simple_019_001_global_para3;

volatile int svp_simple_019_001_global_var1;
volatile int svp_simple_019_001_global_var2;

void svp_simple_019_001_main() {
  int reader1, reader2, reader3, reader4, reader5;
  init();
  svp_simple_019_001_global_para1 = rand() % 10;
  svp_simple_019_001_global_para2 = rand() % 10;
  svp_simple_019_001_global_para3 = rand() % 10;


  if ((svp_simple_019_001_global_para1 + svp_simple_019_001_global_para3) > svp_simple_019_001_global_para2)
    reader1 = svp_simple_019_001_global_var2;

  reader2 = svp_simple_019_001_global_var2;

  if ((svp_simple_019_001_global_condition1 == 1) && (svp_simple_019_001_global_condiiton2 == 1))
    reader3 = svp_simple_019_001_global_var1;
  idlerun();
  disable_isr(1);
  if ((svp_simple_019_001_global_condition1 == 1) && (svp_simple_019_001_global_condition3 == 1))
    reader4 = svp_simple_019_001_global_var1;
  enable_isr(1);
  idlerun();
  disable_isr(1);
  if ((svp_simple_019_001_global_condiiton2 == 1) && (svp_simple_019_001_global_condition3 == 0))
    reader5 = svp_simple_019_001_global_var1;
  enable_isr(1);
}

void svp_simple_019_001_isr_1() {
  idlerun();
  if ((svp_simple_019_001_global_para1 + svp_simple_019_001_global_para3) < svp_simple_019_001_global_para2)
    svp_simple_019_001_global_var2 = 0x55;

  svp_simple_019_001_global_condition3 = 0;

  svp_simple_019_001_global_var1 = 0x01;
}
