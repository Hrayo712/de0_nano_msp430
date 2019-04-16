#include <omsp_system.h>

#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define  QWARK_CTL      (*(volatile unsigned int  *) 0x0180)


volatile int nv_variable = 5;
volatile int dummy_var = 2;
volatile int dummy_read2 = 3;
volatile char eight_bit_variable=1;

int main()
{
	/*Test Case 1: PASS*/
/*	
	nv_variable = 7;	

	dummy_var = nv_variable;

	nv_variable = 6;

	dummy_var = dummy_read2;
*/

	/*Test Case 2: PASS*/
/*     	
	nv_variable = dummy_var;

	dummy_var = 3;	
	

*/

	  QWARK_CTL = 0x01;
	/* Test case 3: PASS*/ 
	
	if(nv_variable == 5)
	nv_variable = 6;


	/* Test case 4*/
/*	FAIL	
	if(eight_bit_variable == 5)
	eight_bit_variable = 6;
*/

	while(1);

  
	return 0;
}

