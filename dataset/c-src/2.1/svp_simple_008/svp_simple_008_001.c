
#include "../common.h"

void svp_simple_008_001_func_1();

#define MAX_LENGTH 10000
#define TRIGGER 9999

volatile int svp_simple_008_001_global_var;

volatile int svp_simple_008_001_global_array[100];

void svp_simple_008_001_main() {
  init();
  int p = 1;
  int q = 2;

  svp_simple_008_001_global_array[p + q] = 0x09;

  svp_simple_008_001_global_array[40] = 0x01;

  svp_simple_008_001_func_1();
}

void svp_simple_008_001_func_1() {
  int reader1, reader2;
  int i = 1;
  int j = 2;
  int p = 1;
  int q = 3;
  reader1 = svp_simple_008_001_global_array[i * 20 + j * 10];

  reader2 = svp_simple_008_001_global_array[p + q];
}

void svp_simple_008_001_isr_1() {
  for (int k = 0; k < 100; k++) svp_simple_008_001_global_array[k] = 0x05;
}