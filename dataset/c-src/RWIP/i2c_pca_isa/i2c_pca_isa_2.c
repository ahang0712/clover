// /*
//  *  i2c-pca-isa.c driver for PCA9564 on ISA boards
//  *    Copyright (C) 2004 Arcom Control Systems
//  *    Copyright (C) 2008 Pengutronix
//  *
//  *  This program is free software; you can redistribute it and/or modify
//  *  it under the terms of the GNU General Public License as published by
//  *  the Free Software Foundation; either version 2 of the License, or
//  *  (at your option) any later version.
//  *
//  *  This program is distributed in the hope that it will be useful,
//  *  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  *  GNU General Public License for more details.
//  *
//  *  You should have received a copy of the GNU General Public License
//  *  along with this program; if not, write to the Free Software
//  *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
//  */
#include <stdio.h>
#include <assert.h>

// #if FULLCODE

// #include <linux/kernel.h>
// #include <linux/ioport.h>
// #include <linux/module.h>
// #include <linux/moduleparam.h>
// #include <linux/delay.h>
// #include <linux/jiffies.h>
// #include <linux/init.h>
// #include <linux/interrupt.h>
// #include <linux/wait.h>
// #include <linux/isa.h>
// #include <linux/i2c.h>
// #include <linux/i2c-algo-pca.h>

// #include <asm/io.h>
// #include <asm/irq.h>

// #define DRIVER "i2c-pca-isa"
// #define IO_SIZE 4


// static unsigned long base;
// static int irq = -1;

// /* Data sheet recommends 59kHz for 100kHz operation due to variation
//  * in the actual clock rate */
// static int clock  = 59000;

// static struct i2c_adapter pca_isa_ops;
// static wait_queue_head_t pca_wait;

// static void pca_isa_writebyte(void *pd, int reg, int val)
// {
// #ifdef DEBUG_IO
//     static char *names[] = { "T/O", "DAT", "ADR", "CON" };
//     printk(KERN_DEBUG "*** write %s at %#lx <= %#04x\n", names[reg],
//            base+reg, val);
// #endif
//     outb(val, base+reg);
// }

// static int pca_isa_readbyte(void *pd, int reg)
// {
//     int res = inb(base+reg);
// #ifdef DEBUG_IO
//     {
//         static char *names[] = { "STA", "DAT", "ADR", "CON" };
//         printk(KERN_DEBUG "*** read  %s => %#04x\n", names[reg], res);
//     }
// #endif
//     return res;
// }

// static int pca_isa_waitforcompletion(void *pd)
// {
//     unsigned long timeout;
//     long ret;

//     if (irq > -1) {
//         ret = wait_event_timeout(pca_wait,
//                 pca_isa_readbyte(pd, I2C_PCA_CON)
//                 & I2C_PCA_CON_SI, pca_isa_ops.timeout);
//     } else {
//         /* Do polling */
//         timeout = jiffies + pca_isa_ops.timeout;
//         do {
//             ret = time_before(jiffies, timeout);
//             if (pca_isa_readbyte(pd, I2C_PCA_CON)
//                     & I2C_PCA_CON_SI)
//                 break;
//             udelay(100);
//         } while (ret);
//     }

//     return ret > 0;
// }

// static void pca_isa_resetchip(void *pd)
// {
//     /* apparently only an external reset will do it. not a lot can be done */
//     printk(KERN_WARNING DRIVER ": Haven't figured out how to do a reset yet\n");
// }

// static irqreturn_t pca_handler(int this_irq, void *dev_id) {
//     wake_up(&pca_wait);
//     return IRQ_HANDLED;
// }

// static struct i2c_algo_pca_data pca_isa_data = {
//     /* .data intentionally left NULL, not needed with ISA */
//     .write_byte		= pca_isa_writebyte,
//     .read_byte		= pca_isa_readbyte,
//     .wait_for_completion	= pca_isa_waitforcompletion,
//     .reset_chip		= pca_isa_resetchip,
// };

// static struct i2c_adapter pca_isa_ops = {
//     .owner          = THIS_MODULE,
//     .algo_data	= &pca_isa_data,
//     .name		= "PCA9564/PCA9665 ISA Adapter",
//     .timeout	= HZ,
// };

// static int __devinit pca_isa_match(struct device *dev, unsigned int id)
// {
//     int match = base != 0;

//     if (match) {
//         if (irq <= -1)
//             dev_warn(dev, "Using polling mode (specify irq)\n");
//     } else
//         dev_err(dev, "Please specify I/O base\n");

//     return match;
// }
// #endif

// #if FULLCODE
// static int __devinit pca_isa_probe(struct device *dev, unsigned int id)
// {
//     init_waitqueue_head(&pca_wait);

//     dev_info(dev, "i/o base %#08lx. irq %d\n", base, irq);

// #ifdef CONFIG_PPC
//     if (check_legacy_ioport(base)) {
//         dev_err(dev, "I/O address %#08lx is not available\n", base);
//         goto out;
//     }
// #endif

//     if (!request_region(base, IO_SIZE, "i2c-pca-isa")) {
//         dev_err(dev, "I/O address %#08lx is in use\n", base);
//         goto out;
//     }

//     if (irq > -1) {
//         if (request_irq(irq, pca_handler, 0, "i2c-pca-isa", &pca_isa_ops) < 0) {
//             dev_err(dev, "Request irq%d failed\n", irq);
//             goto out_region;
//         }
//     }

//     pca_isa_data.i2c_clock = clock;
//     if (i2c_pca_add_bus(&pca_isa_ops) < 0) {
//         dev_err(dev, "Failed to add i2c bus\n");
//         goto out_irq;
//     }

