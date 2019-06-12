/*
 * uart.c
 *
 *  Created on: May 9, 2019
 *      Author: hiram
 */

#include <omsp_system.h>

#include "uart.h"

//--------------------------------------------------//
//                 tty_putc function                 //
//            (Send a byte to the UART)             //
//--------------------------------------------------//
int UART_WriteChar (char txdata) {

  // Wait until the TX buffer is not full
  while (UART_STAT & UART_TX_FULL);
  //LED_CTRL = 0xEE;
  // Write the output character
  UART_TXD = txdata;

  return 0;
}


void UART_WriteNumber (int n)
{
  char buf[20];
  int i = 0;
  if (n < 0)
    {
	  UART_WriteChar ('-');
      n = -n;
    }
  while (n > 9)
    {
      buf[i++] = (n%10) + '0';
      n /= 10;
    }
  buf[i++] = (n%10) + '0';
  while (i > 0)
	  UART_WriteChar (buf[--i]);
}

/* This function prints a string of characters on the UART. The usage of this function is mostly    */
/* for debugging purposes.                                                                          */
/* Parameter(s)                                                                                     */
/* string      string of characters that will be printed through the UART                           */

void UART_WriteString(char* string){

    char i = 0;

    /* while the null character found at the end of every string is not found, keep iterating through the pointer*/
    while(string[i]!='\0')
    {
       /* if a transmission is pending, do not increment the index of the string, keep trying */
    	UART_WriteChar(string[i++]);

    }
 }
