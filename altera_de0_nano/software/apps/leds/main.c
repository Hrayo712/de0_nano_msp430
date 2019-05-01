#include <omsp_system.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

//#define INTERMITTENCY_ENABLED


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

volatile int var1=2;
volatile int var2=7;
volatile int var3=7;
volatile int var4=1;
volatile int var5=1;
volatile int var6=1;
volatile int var7=1;
volatile int var8=1;
volatile int var9=1;

#ifdef INTERMITTENCY_ENABLED

void qwark_restore(void) __attribute__ ((naked));
void qwark_restore(void) __attribute__ ((used));
void qwark_restore(void) __attribute__ ((section (".crt_0001_qwark")));
void qwark_restore(void)
{
    /* verify if this is the first time the code executes */
	__asm__ __volatile__ ("mov #0x0000, &0x0190"); 
	__asm__ __volatile__ ("mov &0x600E, r12");		//3 cycles
	__asm__ __volatile__ ("mov #0x01, r13");		//1 cycle (using constant generator)
	__asm__ __volatile__ ("cmp r12, r13"); 			//1 cycle

	/*If the bit is not set, it means it is the first code execution; continue with initialization normally */
	/* no need to restore anything! */
	__asm__ __volatile__ ("jne __crt0_init_bss");	//2 cycles  Total: 7 cycles of handling logic

	/* Power outage happened ! 	   */
	/* Proceed with system restore */

	/* VOLATILE STATE RESTORE 									  */
	/* STACK RESTORE										  */
	/* Note: The amount of cycles depend on the addressing mode not on the instruction 		  */

	/* STACK RESTORE										  */
	/* TO DO */

	/* SYSTEM REGISTERS RESTORE									  */
	/* Restore registers and PC (last) 								  */
	/* EDE -> Rm  : 3 cycles each 									  */
	/* EDE -> PC  : 4 cycles (1 extra cycle penalty) for openMSP430 		  		  */
	/* Register time: 15x3 = 45 cycles + 4 cycles (PC) = 49 Cycles  (53 counting Qwark enable)*/

	__asm__ __volatile__ ("mov &0x602A,r4"); 		//R4	 3 cycles x 16 = 48 + 1 = 49 cycles
	__asm__ __volatile__ ("mov &0x602C,r5"); 		//R5
	__asm__ __volatile__ ("mov &0x602E,r6"); 		//R6
	__asm__ __volatile__ ("mov &0x6030,r7"); 		//R7
	__asm__ __volatile__ ("mov &0x6032,r8"); 		//R8
	__asm__ __volatile__ ("mov &0x6034,r9"); 		//R9
	__asm__ __volatile__ ("mov &0x6036,r10"); 		//R10
	__asm__ __volatile__ ("mov &0x6038,r11"); 		//R11
	__asm__ __volatile__ ("mov &0x603E,r14"); 		//R14
	__asm__ __volatile__ ("mov &0x6040,r15"); 		//R15
	__asm__ __volatile__ ("mov &0x6026,r13"); 	        //R13
	__asm__ __volatile__ ("mov &0x6028,r12"); 		//R12
	__asm__ __volatile__ ("mov &0x6020,r1");   		//SP/R1
	__asm__ __volatile__ ("mov &0x6024,r2"); 	        //SR/R2

	/* Enable Idempotency Tracking before restarting operation 		 		  */
	__asm__ __volatile__ ("mov #0x0001 , &0x0190");	/* QWARK_CTL Enable 4 cycles 		  */

	/*Restore program Counter */
	__asm__ __volatile__ ("mov &0x6022, pc"); 	    //PC/R0

}
#endif

//-------------------------------------------------------------------------------------------------------------//
//    QWARK Checkpoint Procedure: without stack: 215 cycles -> First phase: 141 cycles - second phase: 74      //
//-------------------------------------------------------------------------------------------------------------//

