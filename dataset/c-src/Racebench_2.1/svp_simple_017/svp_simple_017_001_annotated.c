
#include "../common.h"

#define MAX_LENGTH 100
#define TRIGGER 50

volatile int svp_simple_017_001_global_var;
volatile int svp_simple_017_001_local_array[MAX_LENGTH];

void svp_simple_017_001_main() {
  init();
  int i = 0;

  for (svp_simple_017_001_global_var = 0; svp_simple_017_001_global_var < MAX_LENGTH;  // Write operation on variable 'svp_simple_017_001_global_var' in Main function 'svp_simple_017_001_main'  // Read operation on variable 'svp_simple_017_001_global_var' in Main function 'svp_simple_017_001_main'
       svp_simple_017_001_global_var++)  // Read operation on variable 'svp_simple_017_001_global_var' in Main function 'svp_simple_017_001_main'  // Write operation on variable 'svp_simple_017_001_global_var' in Main function 'svp_simple_017_001_main'
  {
    svp_simple_017_001_local_array[svp_simple_017_001_global_var] = i++;  // Read operation on variable 'svp_simple_017_001_global_var' in Main function 'svp_simple_017_001_main'  // Write operation on variable 'svp_simple_017_001_local_array[var]' in Main function 'svp_simple_017_001_main'
  }
}

void svp_simple_017_001_isr_1() {
  idlerun();

  svp_simple_017_001_global_var = TRIGGER;  // Write operation on variable 'svp_simple_017_001_global_var' in ISR function 'svp_simple_017_001_isr_1'

  svp_simple_017_001_local_array[svp_simple_017_001_global_var] = 0;  // Read operation on variable 'svp_simple_017_001_global_var' in ISR function 'svp_simple_017_001_isr_1'  // Write operation on variable 'svp_simple_017_001_local_array[var]' in ISR function 'svp_simple_017_001_isr_1'
}
