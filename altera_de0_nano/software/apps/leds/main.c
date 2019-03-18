#include "../../libs/omsp_system.h"
#include "../../libs/tA/timerA.h"

/*
Watchdog interrupt
Change LED blinking type every 327ms * 30 = 9.8seconds
 */
volatile unsigned int  lfsr = 0xACEB;
volatile unsigned int wdt_irq_cnt;
volatile unsigned int led_blink_type;
volatile unsigned int led_blink_type_init;

volatile unsigned int ctr;
volatile unsigned int ctr2;
volatile unsigned int data_mram;



wakeup interrupt (WDT_VECTOR) INT_watchdog(void) {

  unsigned int lfsr_lsb;

  if (wdt_irq_cnt<15) {
    wdt_irq_cnt++;
  } else {
    wdt_irq_cnt=0;

    // Update lfsr to select random LED algo
    lfsr_lsb = lfsr & 1;			   /* Get LSB (i.e., the output bit). */
    lfsr     >>= 1;				   /* Shift register */
    lfsr     ^= (-lfsr_lsb) & 0xB400u;	           /* If the output bit is 1, apply toggle mask.
      					            * The value has 1 at bits corresponding
					            * to taps, 0 elsewhere. */
    //led_blink_type      = (unsigned char) (lfsr & 0x0007);
    led_blink_type      = (unsigned char) (lfsr & 0x0007);
    led_blink_type_init = 1;
  }
}

/* Delay */

void fake_delay(int delay){
	
    int index=0;

for(index = 0; index<delay; index++){}
	

}

/**
Main function with some blinking leds
*/
int main(void) {

  unsigned char temp, temp2;
  unsigned char direction;

  // Init global variables
  wdt_irq_cnt         = 0;
  led_blink_type      = 0;
  led_blink_type_init = 1;
  direction           = 0;
  temp                = 0;

  // Configure watchdog timer to generate an IRQ every 327ms
  WDTCTL = WDTPW | WDTSSEL | WDTCNTCL | WDTTMSEL | WDTIS0;  // Select ACLK | Clear timer | Enable interval timer mode | div32768
  IE1_set_wdtie();

  eint();

  while (1) {                        // Main loop, never ends...

    	ctr++;
    	ctr2 = ctr;

    	if(ctr2 == 65000)
    	{
    	    
    	    data_mram = 0xCAFE;
    	    ctr = 0;
	    //ta_wait(WT_500MS);
	    fake_delay(65000);
	    LED_CTRL ^= 0x0F;
    	}
  }
}