interrupt (QWARK_VECTOR) INT_Qwark(void) {

	/* Idempotency Tracking is disabled by default upon entering this context */
	LED_CTRL = 0x0F;

	/* First Phase of the Committ process  */
	/*Store Registers into NV memory : Total: 73 cycles*/

	__asm__ __volatile__ ("mov r1,&0x6020");   		//SP/R1   4 cycles       =  9 cycles
	__asm__ __volatile__ ("add #0x06,&0x6020");		//	  5 cycles
	__asm__ __volatile__ ("mov 4(r1),&0x6022"); 		//PC/R0   6 cycles       = 24 cycles
	__asm__ __volatile__ ("mov 2(r1),&0x6024"); 		//SR/R2   6 cycles
	__asm__ __volatile__ ("mov r13 ,&0x6026"); 	    	//R13	  6 cycles
	__asm__ __volatile__ ("mov 0(r1),&0x6028"); 		//R12	  6 cycles
	__asm__ __volatile__ ("mov r4,&0x602A"); 		//R4	  4 cycles x 10 = 40 cycles
	__asm__ __volatile__ ("mov r5,&0x602C"); 		//R5
	__asm__ __volatile__ ("mov r6,&0x602E"); 		//R6
	__asm__ __volatile__ ("mov r7,&0x6030"); 		//R7
	__asm__ __volatile__ ("mov r8,&0x6032"); 		//R8
	__asm__ __volatile__ ("mov r9,&0x6034"); 		//R9
	__asm__ __volatile__ ("mov r10,&0x6036"); 		//R10
	__asm__ __volatile__ ("mov r11,&0x6038"); 		//R11

	__asm__ __volatile__ ("mov r14,&0x603E"); 		//R14
	__asm__ __volatile__ ("mov r15,&0x6040"); 		//R15

	/* Copy the addresses to the scratchpad : 		Total 57 cycles */

	__asm__ __volatile__ ("mov &0x0192, &0x6010");   // 6 cycles x 7 = 42 cycles
	__asm__ __volatile__ ("mov &0x0194, &0x6012");
	__asm__ __volatile__ ("mov &0x0196, &0x6014");
    	__asm__ __volatile__ ("mov &0x0198, &0x6016");
	__asm__ __volatile__ ("mov &0x019A, &0x6018");
	__asm__ __volatile__ ("mov &0x019C, &0x601A");
	__asm__ __volatile__ ("mov &0x019E, &0x601C");
	//Move the index
	__asm__ __volatile__ ("mov &0x0190, &0x601E");	// 6 cycles     = 15 cycles
	__asm__ __volatile__ ("and #0x000E, &0x601E");	// 5 cycles
	__asm__ __volatile__ ("RRA &0x601E");		// 4 cycles


	/* 1.3 .- Save the Stack to the scratchpad (FULL COPY / no segmentation yet)*/

	/* First phase completed */

	/* Set Dirty Bit - Atomic Flag*/
	/* after setting this bit, it is possible to reproduce the checkpoint even if it fails halfway through */
	__asm__ __volatile__ ("mov #0x01, &0x600E"); //4 cycles

	/* 2nd Phase of the Committ process - Copy back from the Scratchpad: 70 cycles */
	__asm__ __volatile__ ("mov #0x6010,  r12 "); /* 1st value : 2 cycles + 2 cycles + 6 cycles = 10 cycles*/
	__asm__ __volatile__ ("mov @r12,     r13 ");
	__asm__ __volatile__ ("mov &0x6000, @r13 ");

	__asm__ __volatile__ ("mov #0x6012,  r12 "); /* 2nd value */
	__asm__ __volatile__ ("mov @r12,     r13 ");
	__asm__ __volatile__ ("mov &0x6002, @r13 ");

	__asm__ __volatile__ ("mov #0x6014,  r12 "); /* 3rd value */
	__asm__ __volatile__ ("mov @r12,     r13 ");
	__asm__ __volatile__ ("mov &0x6004, @r13 ");

	__asm__ __volatile__ ("mov #0x6016,  r12 "); /* 4th value */
	__asm__ __volatile__ ("mov @r12,     r13 ");
	__asm__ __volatile__ ("mov &0x6006, @r13 ");

	__asm__ __volatile__ ("mov #0x6018,  r12 "); /* 5th value */
	__asm__ __volatile__ ("mov @r12,     r13 ");
	__asm__ __volatile__ ("mov &0x6008, @r13 ");

	__asm__ __volatile__ ("mov #0x601A,  r12 "); /* 6th value */
	__asm__ __volatile__ ("mov @r12,     r13 ");
	__asm__ __volatile__ ("mov &0x600A, @r13 ");

	__asm__ __volatile__ ("mov #0x601C,  r12 "); /* 7th value */
	__asm__ __volatile__ ("mov @r12,     r13 ");
	__asm__ __volatile__ ("mov &0x600C, @r13 ");

	/* Checkpoint finished! */
	/* Clear index counter, and enable Idempotency tracking : 4 cycles*/
	__asm__ __volatile__ ("mov #0x0001, &0x0190"); //QWARK_CTL = 0x01;
	LED_CTRL = 0xF0;

}

int main()
{
   	 //WDTCTL = WDTPW | WDTHOLD; // Stop WDT
	//Enable Global Interrupts 
  	eint();
	
	//Enable Idempotency Tracking
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

	while(1);


}

