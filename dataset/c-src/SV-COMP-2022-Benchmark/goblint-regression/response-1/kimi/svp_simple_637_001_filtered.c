extern void abort(void);
void reach_error() { assert(0); }
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: {reach_error();abort();} } }
int g = 0;
void svp_simple_637_001_isr_1(void *arg) {
}
int svp_simple_637_001_main() {
  g = 1;
  g = 2;
  g = 3; // write under mutex which was locked during singlethreaded mode
  __VERIFIER_assert(g == 3);
  return 0;
}
