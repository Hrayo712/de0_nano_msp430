/*
 * qwark.c
 *
 *  Created on: May 9, 2019
 *      Author: hiram
 */
#include <omsp_system.h>

#include "qwark.h"

#define asm __asm__ __volatile__ 
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
	asm ("mov #0x0000, &0x02A0");				// 4 cycles

	asm ("cmp.b #0x02, &0x6074");				// 2 cycles
	asm ("jz __qwark_retry_1st_setup");		    // 2 cycles

	asm ("cmp.b #0x03, &0x6075");				// 3 cycles
	asm ("jz __qwark_restore_2nd_setup");		// 2 cycles
	asm ("cmp.b #0x03, &0x6074");				// 3 cycles
	asm ("jnz __crt0_init_bss");				// 2 cycles

	asm ("cmp.b #0x02, &0x6075");				// 2 cycles
	asm ("jz  __qwark_retry_2nd_setup");		// 2 cycles

	asm ("__qwark_restore_1st_setup:");

	asm ("mov &0X6012,   r12 ");				// 3 cycles
    asm ("mov #0x6FFE,   r13 ");				// 2 cycles
	asm ("br  #__system_restore");				// 2 cycles

	asm ("__qwark_restore_2nd_setup:");

	asm ("mov &0X6042, r12   ");				// 3 cycles
    asm ("mov #0x6BFE, r13   ");				// 2 cycles
	asm ("br  #__system_restore");				// 2 cycles

	asm ("__qwark_retry_1st_setup:");

	asm ("mov  #0x6030,   r10 ");				// 2 cycles
	asm ("mov  &0X6012,   r12 ");				// 3 cycles
    asm ("mov  #0x6FFE,   r13 ");				// 2 cycles
	asm ("mov  &0x602E,   r15 ");				// 3 cycles
	asm ("br  #__second_stage_retry");			// 2 cycles

	asm ("__qwark_retry_2nd_setup:");

	asm ("mov #0x6060,   r10 ");				// 2 cycles
	asm ("mov &0X6042,   r12 ");				// 3 cycles
    asm ("mov #0x6BFE,   r13 ");				// 2 cycles
	asm ("mov &0x605E,   r15 ");				// 3 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//    RETRY SECOND PHASE OF THE COMMIT PROCESS	: 148 cycles												   //
	//-------------------------------------------------------------------------------------------------------------//
	asm ("__second_stage_retry:");

	asm ("tst r15 ");     		            // 1 cycles
	asm ("jz  _stack_write_back_retry");	// 2 cycles

	asm ("mov #0x6000,  r14");			    // 2 cycles

	asm ("_retry_second_phase_commit_strt:");  // Worst case

	asm ("mov @r10+2,  r9 ");   			// 2 cycles

	asm ("mov r9,  r11 ");   			    // 1 cycle

	asm ("and #0x8000,  r11 ");   			// 2 cycles
	asm ("cmp #0x8000,  r11 ");   			// 2 cycles
	asm ("jeq _retry_byte_copy ");   		// 2 cycles

	asm ("mov @r14+2, @r9 ");    			// 5 cycles

	asm ("dec r15");    					// 1 cycles
	asm ("tst r15");    					// 1 cycles

	asm ("jnz  _retry_second_phase_commit_strt");// 2 cycles
	asm ("br #__retry_complete");		    // 2 cycle

	asm ("_retry_byte_copy: ");
	asm ("and #0x7FFF,  r9  ");   			// mask the highest bit 2 cycles
	asm ("mov r9,      r11  ");   			// 1 cycle
	asm ("and #0x01,    r11 ");   			// detect if its a byte write - 2 cycles
	asm ("bis  r11,     r14 ");   			// detect if its a byte write - 2 cycles

	asm ("mov.b @r14, @r9  ");    			// 5 cycles
	asm ("and #0xFFFE, r14 ");    			// 1 cycle
	asm ("incd r14 ");    					// 1 cycle

	asm ("dec r15");    					// 1 cycles
	asm ("tst r15");    					// 1 cycles
	asm ("jnz  _retry_second_phase_commit_strt");// 2 cycles

	asm ("__retry_complete:");

	//-------------------------------------------------------------------------------------------------------------//
	//   COPY BACK THE 2BLE BUFFER	RETRY				       				       	      						   //
	//-------------------------------------------------------------------------------------------------------------//
	asm ("_stack_write_back_retry:");

	asm ("cmp #0x0000,  &0x6BFE");	
	asm ("jeq _second_phase_retry_finished");

	asm ("mov &0x6BFE,  r13 ");		 // 2 cycles - get the upper limit		
	asm ("mov &0x6BFC,  r12 ");		 // 2 cycles - get the down limit 

	asm ("mov r13,  r14 ");		 	 // 2 cycles - 
	asm ("sub #0x1000,  r14 ");		 // 2 cycles - get the down limit 
	asm ("mov #0x6BFA,  r10 ");

	asm ("_second_phase_retry_stack_cpy:");
	asm ("mov @r10,@r14");				 // 5 cycles
	
	asm ("cmp r13, r12");	
   	asm ("jeq _second_phase_retry_finished");	 	 // 2 cycles
	asm ("decd r10");
	asm ("decd r13");	   	
	asm ("decd r14");	   	
	asm ("br # _second_phase_retry_stack_cpy");	 	// 2 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//    END OF THE RETRY-SECOND PHASE	: Atomic Flag Set														   //
	//	  W.C 18 Cycles																							   //
	//-------------------------------------------------------------------------------------------------------------//
	asm ("_second_phase_retry_finished:");

	asm ("cmp.b #0x02, &0x6074");		// 4 cycles
	asm ("jz __set_flag_complete");	// 2 cycles

	asm ("mov #0x0301, &0x6074 ");		// 5 cycles
	asm ("br #__system_restore:");		// 2 cycles

	asm ("__set_flag_complete:");
	asm ("mov #0x0103, &0x6074 ");		// 5 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//   SYSTEM RESTORE	 WATCHDOG AND UART SETUP 							   								   	   //
	//	 12 CYCLES																								   //
	//-------------------------------------------------------------------------------------------------------------//
	asm ("__system_restore:");

	/* Disable The Watchdog */
	asm ("mov #288, r8");		// 2 cycles
	asm ("mov #23168, 0(r8)");	// 2 cycles

	/* Enable and Configure the UART */
	asm ("mov.b #130, r8");	// 2 cycles
	asm ("mov   #8, 0(r8)");	// 2 cycles

	asm ("mov.b #128, r8");	// 2 cycles
	asm ("mov.b   #1, 0(r8)"); // 2 cycles

	/* Configure the timer */


