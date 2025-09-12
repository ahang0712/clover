int myglobal;
void munge() {
  int tmp = myglobal+1;
  myglobal=tmp; 
}
void isr_munge() {
  int tmp = myglobal+1;
  myglobal=tmp; 
}
void svp_simple_509_001_isr_1(void *arg) {
  isr_munge();
}
int svp_simple_509_001_main(void) {
  munge();
  return 0;
}
