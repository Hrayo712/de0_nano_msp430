
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <omsp_system.h>
#include "timerA.h"

#define QWARK_CTL     				  (*(volatile unsigned int  *) 0x0190)
#define QWARK_VECTOR				  (5)
#define QWARK_CHECKPOINT()			   QWARK_CTL |= 0x0020
#define SEED 4
#define ITER 100
#define CHAR_BIT 8

//typedef unsigned long uint32_t;

volatile unsigned  n_0, n_1, n_2, n_3, n_4, n_5, n_6;

char bits[256] =
{
      0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,  /* 0   - 15  */
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 16  - 31  */
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 32  - 47  */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 48  - 63  */
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 64  - 79  */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 80  - 95  */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 96  - 111 */
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 112 - 127 */
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,  /* 128 - 143 */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 144 - 159 */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 160 - 175 */
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 176 - 191 */
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,  /* 192 - 207 */
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 208 - 223 */
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,  /* 224 - 239 */
      4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8   /* 240 - 255 */
};



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
	__asm__ __volatile__ ("mov #0x0000, &0x0190"); 		 //4 cycles

	/* verify if this is the first time the code executes,and whether the checkpoint succeeded, failed, or was stranded on the first phase */

	__asm__ __volatile__ ("mov.b &0x601E, r12");		 //3 cycles
	__asm__ __volatile__ ("mov #0x02, r13");			 //1 cycle (using constant generator)
	__asm__ __volatile__ ("cmp r12, r13"); 				 //1 cycle

	/*check for the bit set on 2, it means the checkpoint completed successfully, we can reinitialize the system*/
	__asm__ __volatile__ ("JEQ __system_restore");		 //2 cycles

	/*If the bit is set on 1, it means the checkpoint completed successfully, we can finalize the second stage and reinitialize the system*/

	__asm__ __volatile__ ("mov #0x01, r13");		     //1 cycle (using constant generator)
	__asm__ __volatile__ ("cmp r12, r13"); 			     //1 cycle
	__asm__ __volatile__ ("JEQ __second_stage_retry");	 //2 cycles

	__asm__ __volatile__ ("br #__crt0_init_bss");		 //2 cycles


	//-------------------------------------------------------------------------------------------------------------//
	//    RETRY SECOND PHASE OF THE COMMIT PROCESS	: 148 cycles												   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("__second_stage_retry:");

	__asm__ __volatile__ ("mov.b &0x601F, r15");	        // 4 cycles

	__asm__ __volatile__ ("tst r15 ");     		            // 1 cycles
	__asm__ __volatile__ ("jz  __system_restore");		    // 2 cycles

	__asm__ __volatile__ ("mov #0x6010,  r12 ");		    // 2 cycles
	__asm__ __volatile__ ("mov #0x6000,  r14 ");			// 2 cycles

	__asm__ __volatile__ ("_retry_second_phase_commit_strt:");    // Worst case

	__asm__ __volatile__ ("mov @r12+2,  r13 ");   			// 2 cycles

	__asm__ __volatile__ ("mov r13,  r11 ");   			    // 1 cycle

	__asm__ __volatile__ ("and #0x8000,  r11 ");   			// 2 cycles
	__asm__ __volatile__ ("cmp #0x8000,  r11 ");   			// 2 cycles
	__asm__ __volatile__ ("jeq _retry_byte_copy ");   		// 2 cycles

	__asm__ __volatile__ ("mov @r14+2, @r13 ");    			// 5 cycles

	__asm__ __volatile__ ("dec r15");    					// 1 cycles
	__asm__ __volatile__ ("tst r15");    					// 1 cycles

	__asm__ __volatile__ ("jnz  _retry_second_phase_commit_strt");// 2 cycles
	__asm__ __volatile__ ("br #__system_restore");		    // 2 cycle

	__asm__ __volatile__ ("_retry_byte_copy:");
	__asm__ __volatile__ ("and #0x7FFF,  r13 ");   			// mask the highest bit 2 cycles
	__asm__ __volatile__ ("mov r13,      r11 ");   			// 1 cycle
	__asm__ __volatile__ ("and #0x01,    r11 ");   			// detect if its a byte write - 2 cycles
	__asm__ __volatile__ ("bis  r11,     r14 ");   			// detect if its a byte write - 2 cycles

	__asm__ __volatile__ ("mov.b @r14, @r13 ");    			// 5 cycles
	__asm__ __volatile__ ("incd r14 ");    					// 1 cycle

	__asm__ __volatile__ ("dec r15");    					// 1 cycles
	__asm__ __volatile__ ("tst r15");    					// 1 cycles
	__asm__ __volatile__ ("jnz  _retry_second_phase_commit_strt");// 2 cycles


	//-------------------------------------------------------------------------------------------------------------//
	//   SYSTEM RESTORE	 Total: 							   								   					   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("__system_restore:");

	/* Disable The Watchdog */
	__asm__ __volatile__ ("mov #288, r12");
	__asm__ __volatile__ ("mov #23168, 0(r12)");

	//Indicate this checkpoint has been finalized and can be used
	__asm__ __volatile__ ("mov.b #0x02, &0x601E"); //4 cycles

	/* VOLATILE STATE RESTORE 	: STACK RESTORE											  				 		   */
	/* Note: The amount of cycles depend on the addressing mode not on the instruction 		 					   */

	/* TESTING ONLY: Wipe out the stack and restore it*/
	/* STACK ERASE														  				  	  					   */
	__asm__ __volatile__ ("mov &0X6020, r12"); 	   //Get the current SP: 3 cycles
	__asm__ __volatile__ ("mov #0x7FFE, r14");	   //2 cycles
	__asm__ __volatile__ ("mov #0x6FFE, r13");	   //2 cycles

	__asm__ __volatile__ ("decd r12");				//1 cycle
	__asm__ __volatile__ ("decd r12");				//1 cycle
	__asm__ __volatile__ ("decd r12");				//1 cycle
	__asm__ __volatile__ ("__erase_stack:");

	__asm__ __volatile__ ("cmp r14,r12");	   //compare and verify if the base has been reached 1 cycle
	__asm__ __volatile__ ("jz __deletion_stack_complete");	//2 cycles

	__asm__ __volatile__ ("mov #0x00000,@r14");		//4 cycles
	__asm__ __volatile__ ("decd r13");				//1 cycle
	__asm__ __volatile__ ("decd r14");				//1 cycle
	__asm__ __volatile__ ("br #__erase_stack");		//2 cycles

	__asm__ __volatile__ ("__deletion_stack_complete:");

	/* STACK RESTORE		12 cycles per word		384 cycles	per 64B								 */

	__asm__ __volatile__ ("mov &0X6020, r12"); 		//Get the current SP -> 3 cycles
	__asm__ __volatile__ ("mov #0x7FFE, r14");		//2 cycles
	__asm__ __volatile__ ("mov #0x6FFE, r13");		//2 cycles

	__asm__ __volatile__ ("decd r12");				//1 cycle

	__asm__ __volatile__ ("__restore_stack:");

	__asm__ __volatile__ ("cmp r14,r12");	   		// compare and verify if the base has been reached - 1 cycle
	__asm__ __volatile__ ("jz __init_restore_stack_complete"); //2 cycles

	__asm__ __volatile__ ("mov @r13,@r14");					//5 cycles
	__asm__ __volatile__ ("decd r13");						//1 cycle
	__asm__ __volatile__ ("decd r14");						//1 cycle
	__asm__ __volatile__ ("br #__restore_stack");			//2 cycles

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

	/* No local Variables are allowed in this context*/

	/* Idempotency Tracking is disabled by default upon entering this context */

	//-------------------------------------------------------------------------------------------------------------//
	//    FIRST PHASE OF THE COMMIT PROCESS																	       //
	//-------------------------------------------------------------------------------------------------------------//

	/*Store Registers into NV memory : Total: 70 cycles*/
	__asm__ __volatile__ ("mov r1,&0x6020");   		//SP/R1   4 cycles       =  9 cycles
	__asm__ __volatile__ ("add #0x04,&0x6020");		//		  5 cycles
	__asm__ __volatile__ ("mov 2(r1),&0x6022"); 	//PC/R0   6 cycles       = 21 cycles
	__asm__ __volatile__ ("mov 0(r1),&0x6024"); 	//SR/R2   6 cycles
	__asm__ __volatile__ ("mov r13 ,&0x6026"); 	    //R13	  4 cycles
	__asm__ __volatile__ ("mov r12,&0x6028"); 	    //R12	  5 cycles
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

	//Get the index indicating the amount of violations stored (9 cycles)

	__asm__ __volatile__ ("mov &0x0190, r14");		// 3 cycles
	__asm__ __volatile__ ("RRA r14");				// 1 cycle
	__asm__ __volatile__ ("mov.b r14, &0x601F");	// 4 cycles
	__asm__ __volatile__ ("mov r14, r15 ");		    // 1 cycle (save the index for later)

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

	//-------------------------------------------------------------------------------------------------------------//
	//    FIRST PHASE COMPLETED	: Set Binary Semaphore: 1														   //
	//-------------------------------------------------------------------------------------------------------------//

	/* after setting this bit, it is possible to reproduce the checkpoint even if it fails halfway through */
	__asm__ __volatile__ ("mov.b #0x01, &0x601E"); //4 cycles

	//-------------------------------------------------------------------------------------------------------------//
	//    SECOND PHASE OF THE COMMIT PROCESS : 148 cycles														   //
	//-------------------------------------------------------------------------------------------------------------//

	__asm__ __volatile__ ("tst r15 ");     		           // 1 cycles
	__asm__ __volatile__ ("jz  _chkpt_finished");		   // 2 cycles

	__asm__ __volatile__ ("mov #0x6010,  r12 ");			// 2 cycles
	__asm__ __volatile__ ("mov #0x6000,  r14 ");			// 2 cycles

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
	//    CHECKPOINT COMPLETED	- Binary Semaphore set to 2	:20													   //
	//-------------------------------------------------------------------------------------------------------------//
	__asm__ __volatile__ ("_chkpt_finished:");

	/* Set second phase complete Bit - Atomic Flag*/
	__asm__ __volatile__ ("mov.b #0x02, &0x601E");  //4 cycles

	/* This is to continue operation. If at this point a power failure happens, the system can re-start*/
	/* Clear index counter, and enable Idempotency tracking*/
	__asm__ __volatile__ ("mov #0x0001, &0x0190");	//4 cycles
	__asm__ __volatile__ ("mov &0x6038,r11"); 		//3 cycles
	__asm__ __volatile__ ("mov &0x6028,r12"); 		//3 cycles
	__asm__ __volatile__ ("mov &0x6026,r13"); 	    //3 cycles
	__asm__ __volatile__ ("mov &0x603E,r14"); 	    //3 cycles
	__asm__ __volatile__ ("mov &0x6040,r15"); 	    //3 cycles

	//to do: indicate checkpoint as invalid upon entering for double buffering.
}



