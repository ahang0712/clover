// /*
//  *	Industrial Computer Source PCI-WDT500/501 driver
//  *
//  *	(c) Copyright 1996-1997 Alan Cox <alan@redhat.com>, All Rights Reserved.
//  *				http://www.redhat.com
//  *
//  *	This program is free software; you can redistribute it and/or
//  *	modify it under the terms of the GNU General Public License
//  *	as published by the Free Software Foundation; either version
//  *	2 of the License, or (at your option) any later version.
//  *
//  *	Neither Alan Cox nor CymruNet Ltd. admit liability nor provide
//  *	warranty for any of this software. This material is provided
//  *	"AS-IS" and at no charge.
//  *
//  *	(c) Copyright 1995    Alan Cox <alan@lxorguk.ukuu.org.uk>
//  *
//  *	Release 0.10.
//  *
//  *	Fixes
//  *		Dave Gregorich	:	Modularisation and minor bugs
//  *		Alan Cox	:	Added the watchdog ioctl() stuff
//  *		Alan Cox	:	Fixed the reboot problem (as noted by
//  *					Matt Crocker).
//  *		Alan Cox	:	Added wdt= boot option
//  *		Alan Cox	:	Cleaned up copy/user stuff
//  *		Tim Hockin	:	Added insmod parameters, comment cleanup
//  *					Parameterized timeout
//  *		JP Nollmann	:	Added support for PCI wdt501p
//  *		Alan Cox	:	Split ISA and PCI cards into two drivers
//  *		Jeff Garzik	:	PCI cleanups
//  *		Tigran Aivazian	:	Restructured wdtpci_init_one() to handle failures
//  *		Joel Becker 	:	Added WDIOC_GET/SETTIMEOUT
//  *		Zwane Mwaikambo	:	Magic char closing, locking changes, cleanups
//  *		Matt Domsch	:	nowayout module option
//  */
#include <stdio.h>

void foo() {
    printf("This is foo.\n");
}

// #if 0
// void old_function() {
//     // This function is deprecated.
//     printf("Old function.\n");
// }
// int unused_variable = 42;
// #endif

void bar() {
    printf("This is bar.\n");
}

// #if 0
// // Another disabled block
// void another_unused() {
//     printf("This is another unused function.\n");
// }
// #endif

int main() {
    foo();
    bar();
    return 0;
}
