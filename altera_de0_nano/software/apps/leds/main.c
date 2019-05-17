#include <omsp_system.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>


#define QWARK_CTL     				  (*(volatile unsigned int  *) 0x02A0)
#define QWARK_VECTOR				  (5)
#define QWARK_EN					  0x01
#define QWARK_CHECKPOINT()			   QWARK_CTL |= 0x0020

#define UART_BAUD         (*(volatile unsigned int  *) 0x0082)
#define UART_EN            0x01
#define UART_STAT         (*(volatile unsigned char *) 0x0081)  // UART Status register (8bit)
#define UART_CTL          (*(volatile unsigned char *) 0x0080)  // UART Control register (8bit)
#define UART_TXD          (*(volatile unsigned char *) 0x0084)  // UART Transmit data register (8bit)
#define UART_TX_FULL       0x08

//#define LOG_PRINT
//#define PRINTF_PRINT


//#define UART_DBG

//#include <msp430.h>
//#include "driverlib.h"
//#include "nvm.h"
//#include "arch.h"
//#include "checkpoint.h"
//#include "stackpool.h"
//#include "virtualaddr.h"
//#include "virtualmem.h"
//#include "checkpoint_timer.h"

//-------------------------------------------------------------------------------------------------------------------------------------------//
//    QWARK CHECKPOINT PROCEDURE																											 //
//-------------------------------------------------------------------------------------------------------------------------------------------//

interrupt (QWARK_VECTOR) INT_Qwark(void) {
		 	 __asm__ __volatile__ ("nop");
}

void init()
{
    WDTCTL = WDTPW | WDTHOLD; // Stop WDT
 	 __asm__ __volatile__ ("nop");
    eint();
    //UART_BAUD = BAUD;                   // Init UART
    //UART_CTL  = UART_EN;
    //Enable QWARK
   // QWARK_CTL = QWARK_EN;
   //ta_wait(100);

}



int main()
{
    // "Globals" must be on the stack because Mementos doesn't handle real
    // globals correctly

    init();

    //count = 1;
    LED_CTRL = 0x01;



    while (1);
    return 0;
}