void init()
{

     WDTCTL = WDTPW | WDTHOLD; // Stop WDT
  	 __asm__ __volatile__ ("nop");
     eint();

     //Enable QWARK
     QWARK_CTL = 0x01;

     //ta_wait(100);

    //  PM5CTL0 &= ~LOCKLPM5;     // Disable the GPIO power-on default high-impedance mode

	// Disable FRAM wait cycles to allow clock operation over 8MHz
	//FRCTL0 = 0xA500 | ((1) << 4); // FRCTLPW | NWAITS_1;
    // __delay_cycles(3);

	/* init FRAM */
    //  FRCTL0_H |= (FWPW) >> 8;

}

int btbl_bitcnt(uint32_t x)
{
      int cnt = bits[ ((char *)&x)[0] & 0xFF ];

      if (0L != (x >>= 8))
            cnt += btbl_bitcnt(x);
      return cnt;
}
int bit_count(uint32_t x)
{
        int n = 0;

        if (x) do
              n++;
        while (0 != (x = x&(x-1))) ;
        return(n);
}
int bitcount(uint32_t i)
{
      i = ((i & 0xAAAAAAAAL) >>  1) + (i & 0x55555555L);
      i = ((i & 0xCCCCCCCCL) >>  2) + (i & 0x33333333L);
      i = ((i & 0xF0F0F0F0L) >>  4) + (i & 0x0F0F0F0FL);
      i = ((i & 0xFF00FF00L) >>  8) + (i & 0x00FF00FFL);
      i = ((i & 0xFFFF0000L) >> 16) + (i & 0x0000FFFFL);
      return (int)i;
}
int ntbl_bitcount(uint32_t x)
{
      return
            bits[ (int) (x & 0x0000000FUL)       ] +
            bits[ (int)((x & 0x000000F0UL) >> 4) ] +
            bits[ (int)((x & 0x00000F00UL) >> 8) ] +
            bits[ (int)((x & 0x0000F000UL) >> 12)] +
            bits[ (int)((x & 0x000F0000UL) >> 16)] +
            bits[ (int)((x & 0x00F00000UL) >> 20)] +
            bits[ (int)((x & 0x0F000000UL) >> 24)] +
            bits[ (int)((x & 0xF0000000UL) >> 28)];
}
int BW_btbl_bitcount(uint32_t x)
{
      union
      {
            unsigned char ch[4];
            long y;
      } U;

      U.y = x;

      return bits[ U.ch[0] ] + bits[ U.ch[1] ] +
             bits[ U.ch[3] ] + bits[ U.ch[2] ];
}
int AR_btbl_bitcount(uint32_t x)
{
      unsigned char * Ptr = (unsigned char *) &x ;
      int Accu ;

      Accu  = bits[ *Ptr++ ];
      Accu += bits[ *Ptr++ ];
      Accu += bits[ *Ptr++ ];
      Accu += bits[ *Ptr ];
      return Accu;
}
int ntbl_bitcnt(uint32_t x)
{
      int cnt = bits[(int)(x & 0x0000000FL)];

      if (0L != (x >>= 4))
            cnt += ntbl_bitcnt(x);

      return cnt;
}

