int myglobal;
void svp_simple_511_001_isr_1(void *arg) {
  lock();
  myglobal++; // NORACE
  unlock();
}
int svp_simple_511_001_main(void) {
  lock();
  myglobal++; // NORACE
  unlock();
  return 0;
}
