int myglobal;
void svp_simple_518_001_isr_1(void *arg) {
  int tmp = myglobal+1;
  myglobal = tmp;
}
int add1 (int x) {
  return x+1;
}
int svp_simple_518_001_main(void) {
  printf("myglobal equals %dn",myglobal); // RACE!
  add1(myglobal); // RACE!
  return 0;
}
