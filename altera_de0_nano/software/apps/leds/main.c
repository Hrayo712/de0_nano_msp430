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

volatile int var1=7;    		 //0x4002
volatile int var2=7;    		 //0x4002
volatile int var3=7;    		 //0x4002
volatile int redirected=1;    //0x4004

//var1 = 401a, //var2 = 401c
int main()
{

	//Enable Idempotency Tracking

	QWARK_CTL = 0x01;

	if(redirected){
	  redirected = 502;
	}

	if(var1){
	  var1 = 502;
	}

	var2 =	var1;
	var3 = redirected;
	QWARK_CTL = 0x00;

	while(1);


	return 0;
}