static int bit_shifter(uint32_t x)
{
  int i, n;
  for (i = n = 0; x && (i < (sizeof(uint32_t) * CHAR_BIT)); ++i, x >>= 1)
    n += (int)(x & 1L);
  return n;
}

int main()
{
	init();

	uint32_t seed;
	unsigned  iter;
	unsigned  func;

	/* Iterate through the 7 func statements 0 - 7*/
	/* Each statement executes a different bitcount routine, with a different seed value, a 100 times*/
	while(1){
	LED_CTRL ^= 0x0F;

	//Initialize the variables upon every loop
	n_0=0;
	n_1=0;
	n_2=0;
	n_3=0;
	n_4=0;
	n_5=0;
	n_6=0;

	//Toggle LED upon every execution

	for (func = 0; func < 7; func++) {

		seed = (uint32_t)SEED;
		if(func == 0){
			for(iter = 0; iter < ITER; ++iter, seed += 13){

				n_0 += bit_count(seed);
			}
		}
		else if(func == 1){
			for(iter = 0; iter < ITER; ++iter, seed += 13){

				n_1 += bitcount(seed);
			}
		}
		else if(func == 2){
			for(iter = 0; iter < ITER; ++iter, seed += 13){

				n_2 += ntbl_bitcnt(seed);
			}
		}
		else if(func == 3){
			for(iter = 0; iter < ITER; ++iter, seed += 13){

				n_3 += ntbl_bitcount(seed);
			}
		}
		else if(func == 4){
			for(iter = 0; iter < ITER; ++iter, seed += 13){

				n_4 += BW_btbl_bitcount(seed);
			}
		}
		else if(func == 5){
			for(iter = 0; iter < ITER; ++iter, seed += 13){

				n_5 += AR_btbl_bitcount(seed);
			}
		}
		else if(func == 6){
			for(iter = 0; iter < ITER; ++iter, seed += 13){

				n_6 += bit_shifter(seed);
			}
			QWARK_CHECKPOINT();
		}
	}
	/*
	    printf("%u\r\n", n_0);
	    printf("%u\r\n", n_1);
	    printf("%u\r\n", n_2);
	    printf("%u\r\n", n_3);
	    printf("%u\r\n", n_4);
	    printf("%u\r\n", n_5);
	    printf("%u\r\n", n_6);
   */
   }//while 1

	return 0;
}



