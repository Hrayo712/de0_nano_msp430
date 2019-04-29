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

void qwark_restore(void) __attribute__ ((naked));
void qwark_restore(void) __attribute__ ((used));
void qwark_restore(void) __attribute__ ((section (".crt_0001_qwark")));
void qwark_restore(void)
{
    /* verify if this is the first time the code executes */
	__asm__ __volatile__ ("mov &0x7000, r12");
	__asm__ __volatile__ ("mov #0x01, r13");
	__asm__ __volatile__ ("cmp r12, r13");

	/*If the bit is not set, it means it is the first code execution; continue with initialization normally */
	/* no need to restore anything! */
	__asm__ __volatile__ ("jne __crt0_init_bss");

	/* Power outage happened ! 	   */
	/* Proceed with system restore */

	/* VOLATILE STATE RESTORE 												  				  */
	/* STACK RESTORE												  				  		  */
	/* Note: The amount of cycles depend on the addressing mode not on the instruction 		  */

	/* STACK RESTORE														  				  */
	/* TO DO */

	/* SYSTEM REGISTERS RESTORE												  				  */
	/* Restore registers and PC (last) 										  				  */
	/* EDE -> Rm  : 3 cycles each 											  				  */
	/* EDE -> PC  : 4 cycles (1 extra cycle penalty) for openMSP430 		  				  */
	/* Register time: 15x3 = 45 cycles + 4 cycles (PC) = 49 Cycles  		  				  */

	//	__asm__ __volatile__ ("mov #0x8144 , pc");	/* R2 -> Status  Register  				  */
	//	__asm__ __volatile__ ("mov #0x8144 , pc");	/* R1 -> Stack   Pointer  				  */



	/* Enable Idempotency Tracking before restarting operation 		 				  		  */

	//  __asm__ __volatile__ ("mov #0x0001 , &0x0190");	/* QWARK_CTL Enable 			 	  */
	//	__asm__ __volatile__ ("mov #0x8144 , pc");	/* R0 -> program Counter 				  */


}

//--------------------------------------------------//
//    QWARK Checkpoint Procedure                    //
//--------------------------------------------------//

interrupt (QWARK_VECTOR) INT_Qwark(void) {

	//Idempotency Tracking is disabled by default upon entering this context
    //Toggle LED to identify Checkpoint ISR

	LED_CTRL = 0x0F;

	/* Fetch the amount of violations */
	int war_index = QWARK_WAR_CTR;

	/* First Phase of the Committ process  */

	/* 1.1 - Copy the addresses to the scratchpad */
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

	/* 1.2 .- Store register values into the scratchpad */

	/* TO DO */

	/* 1.3 .- Save the Stack to the scratchpad (FULL COPY / no segmentation yet)*/

	/* TO DO */

	/* First phase completed */

	/* Set Dirty Bit */
	/* after setting this bit, it is possible to reproduce the checkpoint even if it fails halfway through */
	__asm__ __volatile__ ("mov #0x01, &0x7000");

	/* 2nd Phase of the Committ process - Copy back from the Scratchpad */
	/* TO DO */


	/* Checkpoint finished! */
	/* Clear index counter, and enable Idempotency tracking */
	__asm__ __volatile__ ("mov #0x0001, &0x0190"); //QWARK_CTL = 0x01;
}

int main()
{
    //WDTCTL = WDTPW | WDTHOLD; // Stop WDT
	//Enable Idempotency Tracking
  	eint();
	QWARK_CTL = 0x01;


	if(var1){
	  var1 = 0x01;
	}

	if(var2){
	  var2 = 0x02;
	}

	if(var3){
	  var3 = 0x03;
	}

	if(var4){
	  var4 = 0x04;
	}

	if(var5){
	  var5 = 0x05;
	}

	if(var6){
	  var6 = 0x06;
	}

	if(var7){
	  var7 = 0x07;
	}

	if(var8){
	    var8 = 0x08;
	}




	if(var9){
	  var9 = 0xAA;
	}



	while(1);


}

