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

volatile int u16_nv_read=1;    //0x4016
volatile int redirected=0;    //0x4016
int main()
{

	//Enable Idempotency Tracking	
		
	QWARK_CTL = 0x01;

	if(u16_nv_read) //WAR!!
	u16_nv_read=7; //redirect to known address of redirected var


	if(redirected==7){
	LED_CTRL = 0x0F;
	}
	//turn on LED


	//liveness
	
	while(1);

  
	return 0;
}

