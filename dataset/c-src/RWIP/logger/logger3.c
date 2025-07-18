#include <pthread.h> 
#include <assert.h>
#include <stdlib.h>

//typedef unsigned int int;
//typedef unsigned short int;
//typedef unsigned char int;

#define MAX_RECORDS  64
int numberOfRecords;
//int records[MAX_RECORDS];
int records;

#define MAX_BUFFER  64
int msgBuffer[MAX_BUFFER];

int intervalCounter; 
int tickCounter;     
int interval;     
int startTime;
int decodingStatus;

int cmd;
int sendit;

// #define IDLE 0
// #define LOGGING 1
int systemState;
int rspStatus;

// #define CMD_DEC_OK 1
// #define CMD_DEC_ERROR 0
// #define RSP_SUCCESS 1
// #define RSP_ERROR 0

// #define TASK_COMMUNICATE 1
// #define TASK_MEASURE 2

// #define CMD_START 1
// #define CMD_STOP 2
// #define CMD_READ_STATE 3
// #define CMD_READ_DATA 4

// void task_communicate();
// void task_measure1();
// void task_measure2();
// void task_measure3();


// const int __CPROVER_thread_priorities[] = {5, 2, 6, 3};
// const char* __CPROVER_threads[] = {"c::task_communicate", "c::task_measure1", "c::task_measure2", "c::task_measure3"};

#define LIMIT 10
int cnt1, cnt2, cnt3, cnt4;

void stop(void)
{
    //systemState = IDLE;
    systemState = 0;
}

void start(int _startTime, int _interval)
{
    if (numberOfRecords+1 >= 64) {//stop();
        //systemState = IDLE;
        systemState = 0;
    }
    intervalCounter = 0;
    tickCounter = 0;
    numberOfRecords = 0;
    startTime = _startTime;
    interval = _interval;
    systemState = 1;
    //assert(numberOfRecords==0);
    //if(numberOfRecords!=0) irq_err();
}


void task_measure1(void) {
    // __CPROVER_ASYNC_1:
    // task_measure3();

    //while (cnt1 < LIMIT) {
        cnt1++;
        int tmp_tickCounter = tickCounter;
        int tmp_interval = interval;
        //int value = read_sensor_value();
        int value = 1;
        // this assertion fails in both cases
        // assert(tickCounter == 0);
        if (tickCounter != 0) {
            // assert(0);
        }
        intervalCounter++;
        //records[numberOfRecords] =  value;
        records = value;
        numberOfRecords++;
    //}
}


void task_isr_1(void) { // Priority is 1
    //while (cnt2 < LIMIT) {
        cnt2++;
        tickCounter = 0;
        // this assertion fails in both cases
        // assert(tickCounter == 0);
        if (tickCounter != 0) {
            // assert(0);
        }
        //records[numberOfRecords] =  value;
    //}
}


void task_isr_2(void ) { // Priority is 2
    // __CPROVER_ASYNC_1:
    // task_communicate();
    //while (cnt3 < LIMIT) {
        tickCounter = 0;
        // our method does not fail
        // assert(tickCounter == 0);
        if (tickCounter != 0) {
            // assert(0);
        }
        cnt3++;
        //records[numberOfRecords] =  value;
    //}
}


void task_isr_3(void) { // Priority is 3
    // __CPROVER_ASYNC_1:
    // task_measure2();
    //while (cnt4 < LIMIT) {
        cnt4++;
        //int _startTime = get_uint32();
        //int _interval = get_uint16();
        int _startTime = 1;
        int _interval = 1;
        //start(_startTime,_interval);
        cmd = rand() %4 +1;
        rspStatus = rand() %2 + 1;
        decodingStatus = 0;

        if(cmd==2 || cmd==3 || 
                cmd==4 || cmd==1) {
            decodingStatus = 1;
        }

        if (rspStatus == 1) {
            if (cmd == 2) {
                if (systemState != 1) {
                    rspStatus = 0;
                } else { //stop();
                    //systemState = IDLE;
                    systemState = 0;
                }
                //send_response();
                sendit = 1;
            }
            if (cmd == 3) {
                //send_response();
                sendit= 1;
            }
            if (cmd == 4) {
                //send_response();
                sendit= 1;
            }
            if (cmd == 0) {
                if (systemState != 0) {
                    rspStatus = 0;
                } else {
                    int tmp_num = numberOfRecords + 1;
                    if (tmp_num >= 64) { //stop();
                        systemState = 0;
                    }
                    intervalCounter = 0;
                    tickCounter = 0;
                    numberOfRecords = 0;
                    startTime = _startTime;
                    interval = _interval;
                    systemState = 1;
                    // This assertion doesn't fail on priority case
                    // assert(numberOfRecords==0);
                    if (numberOfRecords != 0) {
                        // assert(0);
                    }
                    //if(numberOfRecords!=0) irq_err();
                    sendit = 1;
                    //send_response();
                }
            }
        }
    //}
}



int svp_simple_015_001_main() {
    systemState = 0;
    // __CPROVER_ASYNC_1:
    task_measure1();
    // /*
    // pthread_t t1, t2;
    // pthread_create(&t1, 0, task_communicate, 0);
    // pthread_create(&t2, 0, task_measure1, 0);
    // pthread_create(&t2, 0, task_measure2, 0);
    // pthread_create(&t2, 0, task_measure3, 0);
    // */
    return 0;
}
