
#include "../common.h"

volatile int svp_simple_022_001_global_var1;
volatile int svp_simple_022_001_global_var2;
volatile int svp_simple_022_001_global_var3;
volatile int svp_simple_022_001_global_array[256];
void svp_simple_022_001_func_1();
void svp_simple_022_001_func_2();
void svp_simple_022_001_func_3();
void svp_simple_022_001_func_4();
void svp_simple_022_001_init();

void svp_simple_022_001_main() {
  svp_simple_022_001_init();

  svp_simple_022_001_global_var1 = 0;
  svp_simple_022_001_func_1();
  int i;
  for (i = 0; i < 256; i++) {
    svp_simple_022_001_global_array[i] = 0;
  }
  svp_simple_022_001_func_2();
  svp_simple_022_001_global_var3 = svp_simple_022_001_global_var1;
}

void svp_simple_022_001_init() {
  disable_isr(-1);
  // svp_simple_022_001_global_var1 = rand();
  // svp_simple_022_001_global_var2 = rand();
  // svp_simple_022_001_global_var3 = rand();

  init();
  enable_isr(-1);
}

void svp_simple_022_001_func_1() { svp_simple_022_001_func_3(); }

void svp_simple_022_001_func_2() { svp_simple_022_001_func_4(); }

void svp_simple_022_001_func_3() {
  if (svp_simple_022_001_global_var1 >= 12) {
    svp_simple_022_001_global_var1 = 12;
  } else {
    svp_simple_022_001_global_var1 = 0;
  }
}

void svp_simple_022_001_func_4() {
  svp_simple_022_001_global_var3 = svp_simple_022_001_global_var1;
}
void svp_simple_022_001_isr_1() { //Priority: 1
  svp_simple_022_001_global_var1 = 0;
}