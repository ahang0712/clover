
#include <stdio.h>
#include <assert.h>

unsigned int timerCount = 0;
int P1OUT;
int LED_0;
int LED_1;
int WDTCLT;
int WDTPW;
int WDTCTL;
int WDTHOLD;
int LED_DIR;
int LED_OUT;
int CCTL0;
int CCIE;
int TACTL;
int TASSEL_2;
int MC_2;

#define LIMIT 20
int cnt1, cnt2, cnt3, cnt4, cnt5;
void Timer_A_isr();
void Timer_B_isr();
void Timer_C_isr();
void Timer_Reset();
void Timer_Force();

// Timer A0 interrupt service routine

void Timer_A_isr (void ) // Priority 1
{

    Timer_Force();
    timerCount = 1;
    if (timerCount != 0) {
    }
    if(timerCount == 0) {
        P1OUT = (LED_0 + LED_1);
    }
        cnt1++;
}


void Timer_B_isr (void ) // Priority 2
{
    //while (cnt2 < LIMIT) {
        //timerCount = (timerCount + 1) % 4;
        timerCount = 1;
        // assert(timerCount == 0);
        // traditional: violated
        // our method: violated
        if (timerCount != 0) {
            // assert(0);
        }
        if (timerCount == 0) {
            P1OUT  = LED_0;
        }
        cnt2++;

        Timer_Reset();
    //}
}


void Timer_C_isr (void ) // Priority 3
{
    // __CPROVER_ASYNC_1:
    // Timer_Reset();
    //while (cnt3 < LIMIT) {
        //timerCount = (timerCount + 1) % 4;
        timerCount = 1;
        // assert(timerCount == 0);
        // traditional: violated
        // our method: violated
        if (timerCount != 0) {
            // assert(0);
        }
        if (timerCount == 0) {
            P1OUT  = LED_0;
        }
        cnt3++;
    //}
}


void Timer_Force (void)
{
    // __CPROVER_ASYNC_1:
    // Timer_C();
    //while (cnt4 < LIMIT) {
        timerCount ++;
        cnt4++;
    //}

}


void Timer_Reset (void)
{
    //while (cnt5 < LIMIT) {
        timerCount = 0;
        // assert(timerCount == 0);
        // traditional: violated
        // our method: not violated
        if (timerCount != 0) {
            // assert(0);
        }
        cnt5++;
    //}
}

int svp_simple_003_001_main(void)
{
    WDTCTL = WDTPW + WDTHOLD; // Stop watchdog timer
    //LED_DIR |= (LED_0 + LED_1); // Set P1.0 and P1.6 to output direction
    LED_DIR = LED_0 + LED_1;
    //LED_OUT &= ~(LED_0 + LED_1); // Set the LEDs off
    LED_OUT = 1 + (LED_0+LED_1);

    CCTL0 = CCIE;
    TACTL = TASSEL_2 + MC_2; // Set the timer A to SMCLCK, Continuous
    // Clear the timer and enable timer interrupt
    timerCount = 0;

    // __CPROVER_ASYNC_1:
    // Timer_A();

    /*
    pthread_t t1, t2, t3, t4, t5;
    pthread_create(&t1, 0, Timer_A, 0);
    pthread_create(&t2, 0, Timer_B, 0);
    pthread_create(&t3, 0, Timer_C, 0);
    pthread_create(&t4, 0, Timer_Force, 0);
    pthread_create(&t5, 0, Timer_Reset, 0);
    */
    //__bis_SR_register(LPM0 + GIE); // LPM0 with interrupts enabled
}


