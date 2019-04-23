#include <omsp_system.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define  QWARK_CTL      (*(volatile unsigned int  *) 0x0190)

void dummy_wait(){
	volatile int i=0;

	for(i=0;i<500;i++);

}

volatile long var1=0xCAFEBEBE;    		 //0x4002
volatile long var2=7;    				 //0x4002
volatile int var3=7;    		 		 //0x4002
volatile char redirected=1;    			 //0x4004

//var1 = 401a, //var2 = 401c
int main()
{

	//Enable Idempotency Tracking

	QWARK_CTL = 0x01;

//	if(redirected){
//	  redirected = 200;
//	}

	if(var1){
	  var1 = 505;
	}

	var2 =	var1;
	//var3 = redirected;

	QWARK_CTL = 0x00;

	while(1);


	return 0;
}

