#include <omsp_system.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>


#define QWARK_CTL     				  (*(volatile unsigned int  *) 0x0190)
#define QWARK_VECTOR				  (5)
#define QWARK_WAR_CTR 				  (((QWARK_CTL)&(0x000E))>>1)
#define QWARK_ADDR1 				  (**((int**) (0x0192)))
#define QWARK_ADDR2 				  (**((int**) (0x0194)))
#define QWARK_ADDR3 				  (**((int**) (0x0196)))
#define QWARK_ADDR4 				  (**((int**) (0x0198)))
#define QWARK_ADDR5 				  (**((int**) (0x019A)))
#define QWARK_ADDR6 				  (**((int**) (0x019C)))
#define QWARK_ADDR7 				  (**((int**) (0x019E)))

volatile char var1=2;
volatile char var2=7;
volatile int var3=7;
volatile int var4=1;
volatile int var5=1;
volatile int var6=1;
volatile int var7=1;
volatile int var8=1;
volatile int var9=1;
volatile int var10=1;


//#define INTERMITTENCY_HANDLING_ENABLED


#ifdef INTERMITTENCY_HANDLING_ENABLED

void qwark_restore(void) __attribute__ ((naked));
void qwark_restore(void) __attribute__ ((used));
void qwark_restore(void) __attribute__ ((section (".crt_0001_qwark")));
void qwark_restore(void)
{
    /* verify if this is the first time the code executes,and whether the checkpoint succeeded, failed, or was stranded on the first phase */
	__asm__ __volatile__ ("mov #0x0000, &0x0190"); 		 //QWARK_CTL = 0x01;
	__asm__ __volatile__ ("mov &0x600E, r12");			 //3 cycles
	__asm__ __volatile__ ("mov #0x02, r13");			 //1 cycle (using constant generator)
	__asm__ __volatile__ ("cmp r12, r13"); 				 //1 cycle

	/*check for the bit set on 2, it means the checkpoint completed succesfully, we can reinitialize the system*/
	__asm__ __volatile__ ("JEQ __system_restore");		 //2 cycles  Total: 7 cycles of handling logic

	/*If the bit is set on 1, it means the checkpoint completed succesfully, we can finalize the second stage and reinitialize the system*/

	__asm__ __volatile__ ("mov #0x01, r13");		     //1 cycle (using constant generator)
	__asm__ __volatile__ ("cmp r12, r13"); 			     //1 cycle
	__asm__ __volatile__ ("JEQ __second_stage_retry");	 //2 cycles  Total: 7 cycles of handling logic

	__asm__ __volatile__ ("br #__crt0_init_bss");


	//-------------------------------------------------------------------------------------------------------------//
	//    RETRY SECOND PHASE OF THE COMMIT PROCESS																   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("__second_stage_retry:");

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

	//Indicate this checkpoint has been finalized
	__asm__ __volatile__ ("mov #0x02, &0x600E"); //4 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//   SYSTEM RESTORE															   								   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("__system_restore:");
	/* VOLATILE STATE RESTORE 	: STACK RESTORE											  				 		   */
	/* Note: The amount of cycles depend on the addressing mode not on the instruction 		 					   */

	/* TESTING ONLY: Wipe out the stack and restore it*/
	/* STACK ERASE														  				  	  					   */
	__asm__ __volatile__ ("mov &0X6020, r12"); 		//Get the current SP
	__asm__ __volatile__ ("mov #0x7FFE, r14");
	__asm__ __volatile__ ("mov #0x6FFE, r13");

	__asm__ __volatile__ ("decd r12");
	__asm__ __volatile__ ("decd r12");
	__asm__ __volatile__ ("decd r12");
	__asm__ __volatile__ ("__erase_stack:");

	__asm__ __volatile__ ("cmp r14,r12");	   //compare and verify if the base has been reached
	__asm__ __volatile__ ("jz __deletion_stack_complete");

	__asm__ __volatile__ ("mov #0x00000,@r14");
	__asm__ __volatile__ ("decd r13");
	__asm__ __volatile__ ("decd r14");
	__asm__ __volatile__ ("br #__erase_stack");

	__asm__ __volatile__ ("__deletion_stack_complete:");

	/* STACK RESTORE														  				  */
	__asm__ __volatile__ ("mov &0X6020, r12"); 		//Get the current SP
	__asm__ __volatile__ ("mov #0x7FFE, r14");
	__asm__ __volatile__ ("mov #0x6FFE, r13");

	__asm__ __volatile__ ("decd r12");

	__asm__ __volatile__ ("__restore_stack:");

	__asm__ __volatile__ ("cmp r14,r12");	   //compare and verify if the base has been reached
	__asm__ __volatile__ ("jz __init_restore_stack_complete");

	__asm__ __volatile__ ("mov @r13,@r14");
	__asm__ __volatile__ ("decd r13");
	__asm__ __volatile__ ("decd r14");
	__asm__ __volatile__ ("br #__restore_stack");

	__asm__ __volatile__ ("__init_restore_stack_complete:");

	/* SYSTEM REGISTERS RESTORE												  				  */
	/* Restore registers and PC (last) 										  				  */
	/* EDE -> Rm  : 3 cycles each 											  				  */
	/* EDE -> PC  : 4 cycles (1 extra cycle penalty) for openMSP430 		  				  */
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
	__asm__ __volatile__ ("mov &0x6026,r13"); 	    //R13
	__asm__ __volatile__ ("mov &0x6028,r12"); 		//R12
	__asm__ __volatile__ ("mov &0x6020,r1");   		//SP/R1
	__asm__ __volatile__ ("mov &0x6024,r2"); 	    //SR/R2

	/* Enable Idempotency Tracking before restarting operation 		 				  	  */
	__asm__ __volatile__ ("mov #0x0001 , &0x0190");	/* QWARK_CTL Enable 4 cycles 		  */

	/*Restore program Counter */
	__asm__ __volatile__ ("mov &0x6022, pc"); 	    //PC/R0

}
#endif

