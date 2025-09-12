int myglobal;
void svp_simple_504_001_isr_1(void *arg) {
  int tmp = myglobal+1;
  myglobal=tmp; 
}
int svp_simple_504_001_main(void) {
  int tmp = myglobal+1;
  myglobal=tmp; 
  return 0;
}
