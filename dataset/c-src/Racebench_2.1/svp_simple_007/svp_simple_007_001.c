
#include "../common.h"

#define MAX_LENGTH 10000
#define TRIGGER 9999

volatile int svp_simple_007_001_global_var = 0;

volatile int svp_simple_007_001_global_array[5];

void svp_simple_007_001_main() {
  init();
  int reader1, reader2;

  

  svp_simple_007_001_global_array[svp_simple_007_001_global_var] = 0x01;

  reader2 = svp_simple_007_001_global_array[svp_simple_007_001_global_var];

  int i = rand();
  if (i == 2)
    svp_simple_007_001_global_array[i] = 0x02;
  else
    svp_simple_007_001_global_array[i] = 0x09;

  reader1 = svp_simple_007_001_global_array[2];
}

void svp_simple_007_001_isr_1() {
  idlerun();
  svp_simple_007_001_global_array[2] = 0x09;

  svp_simple_007_001_global_var += 1;
  svp_simple_007_001_global_array[svp_simple_007_001_global_var] = 0x09;
}