//     return 0;

//  out_irq:
//     if (irq > -1)
//         free_irq(irq, &pca_isa_ops);
//  out_region:
//     release_region(base, IO_SIZE);
//  out:
//     return -ENODEV;
// }
// #endif

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

// #if FULLCODE
// static int __devexit pca_isa_remove(struct device *dev, unsigned int id)
// {
//     i2c_del_adapter(&pca_isa_ops);

//     if (irq > -1) {
//         disable_irq(irq);
//         free_irq(irq, &pca_isa_ops);
//     }
//     release_region(base, IO_SIZE);

//     return 0;
// }

// static struct isa_driver pca_isa_driver = {
//     .match		= pca_isa_match,
//     .probe		= pca_isa_probe,
//     .remove		= __devexit_p(pca_isa_remove),
//     .driver = {
//         .owner	= THIS_MODULE,
//         .name	= DRIVER,
//     }
// };
// #endif

#define pca_isa_init(dev, id) { \
    global_id = id; \
    global_dev = dev; \
}

#define pca_isa_exit() {\
    global_id = -1; \
    global_dev = -1; \
}

// #if FULLCODE
// static int __init pca_isa_init(void)
// {
//     return isa_register_driver(&pca_isa_driver, 1);
// }

// static void __exit pca_isa_exit(void)
// {
//     isa_unregister_driver(&pca_isa_driver);
// }

// MODULE_AUTHOR("Ian Campbell <icampbell@arcom.com>");
// MODULE_DESCRIPTION("ISA base PCA9564/PCA9665 driver");
// MODULE_LICENSE("GPL");

// module_param(base, ulong, 0);
// MODULE_PARM_DESC(base, "I/O base address");

// module_param(irq, int, 0);
// MODULE_PARM_DESC(irq, "IRQ");
// module_param(clock, int, 0);
// MODULE_PARM_DESC(clock, "Clock rate in hertz.\n\t\t"
//         "For PCA9564: 330000,288000,217000,146000,"
//         "88000,59000,44000,36000\n"
//         "\t\tFor PCA9665:\tStandard: 60300 - 100099\n"
//         "\t\t\t\tFast: 100100 - 400099\n"
//         "\t\t\t\tFast+: 400100 - 10000099\n"
//         "\t\t\t\tTurbo: Up to 1265800");

// module_init(pca_isa_init);
// module_exit(pca_isa_exit);
// #endif

#define LIMIT 20
int cnt1, cnt2, cnt3, cnt4, cnt5, cnt6;

// void req1();
// void req2();
// void req3();
// void req4();
// void req5();
// void req6();

void req1(void) {
    // __CPROVER_ASYNC_1:
//    req2();
    //while(cnt1< LIMIT) {
    irq = 1;
    // pca_isa_init(1, 1);
    global_id = 1;
    global_dev = 1;
    //pca_isa_probe(1, 1);
    if (global_dev != 1) {
    }
    if (irq > -1) {
        if (global_id != 1) {
        }
    }
    // pca_isa_exit();
    global_id = -1;
    global_dev = -1;
    cnt1++;
    //}
}

void req2(void) {
    // __CPROVER_ASYNC_1:
    // req3(); 
    //while(cnt2 < LIMIT) {
    irq = 2;
//    pca_isa_init(2, 2);
    global_id = 2;
    global_dev = 2;
    //pca_isa_probe(2, 2);
    if (global_dev != 2) {
    }
    if (irq > -1) {
        if (global_id != 2) {
        }
    }
//    pca_isa_exit();
//    global_id = -1;
//    global_dev = -1;
    cnt2++;
    //}
}

void req_isr_1(void) { // priority: 1
    // __CPROVER_ASYNC_1:
    // req4(); 
    //while(cnt3 < LIMIT) {
    irq = 3;
//    pca_isa_init(3, 3);
    global_id = 3;
    global_dev = 3;
    //pca_isa_probe(3, 3);
    if (global_dev != 3) {
    }
    if (irq > -1) {
        if (global_id != 3) {
        }
    }
//    pca_isa_exit();
    cnt3++;
    //}
}

void req_isr_2(void) { // priority: 2
    // __CPROVER_ASYNC_1:
    // req5(); 
    //while(cnt4 < LIMIT) {
    irq = 0;
//    pca_isa_init(4, 4);
    global_id = 4;
    global_dev = 4;
    //pca_isa_probe(4, 4);
    if (global_dev != 4) {
    }
    if (irq > -1) {
        if (global_id != 4) {
        }
    }
//    pca_isa_exit();
    cnt4++;
    //}
}

void req_isr_3(void) { // priority: 3
    //while(cnt5 < LIMIT) {
    irq = 0;
    pca_isa_init(5, 5);
    global_id = 5;
    global_dev = 5;
//    pca_isa_probe(5, 5);
//    pca_isa_exit();
    cnt5++;
    //}
}

void req6(void) {
    //while(cnt6 < LIMIT) {
    irq = -1;
    cnt6++;
    //}
}

int svp_simple_008_001_main(void) {
    // __CPROVER_ASYNC_1:
    req1();
    // __CPROVER_ASYNC_1:
    req6();
    // /*
    // pthread_t t1, t2, t3, t4, t5, t6;
    // pthread_create(&t1, NULL, &req1, NULL);
    // pthread_create(&t2, NULL, &req2, NULL);
    // pthread_create(&t2, NULL, &req3, NULL);
    // pthread_create(&t2, NULL, &req4, NULL);
    // pthread_create(&t2, NULL, &req5, NULL);
    // pthread_create(&t2, NULL, &req6, NULL);
    // */
    return 0;

}