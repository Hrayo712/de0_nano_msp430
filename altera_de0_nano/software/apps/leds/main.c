#include <omsp_system.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>


#define QWARK_CTL     				  (*(volatile unsigned int  *) 0x0190)
#define QWARK_VECTOR				  (5)

#define UART_BAUD         (*(volatile unsigned int  *) 0x0082)

#define  UART_EN            0x01
#define UART_STAT         (*(volatile unsigned char *) 0x0081)  // UART Status register (8bit)
#define UART_CTL          (*(volatile unsigned char *) 0x0080)  // UART Control register (8bit)
#define UART_TXD          (*(volatile unsigned char *) 0x0084)  // UART Transmit data register (8bit)
#define  UART_TX_FULL       0x08

//--------------------------------------------------
// Diverse
//--------------------------------------------------

// BAUD = (mclk_freq/baudrate)-1

//#define BAUD           2083            //   9600  @20.0MHz
//#define BAUD           1042            //  19200  @20.0MHz
//#define BAUD            521            //  38400  @20.0MHz
//#define BAUD            347            //  57600  @20.0MHz
#define BAUD                8            // 115200  @20.0MHz
//#define BAUD             87            // 230400  @20.0MHz

//--------------------------------------------------//
//                 tty_putc function                 //
//            (Send a byte to the UART)             //
//--------------------------------------------------//
int tty_putc (int txdata) {

  // Wait until the TX buffer is not full
  while (UART_STAT & UART_TX_FULL);

  // Write the output character
  UART_TXD = txdata;

  return 0;
}

int main()
{
        WDTCTL = WDTPW | WDTHOLD; // Stop WDT
	//Enable Idempotency Tracking
	__asm__ __volatile__ ("nop");
  	eint();

	UART_BAUD = BAUD;                   // Init UART
   	UART_CTL  = UART_EN;

	LED_CTRL = 0xAA;
	
	tty_putc('q');
	tty_putc('w');
	tty_putc('a');
	tty_putc('r');
	tty_putc('k');

	
	while(1);


}

