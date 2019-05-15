/*
 * qwark.h
 *
 *  Created on: May 9, 2019
 *      Author: hiram
 */

#ifndef QWARK_H_
#define QWARK_H_

#define QWARK_CTL     				  (*(volatile unsigned int  *) 0x0190)
#define QWARK_VECTOR				  (5)
#define QWARK_CHECKPOINT()			   QWARK_CTL |= 0x0020

#define QWARK_EN					  0x01
#endif /* QWARK_H_ */
