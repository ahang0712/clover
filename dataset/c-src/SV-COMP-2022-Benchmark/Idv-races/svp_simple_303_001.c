
extern void abort(void);

void reach_error() { assert(0); }
int __VERIFIER_nondet_int(void);
void ldv_assert(int expression) { if (!expression) { ERROR: {reach_error();abort();}}; return; }

int pdev;

void svp_simple_303_001_isr_1(void *arg) {
   pdev = 6;
}

int module_init() {
   pdev = 1;
   ldv_assert(pdev==1);
   if(__VERIFIER_nondet_int()) {
      return 0;
   }
   pdev = 3;
   ldv_assert(pdev==3);
   return -1;
}

void module_exit() {
   void *status;
   pdev = 4;
   ldv_assert(pdev==4);
   pdev = 5;
   ldv_assert(pdev==5);
}

int svp_simple_303_001_main(void) {
   if (module_init() != 0){ // Call module_init()
      module_exit(); // Call module_exit()
   }
    module_exit(); // Call module_exit()
    module_exit(); // Call module_exit()
    return 0;
}
