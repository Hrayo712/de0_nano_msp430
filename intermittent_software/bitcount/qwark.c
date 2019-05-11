/*
 * qwark.c
 *
 *  Created on: May 9, 2019
 *      Author: hiram
 */
#include <omsp_system.h>

#include "qwark.h"

#define INTERMITTENCY_HANDLING_ENABLED


#ifdef INTERMITTENCY_HANDLING_ENABLED

void qwark_restore(void) __attribute__ ((naked));
void qwark_restore(void) __attribute__ ((used));
void qwark_restore(void) __attribute__ ((section (".crt_0001_qwark")));
void qwark_restore(void)
{
	//-------------------------------------------------------------------------------------------------------------//
	//    RESTORE HANDLING LOGIC	Total: 17 cycles															   //
	//-------------------------------------------------------------------------------------------------------------//

	/* Disable Qwark */
	__asm__ __volatile__ ("mov #0x0000, &0x0190");

	__asm__ __volatile__ ("cmp.b #0x02, &0x603E");
	__asm__ __volatile__ ("jz __qwark_retry_1st_setup");

	__asm__ __volatile__ ("cmp.b #0x03, &0x603F");
	__asm__ __volatile__ ("jz __qwark_restore_2nd_setup");
	__asm__ __volatile__ ("cmp.b #0x03, &0x603E");
	__asm__ __volatile__ ("jnz __crt0_init_bss");

	__asm__ __volatile__ ("cmp.b #0x02, &0x603F");
	__asm__ __volatile__ ("jz  __qwark_retry_2nd_setup");

	//__asm__ __volatile__ ("br  #__qwark_restore_1st_setup");

	__asm__ __volatile__ ("__qwark_restore_1st_setup:");

	__asm__ __volatile__ ("mov &0X6012,   r12 ");
    __asm__ __volatile__ ("mov #0x6FFE,   r13 ");
	__asm__ __volatile__ ("br  #__system_restore");

	__asm__ __volatile__ ("__qwark_restore_2nd_setup:");

	__asm__ __volatile__ ("mov &0X6042, r12   ");
    __asm__ __volatile__ ("mov #0x6BFE, r13   ");
	__asm__ __volatile__ ("br  #__system_restore");

	__asm__ __volatile__ ("__qwark_retry_1st_setup:");

	__asm__ __volatile__ ("mov  #0x6030,   r10 ");
	__asm__ __volatile__ ("mov  &0X6012,   r12 ");
    __asm__ __volatile__ ("mov  #0x6FFE,   r13 ");
	__asm__ __volatile__ ("mov  &0x602E,   r15 ");
	__asm__ __volatile__ ("br  #__second_stage_retry");

	__asm__ __volatile__ ("__qwark_retry_2nd_setup:");

	__asm__ __volatile__ ("mov #0x6060,   r10 ");
	__asm__ __volatile__ ("mov &0X6042,   r12 ");
    __asm__ __volatile__ ("mov #0x6BFE,   r13 ");
	__asm__ __volatile__ ("mov &0x605E,   r15 ");
	//__asm__ __volatile__ ("br  #__second_stage_retry");

	//-------------------------------------------------------------------------------------------------------------//
	//    RETRY SECOND PHASE OF THE COMMIT PROCESS	: 148 cycles												   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("__second_stage_retry:");

	__asm__ __volatile__ ("tst r15 ");     		            // 1 cycles
	__asm__ __volatile__ ("jz  __system_restore");		    // 2 cycles

	__asm__ __volatile__ ("mov #0x6000,  r14");			    // 2 cycles

	__asm__ __volatile__ ("_retry_second_phase_commit_strt:");  // Worst case

	__asm__ __volatile__ ("mov @r10+2,  r9 ");   			// 2 cycles

	__asm__ __volatile__ ("mov r9,  r11 ");   			    // 1 cycle

	__asm__ __volatile__ ("and #0x8000,  r11 ");   			// 2 cycles
	__asm__ __volatile__ ("cmp #0x8000,  r11 ");   			// 2 cycles
	__asm__ __volatile__ ("jeq _retry_byte_copy ");   		// 2 cycles

	__asm__ __volatile__ ("mov @r14+2, @r9 ");    			// 5 cycles

	__asm__ __volatile__ ("dec r15");    					// 1 cycles
	__asm__ __volatile__ ("tst r15");    					// 1 cycles

	__asm__ __volatile__ ("jnz  _retry_second_phase_commit_strt");// 2 cycles
	__asm__ __volatile__ ("br #__retry_complete");		    // 2 cycle

	__asm__ __volatile__ ("_retry_byte_copy: ");
	__asm__ __volatile__ ("and #0x7FFF,  r9  ");   			// mask the highest bit 2 cycles
	__asm__ __volatile__ ("mov r9,      r11  ");   			// 1 cycle
	__asm__ __volatile__ ("and #0x01,    r11 ");   			// detect if its a byte write - 2 cycles
	__asm__ __volatile__ ("bis  r11,     r14 ");   			// detect if its a byte write - 2 cycles

	__asm__ __volatile__ ("mov.b @r14, @r9  ");    			// 5 cycles
	__asm__ __volatile__ ("incd r14 ");    					// 1 cycle

	__asm__ __volatile__ ("dec r15");    					// 1 cycles
	__asm__ __volatile__ ("tst r15");    					// 1 cycles
	__asm__ __volatile__ ("jnz  _retry_second_phase_commit_strt");// 2 cycles

	__asm__ __volatile__ ("__retry_complete:");

	//Point that such checkpoint has been completed- fix this to switch the flag as in the isr routine
	__asm__ __volatile__ ("cmp.b #0x02, &0x603E");
	__asm__ __volatile__ ("jz __set_flag_complete");

	__asm__ __volatile__ ("mov #0x0301, &0x603E ");
	__asm__ __volatile__ ("br #__system_restore:");

	__asm__ __volatile__ ("__set_flag_complete:");
	__asm__ __volatile__ ("mov #0x0103, &0x603E ");

	//-------------------------------------------------------------------------------------------------------------//
	//   SYSTEM RESTORE	 Total: 							   								   					   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("__system_restore:");

	/* Disable The Watchdog */
	__asm__ __volatile__ ("mov #288, r8");
	__asm__ __volatile__ ("mov #23168, 0(r8)");
	/* Enable and Configure the UART */
	__asm__ __volatile__ ("mov.b #130, r8");
	__asm__ __volatile__ ("mov   #8, 0(r8)");

	__asm__ __volatile__ ("mov.b #128, r8");
	__asm__ __volatile__ ("mov.b   #1, 0(r8)");


	/* VOLATILE STATE RESTORE 	: STACK RESTORE											  				 		   */
	/* Note: The amount of cycles depend on the addressing mode not on the instruction 		 					   */

	/* TESTING ONLY: Wipe out the stack and restore it*/
	/* STACK ERASE														  				  	  					   */
	__asm__ __volatile__ ("mov #0x7FFE, r14");	   //2 cycles

	__asm__ __volatile__ ("__erase_stack:");

	__asm__ __volatile__ ("cmp #0x7EFE,r14");	   //compare and verify if the base has been reached 1 cycle
	__asm__ __volatile__ ("jz __deletion_stack_complete");	//2 cycles

	__asm__ __volatile__ ("mov #0x00000,@r14");		//4 cycles
	__asm__ __volatile__ ("decd r14");				//1 cycle
	__asm__ __volatile__ ("br #__erase_stack");		//2 cycles

	__asm__ __volatile__ ("__deletion_stack_complete:");

	/* STACK RESTORE		12 cycles per word		384 cycles	per 64B								 */

	__asm__ __volatile__ ("mov #0x7FFE, r14");		//2 cycles

	__asm__ __volatile__ ("decd r12");				//1 cycle

	__asm__ __volatile__ ("__restore_stack:");

	__asm__ __volatile__ ("cmp r14,r12");	   		// compare and verify if the base has been reached - 1 cycle
	__asm__ __volatile__ ("jz __init_restore_stack_complete"); //2 cycles

	__asm__ __volatile__ ("mov @r13,@r14");					//5 cycles
	__asm__ __volatile__ ("decd r13");						//1 cycle
	__asm__ __volatile__ ("decd r14");						//1 cycle
	__asm__ __volatile__ ("br #__restore_stack");			//2 cycles

	__asm__ __volatile__ ("__init_restore_stack_complete:");

	/* VERIFY WHICH REGISTERS SHOULD BE RESTORED				*/

	__asm__ __volatile__ ("cmp.b #0x03,&0x603F");
	__asm__ __volatile__ ("jeq __Second_buffer_restore_stack");

	/* SYSTEM REGISTERS RESTORE												  				  */
	/* Restore registers and PC (last) 										  				  */
	/* EDE -> Rm  : 3 cycles each 											  				  */
	/* EDE -> PC  : 4 cycles (1 extra cycle penalty) for openMSP430 		  				  */
	/* Register time: 15x3 = 45 cycles + 4 cycles (PC) = 49 Cycles  (53 counting Qwark enable)*/
	__asm__ __volatile__ ("__First_buffer_restore_stack:");

	__asm__ __volatile__ ("mov &0x6016,r4"); 		//R4	 3 cycles x 16 = 48 + 1 = 49 cycles
	__asm__ __volatile__ ("mov &0x6018,r5"); 		//R5
	__asm__ __volatile__ ("mov &0x601A,r6"); 		//R6
	__asm__ __volatile__ ("mov &0x601C,r7"); 		//R7
	__asm__ __volatile__ ("mov &0x601E,r8"); 		//R8
	__asm__ __volatile__ ("mov &0x6020,r9"); 		//R9
	__asm__ __volatile__ ("mov &0x6022,r10"); 		//R10
	__asm__ __volatile__ ("mov &0x6024,r11"); 		//R11
	__asm__ __volatile__ ("mov &0x6026,r12"); 		//R12
	__asm__ __volatile__ ("mov &0x6028,r13"); 	    //R13
	__asm__ __volatile__ ("mov &0x602A,r14"); 		//R14
	__asm__ __volatile__ ("mov &0x602C,r15"); 		//R15
	__asm__ __volatile__ ("mov &0x6012,r1");   		//SP/R1
	__asm__ __volatile__ ("mov &0x6014,r2"); 	    //SR/R2

	/* Enable Idempotency Tracking before restarting operation 		 				  	  */
	__asm__ __volatile__ ("mov #0x0001 , &0x0190");	/* QWARK_CTL Enable 4 cycles 		  */

	/*Restore program Counter */
	__asm__ __volatile__ ("mov &0x6010, pc"); 	    //PC/R0

	__asm__ __volatile__ ("__Second_buffer_restore_stack:");

	__asm__ __volatile__ ("mov &0x6046,r4"); 		//R4	 3 cycles x 16 = 48 + 1 = 49 cycles
	__asm__ __volatile__ ("mov &0x6048,r5"); 		//R5
	__asm__ __volatile__ ("mov &0x604A,r6"); 		//R6
	__asm__ __volatile__ ("mov &0x604C,r7"); 		//R7
	__asm__ __volatile__ ("mov &0x604E,r8"); 		//R8
	__asm__ __volatile__ ("mov &0x6050,r9"); 		//R9
	__asm__ __volatile__ ("mov &0x6052,r10"); 		//R10
	__asm__ __volatile__ ("mov &0x6054,r11"); 		//R11
	__asm__ __volatile__ ("mov &0x6056,r12"); 		//R12
	__asm__ __volatile__ ("mov &0x6058,r13"); 	    //R13
	__asm__ __volatile__ ("mov &0x605A,r14"); 		//R14
	__asm__ __volatile__ ("mov &0x605C,r15"); 		//R15
	__asm__ __volatile__ ("mov &0x6042,r1");   		//SP/R1
	__asm__ __volatile__ ("mov &0x6044,r2"); 	    //SR/R2

	/* Enable Idempotency Tracking before restarting operation 		 				  	  */
	__asm__ __volatile__ ("mov #0x0001 , &0x0190");	/* QWARK_CTL Enable 4 cycles 		  */

	/*Restore program Counter */
	__asm__ __volatile__ ("mov &0x6040, pc"); 	    //PC/R0

}
#endif

