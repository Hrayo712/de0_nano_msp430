#include <omsp_system.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define QWARK_CTL     				  (*(volatile unsigned int  *) 0x0190)
#define QWARK_VECTOR				  (5)
#define QWARK_WAR_CTR 				  (((QWARK_CTL)&(0x000E))>>1)
#define QWARK_ENABLE()				  ((QWARK_CTL) | (0x0001))
#define QWARK_ADDR1 				  (**((int**) (0x0192)))
#define QWARK_ADDR2 				  (**((int**) (0x0194)))
#define QWARK_ADDR3 				  (**((int**) (0x0196)))
#define QWARK_ADDR4 				  (**((int**) (0x0198)))
#define QWARK_ADDR5 				  (**((int**) (0x019A)))
#define QWARK_ADDR6 				  (**((int**) (0x019C)))
#define QWARK_ADDR7 				  (**((int**) (0x019E)))



volatile int var1=1;
volatile int var2=7;
volatile int var3=7;
volatile int var4=1;
volatile int var5=1;
volatile int var6=1;
volatile int var7=1;
volatile int var8=1;
volatile int var9=1;

//--------------------------------------------------//
//    QWARK Checkpoint Procedure                    //
//--------------------------------------------------//

interrupt (QWARK_VECTOR) INT_Qwark(void) {

	//Idempotency Tracking is disabled by default upon entering this context
    //Toggle LED to identify Checkpoint ISR

	LED_CTRL = 0x0F;
	int war_index = QWARK_WAR_CTR;

	switch(war_index){

	case 0 :
			 break;

	case 1 : QWARK_ADDR1 = (*(volatile unsigned int  *) 0x6000);

			 break;

	case 2 : QWARK_ADDR1 = (*(volatile unsigned int  *) 0x6000);
			 QWARK_ADDR2 = (*(volatile unsigned int  *) 0x6002);
			 break;

	case 3 : QWARK_ADDR1 = (*(volatile unsigned int  *) 0x6000);
			 QWARK_ADDR2 = (*(volatile unsigned int  *) 0x6002);
			 QWARK_ADDR3 = (*(volatile unsigned int  *) 0x6004);
			 break;

	case 4 : QWARK_ADDR1 = (*(volatile unsigned int  *) 0x6000);
	 	 	 QWARK_ADDR2 = (*(volatile unsigned int  *) 0x6002);
	 	 	 QWARK_ADDR3 = (*(volatile unsigned int  *) 0x6004);
	 	 	 QWARK_ADDR4 = (*(volatile unsigned int  *) 0x6006);
	 	 	 break;
	case 5 : QWARK_ADDR1 = (*(volatile unsigned int  *) 0x6000);
	 	 	 QWARK_ADDR2 = (*(volatile unsigned int  *) 0x6002);
	 	 	 QWARK_ADDR3 = (*(volatile unsigned int  *) 0x6004);
	 	 	 QWARK_ADDR4 = (*(volatile unsigned int  *) 0x6006);
	 	 	 QWARK_ADDR5 = (*(volatile unsigned int  *) 0x6008);
	 	 	 break;

	case 6 : QWARK_ADDR1 = (*(volatile unsigned int  *) 0x6000);
	 	 	 QWARK_ADDR2 = (*(volatile unsigned int  *) 0x6002);
	 	 	 QWARK_ADDR3 = (*(volatile unsigned int  *) 0x6004);
	 	 	 QWARK_ADDR4 = (*(volatile unsigned int  *) 0x6006);
	 	 	 QWARK_ADDR5 = (*(volatile unsigned int  *) 0x6008);
	 	 	 QWARK_ADDR6 = (*(volatile unsigned int  *) 0x600A);
	 	 	 break;

	case 7 : QWARK_ADDR1 = (*(volatile unsigned int  *) 0x6000);
	 	 	 QWARK_ADDR2 = (*(volatile unsigned int  *) 0x6002);
	 	 	 QWARK_ADDR3 = (*(volatile unsigned int  *) 0x6004);
	 	 	 QWARK_ADDR4 = (*(volatile unsigned int  *) 0x6006);
	 	 	 QWARK_ADDR5 = (*(volatile unsigned int  *) 0x6008);
	 	 	 QWARK_ADDR6 = (*(volatile unsigned int  *) 0x600A);
	 	 	 QWARK_ADDR7 = (*(volatile unsigned int  *) 0x600C);
	 	 	 break;

	default: break;
	}

	LED_CTRL = 0xF0;

	//Clear index counter, and enable idempotency tracking
	QWARK_CTL = 0x01;
}

int main()
{
    	WDTCTL = WDTPW | WDTHOLD; // Stop WDT
	//Enable Idempotency Tracking
  	eint();
	QWARK_CTL = 0x01;


	if(var1){
	   var1 = 1;	  
	}

	if(var2){
	   var2 = 1;	  
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
	  var8 = 0xAA;
	}

	


	while(1);


}