#ifdef TIMER_TEST
	asm ("mov  #370, r8");		    // 2 cycles
	asm ("mov  #9980, 0(r8)");	// 2 cycles

	asm ("mov  #352, r8");		    // 2 cycles
	asm ("mov  #534, 0(r8)");	    // 2 cycles
#endif

	//-------------------------------------------------------------------------------------------------------------//
	//   TESTING ONLY: Wipe out the stack to simulate a real power outage										   //
	//	 N.A.																								       //
	//-------------------------------------------------------------------------------------------------------------//

	asm ("mov #0x7FFE, r14");

	asm ("__erase_stack:");

	asm ("cmp #0x7C00,r14");
	asm ("jz __deletion_stack_complete");

	asm ("mov #0x0000,@r14");
	asm ("decd r14");
	asm ("br #__erase_stack");

	asm ("__deletion_stack_complete:");


	//-------------------------------------------------------------------------------------------------------------//
	//   REGISTERS RESTORE: VERIFY WHICH REGISTERS SHOULD BE RESTORED					   						   //
	//	 																										   //
	//-------------------------------------------------------------------------------------------------------------//

	asm ("cmp.b #0x03,&0x6075");				// 5 cycles
	asm ("jeq __Second_buffer_restore_stack"); // 2 cycles

	/* SYSTEM REGISTERS RESTORE												  				  		      */
	/* Restore registers and PC (last) 										  				  			  */
	/* EDE -> Rm  : 3 cycles each 											  				  			  */
	/* EDE -> PC  : 4 cycles (1 extra cycle penalty) for openMSP430 		  				  			  */
	/* Register time: 14x3 = 42 cycles + 4 cycles (PC) = 49 Cycles + 4(Qwark enable) = 53 cycles 		  */
	asm ("__First_buffer_restore_stack:");

	asm ("mov &0x6016,r4"); 		//R4
	asm ("mov &0x6018,r5"); 		//R5
	asm ("mov &0x601A,r6"); 		//R6
	asm ("mov &0x601C,r7"); 		//R7
	asm ("mov &0x601E,r8"); 		//R8
	asm ("mov &0x6020,r9"); 		//R9
	asm ("mov &0x6022,r10"); 		//R10
	asm ("mov &0x6024,r11"); 		//R11
	asm ("mov &0x6026,r12"); 		//R12
	asm ("mov &0x6028,r13"); 	    //R13
	asm ("mov &0x602A,r14"); 		//R14
	asm ("mov &0x602C,r15"); 		//R15
	asm ("mov &0x6012,r1");   		//SP/R1
	asm ("mov &0x6014,r2"); 	    //SR/R2
	asm ("mov &0x6076,&0x02B2"); 	    //3 cycles
	asm ("mov &0x6076,&0x02B4"); 	    //3 cycles
	asm ("mov &0x6076,&0x02B6"); 	    //3 cycles

	/* Enable Idempotency Tracking before restarting operation 		 				  	  */

	asm ("mov #0x0001 , &0x02A0");	/* QWARK_CTL Enable 4 cycles 		  */

	/*Restore program Counter */
	asm ("mov &0x6010, pc"); 	    //PC/R0

	asm ("__Second_buffer_restore_stack:");

	asm ("mov &0x6046,r4"); 		//R4
	asm ("mov &0x6048,r5"); 		//R5
	asm ("mov &0x604A,r6"); 		//R6
	asm ("mov &0x604C,r7"); 		//R7
	asm ("mov &0x604E,r8"); 		//R8
	asm ("mov &0x6050,r9"); 		//R9
	asm ("mov &0x6052,r10"); 		//R10
	asm ("mov &0x6054,r11"); 		//R11
	asm ("mov &0x6056,r12"); 		//R12
	asm ("mov &0x6058,r13"); 	    //R13
	asm ("mov &0x605A,r14"); 		//R14
	asm ("mov &0x605C,r15"); 		//R15
	asm ("mov &0x6042,r1");   		//SP/R1
	asm ("mov &0x6044,r2"); 	    //SR/R2

	/* Enable Idempotency Tracking before restarting operation 		 				  	  */
	asm ("mov &0x6078,&0x02B2"); 	    //3 cycles
	asm ("mov &0x6078,&0x02B4"); 	    //3 cycles
	asm ("mov &0x6078,&0x02B6"); 	    //3 cycles
	asm ("mov #0x0001 , &0x02A0");	/* QWARK_CTL Enable 4 cycles 		  */

	/*Restore program Counter */
	asm ("mov &0x6040, pc"); 	    //PC/R0

}
#endif

