extern void abort(void);
void reach_error() { assert(0); }

int data = 0;

void svp_simple_304_001_isr_1(void *arg) //priority: 1
{
  int tmp = data +1;
  data =tmp;

}


void svp_simple_304_001_isr_2(void *arg)//priority: 2
{
  int tmp = data + 2;
  data =tmp;
}


void svp_simple_304_001_isr_3(void *arg)//priority: 3
{
  if (data >= 3){
    ERROR: {reach_error();abort();}
  }
}


int svp_simple_304_001_main()
{
  return 0;
}
