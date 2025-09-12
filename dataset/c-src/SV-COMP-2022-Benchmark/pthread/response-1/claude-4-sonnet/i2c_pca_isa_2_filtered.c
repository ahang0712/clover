#include <stdio.h>
#include <assert.h>
int global_clock;
int irq;
int global_id;
int global_dev;
#define pca_isa_probe(dev, id)\
    if (global_dev != dev) { \
    } \
    if (irq > -1) { \
        if (global_id != id) {\
        }\
    } \
#define pca_isa_init(dev, id) { \
    global_id = id; \
    global_dev = dev; \
}
#define pca_isa_exit() {\
    global_id = -1; \
    global_dev = -1; \
}
#define LIMIT 20
int cnt1, cnt2, cnt3, cnt4, cnt5, cnt6;
void req1(void) {
    irq = 1;
    global_id = 1;
    global_dev = 1;
    if (global_dev != 1) {
    }
    if (irq > -1) {
        if (global_id != 1) {
        }
    }
    global_id = -1;
    global_dev = -1;
    cnt1++;
}
void req2(void) {
    irq = 2;
    global_id = 2;
    global_dev = 2;
    if (global_dev != 2) {
    }
    if (irq > -1) {
        if (global_id != 2) {
        }
    }
    cnt2++;
}
void req_isr_1(void) { // priority: 1
    irq = 3;
    global_id = 3;
    global_dev = 3;
    if (global_dev != 3) {
    }
    if (irq > -1) {
        if (global_id != 3) {
        }
    }
    cnt3++;
}
void req_isr_2(void) { // priority: 2
    irq = 0;
    global_id = 4;
    global_dev = 4;
    if (global_dev != 4) {
    }
    if (irq > -1) {
        if (global_id != 4) {
        }
    }
    cnt4++;
}
void req_isr_3(void) { // priority: 3
    irq = 0;
    pca_isa_init(5, 5);
    global_id = 5;
    global_dev = 5;
    cnt5++;
}
void req6(void) {
    irq = -1;
    cnt6++;
}
int svp_simple_008_001_main(void) {
    req1();
    req6();
    return 0;
}