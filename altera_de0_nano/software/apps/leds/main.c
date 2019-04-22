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

volatile int u16_nv_read=7;    //0x4002
volatile int redirected=1;    //0x4004
volatile int var1,var2,var4,var5,var3=0xBEBE; //4006
//var1 = 401a, //var2 = 401c
int main()
{

	//Enable Idempotency Tracking

	QWARK_CTL = 0x01;
	

	if(redirected){
	  redirected = 3;
	}
	
	var1 = redirected;


	QWARK_CTL = 0x00;

	//liveness

	while(1);


	return 0;
}

