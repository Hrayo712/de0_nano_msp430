#include <omsp_system.h>
#include "timerA.h"
#include "qwark.h"

//---------------------------------------------------//
//    TA_WAIT_NO_LPM                                 //
// ( the function implements a wait by continously ) //
// ( polling the TAR register                      ) //
//                                                   //
//---------------------------------------------------//
void ta_wait_no_lpm(unsigned int time_cnt) {

  // Start and re-initialize TimerA
  TACTL = TASSEL0 | TACLR | MC_2;

  // Wait until time is over
  while(TAR < time_cnt);

}

//--------------------------------------------------//
//    WAIT FUNCTION                                 //
// ( the function brings the core to LPM0 state )   //
// ( the timerA IRQ will exit the LPM0 state    )   //
//                                                  //
//--------------------------------------------------//
unsigned int periodic_val;
void ta_wait(unsigned int time_cnt) {

  // Set time limit for IRQ generation
  TACCR0 = time_cnt;
  periodic_val = time_cnt;
  // Start and re-initialize TimerA
  TACTL  = TASSEL1 | TACLR | MC_1 | TAIE;

  // Go to Low-Power-Mode 0
  //LPM0;

}

//--------------------------------------------------//
//    TIMER A INTERRUPT                             //
//--------------------------------------------------//
wakeup interrupt (TIMERA1_VECTOR) INT_timerA1(void) {


      //Force Reset
	  //WDTCTL = 0;
	  TACTL = TAIFG;
	  //LED_CTRL ^= 0x0F;
	  // Set time limit for IRQ generation
	  TACCR0 = periodic_val;

	  // Start and re-initialize TimerA
	  TACTL  = TASSEL1 | TACLR | MC_1 | TAIE;


	  QWARK_CHECKPOINT();


}
