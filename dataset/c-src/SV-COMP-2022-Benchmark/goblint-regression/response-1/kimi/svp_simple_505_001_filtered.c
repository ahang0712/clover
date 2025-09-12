extern int __VERIFIER_nondet_int();
int myglobal;
void isr_fun(void) {
  int i = __VERIFIER_nondet_int();
  int tmp = myglobal+1;
  myglobal=tmp; 
}
void svp_simple_505_001_isr_1(void *arg) {
  int tmp = myglobal+1;
  myglobal=tmp; 
  isr_fun();
}
int svp_simple_505_001_main(void) {
  int tmp = myglobal+1;
  myglobal=tmp; 
  return 0;
}
