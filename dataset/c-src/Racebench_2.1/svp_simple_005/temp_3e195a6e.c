
#include "../common.h"

#define MAX_LENGTH 10000
#define TRIGGER 9999
#define TRIGGER1 1000

volatile int svp_simple_005_001_global_condition = 0;

volatile int svp_simple_005_001_global_var;

void svp_simple_005_001_main() {
init();
for (int i = 0; i < MAX_LENGTH; i++) {
for (int j = 0; j < MAX_LENGTH; j++) {
if ((i == TRIGGER) && (j == TRIGGER1))
svp_simple_005_001_global_var = 0x01; // Write Operation on svp_simple_005_001_global_var.
}
}

if (svp_simple_005_001_global_condition == 1){

svp_simple_005_001_global_var = 0x09; // Write Operation on svp_simple_005_001_global_var.
}
svp_simple_005_001_global_var = 0x05; // Write Operation on svp_simple_005_001_global_var.
}

void svp_simple_005_001_isr_1() {
idlerun();
int reader;
reader = svp_simple_005_001_global_var; // Read Operation on svp_simple_005_001_global_var.
}