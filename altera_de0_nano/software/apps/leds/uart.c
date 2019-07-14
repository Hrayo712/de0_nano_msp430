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


void UART_WriteNumber (unsigned n)
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


void UART_WriteString_HEX(char* string, unsigned length){

    char i = 0;
    char up_nibble;
    char down_nibble;

    /* while the null character found at the end of every string is not found, keep iterating through the pointer*/
  for (i = 0  ; i < length ; i++)
  {
      up_nibble = (string[i]&0xF0)>>4;
      down_nibble = (string[i]&0x0F);
      
      if(up_nibble >=0 && up_nibble <= 9)
        up_nibble += 48;
      else
        up_nibble += 55;


      if(down_nibble >=0 && down_nibble <= 9)
        down_nibble += 48;
      else
        down_nibble += 55;

      UART_WriteChar(up_nibble);
      UART_WriteChar(down_nibble);

  }
      
}

  

void UART_16_WriteHex(unsigned short hex_val){

    char i = 0;
    char tmp = 0;
    unsigned short var;
    for( i=0 ; i<4 ; i++){

     // tmp = (char)(((hex_val&(0xF000>>(i*4)))>>(12-(i*4))) + 55);
      LED_CTRL = 01;
      var = (hex_val&((0xF000)>>(i*4)))>>(12-(i*4));
      tmp = (char)var;
      if(tmp >= 0 && tmp <= 9)
        tmp += 48;
      else
        tmp += 55;
      UART_WriteChar(tmp);
    }
 }