//-------------------------------------------------------------------------------------------------------------------------------------------//
//    QWARK Checkpoint Procedure: without stack: 215 cycles => First phase: 141 cycles - second phase: 74    , complete: 683.5 at 64B stack  //
//-------------------------------------------------------------------------------------------------------------------------------------------//

interrupt (QWARK_VECTOR) INT_Qwark(void) {

	/* Idempotency Tracking is disabled by default upon entering this context */
	LED_CTRL = 0x10;

	//-------------------------------------------------------------------------------------------------------------//
	//    FIRST PHASE OF THE COMMIT PROCESS																	       //
	//-------------------------------------------------------------------------------------------------------------//

	/*Store Registers into NV memory : Total: 70 cycles*/

	__asm__ __volatile__ ("mov r1,&0x6020");   		//SP/R1   4 cycles       =  9 cycles
	__asm__ __volatile__ ("add #0x06,&0x6020");		//		  5 cycles
	__asm__ __volatile__ ("mov 4(r1),&0x6022"); 	//PC/R0   6 cycles       = 21 cycles
	__asm__ __volatile__ ("mov 2(r1),&0x6024"); 	//SR/R2   6 cycles
	__asm__ __volatile__ ("mov r13 ,&0x6026"); 	    //R13	  4 cycles
	__asm__ __volatile__ ("mov 0(r1),&0x6028"); 	//R12	  5 cycles
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

	LED_CTRL = 0x11;

	//Get the index indicating the amount of violations stored (9 cycles)

	__asm__ __volatile__ ("mov &0x0190, r14");		// 3 cycles
	__asm__ __volatile__ ("RRA r14");				// 1 cycle
	__asm__ __volatile__ ("mov.b r14, &0x601F");	// 4 cycles
	__asm__ __volatile__ ("mov r14, r15 ");		    // 1 cycle (save the index for later)

	LED_CTRL = 0x12;

	/* Copy the addresses to the scratchpad : 		 Total worst case: 77 cycles */
	/* Setup registers for copy*/
	__asm__ __volatile__ ("tst r14 ");     		       // 1 cycle
	__asm__ __volatile__ ("jz  _chkpt_stack");		   // 2 cycles


	__asm__ __volatile__ ("mov #0x0192, r12");		  // 2 cycles
	__asm__ __volatile__ ("mov #0x6010, r13");		  // 2 cycles

	__asm__ __volatile__ ("_scratchpad_addr_cpy:");   // Each iteration takes 10 cycles - Worst case 70 cycles

	__asm__ __volatile__ ("mov @r12+2, @r13");         // 5 cycles
	__asm__ __volatile__ ("incd r13");  		       // 1 cycle
	__asm__ __volatile__ ("dec r14 ");      	       // 1 cycle
	__asm__ __volatile__ ("tst r14 ");     		       // 1 cycle
	__asm__ __volatile__ ("jnz  _scratchpad_addr_cpy");// 2 cycles

	/* 1.3 .- Checkpoint the Stack (FULL COPY / no segmentation yet) : 64B stack take approximately 466 cycles*/

	LED_CTRL = 0x13;

	__asm__ __volatile__ ("_chkpt_stack:");

	__asm__ __volatile__ ("mov &0X6020, r12"); 		//Get the current SP - 3 cycles
	__asm__ __volatile__ ("mov #0x7FFE, r14");		//2 cycles
	__asm__ __volatile__ ("mov #0x6FFE, r13");		//2 cycles

	__asm__ __volatile__ ("decd r12");				//1 cycle

	__asm__ __volatile__ ("__copy_stack:");

	__asm__ __volatile__ ("cmp r14,r12");	   		  //compare and verify if the base has been reached - 1 cycle
	__asm__ __volatile__ ("jz __copy_stack_complete");//2 cycles

	__asm__ __volatile__ ("mov @r14,@r13");			  //5 cycles

	__asm__ __volatile__ ("decd r13");				  //1 cycle
	__asm__ __volatile__ ("decd r14");				  //1 cycle
	__asm__ __volatile__ ("br #__copy_stack");		  //2 cycle

	__asm__ __volatile__ ("__copy_stack_complete:");

	LED_CTRL = 0x14;

	//-------------------------------------------------------------------------------------------------------------//
	//    FIRST PHASE COMPLETED	: Set Binary Semaphore: 1														   //
	//-------------------------------------------------------------------------------------------------------------//

	/* after setting this bit, it is possible to reproduce the checkpoint even if it fails halfway through */
	__asm__ __volatile__ ("mov.b #0x01, &0x601E"); //4 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//    SECOND PHASE OF THE COMMIT PROCESS																	   //
	//-------------------------------------------------------------------------------------------------------------//
	LED_CTRL = 0x15;

	__asm__ __volatile__ ("tst r15 ");     		           // 2 cycles
	__asm__ __volatile__ ("jz  _chkpt_finished");		   // 2 cycles

	__asm__ __volatile__ ("mov #0x6010,  r12 ");			// 2 cycles
	__asm__ __volatile__ ("mov #0x6000,  r14 ");			// 2 cycles

	__asm__ __volatile__ ("_second_phase_commit_strt:");    // Worst case: 84 cycles( w/o logic)

	__asm__ __volatile__ ("mov @r12+2,  r13 ");   			// 2 cycles
	__asm__ __volatile__ ("mov @r14+2, @r13 ");    			// 5 cycles

	__asm__ __volatile__ ("dec r15");    					// 1 cycles
	__asm__ __volatile__ ("tst r15");    					// 2 cycles
	__asm__ __volatile__ ("jnz  _second_phase_commit_strt");// 2 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//    CHECKPOINT COMPLETED	- Binary Semaphore set to 2														   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("_chkpt_finished:");// 2 cycles

	/* Set second phase complete Bit - Atomic Flag*/
	__asm__ __volatile__ ("mov.b #0x02, &0x601E");  //4 cycles

	/* This is to continue operation. If at this point a power failure happens, the system can re-start*/
	/* Clear index counter, and enable Idempotency tracking*/
	__asm__ __volatile__ ("mov #0x0001, &0x0190");
	__asm__ __volatile__ ("mov &0x6026,r13"); 	    //Re-establish r13
	__asm__ __volatile__ ("mov &0x603E,r14"); 	    //Re-establish r14
	__asm__ __volatile__ ("mov &0x6040,r15"); 	    //Re-establish r15 (3 cycles)

	//to do: indicate checkpoint as invalid upon entering
	LED_CTRL = 0xF0;

}

void dummy_function(void){
	int var=0xAA;
	int array[32];
	for(var=0;var<31;var++)
	{
		array[var] = 0xFECA;
	}
	if(var9){
			  var9 = 0x07;
			}
}


int main()
{
    //WDTCTL = WDTPW | WDTHOLD; // Stop WDT
	//Enable Idempotency Tracking
	__asm__ __volatile__ ("nop");
  	eint();
	QWARK_CTL = 0x01;

	if(var1){
	  var1 = 0xAA;
	}

	if(var2){
	  var2 = 0xBB;
	}

	if(var2 == 0xBB)
		LED_CTRL = 0xAA;


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
		//dummy_function();

		if(var8){
		  var8 = 0x07;
		}
	while(1);


}