//-------------------------------------------------------------------------------------------------------------------------------------------//
//    QWARK CHECKPOINT PROCEDURE																											 //
//-------------------------------------------------------------------------------------------------------------------------------------------//

interrupt (QWARK_VECTOR) INT_Qwark(void) {
	
	/* No local Variables are allowed in this context*/
	/* Idempotency Tracking is disabled by default upon entering this context */
	asm ("mov #0xAA, &0x0090 ");	

	//---------------------------------------------------------------------------------------------------------------------------------//
	//    CHECKPOINT SETUP: Identify which of the 2 checkpoint buffers should be written, one should always be consistent		       //
	//	  W.C. 18 CYCLES  													   														   //	 
	//	  B.C. 10 CYCLES 													   														   //
	//---------------------------------------------------------------------------------------------------------------------------------//
		asm ("mov r13, &0x6070"); 		//temporal r13: 4 cycles
		asm ("mov r12, &0x6072"); 		//temporal r12: 4 cycles

		asm ("cmp.b #0x01,&0x6075"); 		//4 cycles
		asm ("jz __second_buffer_init");	//2 cycles

		asm ("mov #0x6010, r12"); 		//Load the base pointer of the first checkpoint buffer: 2 cycles
		asm ("mov.b #0x01,&0x6074");		//4 cycles
		asm ("br #__first_phase_commit");	//2 cycles

		asm ("__second_buffer_init:");

		asm ("mov #0x6040, r12"); 		//Load the base pointer of the second checkpoint buffer: 2 cycles

		//-------------------------------------------------------------------------------------------------------------//
		// START OF THE FIRST PHASE OF THE COMMIT PROCESS							       							   //
		//-------------------------------------------------------------------------------------------------------------//

		//-------------------------------------------------------------------------------------------------------------//
		//    SYSTEM REGISTER CHECKPOINT									       									   //
		//	  W.C 116 CYCLES											       												   //
		//-------------------------------------------------------------------------------------------------------------//
		

		asm ("__first_phase_commit:");
		//Verify readjustments on the PC
		asm ("mov 2(r1),@r12"); 					//PC/R0   6 cycles

		asm ("cmp #0x0000,&0x02B8"); 				//        5 cycles
		asm ("jeq __continue_first_phase_commit"); 	//PC/R0   2 cycles
		asm ("sub &0x02B8,@r12");					//		  6 cycles

		asm ("__continue_first_phase_commit:");

		asm ("incd r12");							//	  	  1 cycle

		asm ("mov r1,@r12");   						//SP/R1   4 cycles
		asm ("add #0x04,@r12");						//	  	  5 cycles
		asm ("incd r12");							// 	  	  1 cycle

		asm ("mov 0(r1),@r12"); 					//SR/R2   6 cycles
		asm ("incd r12");							// 	 	  1 cycle

		asm ("mov &0x02A0,r13"); 					// Disable Qwark and signal a buffer reset without modifying the data - 3 cycles
		asm ("and #0x3E,r13"); 						//		  2 cycles
		asm ("bis #0x40,r13"); 						//		  2 cycles
		asm ("mov r13,&0x02A0");					//		  4 cycles		
		asm ("and #0xBF,r13"); 						//		  2 cycles
		asm ("mov r13,&0x02A0");					//	 	  4 cycles		

		asm ("mov r4,@r12"); 					    //R4	  4 cycles
		asm ("incd r12");							// 	 	  1 cycle

		asm ("mov r5,@r12"); 						//R5	  4 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov r6,@r12"); 						//R6	  4 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov r7,@r12"); 					    //R7	  4 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov r8,@r12"); 						//R8	  4 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov r9,@r12"); 						//R9	  4 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov r10,@r12"); 						//R10	  4 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov r11,@r12"); 						//R11	  4 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov &0x6072,@r12"); 					//R12	  6 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov &0x6070,@r12"); 					//R13	  4 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov r14,@r12"); 						//R14	  4 cycles
		asm ("incd r12");							// 		  1 cycle

		asm ("mov r15,@r12"); 						//R15	  4 cycles
		asm ("incd r12");							// 		  1 cycle

	//-------------------------------------------------------------------------------------------------------------//
	//    WAR VIOLATION INDEX CHECKPOINT: Get the index indicating the amount of violations stored 		           //
	//	  10 CYCLES											       												   //
	//													       													   //
	//-------------------------------------------------------------------------------------------------------------//

		asm ("mov &0x02A0, r14");	// 		  3 cycles
		asm ("RRA r14");			// 		  1 cycle
		asm ("mov.b r14, @r12");	// 		  4 cycles
		asm ("mov r14, r15 ");		// 		  1 cycle (save the index for later)
		asm ("incd r12");			// 		  1 Cycle

	//-------------------------------------------------------------------------------------------------------------//
	//    VIOLATION ADDRESSES SHADOWCOPY: based on the amount of violations, copy the addresses to the scratchpad  //
	//	  W.C.	85 CYCLES FOR FULL  TLB	(10 CYCLES PER ADDRESS + 5 CYCLES OF LOGIC)			       				   //
	//	  B.C.	 5 CYCLES FOR EMPTY TLB									       									   //
	//-------------------------------------------------------------------------------------------------------------//

		/* Setup registers for copy*/

		asm ("tst r14 ");     	    	// 		  1 cycle
		asm ("jz  __seg_logic");		// 		  2 cycles

		asm ("mov #0x02A2, r13");		// 		  2 cycles

		asm ("_scratchpad_addr_cpy:");  // Each iteration takes 10 cycles - Worst case 80 cycles

		asm ("mov @r13+2, @r12");  		// 		  5 cycles
		asm ("incd r12");  				// 		  1 cycle
		asm ("dec r14 ");      			// 		  1 cycle
		asm ("tst r14 ");     			// 		  1 cycle
		asm ("jnz  _scratchpad_addr_cpy");// 	  2 cycles

		//-------------------------------------------------------------------------------------------------------------//
		//  STACK PROMOTION LOGIC : detect the lower limit for promotion: 		       				      					   //
		//	W.C. 34 Cycles	 					    					       										   //
		//-------------------------------------------------------------------------------------------------------------//
		
		
		asm ("__seg_logic:");  

		// identify what kind of interruption happened (segmentation or buffer overflow)

		asm ("mov &0x02B2, r12 ");			 // 4 cycles 
		asm ("and #0x8000, r12 ");			 // 4 cycles 
		asm ("cmp #0x8000, r12 ");			 // 4 cycles 
		
		//if the comparison is equal, it means that the isr was triggered by a segmentation request
		asm ("jeq __segmentation_isr");		 // 4 cycles - copy segment address to NV location for restore

		//This sequence is for a segmentation based on buffer overflow
		asm ("mov &0X6042, r12"); 			 // Ok, it wasnt a segmentation. Then we should segment based on the current  - 3 cycles

		asm ("cmp.b #0x01,&0x6075");		 // 4 cycles
		asm ("jz __commit_th");		 	     // 2 cycles

		// We know it is not the first time...but which stack shall we use ?
		asm ("mov &0X6012, r12"); 			 // Get the SP from the right buffer - 3 cycles
		asm ("cmp.b #0x01,&0x6074");   	 	 // Verify if we are being indicated that we should work with the first - 4 cycles
		asm ("jz __commit_th");		 	 	 // 2 cycles

		asm ("__segmentation_isr:");
		asm ("mov &0x02B2, r12 ");			 // 3 cycles - copy segment address to NV location for restore
		asm ("and #0x7FFF, r12 ");			 // 2 cycles - copy segment address to NV location for restore

	//-------------------------------------------------------------------------------------------------------------//
	//   DOUBLE BUFFER THE NEW SEGMENT LIMIT								       								   //
	//-------------------------------------------------------------------------------------------------------------//

		asm ("__commit_th:");

		asm ("cmp #0x8000,r12");		 // 4 cycles
		asm ("jne __commit_th_cmp");	 // 4 cycles
		asm ("decd  r12");		 		 // 4 cycles

		asm ("__commit_th_cmp:");

		asm ("cmp.b #0x01,&0x6075");		 // 4 cycles
		asm ("jz  __commit_on_2nd ");		 // 2 cycles
		asm ("mov r12, &0x6076"); 		     // 4 cycles	- save the SP in the NV memory for restore
		
		asm ("br #_chkpt_stack");		     // 2 cycles

		asm ("__commit_on_2nd: ");
		asm ("mov r12, &0x6078 "); 	 	 	 // 4 cycles		

	//-------------------------------------------------------------------------------------------------------------//
	//   STACK PROMOTION  							       		       							   			   	   //
	//-------------------------------------------------------------------------------------------------------------//

		asm ("_chkpt_stack:");
			
		asm ("mov #0x0000, &0x6BFE");			 // 4 cycles
		asm ("mov #0x0000, &0x6BFC");			 // 4 cycles 
		//-------------------------------------------------------------------------------------------------------------//
		//   STACK CHECKPOINT - FIRST CHECKPOINT: 				       				      							   //
		//-------------------------------------------------------------------------------------------------------------//
		asm ("__first_stack_chkpt_setup:");	
		asm ("cmp.b #0x00, &0x6075 ");			 // 4 cycles - This is 0 only the first time the code executes, the first time all the stack has to be checkpointed
		asm ("jne __segmentation_logic");	 	 // 2 cycles		


		asm ("mov #0x6FFE, r13");			 	 // 2 cycles - this executes only once
		asm ("mov #0x7FFE, r14");			 	 // 2 cycles - this executes only once
		asm ("br #__copy_stack");		  	 	 // 2 cycle  - the first execution is all set, start copy	

		//-------------------------------------------------------------------------------------------------------------//
		//   STACK CHECKPOINT - LOGIC TO DETERMINE BOUNDARIES OF SEGMENTATION				      	       			   //
		//-------------------------------------------------------------------------------------------------------------//

		asm ("__segmentation_logic:");			

		asm ("mov &0x02B4, r14");			 	 // 3 cycles - Get the Max val address -> R14 - 3 cycles
		asm ("mov &0x6076, r10");			 	 // Get the previous segment limit     -> R10 - 3 cycles
		asm ("cmp.b #0x01, &0x6075 ");			 // 4 cycles 
		asm ("jeq __sp_seg_define ");		 	 // 2 cycles 
		asm ("mov &0x6078, r10");				 // 3 cycles (29 up to this point)

		//-------------------------------------------------------------------------------------------------------------//
		//   STACK CHECKPOINT - VERIFY IF THE SEGMENT DIDNT CHANGE OR INCREMENTAL CHECKPOINT			       		   //
		//-------------------------------------------------------------------------------------------------------------//
		asm ("__sp_seg_define:");

		asm ("cmp r10, r14");			 	 	 // 1 cycle - compare the old segment and the max value 
		asm ("jne __sp_overlap");	 		 	 // 2 cycles 


		asm ("cmp r10, r12");			 	 	 // 1 cycle - compare the new segment and the old segment value 
		asm ("jeq __stack_chkpt_end");	 		 // 2 cycles 
		asm ("br #__sp_pre_copy");		  	 	 // 2 cycles

		//-------------------------------------------------------------------------------------------------------------//
		//   STACK CHECKPOINT - OVERLAP CHECKPOINT									       							   //
		//-------------------------------------------------------------------------------------------------------------//
		asm ("__sp_overlap:"); //32 up to this point

		asm ("cmp r14, r12");			 	 	 // 1 cycle - compare the new segment and the max value 
		asm ("jeq __stack_chkpt_end");	 	 	 // 2 cycles

		asm ("decd r14 ");				 		 // 1 cycle

		asm ("mov #0x6BFE, r13");				 // 2 cycles
		asm ("mov r14, @r13 ");					 //start address at 0x6BFE - 4 cycles
		asm ("decd r13 ");						 // 1 cycle
		asm ("mov r10, @r13");					 //end address at  0x6BFC - 4 cycles
		asm ("decd r13 ");						 // 1 cycle
		
		asm ("mov r12, r11 ");					 // 1 cycle
		asm ("cmp r10, r12");	   			 	 //  (new >= old) if true use r12 as the limit 	- 1 cycle	
		asm ("jge __overlap_copy");				 // 2 cycles
		asm ("mov r10, r11 ");					 // 1 cycle

		asm ("__overlap_copy:");

		asm ("mov @r14, @r13 ");				// 5 cycles (53 up to this point)
		asm ("cmp r14,r11");	   		  	 	// compare and verify if the LIMIT has been reached - 1 cycle

		asm ("jeq __sp_ovl_copy");	 	 	 	// 2 cycles
		asm ("decd r13");						// 1 cycle
		asm ("decd r14");				 		// 1 cycle
		asm ("br #__overlap_copy");				// 2 cycles
	  	 
		//-------------------------------------------------------------------------------------------------------------//
		//   STACK CHECKPOINT - VERIFY IF A COPY IS NECESSARY AFTER THE OVERLAP	       				       			   //
		//-------------------------------------------------------------------------------------------------------------//
		asm ("__sp_ovl_copy:");
	
		asm ("cmp r10,r12");	   			 // r12 >= r10 ?  new seg >= old ? 		  	 
		asm ("jge __stack_chkpt_end");

		asm ("__sp_pre_copy:");

		asm ("decd r14 ");				 	 // 1 cycle
		asm ("mov r14, r13");			 	 // 2 cycles
		asm ("sub #0x1000, r13");			 // 2 cycles - Make the equal stack max offset (e.g., 0x6FCE -> 0x7FCE)
		
		//-------------------------------------------------------------------------------------------------------------//
		//   STACK CHECKPOINT - COPY ROUTINE: 				       				       	       						   //
		//-------------------------------------------------------------------------------------------------------------//
		asm ("__copy_stack:");

		asm ("mov @r14,@r13");			 	 // 5 cycles

		asm ("cmp r14,r12");	   		  	 // compare and verify if the base has been reached - 1 cycle
		asm ("jz __stack_chkpt_end");	 	 // 2 cycles

		asm ("decd r13");				 	 // 1 cycle
		asm ("decd r14");					 // 1 cycle
		asm ("br #__copy_stack");		  	 // 2 cycle

		asm ("__stack_chkpt_end:");
		
	//-------------------------------------------------------------------------------------------------------------//
	//    END OF THE FIRST PHASE: Atomic Flag Handling for halfway through checkpoint			       			   //
	//	  W.C 18 Cycles											       											   //
	//-------------------------------------------------------------------------------------------------------------//

		asm ("cmp.b #0x01,&0x6075");		 // 4 cycles
		asm ("jz  __set_flag_2nd ");		 // 2 cycles

		asm ("add.b #0x01, &0x6074 "); 	 	 // 4 cycles
		asm ("br  #_WAR_commit "); 	    	 // 4 cycles

		asm ("__set_flag_2nd:");
		asm ("add.b #0x01, &0x6075 "); 		 // 4 cycles		/* THE RESTORE ROUTINE CAN FINALIZE THIS HALFWAY CHECKPOINT  */

	//-------------------------------------------------------------------------------------------------------------//
	//    START OF THE SECOND PHASE OF THE COMMIT PROCESS : 148 CYCLES					       					   //
	//	  NOTE: BYTE ADDRESSING IS HANDLED DIFFERENTLY THAN WORD (16-BIT) ADDRESSING. CYCLE COUNTING IS GIVEN      //
	//	  ASSUMMING ONLY WORD ADDRESSING. 								       									   //
	//-------------------------------------------------------------------------------------------------------------//
		

		//-------------------------------------------------------------------------------------------------------------//
		//   CONTINUE WITH THE COMMIT OF THE WARs				       				       							   //
		//-------------------------------------------------------------------------------------------------------------//
		
		asm ("_WAR_commit:");

		asm ("tst r15 ");     		         	// 1 cycle
		asm ("jz  _stack_write_back");		 	// 2 cycles

		asm ("mov #0x6000,  r14 ");		 	 	// 2 cycles

		asm ("mov #0x6060,  r12 ");		 	 	// 2 cycles
		asm ("cmp.b #0x02,&0x6075");		 	// 4 cycles
		asm ("jz _second_phase_commit_strt");   // 2 cycles

		asm ("mov #0x6030,  r12 ");		 		// 2 cycles

		asm ("_second_phase_commit_strt:"); 	// Worst case

		asm ("mov @r12+2,  r13 ");   		 	// 3 cycles

		asm ("mov r13,  r11 ");   		 		// 1 cycle

		asm ("and #0x8000,  r11 ");   		 	// 2 cycles
		asm ("cmp #0x8000,  r11 ");   		 	// 2 cycles
		asm ("jeq _byte_copy ");   				// 2 cycles

		asm ("mov @r14, @r13 ");    		 	// 5 cycles

		asm ("_pre_end_copy:");
		asm ("incd r14");    			 		// 1 cycle
		asm ("dec r15");    			 		// 1 cycle
		asm ("tst r15");    			 		// 1 cycle

		asm ("jnz  _second_phase_commit_strt"); // 2 cycles
		asm ("br #_stack_write_back");		 	// 2 cycles

		asm ("_byte_copy:");
		asm ("and #0x7FFF,  r13 ");   			// mask the highest bit - 2 cycles
		asm ("mov r13,      r11 ");   			// 1 cycle
		asm ("and #0x01,    r11 ");   			// detect if its a byte write - 1 cycle
		asm ("bis  r11,     r14 ");   			// detect if its a byte write - 1 cycle


		asm ("mov.b @r14, @r13 ");    			// 5 cycles

		asm ("and #0xFFFE, r14");    			// 2 cycles
		asm ("incd r14");    					// 1 cycle
		asm ("dec r15");    					// 1 cycles
		asm ("tst r15");    					// 1 cycles
		asm ("jnz  _second_phase_commit_strt");	// 2 cycles

		//-------------------------------------------------------------------------------------------------------------//
		//   COPY BACK THE 2BLE BUFFER					       				       	       							   //
		//-------------------------------------------------------------------------------------------------------------//
		asm ("_stack_write_back:");


		asm ("cmp #0x0000,  &0x6BFE");				 // 4 cycles
		asm ("jeq _chkpt_finished");				 // 2 cycles

		asm ("mov &0x6BFE,  r13 ");		 			 // 2 cycles - get the upper limit		
		asm ("mov &0x6BFC,  r12 ");					 // 2 cycles - get the down limit 

		asm ("mov r13,  r14 ");		     			 // 1 cycle 
		asm ("sub #0x1000,  r14 ");		 			 // 2 cycles - get the down limit 
		asm ("mov #0x6BFA,  r10 ");		 			 // 2 cycles

		asm ("_second_phase_stack_cpy:");
		asm ("mov @r10,@r14");			     		 // 5 cycles
	
		asm ("cmp r13, r12");						 // 1 cycle
   		asm ("jeq _chkpt_finished");	 	 		 // 2 cycles
		asm ("decd r10");							 // 1 cycle
		asm ("decd r13");	   				 		 // 1 cycle
	  	asm ("decd r14");	   						 // 1 cycle
		asm ("br # _second_phase_stack_cpy");	 	 // 2 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//    CHECKPOINT COMPLETED	- Atomic Flag Handling for Finalized checkpoint			       	       			   //
	//	  25 CYCLES											       												   //
	//-------------------------------------------------------------------------------------------------------------//
		asm ("_chkpt_finished:");

	    /* Set second phase complete Bit - Atomic Flag*/
		asm ("cmp.b #0x02,&0x6075");			//4 cycles
		asm ("jeq  __pre_finish_2nd_buffer "); 	//2 cycles

		asm ("mov #0x0103, &0x6074 "); 			//5 cycles	/* After setting this bit, THE RESTORE ROUTINE CAN RE-USE THE 1ST CHECKPOINT COMPLETELY  */

	//-------------------------------------------------------------------------------------------------------------//
	//    REGISTER RESTORE:	This is to continue operation and restore possibly modified registers 		           //
	//													       													   //
	//-------------------------------------------------------------------------------------------------------------//
		asm ("mov &0x6022,r10"); 		//3 cycles
		asm ("mov &0x6024,r11"); 		//3 cycles
		asm ("mov &0x6026,r12"); 		//3 cycles
		asm ("mov &0x6028,r13"); 	    //3 cycles
		asm ("mov &0x602A,r14"); 	    //3 cycles
		asm ("mov &0x602C,r15"); 	    //3 cycles
		asm ("mov &0x6076,&0x02B2"); 	//3 cycles
		asm ("mov &0x6076,&0x02B4"); 	//3 cycles
		asm ("mov &0x6076,&0x02B6"); 	//3 cycles
		asm ("br #_finish"); 	   		//3 cycles
	//-------------------------------------------------------------------------------------------------------------//
	//    REGISTER RESTORE:	This is to continue operation and restore possibly modified registers 		           //
	//-------------------------------------------------------------------------------------------------------------//

		asm ("__pre_finish_2nd_buffer:");

		asm ("mov #0x0301, &0x6074 "); 	//4 cycles /* After setting this bit, THE RESTORE ROUTINE CAN RE-USE THE 2ND CHECKPOINT COMPLETELY  */

		asm ("mov &0x6052,r10"); 	    //3 cycles		
		asm ("mov &0x6054,r11"); 	    //3 cycles
		asm ("mov &0x6056,r12"); 	    //3 cycles
		asm ("mov &0x6058,r13"); 	    //3 cycles
		asm ("mov &0x605A,r14"); 	    //3 cycles
		asm ("mov &0x605C,r15"); 	    //3 cycles
		asm ("mov &0x6078,&0x02B2"); 	//3 cycles
		asm ("mov &0x6078,&0x02B4"); 	//3 cycles
		asm ("mov &0x6078,&0x02B6"); 	//3 cycles
		asm ("_finish:");

		/* Clear the counters*/
		asm ("mov #0x0000, &0x6000");	//4 cycles
		asm ("mov #0x0000, &0x6002");	//4 cycles
		asm ("mov #0x0000, &0x6004");	//4 cycles
		asm ("mov #0x0000, &0x6006");	//4 cycles
		asm ("mov #0x0000, &0x6008");	//4 cycles
		asm ("mov #0x0000, &0x600A");	//4 cycles
		asm ("mov #0x0000, &0x600C");	//4 cycles
		asm ("mov #0x0000, &0x600E");	//4 cycles

		asm ("mov #0x0000, &0x02A2");	//4 cycles
		asm ("mov #0x0000, &0x02A4");	//4 cycles
		asm ("mov #0x0000, &0x02A6");	//4 cycles
		asm ("mov #0x0000, &0x02A8");	//4 cycles
		asm ("mov #0x0000, &0x02AA");	//4 cycles
		asm ("mov #0x0000, &0x02AC");	//4 cycles
		asm ("mov #0x0000, &0x02AE");	//4 cycles
		asm ("mov #0x0000, &0x02B0");	//4 cycles

		asm ("add #0x01, &0x607A");	//4 cycles

		/* and re-enable Idempotency tracking */

		asm ("mov #0xFF, &0x0090 ");	

		asm ("mov #0x0001, &0x02A0");	// 4 cycles

}

