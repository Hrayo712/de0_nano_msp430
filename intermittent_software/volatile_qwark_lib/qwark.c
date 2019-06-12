/*
 * qwark.c
 *
 *  Created on: May 9, 2019
 *      Author: hiram
 */
#include <omsp_system.h>

#include "qwark.h"

#define INTERMITTENCY_HANDLING_ENABLED
#define TIMER_TEST

#ifdef INTERMITTENCY_HANDLING_ENABLED

void qwark_restore(void) __attribute__ ((naked));
void qwark_restore(void) __attribute__ ((used));
void qwark_restore(void) __attribute__ ((section (".crt_0001_qwark")));
void qwark_restore(void)
{
	//-------------------------------------------------------------------------------------------------------------//
	//    RESTORE HANDLING LOGIC																  				   //
	//	  W.C 30 CYCLES																							   //
	//-------------------------------------------------------------------------------------------------------------//

	/* Disable Qwark */
	__asm__ __volatile__ ("mov #0x0000, &0x02A0");				// 4 cycles

	__asm__ __volatile__ ("cmp.b #0x02, &0x6074");				// 2 cycles
	__asm__ __volatile__ ("jz __qwark_retry_1st_setup");		// 2 cycles

	__asm__ __volatile__ ("cmp.b #0x03, &0x6075");				// 3 cycles
	__asm__ __volatile__ ("jz __qwark_restore_2nd_setup");		// 2 cycles
	__asm__ __volatile__ ("cmp.b #0x03, &0x6074");				// 3 cycles
	__asm__ __volatile__ ("jnz __crt0_init_bss");				// 2 cycles

	__asm__ __volatile__ ("cmp.b #0x02, &0x6075");				// 2 cycles
	__asm__ __volatile__ ("jz  __qwark_retry_2nd_setup");		// 2 cycles

	__asm__ __volatile__ ("__qwark_restore_1st_setup:");

	__asm__ __volatile__ ("mov &0X6012,   r12 ");				// 3 cycles
    __asm__ __volatile__ ("mov #0x6FFE,   r13 ");				// 2 cycles
	__asm__ __volatile__ ("br  #__system_restore");				// 2 cycles

	__asm__ __volatile__ ("__qwark_restore_2nd_setup:");

	__asm__ __volatile__ ("mov &0X6042, r12   ");				// 3 cycles
    __asm__ __volatile__ ("mov #0x6BFE, r13   ");				// 2 cycles
	__asm__ __volatile__ ("br  #__system_restore");				// 2 cycles

	__asm__ __volatile__ ("__qwark_retry_1st_setup:");

	__asm__ __volatile__ ("mov  #0x6030,   r10 ");				// 2 cycles
	__asm__ __volatile__ ("mov  &0X6012,   r12 ");				// 3 cycles
    __asm__ __volatile__ ("mov  #0x6FFE,   r13 ");				// 2 cycles
	__asm__ __volatile__ ("mov  &0x602E,   r15 ");				// 3 cycles
	__asm__ __volatile__ ("br  #__second_stage_retry");			// 2 cycles

	__asm__ __volatile__ ("__qwark_retry_2nd_setup:");

	__asm__ __volatile__ ("mov #0x6060,   r10 ");				// 2 cycles
	__asm__ __volatile__ ("mov &0X6042,   r12 ");				// 3 cycles
    __asm__ __volatile__ ("mov #0x6BFE,   r13 ");				// 2 cycles
	__asm__ __volatile__ ("mov &0x605E,   r15 ");				// 3 cycles

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
	__asm__ __volatile__ ("and #0xFFFE, r14 ");    			// 1 cycle
	__asm__ __volatile__ ("incd r14 ");    					// 1 cycle

	__asm__ __volatile__ ("dec r15");    					// 1 cycles
	__asm__ __volatile__ ("tst r15");    					// 1 cycles
	__asm__ __volatile__ ("jnz  _retry_second_phase_commit_strt");// 2 cycles

	__asm__ __volatile__ ("__retry_complete:");

	//-------------------------------------------------------------------------------------------------------------//
	//    END OF THE RETRY-SECOND PHASE	: Atomic Flag Set														   //
	//	  W.C 18 Cycles																							   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("cmp.b #0x02, &0x6074");		// 4 cycles
	__asm__ __volatile__ ("jz __set_flag_complete");	// 2 cycles

	__asm__ __volatile__ ("mov #0x0301, &0x6074 ");		// 5 cycles
	__asm__ __volatile__ ("br #__system_restore:");		// 2 cycles

	__asm__ __volatile__ ("__set_flag_complete:");
	__asm__ __volatile__ ("mov #0x0103, &0x6074 ");		// 5 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//   SYSTEM RESTORE	 WATCHDOG AND UART SETUP 							   								   	   //
	//	 12 CYCLES																								   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("__system_restore:");

	/* Disable The Watchdog */
	__asm__ __volatile__ ("mov #288, r8");		// 2 cycles
	__asm__ __volatile__ ("mov #23168, 0(r8)");	// 2 cycles

	/* Enable and Configure the UART */
	__asm__ __volatile__ ("mov.b #130, r8");	// 2 cycles
	__asm__ __volatile__ ("mov   #8, 0(r8)");	// 2 cycles

	__asm__ __volatile__ ("mov.b #128, r8");	// 2 cycles
	__asm__ __volatile__ ("mov.b   #1, 0(r8)"); // 2 cycles

	/* Configure the timer */
#ifdef TIMER_TEST
	__asm__ __volatile__ ("mov  #370, r8");		    // 2 cycles
	__asm__ __volatile__ ("mov  #9980, 0(r8)");	// 2 cycles

	__asm__ __volatile__ ("mov  #352, r8");		    // 2 cycles
	__asm__ __volatile__ ("mov  #534, 0(r8)");	    // 2 cycles
#endif
	//-------------------------------------------------------------------------------------------------------------//
	//   VOLATILE STATE RESTORE 							   								   	   				   //
	//	 12 CYCLES																								   //
	//-------------------------------------------------------------------------------------------------------------//
	//-------------------------------------------------------------------------------------------------------------//
	//   STACK RESTORE 							   							  									   //
	//																									       	   //
	//-------------------------------------------------------------------------------------------------------------//
	//-------------------------------------------------------------------------------------------------------------//
	//   TESTING ONLY: Wipe out the stack first to verify the restoration works									   //
	//	 N.A.																								       //
	//-------------------------------------------------------------------------------------------------------------//

	__asm__ __volatile__ ("mov #0x7FFE, r14");

	__asm__ __volatile__ ("__erase_stack:");

	__asm__ __volatile__ ("cmp #0x7EFE,r14");
	__asm__ __volatile__ ("jz __deletion_stack_complete");

	__asm__ __volatile__ ("mov #0x00000,@r14");
	__asm__ __volatile__ ("decd r14");
	__asm__ __volatile__ ("br #__erase_stack");

	__asm__ __volatile__ ("__deletion_stack_complete:");

	//-------------------------------------------------------------------------------------------------------------//
	//   STACK RESTORE 							   							  									   //
	//	 12 cycles per word		384 cycles	per 64B		+ 3 CYCLES OF LOGIC										   //
	//-------------------------------------------------------------------------------------------------------------//

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

	//-------------------------------------------------------------------------------------------------------------//
	//   REGISTERS RESTORE: VERIFY WHICH REGISTERS SHOULD BE RESTORED					   						   //
	//	 																										   //
	//-------------------------------------------------------------------------------------------------------------//

	__asm__ __volatile__ ("cmp.b #0x03,&0x6075");				// 5 cycles
	__asm__ __volatile__ ("jeq __Second_buffer_restore_stack"); // 2 cycles

	/* SYSTEM REGISTERS RESTORE												  				  		      */
	/* Restore registers and PC (last) 										  				  			  */
	/* EDE -> Rm  : 3 cycles each 											  				  			  */
	/* EDE -> PC  : 4 cycles (1 extra cycle penalty) for openMSP430 		  				  			  */
	/* Register time: 14x3 = 42 cycles + 4 cycles (PC) = 49 Cycles + 4(Qwark enable) = 53 cycles 		  */
	__asm__ __volatile__ ("__First_buffer_restore_stack:");

	__asm__ __volatile__ ("mov &0x6016,r4"); 		//R4
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
	__asm__ __volatile__ ("mov #0x0001 , &0x02A0");	/* QWARK_CTL Enable 4 cycles 		  */

	/*Restore program Counter */
	__asm__ __volatile__ ("mov &0x6010, pc"); 	    //PC/R0

	__asm__ __volatile__ ("__Second_buffer_restore_stack:");

	__asm__ __volatile__ ("mov &0x6046,r4"); 		//R4
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
	__asm__ __volatile__ ("mov #0x0001 , &0x02A0");	/* QWARK_CTL Enable 4 cycles 		  */

	/*Restore program Counter */
	__asm__ __volatile__ ("mov &0x6040, pc"); 	    //PC/R0

}
#endif

