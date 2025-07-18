
#include "../common.h"

#define MAX_LENGTH 100000
#define TRIGGER 9999

volatile int svp_simple_002_001_global_array[MAX_LENGTH];
volatile int casee2_global_var;

void svp_simple_002_001_main() {
  init();
  idlerun();
}

void svp_simple_002_001_isr_1() {
  int mininum, maxnum;
  for (int i = 0; i < MAX_LENGTH; i++) {
    if (i == TRIGGER) svp_simple_002_001_global_array[TRIGGER] = 1;
    if (i == MAX_LENGTH + 1)
      svp_simple_002_001_global_array[TRIGGER] = 1;
  }
  mininum = svp_simple_002_001_global_array[TRIGGER] - 10;

  maxnum = svp_simple_002_001_global_array[0] + 10;
}

void svp_simple_002_001_isr_2() {
  idlerun();
  svp_simple_002_001_global_array[TRIGGER] = 999;

}