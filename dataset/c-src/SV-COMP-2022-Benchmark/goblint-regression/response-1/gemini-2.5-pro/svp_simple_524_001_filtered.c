int myglobal;
void svp_simple_524_001_isr_1(void *arg) {
  int tmp = myglobal+1;
  myglobal = tmp;
}
int svp_simple_524_001_main(void) {
  scanf("%d", &myglobal); // RACE!
  return 0;
}
