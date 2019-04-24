#include <omsp_system.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define  QWARK_CTL      (*(volatile unsigned int  *) 0x0190)

volatile int var1=1;    		 
volatile int var2=7;    				 
volatile int var3=7;    		 		 
volatile int var4=1;    			 
volatile int var5=1;    			 
volatile int var6=1;  
volatile int var7=1;    			   			 
volatile int var8=1; 

#define QWARK_VECTOR (5)

//--------------------------------------------------//
//    Checkpoint Procedure                          //
//--------------------------------------------------//
interrupt (QWARK_VECTOR) INT_Qwark(void) {
	
	//Disable Idempotency Tracking
	QWARK_CTL = 0x00;
	LED_CTRL = 0x0F;

	// Write back values into memory
	(*(volatile unsigned int  *) 0x4002) = (*(volatile unsigned int  *) 0x6000);
	(*(volatile unsigned int  *) 0x4004) = (*(volatile unsigned int  *) 0x6002);
	(*(volatile unsigned int  *) 0x4006) = (*(volatile unsigned int  *) 0x6004);
	(*(volatile unsigned int  *) 0x4008) = (*(volatile unsigned int  *) 0x6006);
	(*(volatile unsigned int  *) 0x400A) = (*(volatile unsigned int  *) 0x6008);
	(*(volatile unsigned int  *) 0x400C) = (*(volatile unsigned int  *) 0x600A);
	(*(volatile unsigned int  *) 0x400E) = (*(volatile unsigned int  *) 0x600C);
	(*(volatile unsigned int  *) 0x4010) = (*(volatile unsigned int  *) 0x600E);
	LED_CTRL = 0xF0;
}

int main()
{

	//Enable Idempotency Tracking
  	eint();
	QWARK_CTL = 0x01;



	if(var1){
	  var1 = 0xAA;
	}

	if(var2){
	  var2 = 0xBB;
	}

	if(var3){
	  var3 = 0xCC;
	}

	if(var4){
	  var4 = 0xDD;
	}

	if(var5){
	  var5 = 0xEE;
	}

	if(var6){
	  var6 = 0xFF;
	}

	if(var7){
	  var7 = 0x55;
	}

	if(var8){
	  var8 = 0x66;
	}

	
	while(1);

	
}