//-------------------------------------------------------------------------------------------------------------------------------------------//
//    QWARK Checkpoint Procedure: without stack: 215 cycles => First phase: 141 cycles - second phase: 74    , complete: 683.5 at 64B stack  //
//-------------------------------------------------------------------------------------------------------------------------------------------//

interrupt (QWARK_VECTOR) INT_Qwark(void) {

	/* No local Variables are allowed in this context*/

	/* Idempotency Tracking is disabled by default upon entering this context */

	//Identify which of the 2 checkpoint buffers should be written, one should always be consistent.

		__asm__ __volatile__ ("mov r12, &0x6072"); 			//temporal r12

		__asm__ __volatile__ ("cmp.b #0x01,&0x603F"); 		//verify if the first buffer has been finalized, if so, then use the second
		__asm__ __volatile__ ("jz __second_buffer_init");

		__asm__ __volatile__ ("mov #0x6010, r12"); 			    //Load the base pointer of the first checkpoint buffer
		__asm__ __volatile__ ("mov.b #0x01,&0x603E");			//set to 3.- 2nd buffer start
		__asm__ __volatile__ ("br #__first_phase_commit");		//set to 3.- 2nd buffer start


		__asm__ __volatile__ ("__second_buffer_init:");

		__asm__ __volatile__ ("mov #0x6040, r12"); 			 //Load the base pointer of the second checkpoint buffer

		//-------------------------------------------------------------------------------------------------------------//
		//    FIRST PHASE OF THE COMMIT PROCESS																	       //
		//-------------------------------------------------------------------------------------------------------------//

		__asm__ __volatile__ ("__first_phase_commit:");

		__asm__ __volatile__ ("mov 2(r1),@r12"); 	//PC/R0   6 cycles       = 21 cycles
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r1,@r12");   		//SP/R1   4 cycles   =  9 cycles
		__asm__ __volatile__ ("add #0x04,@r12");		//		  5 cycles
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov 0(r1),@r12"); 	//SR/R2   6 cycles
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r4,@r12"); 		//R4	  4 cycles x 10 = 40 cycles
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r5,@r12"); 		//R5
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r6,@r12"); 		//R6
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r7,@r12"); 		//R7
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r8,@r12"); 		//R8
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r9,@r12"); 		//R9
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r10,@r12"); 		//R10
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r11,@r12"); 		//R11
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov &0x6072,@r12"); 	//R12	  5 cycles
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r13,@r12"); 	    //R13	  4 cycles
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r14,@r12"); 		//R14
		__asm__ __volatile__ ("incd r12");

		__asm__ __volatile__ ("mov r15,@r12"); 		//R15
		__asm__ __volatile__ ("incd r12");

	//Get the index indicating the amount of violations stored (9 cycles)

		__asm__ __volatile__ ("mov &0x0190, r14");		// 3 cycles
		__asm__ __volatile__ ("RRA r14");				// 1 cycle
		__asm__ __volatile__ ("mov.b r14, @r12");		// 4 cycles
		__asm__ __volatile__ ("mov r14, r15 ");		    // 1 cycle (save the index for later)
		__asm__ __volatile__ ("incd r12");

	/* based on the amount of violations, copy the addresses to the scratchpad */
	/* Setup registers for copy*/

		__asm__ __volatile__ ("tst r14 ");     		       // 1 cycle
		__asm__ __volatile__ ("jz  _chkpt_stack");		   // 2 cycles

		__asm__ __volatile__ ("mov #0x0192, r13");		  // 2 cycles

		__asm__ __volatile__ ("_scratchpad_addr_cpy:");   // Each iteration takes 10 cycles - Worst case 70 cycles

		__asm__ __volatile__ ("mov @r13+2, @r12");         // 5 cycles
		__asm__ __volatile__ ("incd r12");  		       // 1 cycle
		__asm__ __volatile__ ("dec r14 ");      	       // 1 cycle
		__asm__ __volatile__ ("tst r14 ");     		       // 1 cycle
		__asm__ __volatile__ ("jnz  _scratchpad_addr_cpy");// 2 cycles

	/* 1.3 .- Checkpoint the Stack (FULL COPY / no segmentation yet) : 64B stack take approximately 466 cycles*/

		__asm__ __volatile__ ("_chkpt_stack:");

	    //verify which of the 2 stacks should be overwritten (Double buffering)

		__asm__ __volatile__ ("mov #0x7FFE, r14");		//2 cycles
		__asm__ __volatile__ ("mov &0X6042, r12"); 		//Get the current SP - 3 cycles
		__asm__ __volatile__ ("mov #0x6BFE, r13");		//2 cycles

		__asm__ __volatile__ ("cmp.b #0x01,&0x603F");   //working with the second stack
		__asm__ __volatile__ ("jz __pre_copy_stack");

		__asm__ __volatile__ ("mov &0X6012, r12"); 		//Get the current SP - 3 cycles
		__asm__ __volatile__ ("mov #0x6FFE, r13");		//2 cycles

		__asm__ __volatile__ ("__pre_copy_stack:");

		__asm__ __volatile__ ("decd r12");				//1 cycle

		__asm__ __volatile__ ("__copy_stack:");

		__asm__ __volatile__ ("cmp r14,r12");	   		  //compare and verify if the base has been reached - 1 cycle
		__asm__ __volatile__ ("jz __copy_stack_complete");//2 cycles

		__asm__ __volatile__ ("mov @r14,@r13");			  //5 cycles

		__asm__ __volatile__ ("decd r13");				  //1 cycle
		__asm__ __volatile__ ("decd r14");				  //1 cycle
		__asm__ __volatile__ ("br #__copy_stack");		  //2 cycle

		__asm__ __volatile__ ("__copy_stack_complete:");

	//-------------------------------------------------------------------------------------------------------------//
	//    FIRST PHASE COMPLETED	: Set Binary Semaphore: 1														   //
	//-------------------------------------------------------------------------------------------------------------//

	/* after setting this bit, it is possible to reproduce the checkpoint even if it fails halfway through */

		__asm__ __volatile__ ("cmp.b #0x01,&0x603F");
		__asm__ __volatile__ ("jz  __set_flag_2nd ");

		__asm__ __volatile__ ("add.b #0x01, &0x603E "); //4 cycles
		__asm__ __volatile__ ("br  #_second_phase_commit "); //4 cycles

		__asm__ __volatile__ ("__set_flag_2nd:");
		__asm__ __volatile__ ("add.b #0x01, &0x603F "); //4 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//    SECOND PHASE OF THE COMMIT PROCESS : 148 cycles														   //
	//-------------------------------------------------------------------------------------------------------------//
		__asm__ __volatile__ ("_second_phase_commit:");    // Worst case


		__asm__ __volatile__ ("tst r15 ");     		           // 1 cycles
		__asm__ __volatile__ ("jz  _chkpt_finished");		   // 2 cycles

		__asm__ __volatile__ ("mov #0x6000,  r14 ");			// 2 cycles

		__asm__ __volatile__ ("mov #0x6060,  r12 ");			// 2 cycles
		__asm__ __volatile__ ("cmp.b #0x02,&0x603F");
		__asm__ __volatile__ ("jz _second_phase_commit_strt");

		__asm__ __volatile__ ("mov #0x6030,  r12 ");			// 2 cycles


		__asm__ __volatile__ ("_second_phase_commit_strt:");    // Worst case

		__asm__ __volatile__ ("mov @r12+2,  r13 ");   			// 2 cycles

		__asm__ __volatile__ ("mov r13,  r11 ");   			    // 1 cycle

		__asm__ __volatile__ ("and #0x8000,  r11 ");   			// 2 cycles
		__asm__ __volatile__ ("cmp #0x8000,  r11 ");   			// 2 cycles
		__asm__ __volatile__ ("jeq _byte_copy ");   			// 2 cycles

		__asm__ __volatile__ ("mov @r14+2, @r13 ");    			// 5 cycles

		__asm__ __volatile__ ("dec r15");    					// 1 cycles
		__asm__ __volatile__ ("tst r15");    					// 1 cycles

		__asm__ __volatile__ ("jnz  _second_phase_commit_strt");// 2 cycles
		__asm__ __volatile__ ("br #_chkpt_finished");		    // 2 cycle

		__asm__ __volatile__ ("_byte_copy:");    				//
		__asm__ __volatile__ ("and #0x7FFF,  r13 ");   			// mask the highest bit 2 cycles
		__asm__ __volatile__ ("mov r13,      r11 ");   			// 1 cycle
		__asm__ __volatile__ ("and #0x01,    r11 ");   			// detect if its a byte write - 2 cycles
		__asm__ __volatile__ ("bis  r11,     r14 ");   			// detect if its a byte write - 2 cycles

		__asm__ __volatile__ ("mov.b @r14, @r13 ");    			// 5 cycles
		__asm__ __volatile__ ("incd r14 ");    					// 1 cycle

		__asm__ __volatile__ ("dec r15");    					// 1 cycles
		__asm__ __volatile__ ("tst r15");    					// 1 cycles
		__asm__ __volatile__ ("jnz  _second_phase_commit_strt");// 2 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//    CHECKPOINT COMPLETED	- Binary Semaphore set to 2	:  20 cycles										   //
	//-------------------------------------------------------------------------------------------------------------//
		__asm__ __volatile__ ("_chkpt_finished:");

	/* Set second phase complete Bit - Atomic Flag*/
		__asm__ __volatile__ ("cmp.b #0x02,&0x603F");
		__asm__ __volatile__ ("jeq  __pre_finish_2nd_buffer ");

		__asm__ __volatile__ ("mov #0x0103, &0x603E "); //4 cycles

		__asm__ __volatile__ ("mov &0x6024,r11"); 		//3 cycles
		__asm__ __volatile__ ("mov &0x6026,r12"); 		//3 cycles
		__asm__ __volatile__ ("mov &0x6028,r13"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x602A,r14"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x602C,r15"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x602C,r15"); 	    //3 cycles

		__asm__ __volatile__ ("br #_finish"); 	   		//3 cycles

		__asm__ __volatile__ ("__pre_finish_2nd_buffer:");

		__asm__ __volatile__ ("mov #0x0301, &0x603E "); //4 cycles

		__asm__ __volatile__ ("mov &0x6054,r11"); 		//3 cycles
		__asm__ __volatile__ ("mov &0x6056,r12"); 		//3 cycles
		__asm__ __volatile__ ("mov &0x6058,r13"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x605A,r14"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x605C,r15"); 	    //3 cycles


		/* This is to continue operation. If at this point a power failure happens, the system can re-start*/
		/* Clear index counter, and enable Idempotency tracking*/

		__asm__ __volatile__ ("_finish:");
		__asm__ __volatile__ ("mov #0x0001, &0x0190");	//4 cycles

}