//-------------------------------------------------------------------------------------------------------------------------------------------//
//    QWARK CHECKPOINT PROCEDURE																											 //
//-------------------------------------------------------------------------------------------------------------------------------------------//

interrupt (QWARK_VECTOR) INT_Qwark(void) {

	/* No local Variables are allowed in this context*/
	/* Idempotency Tracking is disabled by default upon entering this context */

	//---------------------------------------------------------------------------------------------------------------------------------//
	//    CHECKPOINT SETUP: Identify which of the 2 checkpoint buffers should be written, one should always be consistent		       //
	//	  W.C. 18 CYCLES																											   //
	//	  B.C. 10 CYCLES																											   //
	//---------------------------------------------------------------------------------------------------------------------------------//
		__asm__ __volatile__ ("mov r13, &0x6070"); 		//temporal r13: 4 cycles
		__asm__ __volatile__ ("mov r12, &0x6072"); 		//temporal r12: 4 cycles

		__asm__ __volatile__ ("cmp.b #0x01,&0x6075"); 		//4 cycles
		__asm__ __volatile__ ("jz __second_buffer_init");	//2 cycles

		__asm__ __volatile__ ("mov #0x6010, r12"); 			//Load the base pointer of the first checkpoint buffer: 2 cycles
		__asm__ __volatile__ ("mov.b #0x01,&0x6074");		//4 cycles
		__asm__ __volatile__ ("br #__first_phase_commit");	//2 cycles

		__asm__ __volatile__ ("__second_buffer_init:");

		__asm__ __volatile__ ("mov #0x6040, r12"); 			//Load the base pointer of the second checkpoint buffer: 2 cycles

		//-------------------------------------------------------------------------------------------------------------//
		// START OF THE FIRST PHASE OF THE COMMIT PROCESS															   //
		//-------------------------------------------------------------------------------------------------------------//

		//-------------------------------------------------------------------------------------------------------------//
		//    SYSTEM REGISTER CHECKPOINT																		       //
		//	  84 CYCLES																								   //
		//-------------------------------------------------------------------------------------------------------------//
		__asm__ __volatile__ ("__first_phase_commit:");

		__asm__ __volatile__ ("mov 2(r1),@r12"); 	//PC/R0   6 cycles
		__asm__ __volatile__ ("incd r12");			//		  1 cycle

		__asm__ __volatile__ ("mov r1,@r12");   	//SP/R1   4 cycles
		__asm__ __volatile__ ("add #0x04,@r12");	//		  5 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov 0(r1),@r12"); 	//SR/R2   6 cycles
		__asm__ __volatile__ ("incd r12");		// 	  1 cycle

		__asm__ __volatile__ ("mov &0x02A0,r13"); 	//Disable Qwark and signal a buffer reset without modifying the data - 3 cycles
		__asm__ __volatile__ ("and #0x3E,r13"); 	//	  2 cycles
		__asm__ __volatile__ ("bis #0x40,r13"); 	//	  2 cycles
		__asm__ __volatile__ ("mov r13,&0x02A0");	//	  4 cycles		
		__asm__ __volatile__ ("and #0xBF,r13"); 	//	  2 cycles
		__asm__ __volatile__ ("mov r13,&0x02A0");	//	  4 cycles		

		__asm__ __volatile__ ("mov r4,@r12"); 		//R4	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov r5,@r12"); 		//R5	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov r6,@r12"); 		//R6	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov r7,@r12"); 		//R7	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov r8,@r12"); 		//R8	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov r9,@r12"); 		//R9	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov r10,@r12"); 		//R10	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov r11,@r12"); 		//R11	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov &0x6072,@r12"); 	//R12	  6 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov &0x6070,@r12"); 	//R13	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov r14,@r12"); 		//R14	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		__asm__ __volatile__ ("mov r15,@r12"); 		//R15	  4 cycles
		__asm__ __volatile__ ("incd r12");			// 		  1 cycle

		//-------------------------------------------------------------------------------------------------------------//
		//    WAR VIOLATION INDEX CHECKPOINT: Get the index indicating the amount of violations stored 				   //
		//	  10 CYCLES																								   //
		//																											   //
		//-------------------------------------------------------------------------------------------------------------//

		__asm__ __volatile__ ("mov &0x02A0, r14");	// 		  3 cycles
		__asm__ __volatile__ ("RRA r14");			// 		  1 cycle
		__asm__ __volatile__ ("mov.b r14, @r12");	// 		  4 cycles
		__asm__ __volatile__ ("mov r14, r15 ");		// 		  1 cycle (save the index for later)
		__asm__ __volatile__ ("incd r12");			// 		  1 Cycle

		//-------------------------------------------------------------------------------------------------------------//
		//    VIOLATION ADDRESSES SHADOWCOPY: based on the amount of violations, copy the addresses to the scratchpad  //
		//	  W.C.	75 CYCLES FOR FULL  TLB	(10 CYCLES PER ADDRESS + 5 CYCLES OF LOGIC)								   //
		//	  B.C.	 5 CYCLES FOR EMPTY TLB																			   //
		//-------------------------------------------------------------------------------------------------------------//

		/* Setup registers for copy*/

		__asm__ __volatile__ ("tst r14 ");     	    // 		  1 cycle
		__asm__ __volatile__ ("jz  _chkpt_stack");	// 		  2 cycles

		__asm__ __volatile__ ("mov #0x02A2, r13");	// 		  2 cycles

		__asm__ __volatile__ ("_scratchpad_addr_cpy:");   // Each iteration takes 10 cycles - Worst case 70 cycles

		__asm__ __volatile__ ("mov @r13+2, @r12");  // 		  5 cycles
		__asm__ __volatile__ ("incd r12");  		// 		  1 cycle
		__asm__ __volatile__ ("dec r14 ");      	// 		  1 cycle
		__asm__ __volatile__ ("tst r14 ");     		// 		  1 cycle
		__asm__ __volatile__ ("jnz  _scratchpad_addr_cpy");// 2 cycles

		//-------------------------------------------------------------------------------------------------------------//
		//   STACK CHECKPOINT: (FULL COPY / no segmentation)  													   	   //
		//	 64B take approximately 466 cycles 										 								   //
		//	  																   										   //
		//-------------------------------------------------------------------------------------------------------------//

		/* 1.3 .- Checkpoint the Stack (FULL COPY / no segmentation yet) : 64B stack take approximately 466 cycles*/

		__asm__ __volatile__ ("_chkpt_stack:");

	    //verify which of the 2 stacks should be overwritten (Double buffering)

		__asm__ __volatile__ ("mov #0x7FFE, r14");			 // 2 cycles
		__asm__ __volatile__ ("mov &0X6042, r12"); 			 // Get the current SP - 3 cycles
		__asm__ __volatile__ ("mov #0x6BFE, r13");			 // 2 cycles

		__asm__ __volatile__ ("cmp.b #0x01,&0x6075");   	 // working with the second stack
		__asm__ __volatile__ ("jz __pre_copy_stack");		 // 2 cycles

		__asm__ __volatile__ ("mov &0X6012, r12"); 			 // Get the current SP - 3 cycles
		__asm__ __volatile__ ("mov #0x6FFE, r13");			 // 2 cycles

		__asm__ __volatile__ ("__pre_copy_stack:");

		__asm__ __volatile__ ("decd r12");					 // 1 cycle

		__asm__ __volatile__ ("__copy_stack:");

		__asm__ __volatile__ ("cmp r14,r12");	   		  	 // compare and verify if the base has been reached - 1 cycle
		__asm__ __volatile__ ("jz __copy_stack_complete");	 // 2 cycles

		__asm__ __volatile__ ("mov @r14,@r13");			 	 // 5 cycles

		__asm__ __volatile__ ("decd r13");				  	 // 1 cycle
		__asm__ __volatile__ ("decd r14");				  	 // 1 cycle
		__asm__ __volatile__ ("br #__copy_stack");		  	 // 2 cycle

		__asm__ __volatile__ ("__copy_stack_complete:");

	//-------------------------------------------------------------------------------------------------------------//
	//    END OF THE FIRST PHASE: Atomic Flag Handling for halfway through checkpoint							   //
	//	  W.C 18 Cycles																							   //
	//-------------------------------------------------------------------------------------------------------------//

		__asm__ __volatile__ ("cmp.b #0x01,&0x6075");		 // 4 cycles
		__asm__ __volatile__ ("jz  __set_flag_2nd ");		 // 2 cycles

		__asm__ __volatile__ ("add.b #0x01, &0x6074 "); 	 //4 cycles
		__asm__ __volatile__ ("br  #_second_phase_commit "); //4 cycles

		__asm__ __volatile__ ("__set_flag_2nd:");
		__asm__ __volatile__ ("add.b #0x01, &0x6075 "); 	 // 4 cycles		/* after setting this bit, THE RESTORE ROUTINE CAN FINALIZE THIS HALFWAY CHECKPOINT  */

	//-------------------------------------------------------------------------------------------------------------//
	//    START OF THE SECOND PHASE OF THE COMMIT PROCESS : 148 CYCLES											   //
	//	  NOTE: BYTE ADDRESSING IS HANDLED DIFFERENTLY THAN WORD (16-BIT) ADDRESSING. CYCLE COUNTINT IS GIVEN 	   //
	//	  ASSUMMING ONLY WORD ADDRESSING. 																		   //
	//-------------------------------------------------------------------------------------------------------------//

		__asm__ __volatile__ ("_second_phase_commit:");

		__asm__ __volatile__ ("tst r15 ");     		         // 1 cycle
		__asm__ __volatile__ ("jz  _chkpt_finished");		 // 2 cycles

		__asm__ __volatile__ ("mov #0x6000,  r14 ");		 // 2 cycles

		__asm__ __volatile__ ("mov #0x6060,  r12 ");		 // 2 cycles
		__asm__ __volatile__ ("cmp.b #0x02,&0x6075");		 // 4 cycles
		__asm__ __volatile__ ("jz _second_phase_commit_strt"); // 2 cycles

		__asm__ __volatile__ ("mov #0x6030,  r12 ");		 // 2 cycles


		__asm__ __volatile__ ("_second_phase_commit_strt:"); // Worst case

		__asm__ __volatile__ ("mov @r12+2,  r13 ");   		 // 3 cycles

		__asm__ __volatile__ ("mov r13,  r11 ");   			 // 1 cycle

		__asm__ __volatile__ ("and #0x8000,  r11 ");   		 // 2 cycles
		__asm__ __volatile__ ("cmp #0x8000,  r11 ");   		 // 2 cycles
		__asm__ __volatile__ ("jeq _byte_copy ");   		 // 2 cycles

		__asm__ __volatile__ ("mov @r14, @r13 ");    		 // 5 cycles

		__asm__ __volatile__ ("_pre_end_copy:");
		__asm__ __volatile__ ("incd r14");    			 // 1 cycle
		__asm__ __volatile__ ("dec r15");    			 // 1 cycle
		__asm__ __volatile__ ("tst r15");    			 // 1 cycle

		__asm__ __volatile__ ("jnz  _second_phase_commit_strt");	// 2 cycles
		__asm__ __volatile__ ("br #_chkpt_finished");		    	// 2 cycles

		__asm__ __volatile__ ("_byte_copy:");
		__asm__ __volatile__ ("and #0x7FFF,  r13 ");   		// mask the highest bit - 2 cycles
		__asm__ __volatile__ ("mov r13,      r11 ");   		// 1 cycle
		__asm__ __volatile__ ("and #0x01,    r11 ");   		// detect if its a byte write - 1 cycle
		__asm__ __volatile__ ("bis  r11,     r14 ");   		// detect if its a byte write - 1 cycle

		__asm__ __volatile__ ("mov.b @r14, @r13 ");    		// 5 cycles
		__asm__ __volatile__ ("and #0xFFFE, r14");    				// 2 cycles
		__asm__ __volatile__ ("incd r14");    				 		// 1 cycle
		__asm__ __volatile__ ("dec r15");    						// 1 cycles
		__asm__ __volatile__ ("tst r15");    						// 1 cycles
		__asm__ __volatile__ ("jnz  _second_phase_commit_strt");	// 2 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//    CHECKPOINT COMPLETED	- Atomic Flag Handling for Finalized checkpoint									   //
	//	  25 CYCLES																								   //
	//-------------------------------------------------------------------------------------------------------------//
		__asm__ __volatile__ ("_chkpt_finished:");


	    /* Set second phase complete Bit - Atomic Flag*/
		__asm__ __volatile__ ("cmp.b #0x02,&0x6075");			//4 cycles
		__asm__ __volatile__ ("jeq  __pre_finish_2nd_buffer "); //2 cycles

		__asm__ __volatile__ ("mov #0x0103, &0x6074 "); //5 cycles	/* After setting this bit, THE RESTORE ROUTINE CAN RE-USE THE 1ST CHECKPOINT COMPLETELY  */

	//-------------------------------------------------------------------------------------------------------------//
	//    REGISTER RESTORE:	This is to continue operation and restore possibly modified registers 				   //
	//																											   //
	//-------------------------------------------------------------------------------------------------------------//
		__asm__ __volatile__ ("mov &0x6022,r10"); 		//3 cycles
		__asm__ __volatile__ ("mov &0x6024,r11"); 		//3 cycles
		__asm__ __volatile__ ("mov &0x6026,r12"); 		//3 cycles
		__asm__ __volatile__ ("mov &0x6028,r13"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x602A,r14"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x602C,r15"); 	    //3 cycles

		__asm__ __volatile__ ("br #_finish"); 	   		//3 cycles

		__asm__ __volatile__ ("__pre_finish_2nd_buffer:");

		__asm__ __volatile__ ("mov #0x0301, &0x6074 "); //4 cycles /* After setting this bit, THE RESTORE ROUTINE CAN RE-USE THE 2ND CHECKPOINT COMPLETELY  */

	//-------------------------------------------------------------------------------------------------------------//
	//    REGISTER RESTORE:	This is to continue operation and restore possibly modified registers 				   //
	//-------------------------------------------------------------------------------------------------------------//
		__asm__ __volatile__ ("mov &0x6052,r10"); 	    //3 cycles		
		__asm__ __volatile__ ("mov &0x6054,r11"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x6056,r12"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x6058,r13"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x605A,r14"); 	    //3 cycles
		__asm__ __volatile__ ("mov &0x605C,r15"); 	    //3 cycles

		__asm__ __volatile__ ("_finish:");
		/* Clear the counters, and re-enable Idempotency tracking*/
		__asm__ __volatile__ ("mov #0x0000, &0x6000");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x6002");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x6004");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x6006");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x6008");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x600A");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x600C");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x600E");	//4 cycles

		__asm__ __volatile__ ("mov #0x0000, &0x02A2");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x02A4");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x02A6");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x02A8");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x02AA");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x02AC");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x02AE");	//4 cycles
		__asm__ __volatile__ ("mov #0x0000, &0x02B0");	//4 cycles

		//Test software to measure the amount of checkpoints

		//__asm__ __volatile__ ("add #0x01, &0x6076");	//4 cycles

		__asm__ __volatile__ ("mov #0x0001, &0x02A0");	//4 cycles



}
