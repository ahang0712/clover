
#include "../common.h"

#define MAX_LENGTH 100
#define TRIGGER 50

volatile int svp_simple_017_001_global_var;
volatile int svp_simple_017_001_local_array[MAX_LENGTH];

void svp_simple_017_001_main() {
  init();
  int i = 0;

  for (svp_simple_017_001_global_var = 0; svp_simple_017_001_global_var < MAX_LENGTH;
       svp_simple_017_001_global_var++)
  {
    svp_simple_017_001_local_array[svp_simple_017_001_global_var] = i++;
  }
}

void svp_simple_017_001_isr_1() {
  idlerun();

  svp_simple_017_001_global_var = TRIGGER;

  svp_simple_017_001_local_array[svp_simple_017_001_global_var] = 0;
}