	.file	"qwark.c"
.text
.Ltext0:
	.balign 2
	.global	INT_Qwark
	.section	__interrupt_vector_5,"ax",@progbits
	.word	INT_Qwark
	.text
	.type	INT_Qwark, @function
INT_Qwark:
.LFB0:
	.file 1 "../qwark.c"
	.loc 1 255 0
; start of function
; attributes: interrupt 
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
	.loc 1 265 0
 ; 265 "../qwark.c" 1
	mov r12, &0x6072
 ; 0 "" 2
	.loc 1 267 0
 ; 267 "../qwark.c" 1
	cmp.b #0x01,&0x6075
 ; 0 "" 2
	.loc 1 268 0
 ; 268 "../qwark.c" 1
	jz __second_buffer_init
 ; 0 "" 2
	.loc 1 270 0
 ; 270 "../qwark.c" 1
	mov #0x6010, r12
 ; 0 "" 2
	.loc 1 271 0
 ; 271 "../qwark.c" 1
	mov.b #0x01,&0x6074
 ; 0 "" 2
	.loc 1 272 0
 ; 272 "../qwark.c" 1
	br #__first_phase_commit
 ; 0 "" 2
	.loc 1 274 0
 ; 274 "../qwark.c" 1
	__second_buffer_init:
 ; 0 "" 2
	.loc 1 276 0
 ; 276 "../qwark.c" 1
	mov #0x6040, r12
 ; 0 "" 2
	.loc 1 286 0
 ; 286 "../qwark.c" 1
	__first_phase_commit:
 ; 0 "" 2
	.loc 1 288 0
 ; 288 "../qwark.c" 1
	mov 2(r1),@r12
 ; 0 "" 2
	.loc 1 289 0
 ; 289 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 291 0
 ; 291 "../qwark.c" 1
	mov r1,@r12
 ; 0 "" 2
	.loc 1 292 0
 ; 292 "../qwark.c" 1
	add #0x04,@r12
 ; 0 "" 2
	.loc 1 293 0
 ; 293 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 295 0
 ; 295 "../qwark.c" 1
	mov 0(r1),@r12
 ; 0 "" 2
	.loc 1 296 0
 ; 296 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 298 0
 ; 298 "../qwark.c" 1
	mov r4,@r12
 ; 0 "" 2
	.loc 1 299 0
 ; 299 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 301 0
 ; 301 "../qwark.c" 1
	mov r5,@r12
 ; 0 "" 2
	.loc 1 302 0
 ; 302 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 304 0
 ; 304 "../qwark.c" 1
	mov r6,@r12
 ; 0 "" 2
	.loc 1 305 0
 ; 305 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 307 0
 ; 307 "../qwark.c" 1
	mov r7,@r12
 ; 0 "" 2
	.loc 1 308 0
 ; 308 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 310 0
 ; 310 "../qwark.c" 1
	mov r8,@r12
 ; 0 "" 2
	.loc 1 311 0
 ; 311 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 313 0
 ; 313 "../qwark.c" 1
	mov r9,@r12
 ; 0 "" 2
	.loc 1 314 0
 ; 314 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 316 0
 ; 316 "../qwark.c" 1
	mov r10,@r12
 ; 0 "" 2
	.loc 1 317 0
 ; 317 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 319 0
 ; 319 "../qwark.c" 1
	mov r11,@r12
 ; 0 "" 2
	.loc 1 320 0
 ; 320 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 322 0
 ; 322 "../qwark.c" 1
	mov &0x6072,@r12
 ; 0 "" 2
	.loc 1 323 0
 ; 323 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 325 0
 ; 325 "../qwark.c" 1
	mov r13,@r12
 ; 0 "" 2
	.loc 1 326 0
 ; 326 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 328 0
 ; 328 "../qwark.c" 1
	mov r14,@r12
 ; 0 "" 2
	.loc 1 329 0
 ; 329 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 331 0
 ; 331 "../qwark.c" 1
	mov r15,@r12
 ; 0 "" 2
	.loc 1 332 0
 ; 332 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 340 0
 ; 340 "../qwark.c" 1
	mov &0x02A0, r14
 ; 0 "" 2
	.loc 1 341 0
 ; 341 "../qwark.c" 1
	RRA r14
 ; 0 "" 2
	.loc 1 342 0
 ; 342 "../qwark.c" 1
	mov.b r14, @r12
 ; 0 "" 2
	.loc 1 343 0
 ; 343 "../qwark.c" 1
	mov r14, r15 
 ; 0 "" 2
	.loc 1 344 0
 ; 344 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 354 0
 ; 354 "../qwark.c" 1
	tst r14 
 ; 0 "" 2
	.loc 1 355 0
 ; 355 "../qwark.c" 1
	jz  _chkpt_stack
 ; 0 "" 2
	.loc 1 357 0
 ; 357 "../qwark.c" 1
	mov #0x02A2, r13
 ; 0 "" 2
	.loc 1 359 0
 ; 359 "../qwark.c" 1
	_scratchpad_addr_cpy:
 ; 0 "" 2
	.loc 1 361 0
 ; 361 "../qwark.c" 1
	mov @r13+2, @r12
 ; 0 "" 2
	.loc 1 362 0
 ; 362 "../qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 363 0
 ; 363 "../qwark.c" 1
	dec r14 
 ; 0 "" 2
	.loc 1 364 0
 ; 364 "../qwark.c" 1
	tst r14 
 ; 0 "" 2
	.loc 1 365 0
 ; 365 "../qwark.c" 1
	jnz  _scratchpad_addr_cpy
 ; 0 "" 2
	.loc 1 375 0
 ; 375 "../qwark.c" 1
	_chkpt_stack:
 ; 0 "" 2
	.loc 1 379 0
 ; 379 "../qwark.c" 1
	mov #0x7FFE, r14
 ; 0 "" 2
	.loc 1 380 0
 ; 380 "../qwark.c" 1
	mov &0X6042, r12
 ; 0 "" 2
	.loc 1 381 0
 ; 381 "../qwark.c" 1
	mov #0x6BFE, r13
 ; 0 "" 2
	.loc 1 383 0
 ; 383 "../qwark.c" 1
	cmp.b #0x01,&0x6075
 ; 0 "" 2
	.loc 1 384 0
 ; 384 "../qwark.c" 1
	jz __pre_copy_stack
 ; 0 "" 2
	.loc 1 386 0
 ; 386 "../qwark.c" 1
	mov &0X6012, r12
 ; 0 "" 2
	.loc 1 387 0
 ; 387 "../qwark.c" 1
	mov #0x6FFE, r13
 ; 0 "" 2
	.loc 1 389 0
 ; 389 "../qwark.c" 1
	__pre_copy_stack:
 ; 0 "" 2
	.loc 1 391 0
 ; 391 "../qwark.c" 1
	decd r12
 ; 0 "" 2
	.loc 1 393 0
 ; 393 "../qwark.c" 1
	__copy_stack:
 ; 0 "" 2
	.loc 1 395 0
 ; 395 "../qwark.c" 1
	cmp r14,r12
 ; 0 "" 2
	.loc 1 396 0
 ; 396 "../qwark.c" 1
	jz __copy_stack_complete
 ; 0 "" 2
	.loc 1 398 0
 ; 398 "../qwark.c" 1
	mov @r14,@r13
 ; 0 "" 2
	.loc 1 400 0
 ; 400 "../qwark.c" 1
	decd r13
 ; 0 "" 2
	.loc 1 401 0
 ; 401 "../qwark.c" 1
	decd r14
 ; 0 "" 2
	.loc 1 402 0
 ; 402 "../qwark.c" 1
	br #__copy_stack
 ; 0 "" 2
	.loc 1 404 0
 ; 404 "../qwark.c" 1
	__copy_stack_complete:
 ; 0 "" 2
	.loc 1 411 0
 ; 411 "../qwark.c" 1
	cmp.b #0x01,&0x6075
 ; 0 "" 2
	.loc 1 412 0
 ; 412 "../qwark.c" 1
	jz  __set_flag_2nd 
 ; 0 "" 2
	.loc 1 414 0
 ; 414 "../qwark.c" 1
	add.b #0x01, &0x6074 
 ; 0 "" 2
	.loc 1 415 0
 ; 415 "../qwark.c" 1
	br  #_second_phase_commit 
 ; 0 "" 2
	.loc 1 417 0
 ; 417 "../qwark.c" 1
	__set_flag_2nd:
 ; 0 "" 2
	.loc 1 418 0
 ; 418 "../qwark.c" 1
	add.b #0x01, &0x6075 
 ; 0 "" 2
	.loc 1 426 0
 ; 426 "../qwark.c" 1
	_second_phase_commit:
 ; 0 "" 2
	.loc 1 428 0
 ; 428 "../qwark.c" 1
	tst r15 
 ; 0 "" 2
	.loc 1 429 0
 ; 429 "../qwark.c" 1
	jz  _chkpt_finished
 ; 0 "" 2
	.loc 1 431 0
 ; 431 "../qwark.c" 1
	mov #0x6000,  r14 
 ; 0 "" 2
	.loc 1 433 0
 ; 433 "../qwark.c" 1
	mov #0x6060,  r12 
 ; 0 "" 2
	.loc 1 434 0
 ; 434 "../qwark.c" 1
	cmp.b #0x02,&0x6075
 ; 0 "" 2
	.loc 1 435 0
 ; 435 "../qwark.c" 1
	jz _second_phase_commit_strt
 ; 0 "" 2
	.loc 1 437 0
 ; 437 "../qwark.c" 1
	mov #0x6030,  r12 
 ; 0 "" 2
	.loc 1 440 0
 ; 440 "../qwark.c" 1
	_second_phase_commit_strt:
 ; 0 "" 2
	.loc 1 442 0
 ; 442 "../qwark.c" 1
	mov @r12+2,  r13 
 ; 0 "" 2
	.loc 1 444 0
 ; 444 "../qwark.c" 1
	mov r13,  r11 
 ; 0 "" 2
	.loc 1 446 0
 ; 446 "../qwark.c" 1
	and #0x8000,  r11 
 ; 0 "" 2
	.loc 1 447 0
 ; 447 "../qwark.c" 1
	cmp #0x8000,  r11 
 ; 0 "" 2
	.loc 1 448 0
 ; 448 "../qwark.c" 1
	jeq _byte_copy 
 ; 0 "" 2
	.loc 1 450 0
 ; 450 "../qwark.c" 1
	mov @r14+2, @r13 
 ; 0 "" 2
	.loc 1 452 0
 ; 452 "../qwark.c" 1
	dec r15
 ; 0 "" 2
	.loc 1 453 0
 ; 453 "../qwark.c" 1
	tst r15
 ; 0 "" 2
	.loc 1 455 0
 ; 455 "../qwark.c" 1
	jnz  _second_phase_commit_strt
 ; 0 "" 2
	.loc 1 456 0
 ; 456 "../qwark.c" 1
	br #_chkpt_finished
 ; 0 "" 2
	.loc 1 458 0
 ; 458 "../qwark.c" 1
	_byte_copy:
 ; 0 "" 2
	.loc 1 459 0
 ; 459 "../qwark.c" 1
	and #0x7FFF,  r13 
 ; 0 "" 2
	.loc 1 460 0
 ; 460 "../qwark.c" 1
	mov r13,      r11 
 ; 0 "" 2
	.loc 1 461 0
 ; 461 "../qwark.c" 1
	and #0x01,    r11 
 ; 0 "" 2
	.loc 1 462 0
 ; 462 "../qwark.c" 1
	bis  r11,     r14 
 ; 0 "" 2
	.loc 1 464 0
 ; 464 "../qwark.c" 1
	mov.b @r14, @r13 
 ; 0 "" 2
	.loc 1 465 0
 ; 465 "../qwark.c" 1
	incd r14 
 ; 0 "" 2
	.loc 1 467 0
 ; 467 "../qwark.c" 1
	dec r15
 ; 0 "" 2
	.loc 1 468 0
 ; 468 "../qwark.c" 1
	tst r15
 ; 0 "" 2
	.loc 1 469 0
 ; 469 "../qwark.c" 1
	jnz  _second_phase_commit_strt
 ; 0 "" 2
	.loc 1 475 0
 ; 475 "../qwark.c" 1
	_chkpt_finished:
 ; 0 "" 2
	.loc 1 479 0
 ; 479 "../qwark.c" 1
	cmp.b #0x02,&0x6075
 ; 0 "" 2
	.loc 1 480 0
 ; 480 "../qwark.c" 1
	jeq  __pre_finish_2nd_buffer 
 ; 0 "" 2
	.loc 1 482 0
 ; 482 "../qwark.c" 1
	mov #0x0103, &0x6074 
 ; 0 "" 2
	.loc 1 489 0
 ; 489 "../qwark.c" 1
	mov &0x6024,r11
 ; 0 "" 2
	.loc 1 490 0
 ; 490 "../qwark.c" 1
	mov &0x6026,r12
 ; 0 "" 2
	.loc 1 491 0
 ; 491 "../qwark.c" 1
	mov &0x6028,r13
 ; 0 "" 2
	.loc 1 492 0
 ; 492 "../qwark.c" 1
	mov &0x602A,r14
 ; 0 "" 2
	.loc 1 493 0
 ; 493 "../qwark.c" 1
	mov &0x602C,r15
 ; 0 "" 2
	.loc 1 495 0
 ; 495 "../qwark.c" 1
	br #_finish
 ; 0 "" 2
	.loc 1 497 0
 ; 497 "../qwark.c" 1
	__pre_finish_2nd_buffer:
 ; 0 "" 2
	.loc 1 499 0
 ; 499 "../qwark.c" 1
	mov #0x0301, &0x6074 
 ; 0 "" 2
	.loc 1 504 0
 ; 504 "../qwark.c" 1
	mov &0x6054,r11
 ; 0 "" 2
	.loc 1 505 0
 ; 505 "../qwark.c" 1
	mov &0x6056,r12
 ; 0 "" 2
	.loc 1 506 0
 ; 506 "../qwark.c" 1
	mov &0x6058,r13
 ; 0 "" 2
	.loc 1 507 0
 ; 507 "../qwark.c" 1
	mov &0x605A,r14
 ; 0 "" 2
	.loc 1 508 0
 ; 508 "../qwark.c" 1
	mov &0x605C,r15
 ; 0 "" 2
	.loc 1 510 0
 ; 510 "../qwark.c" 1
	_finish:
 ; 0 "" 2
	.loc 1 512 0
 ; 512 "../qwark.c" 1
	mov #0x0001, &0x02A0
 ; 0 "" 2
	.loc 1 514 0
	; start of epilogue
	RETI
.LFE0:
	.size	INT_Qwark, .-INT_Qwark
	.section	.debug_frame,"",@progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.string	""
	.uleb128 0x1
	.sleb128 -2
	.uleb128 0
	.byte	0xc
	.uleb128 0x1
	.uleb128 0x2
	.byte	0x80
	.uleb128 0x1
	.balign 4
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.balign 4
.LEFDE0:
.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x40
	.2byte	0x3
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF0
	.byte	0xc
	.4byte	.LASF1
	.4byte	.LASF2
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macinfo0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x1
	.4byte	.LASF4
	.byte	0x1
	.byte	0xff
	.byte	0x1
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x43
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_macinfo,"",@progbits
.Ldebug_macinfo0:
	.byte	0x3
	.uleb128 0
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x1
	.string	"__STDC__ 1"
	.byte	0x1
	.uleb128 0x2
	.string	"__STDC_VERSION__ 199901L"
	.byte	0x1
	.uleb128 0x3
	.string	"__STDC_HOSTED__ 1"
	.byte	0x1
	.uleb128 0x4
	.string	"__GNUC__ 7"
	.byte	0x1
	.uleb128 0x5
	.string	"__GNUC_MINOR__ 3"
	.byte	0x1
	.uleb128 0x6
	.string	"__GNUC_PATCHLEVEL__ 1"
	.byte	0x1
	.uleb128 0x7
	.string	"__VERSION__ \"7.3.1\""
	.byte	0x1
	.uleb128 0x8
	.string	"__ATOMIC_RELAXED 0"
	.byte	0x1
	.uleb128 0x9
	.string	"__ATOMIC_SEQ_CST 5"
	.byte	0x1
	.uleb128 0xa
	.string	"__ATOMIC_ACQUIRE 2"
	.byte	0x1
	.uleb128 0xb
	.string	"__ATOMIC_RELEASE 3"
	.byte	0x1
	.uleb128 0xc
	.string	"__ATOMIC_ACQ_REL 4"
	.byte	0x1
	.uleb128 0xd
	.string	"__ATOMIC_CONSUME 1"
	.byte	0x1
	.uleb128 0xe
	.string	"__OPTIMIZE__ 1"
	.byte	0x1
	.uleb128 0xf
	.string	"__FINITE_MATH_ONLY__ 0"
	.byte	0x1
	.uleb128 0x10
	.string	"__SIZEOF_INT__ 2"
	.byte	0x1
	.uleb128 0x11
	.string	"__SIZEOF_LONG__ 4"
	.byte	0x1
	.uleb128 0x12
	.string	"__SIZEOF_LONG_LONG__ 8"
	.byte	0x1
	.uleb128 0x13
	.string	"__SIZEOF_SHORT__ 2"
	.byte	0x1
	.uleb128 0x14
	.string	"__SIZEOF_FLOAT__ 4"
	.byte	0x1
	.uleb128 0x15
	.string	"__SIZEOF_DOUBLE__ 8"
	.byte	0x1
	.uleb128 0x16
	.string	"__SIZEOF_LONG_DOUBLE__ 8"
	.byte	0x1
	.uleb128 0x17
	.string	"__SIZEOF_SIZE_T__ 2"
	.byte	0x1
	.uleb128 0x18
	.string	"__CHAR_BIT__ 8"
	.byte	0x1
	.uleb128 0x19
	.string	"__BIGGEST_ALIGNMENT__ 2"
	.byte	0x1
	.uleb128 0x1a
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
	.byte	0x1
	.uleb128 0x1b
	.string	"__ORDER_BIG_ENDIAN__ 4321"
	.byte	0x1
	.uleb128 0x1c
	.string	"__ORDER_PDP_ENDIAN__ 3412"
	.byte	0x1
	.uleb128 0x1d
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
	.byte	0x1
	.uleb128 0x1e
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
	.byte	0x1
	.uleb128 0x1f
	.string	"__SIZEOF_POINTER__ 2"
	.byte	0x1
	.uleb128 0x20
	.string	"__SIZE_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x21
	.string	"__PTRDIFF_TYPE__ int"
	.byte	0x1
	.uleb128 0x22
	.string	"__WCHAR_TYPE__ long int"
	.byte	0x1
	.uleb128 0x23
	.string	"__WINT_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x24
	.string	"__INTMAX_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x25
	.string	"__UINTMAX_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x26
	.string	"__CHAR16_TYPE__ short unsigned int"
	.byte	0x1
	.uleb128 0x27
	.string	"__CHAR32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x28
	.string	"__SIG_ATOMIC_TYPE__ int"
	.byte	0x1
	.uleb128 0x29
	.string	"__INT8_TYPE__ signed char"
	.byte	0x1
	.uleb128 0x2a
	.string	"__INT16_TYPE__ short int"
	.byte	0x1
	.uleb128 0x2b
	.string	"__INT32_TYPE__ long int"
	.byte	0x1
	.uleb128 0x2c
	.string	"__INT64_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x2d
	.string	"__UINT8_TYPE__ unsigned char"
	.byte	0x1
	.uleb128 0x2e
	.string	"__UINT16_TYPE__ short unsigned int"
	.byte	0x1
	.uleb128 0x2f
	.string	"__UINT32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x30
	.string	"__UINT64_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x31
	.string	"__INT_LEAST8_TYPE__ signed char"
	.byte	0x1
	.uleb128 0x32
	.string	"__INT_LEAST16_TYPE__ short int"
	.byte	0x1
	.uleb128 0x33
	.string	"__INT_LEAST32_TYPE__ long int"
	.byte	0x1
	.uleb128 0x34
	.string	"__INT_LEAST64_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x35
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
	.byte	0x1
	.uleb128 0x36
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
	.byte	0x1
	.uleb128 0x37
	.string	"__UINT_LEAST32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x38
	.string	"__UINT_LEAST64_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x39
	.string	"__INT_FAST8_TYPE__ int"
	.byte	0x1
	.uleb128 0x3a
	.string	"__INT_FAST16_TYPE__ int"
	.byte	0x1
	.uleb128 0x3b
	.string	"__INT_FAST32_TYPE__ long int"
	.byte	0x1
	.uleb128 0x3c
	.string	"__INT_FAST64_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x3d
	.string	"__UINT_FAST8_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x3e
	.string	"__UINT_FAST16_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x3f
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x40
	.string	"__UINT_FAST64_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x41
	.string	"__INTPTR_TYPE__ int"
	.byte	0x1
	.uleb128 0x42
	.string	"__UINTPTR_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x43
	.string	"__has_include(STR) __has_include__(STR)"
	.byte	0x1
	.uleb128 0x44
	.string	"__has_include_next(STR) __has_include_next__(STR)"
	.byte	0x1
	.uleb128 0x45
	.string	"__GXX_ABI_VERSION 1011"
	.byte	0x1
	.uleb128 0x46
	.string	"__SCHAR_MAX__ 0x7f"
	.byte	0x1
	.uleb128 0x47
	.string	"__SHRT_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x48
	.string	"__INT_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x49
	.string	"__LONG_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x4a
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x4b
	.string	"__WCHAR_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x4c
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x4d
	.string	"__WINT_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x4e
	.string	"__WINT_MIN__ 0U"
	.byte	0x1
	.uleb128 0x4f
	.string	"__PTRDIFF_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x50
	.string	"__SIZE_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x51
	.string	"__SCHAR_WIDTH__ 8"
	.byte	0x1
	.uleb128 0x52
	.string	"__SHRT_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x53
	.string	"__INT_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x54
	.string	"__LONG_WIDTH__ 32"
	.byte	0x1
	.uleb128 0x55
	.string	"__LONG_LONG_WIDTH__ 64"
	.byte	0x1
	.uleb128 0x56
	.string	"__WCHAR_WIDTH__ 32"
	.byte	0x1
	.uleb128 0x57
	.string	"__WINT_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x58
	.string	"__PTRDIFF_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x59
	.string	"__SIZE_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x5a
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x5b
	.string	"__INTMAX_C(c) c ## LL"
	.byte	0x1
	.uleb128 0x5c
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffULL"
	.byte	0x1
	.uleb128 0x5d
	.string	"__UINTMAX_C(c) c ## ULL"
	.byte	0x1
	.uleb128 0x5e
	.string	"__INTMAX_WIDTH__ 64"
	.byte	0x1
	.uleb128 0x5f
	.string	"__SIG_ATOMIC_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x60
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x61
	.string	"__SIG_ATOMIC_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x62
	.string	"__INT8_MAX__ 0x7f"
	.byte	0x1
	.uleb128 0x63
	.string	"__INT16_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x64
	.string	"__INT32_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x65
	.string	"__INT64_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x66
	.string	"__UINT8_MAX__ 0xff"
	.byte	0x1
	.uleb128 0x67
	.string	"__UINT16_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x68
	.string	"__UINT32_MAX__ 0xffffffffUL"
	.byte	0x1
	.uleb128 0x69
	.string	"__UINT64_MAX__ 0xffffffffffffffffULL"
	.byte	0x1
	.uleb128 0x6a
	.string	"__INT_LEAST8_MAX__ 0x7f"
	.byte	0x1
	.uleb128 0x6b
	.string	"__INT8_C(c) c"
	.byte	0x1
	.uleb128 0x6c
	.string	"__INT_LEAST8_WIDTH__ 8"
	.byte	0x1
	.uleb128 0x6d
	.string	"__INT_LEAST16_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x6e
	.string	"__INT16_C(c) c"
	.byte	0x1
	.uleb128 0x6f
	.string	"__INT_LEAST16_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x70
	.string	"__INT_LEAST32_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x71
	.string	"__INT32_C(c) c ## L"
	.byte	0x1
	.uleb128 0x72
	.string	"__INT_LEAST32_WIDTH__ 32"
	.byte	0x1
	.uleb128 0x73
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x74
	.string	"__INT64_C(c) c ## LL"
	.byte	0x1
	.uleb128 0x75
	.string	"__INT_LEAST64_WIDTH__ 64"
	.byte	0x1
	.uleb128 0x76
	.string	"__UINT_LEAST8_MAX__ 0xff"
	.byte	0x1
	.uleb128 0x77
	.string	"__UINT8_C(c) c"
	.byte	0x1
	.uleb128 0x78
	.string	"__UINT_LEAST16_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x79
	.string	"__UINT16_C(c) c ## U"
	.byte	0x1
	.uleb128 0x7a
	.string	"__UINT_LEAST32_MAX__ 0xffffffffUL"
	.byte	0x1
	.uleb128 0x7b
	.string	"__UINT32_C(c) c ## UL"
	.byte	0x1
	.uleb128 0x7c
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL"
	.byte	0x1
	.uleb128 0x7d
	.string	"__UINT64_C(c) c ## ULL"
	.byte	0x1
	.uleb128 0x7e
	.string	"__INT_FAST8_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x7f
	.string	"__INT_FAST8_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x80
	.string	"__INT_FAST16_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x81
	.string	"__INT_FAST16_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x82
	.string	"__INT_FAST32_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x83
	.string	"__INT_FAST32_WIDTH__ 32"
	.byte	0x1
	.uleb128 0x84
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x85
	.string	"__INT_FAST64_WIDTH__ 64"
	.byte	0x1
	.uleb128 0x86
	.string	"__UINT_FAST8_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x87
	.string	"__UINT_FAST16_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x88
	.string	"__UINT_FAST32_MAX__ 0xffffffffUL"
	.byte	0x1
	.uleb128 0x89
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL"
	.byte	0x1
	.uleb128 0x8a
	.string	"__INTPTR_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x8b
	.string	"__INTPTR_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x8c
	.string	"__UINTPTR_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x8d
	.string	"__GCC_IEC_559 0"
	.byte	0x1
	.uleb128 0x8e
	.string	"__GCC_IEC_559_COMPLEX 0"
	.byte	0x1
	.uleb128 0x8f
	.string	"__FLT_EVAL_METHOD__ 0"
	.byte	0x1
	.uleb128 0x90
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
	.byte	0x1
	.uleb128 0x91
	.string	"__DEC_EVAL_METHOD__ 2"
	.byte	0x1
	.uleb128 0x92
	.string	"__FLT_RADIX__ 2"
	.byte	0x1
	.uleb128 0x93
	.string	"__FLT_MANT_DIG__ 24"
	.byte	0x1
	.uleb128 0x94
	.string	"__FLT_DIG__ 6"
	.byte	0x1
	.uleb128 0x95
	.string	"__FLT_MIN_EXP__ (-125)"
	.byte	0x1
	.uleb128 0x96
	.string	"__FLT_MIN_10_EXP__ (-37)"
	.byte	0x1
	.uleb128 0x97
	.string	"__FLT_MAX_EXP__ 128"
	.byte	0x1
	.uleb128 0x98
	.string	"__FLT_MAX_10_EXP__ 38"
	.byte	0x1
	.uleb128 0x99
	.string	"__FLT_DECIMAL_DIG__ 9"
	.byte	0x1
	.uleb128 0x9a
	.string	"__FLT_MAX__ 3.4028234663852886e+38F"
	.byte	0x1
	.uleb128 0x9b
	.string	"__FLT_MIN__ 1.1754943508222875e-38F"
	.byte	0x1
	.uleb128 0x9c
	.string	"__FLT_EPSILON__ 1.1920928955078125e-7F"
	.byte	0x1
	.uleb128 0x9d
	.string	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F"
	.byte	0x1
	.uleb128 0x9e
	.string	"__FLT_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0x9f
	.string	"__FLT_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xa0
	.string	"__FLT_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xa1
	.string	"__DBL_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0xa2
	.string	"__DBL_DIG__ 15"
	.byte	0x1
	.uleb128 0xa3
	.string	"__DBL_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0xa4
	.string	"__DBL_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0xa5
	.string	"__DBL_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0xa6
	.string	"__DBL_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0xa7
	.string	"__DBL_DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xa8
	.string	"__DBL_MAX__ ((double)1.7976931348623157e+308L)"
	.byte	0x1
	.uleb128 0xa9
	.string	"__DBL_MIN__ ((double)2.2250738585072014e-308L)"
	.byte	0x1
	.uleb128 0xaa
	.string	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)"
	.byte	0x1
	.uleb128 0xab
	.string	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324L)"
	.byte	0x1
	.uleb128 0xac
	.string	"__DBL_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xad
	.string	"__DBL_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xae
	.string	"__DBL_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xaf
	.string	"__LDBL_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0xb0
	.string	"__LDBL_DIG__ 15"
	.byte	0x1
	.uleb128 0xb1
	.string	"__LDBL_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0xb2
	.string	"__LDBL_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0xb3
	.string	"__LDBL_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0xb4
	.string	"__LDBL_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0xb5
	.string	"__DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xb6
	.string	"__LDBL_DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xb7
	.string	"__LDBL_MAX__ 1.7976931348623157e+308L"
	.byte	0x1
	.uleb128 0xb8
	.string	"__LDBL_MIN__ 2.2250738585072014e-308L"
	.byte	0x1
	.uleb128 0xb9
	.string	"__LDBL_EPSILON__ 2.2204460492503131e-16L"
	.byte	0x1
	.uleb128 0xba
	.string	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L"
	.byte	0x1
	.uleb128 0xbb
	.string	"__LDBL_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xbc
	.string	"__LDBL_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xbd
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xbe
	.string	"__FLT32_MANT_DIG__ 24"
	.byte	0x1
	.uleb128 0xbf
	.string	"__FLT32_DIG__ 6"
	.byte	0x1
	.uleb128 0xc0
	.string	"__FLT32_MIN_EXP__ (-125)"
	.byte	0x1
	.uleb128 0xc1
	.string	"__FLT32_MIN_10_EXP__ (-37)"
	.byte	0x1
	.uleb128 0xc2
	.string	"__FLT32_MAX_EXP__ 128"
	.byte	0x1
	.uleb128 0xc3
	.string	"__FLT32_MAX_10_EXP__ 38"
	.byte	0x1
	.uleb128 0xc4
	.string	"__FLT32_DECIMAL_DIG__ 9"
	.byte	0x1
	.uleb128 0xc5
	.string	"__FLT32_MAX__ 3.4028234663852886e+38F32"
	.byte	0x1
	.uleb128 0xc6
	.string	"__FLT32_MIN__ 1.1754943508222875e-38F32"
	.byte	0x1
	.uleb128 0xc7
	.string	"__FLT32_EPSILON__ 1.1920928955078125e-7F32"
	.byte	0x1
	.uleb128 0xc8
	.string	"__FLT32_DENORM_MIN__ 1.4012984643248171e-45F32"
	.byte	0x1
	.uleb128 0xc9
	.string	"__FLT32_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xca
	.string	"__FLT32_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xcb
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xcc
	.string	"__FLT64_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0xcd
	.string	"__FLT64_DIG__ 15"
	.byte	0x1
	.uleb128 0xce
	.string	"__FLT64_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0xcf
	.string	"__FLT64_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0xd0
	.string	"__FLT64_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0xd1
	.string	"__FLT64_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0xd2
	.string	"__FLT64_DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xd3
	.string	"__FLT64_MAX__ 1.7976931348623157e+308F64"
	.byte	0x1
	.uleb128 0xd4
	.string	"__FLT64_MIN__ 2.2250738585072014e-308F64"
	.byte	0x1
	.uleb128 0xd5
	.string	"__FLT64_EPSILON__ 2.2204460492503131e-16F64"
	.byte	0x1
	.uleb128 0xd6
	.string	"__FLT64_DENORM_MIN__ 4.9406564584124654e-324F64"
	.byte	0x1
	.uleb128 0xd7
	.string	"__FLT64_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xd8
	.string	"__FLT64_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xd9
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xda
	.string	"__FLT32X_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0xdb
	.string	"__FLT32X_DIG__ 15"
	.byte	0x1
	.uleb128 0xdc
	.string	"__FLT32X_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0xdd
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0xde
	.string	"__FLT32X_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0xdf
	.string	"__FLT32X_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0xe0
	.string	"__FLT32X_DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xe1
	.string	"__FLT32X_MAX__ 1.7976931348623157e+308F32x"
	.byte	0x1
	.uleb128 0xe2
	.string	"__FLT32X_MIN__ 2.2250738585072014e-308F32x"
	.byte	0x1
	.uleb128 0xe3
	.string	"__FLT32X_EPSILON__ 2.2204460492503131e-16F32x"
	.byte	0x1
	.uleb128 0xe4
	.string	"__FLT32X_DENORM_MIN__ 4.9406564584124654e-324F32x"
	.byte	0x1
	.uleb128 0xe5
	.string	"__FLT32X_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xe6
	.string	"__FLT32X_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xe7
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xe8
	.string	"__DEC32_MANT_DIG__ 7"
	.byte	0x1
	.uleb128 0xe9
	.string	"__DEC32_MIN_EXP__ (-94)"
	.byte	0x1
	.uleb128 0xea
	.string	"__DEC32_MAX_EXP__ 97"
	.byte	0x1
	.uleb128 0xeb
	.string	"__DEC32_MIN__ 1E-95DF"
	.byte	0x1
	.uleb128 0xec
	.string	"__DEC32_MAX__ 9.999999E96DF"
	.byte	0x1
	.uleb128 0xed
	.string	"__DEC32_EPSILON__ 1E-6DF"
	.byte	0x1
	.uleb128 0xee
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
	.byte	0x1
	.uleb128 0xef
	.string	"__DEC64_MANT_DIG__ 16"
	.byte	0x1
	.uleb128 0xf0
	.string	"__DEC64_MIN_EXP__ (-382)"
	.byte	0x1
	.uleb128 0xf1
	.string	"__DEC64_MAX_EXP__ 385"
	.byte	0x1
	.uleb128 0xf2
	.string	"__DEC64_MIN__ 1E-383DD"
	.byte	0x1
	.uleb128 0xf3
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
	.byte	0x1
	.uleb128 0xf4
	.string	"__DEC64_EPSILON__ 1E-15DD"
	.byte	0x1
	.uleb128 0xf5
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
	.byte	0x1
	.uleb128 0xf6
	.string	"__DEC128_MANT_DIG__ 34"
	.byte	0x1
	.uleb128 0xf7
	.string	"__DEC128_MIN_EXP__ (-6142)"
	.byte	0x1
	.uleb128 0xf8
	.string	"__DEC128_MAX_EXP__ 6145"
	.byte	0x1
	.uleb128 0xf9
	.string	"__DEC128_MIN__ 1E-6143DL"
	.byte	0x1
	.uleb128 0xfa
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
	.byte	0x1
	.uleb128 0xfb
	.string	"__DEC128_EPSILON__ 1E-33DL"
	.byte	0x1
	.uleb128 0xfc
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
	.byte	0x1
	.uleb128 0xfd
	.string	"__REGISTER_PREFIX__ "
	.byte	0x1
	.uleb128 0xfe
	.string	"__USER_LABEL_PREFIX__ "
	.byte	0x1
	.uleb128 0xff
	.string	"__GNUC_STDC_INLINE__ 1"
	.byte	0x1
	.uleb128 0x100
	.string	"__STRICT_ANSI__ 1"
	.byte	0x1
	.uleb128 0x101
	.string	"__CHAR_UNSIGNED__ 1"
	.byte	0x1
	.uleb128 0x102
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x103
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x104
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x105
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x106
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x107
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x108
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x109
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x10a
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x10b
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
	.byte	0x1
	.uleb128 0x10c
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 1"
	.byte	0x1
	.uleb128 0x10d
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
	.byte	0x1
	.uleb128 0x10e
	.string	"__SIZEOF_WCHAR_T__ 4"
	.byte	0x1
	.uleb128 0x10f
	.string	"__SIZEOF_WINT_T__ 2"
	.byte	0x1
	.uleb128 0x110
	.string	"__SIZEOF_PTRDIFF_T__ 2"
	.byte	0x1
	.uleb128 0x111
	.string	"NO_TRAMPOLINES 1"
	.byte	0x1
	.uleb128 0x112
	.string	"__MSP430__ 1"
	.byte	0x1
	.uleb128 0x113
	.string	"__MSP430GENERIC__ 1"
	.byte	0x1
	.uleb128 0x114
	.string	"__ELF__ 1"
	.byte	0x1
	.uleb128 0x1
	.string	"PFX_MSP430_ELF 1"
	.file 2 "/home/hiram/master/Qwark/altera_de0_nano/software/libs/omsp_system.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0x2
	.file 3 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x3
	.byte	0x1
	.uleb128 0x27
	.string	"__IN430_H__ "
	.byte	0x1
	.uleb128 0x32
	.string	"_no_operation() __asm__ __volatile__ (\"nop\")"
	.byte	0x1
	.uleb128 0x34
	.string	"_get_interrupt_state() ({ unsigned int __x; __asm__ __volatile__( \"mov SR, %0\" : \"=r\" ((unsigned int) __x) :); __x; })"
	.byte	0x1
	.uleb128 0x4e
	.string	"_set_interrupt_state(x) ({ __asm__ __volatile__ (\"mov %0, SR\" : : \"ri\"((unsigned int) x) );})"
	.byte	0x1
	.uleb128 0x55
	.string	"_enable_interrupts() __asm__ __volatile__ (\"eint { nop\")"
	.byte	0x1
	.uleb128 0x57
	.string	"_bis_SR_register(x) __asm__ __volatile__ (\"bis.w %0, SR\" : : \"ri\"((unsigned int) x) )"
	.byte	0x1
	.uleb128 0x5e
	.string	"_disable_interrupts() __asm__ __volatile__ (\"dint { nop\")"
	.byte	0x1
	.uleb128 0x60
	.string	"_bic_SR_register(x) __asm__ __volatile__ (\"bic.w %0, SR { nop\" : : \"ri\"((unsigned int) x) )"
	.byte	0x1
	.uleb128 0x65
	.string	"_get_SR_register() ({ unsigned int __x; __asm__ __volatile__( \"mov SR, %0\" : \"=r\" ((unsigned int) __x) :); __x; })"
	.byte	0x1
	.uleb128 0x6f
	.string	"_swap_bytes(x) ({ unsigned int __dst = x; __asm__ __volatile__( \"swpb %0\" : \"+r\" ((unsigned int) __dst) :); __dst; })"
	.byte	0x1
	.uleb128 0x7a
	.string	"_bic_SR_register_on_exit(x) __bic_SR_register_on_exit(x)"
	.byte	0x1
	.uleb128 0x7b
	.string	"_bis_SR_register_on_exit(x) __bis_SR_register_on_exit(x)"
	.byte	0x1
	.uleb128 0x7e
	.string	"_bcd_add_short(x,y) ({ unsigned short __z = ((unsigned short) y); __asm__ __volatile__( \"clrc \\n\\t\" \"dadd.w %1, %0\" : \"+r\" ((unsigned short) __z) : \"ri\" ((unsigned short) x) ); __z; })"
	.byte	0x1
	.uleb128 0x8a
	.string	"__bcd_add_short(x,y) _bcd_add_short(x,y)"
	.byte	0x1
	.uleb128 0x8c
	.string	"_bcd_add_long(x,y) ({ unsigned long __z = ((unsigned long) y); __asm__ __volatile__( \"clrc \\n\\t\" \"dadd.w %L1, %L0 \\n\\t\" \"dadd.w %H1, %H0\" : \"+r\" ((unsigned long) __z) : \"ri\" ((unsigned long) x) ); __z; })"
	.byte	0x1
	.uleb128 0x99
	.string	"__bcd_add_long(x,y) _bcd_add_long(x,y)"
	.byte	0x1
	.uleb128 0x9b
	.string	"_get_SP_register() ({ unsigned int __x; __asm__ __volatile__( \"mov SP, %0\" : \"=r\" ((unsigned int) __x) :); __x; })"
	.byte	0x1
	.uleb128 0xa5
	.string	"__get_SP_register() _get_SP_register()"
	.byte	0x1
	.uleb128 0xa7
	.string	"_set_SP_register(x) ({ __asm__ __volatile__ (\"mov %0, SP\" : : \"ri\"((unsigned int) x) );})"
	.byte	0x1
	.uleb128 0xae
	.string	"__set_SP_register(x) _set_SP_register(x)"
	.byte	0x1
	.uleb128 0xb0
	.string	"_data16_write_addr(addr,src) ({ unsigned long __src = src; __asm__ __volatile__ ( \"movx.a %1, 0(%0)\" : : \"r\"((unsigned int) addr), \"m\"((unsigned long) __src) ); })"
	.byte	0x1
	.uleb128 0xb9
	.string	"__data16_write_addr(addr,src) _data16_write_addr(addr,src)"
	.byte	0x1
	.uleb128 0xbb
	.string	"_data16_read_addr(addr) ({ unsigned long __dst; __asm__ __volatile__ ( \"movx.a @%1, %0\" : \"=m\"((unsigned long) __dst) : \"r\"((unsigned int) addr) ); __dst; })"
	.byte	0x1
	.uleb128 0xc6
	.string	"__data16_read_addr(addr) _data16_read_addr(addr)"
	.byte	0x1
	.uleb128 0xc8
	.string	"_data20_write_char(addr,src) ({ unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( \"movx.a %1, %0 \\n\\t\" \"mov.b  %2, 0(%0)\" : \"=&r\"((unsigned int) __tmp) : \"m\"((unsigned long) __addr), \"ri\"((char) src) ); })"
	.byte	0x1
	.uleb128 0xd4
	.string	"__data20_write_char(addr,src) _data20_write_char(addr,src)"
	.byte	0x1
	.uleb128 0xd6
	.string	"_data20_read_char(addr) ({ char __dst; unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( \"movx.a %2, %1 \\n\\t\" \"mov.b 0(%1), %0\" : \"=r\"((char) __dst), \"=&r\"((unsigned int) __tmp) : \"m\"((unsigned long) __addr) ); __dst ; })"
	.byte	0x1
	.uleb128 0xe4
	.string	"__data20_read_char(addr) _data20_read_char(addr)"
	.byte	0x1
	.uleb128 0xe6
	.string	"_data20_write_short(addr,src) ({ unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( \"movx.a %1, %0 \\n\\t\" \"mov.w  %2, 0(%0)\" : \"=&r\"((unsigned int) __tmp) : \"m\"((unsigned long) __addr), \"ri\"((short) src) ); })"
	.byte	0x1
	.uleb128 0xf2
	.string	"__data20_write_short(addr,src) _data20_write_short(addr,src)"
	.byte	0x1
	.uleb128 0xf4
	.string	"_data20_read_short(addr) ({ short __dst; unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( \"movx.a %2, %1 \\n\\t\" \"mov.w 0(%1), %0\" : \"=r\"((short) __dst), \"=&r\"((unsigned int) __tmp) : \"m\"((unsigned long) __addr) ); __dst ; })"
	.byte	0x1
	.uleb128 0x102
	.string	"__data20_read_short(addr) _data20_read_short(addr)"
	.byte	0x1
	.uleb128 0x104
	.string	"_data20_write_long(addr,src) ({ unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( \"movx.a %1, %0 \\n\\t\" \"mov.w  %L2, 0(%0) \\n\\t\" \"mov.w  %H2, 2(%0)\" : \"=&r\"((unsigned int) __tmp) : \"m\"((unsigned long) __addr), \"ri\"((long) src) ); })"
	.byte	0x1
	.uleb128 0x111
	.string	"__data20_write_long(addr,src) _data20_write_long(addr,src)"
	.byte	0x1
	.uleb128 0x113
	.ascii	"_data20_read_l"
	.string	"ong(addr) ({ long __dst; unsigned int __tmp; unsigned long __addr = addr; __asm__ __volatile__ ( \"movx.a %2, %1 \\n\\t\" \"mov.w  0(%1), %L0 \\n\\t\" \"mov.w  2(%1), %H0\" : \"=r\"((long) __dst), \"=&r\"((unsigned int) __tmp) : \"m\"((unsigned long) __addr) ); __dst ; })"
	.byte	0x1
	.uleb128 0x122
	.string	"__data20_read_long(addr) _data20_read_long(addr)"
	.byte	0x1
	.uleb128 0x124
	.string	"_low_power_mode_0() _bis_SR_register(0x18)"
	.byte	0x1
	.uleb128 0x125
	.string	"_low_power_mode_1() _bis_SR_register(0x58)"
	.byte	0x1
	.uleb128 0x126
	.string	"_low_power_mode_2() _bis_SR_register(0x98)"
	.byte	0x1
	.uleb128 0x127
	.string	"_low_power_mode_3() _bis_SR_register(0xD8)"
	.byte	0x1
	.uleb128 0x128
	.string	"_low_power_mode_4() _bis_SR_register(0xF8)"
	.byte	0x1
	.uleb128 0x129
	.string	"_low_power_mode_off_on_exit() _bic_SR_register_on_exit(0xF0)"
	.byte	0x1
	.uleb128 0x12b
	.string	"__low_power_mode_0() _low_power_mode_0()"
	.byte	0x1
	.uleb128 0x12c
	.string	"__low_power_mode_1() _low_power_mode_1()"
	.byte	0x1
	.uleb128 0x12d
	.string	"__low_power_mode_2() _low_power_mode_2()"
	.byte	0x1
	.uleb128 0x12e
	.string	"__low_power_mode_3() _low_power_mode_3()"
	.byte	0x1
	.uleb128 0x12f
	.string	"__low_power_mode_4() _low_power_mode_4()"
	.byte	0x1
	.uleb128 0x130
	.string	"__low_power_mode_off_on_exit() _low_power_mode_off_on_exit()"
	.byte	0x1
	.uleb128 0x132
	.string	"_even_in_range(x,y) (x)"
	.byte	0x1
	.uleb128 0x133
	.string	"__even_in_range(x,y) _even_in_range(x,y)"
	.byte	0x1
	.uleb128 0x137
	.string	"__no_operation() _no_operation()"
	.byte	0x1
	.uleb128 0x139
	.string	"__get_interrupt_state() _get_interrupt_state()"
	.byte	0x1
	.uleb128 0x13a
	.string	"__set_interrupt_state(x) _set_interrupt_state(x)"
	.byte	0x1
	.uleb128 0x13b
	.string	"__enable_interrupt() _enable_interrupts()"
	.byte	0x1
	.uleb128 0x13c
	.string	"__disable_interrupt() _disable_interrupts()"
	.byte	0x1
	.uleb128 0x13e
	.string	"__bic_SR_register(x) _bic_SR_register(x)"
	.byte	0x1
	.uleb128 0x13f
	.string	"__bis_SR_register(x) _bis_SR_register(x)"
	.byte	0x1
	.uleb128 0x140
	.string	"__get_SR_register() _get_SR_register()"
	.byte	0x1
	.uleb128 0x142
	.string	"__swap_bytes(x) _swap_bytes(x)"
	.byte	0x1
	.uleb128 0x144
	.string	"__nop() _no_operation()"
	.byte	0x1
	.uleb128 0x146
	.string	"__eint() _enable_interrupts()"
	.byte	0x1
	.uleb128 0x147
	.string	"__dint() _disable_interrupts()"
	.byte	0x1
	.uleb128 0x149
	.string	"_NOP() _no_operation()"
	.byte	0x1
	.uleb128 0x14a
	.string	"_EINT() _enable_interrupts()"
	.byte	0x1
	.uleb128 0x14b
	.string	"_DINT() _disable_interrupts()"
	.byte	0x1
	.uleb128 0x14d
	.string	"_BIC_SR(x) _bic_SR_register(x)"
	.byte	0x1
	.uleb128 0x14e
	.string	"_BIC_SR_IRQ(x) _bic_SR_register_on_exit(x)"
	.byte	0x1
	.uleb128 0x14f
	.string	"_BIS_SR(x) _bis_SR_register(x)"
	.byte	0x1
	.uleb128 0x150
	.string	"_BIS_SR_IRQ(x) _bis_SR_register_on_exit(x)"
	.byte	0x1
	.uleb128 0x151
	.string	"_BIS_NMI_IE1(x) _bis_nmi_ie1(x)"
	.byte	0x1
	.uleb128 0x153
	.string	"_SWAP_BYTES(x) _swap_bytes(x)"
	.byte	0x1
	.uleb128 0x155
	.string	"__no_init __attribute__ ((section (\".noinit\")))"
	.byte	0x4
	.byte	0x1
	.uleb128 0x2b
	.string	"C (0x0001)"
	.byte	0x1
	.uleb128 0x2c
	.string	"Z (0x0002)"
	.byte	0x1
	.uleb128 0x2d
	.string	"N (0x0004)"
	.byte	0x1
	.uleb128 0x2e
	.string	"V (0x0100)"
	.byte	0x1
	.uleb128 0x2f
	.string	"GIE (0x0008)"
	.byte	0x1
	.uleb128 0x30
	.string	"CPUOFF (0x0010)"
	.byte	0x1
	.uleb128 0x31
	.string	"OSCOFF (0x0020)"
	.byte	0x1
	.uleb128 0x32
	.string	"SCG0 (0x0040)"
	.byte	0x1
	.uleb128 0x33
	.string	"SCG1 (0x0080)"
	.byte	0x1
	.uleb128 0x36
	.string	"LPM0_bits (CPUOFF)"
	.byte	0x1
	.uleb128 0x37
	.string	"LPM1_bits (SCG0+CPUOFF)"
	.byte	0x1
	.uleb128 0x38
	.string	"LPM2_bits (SCG1+CPUOFF)"
	.byte	0x1
	.uleb128 0x39
	.string	"LPM3_bits (SCG1+SCG0+CPUOFF)"
	.byte	0x1
	.uleb128 0x3a
	.string	"LPM4_bits (SCG1+SCG0+OSCOFF+CPUOFF)"
	.byte	0x1
	.uleb128 0x3c
	.string	"LPM0 _BIS_SR(LPM0_bits)"
	.byte	0x1
	.uleb128 0x3d
	.string	"LPM0_EXIT _BIC_SR_IRQ(LPM0_bits)"
	.byte	0x1
	.uleb128 0x3e
	.string	"LPM1 _BIS_SR(LPM1_bits)"
	.byte	0x1
	.uleb128 0x3f
	.string	"LPM1_EXIT _BIC_SR_IRQ(LPM1_bits)"
	.byte	0x1
	.uleb128 0x40
	.string	"LPM2 _BIS_SR(LPM2_bits)"
	.byte	0x1
	.uleb128 0x41
	.string	"LPM2_EXIT _BIC_SR_IRQ(LPM2_bits)"
	.byte	0x1
	.uleb128 0x42
	.string	"LPM3 _BIS_SR(LPM3_bits)"
	.byte	0x1
	.uleb128 0x43
	.string	"LPM3_EXIT _BIC_SR_IRQ(LPM3_bits)"
	.byte	0x1
	.uleb128 0x44
	.string	"LPM4 _BIS_SR(LPM4_bits)"
	.byte	0x1
	.uleb128 0x45
	.string	"LPM4_EXIT _BIC_SR_IRQ(LPM4_bits)"
	.byte	0x1
	.uleb128 0x4f
	.string	"IE1_set_wdtie() __asm__ __volatile__ (\"bis.b #0x01, &0x0000\")"
	.byte	0x1
	.uleb128 0x51
	.string	"IFG1 (*(volatile unsigned char *) 0x0002)"
	.byte	0x1
	.uleb128 0x53
	.string	"CPU_ID_LO (*(volatile unsigned int *) 0x0004)"
	.byte	0x1
	.uleb128 0x54
	.string	"CPU_ID_HI (*(volatile unsigned int *) 0x0006)"
	.byte	0x1
	.uleb128 0x55
	.string	"CPU_NR (*(volatile unsigned int *) 0x0008)"
	.byte	0x1
	.uleb128 0x5b
	.string	"LED_CTRL (*(volatile unsigned char *) 0x0090)"
	.byte	0x1
	.uleb128 0x5c
	.string	"KEY_SW_VAL (*(volatile unsigned char *) 0x0091)"
	.byte	0x1
	.uleb128 0x5d
	.string	"KEY_SW_IRQ_EN (*(volatile unsigned char *) 0x0092)"
	.byte	0x1
	.uleb128 0x5e
	.string	"KEY_SW_IRQ_EDGE (*(volatile unsigned char *) 0x0093)"
	.byte	0x1
	.uleb128 0x5f
	.string	"KEY_SW_IRQ_VAL (*(volatile unsigned char *) 0x0094)"
	.byte	0x1
	.uleb128 0x65
	.string	"DCOCTL (*(volatile unsigned char *) 0x0056)"
	.byte	0x1
	.uleb128 0x66
	.string	"BCSCTL1 (*(volatile unsigned char *) 0x0057)"
	.byte	0x1
	.uleb128 0x67
	.string	"BCSCTL2 (*(volatile unsigned char *) 0x0058)"
	.byte	0x1
	.uleb128 0x6f
	.string	"WDTCTL (*(volatile unsigned int *) 0x0120)"
	.byte	0x1
	.uleb128 0x72
	.string	"WDTIS0 (0x0001)"
	.byte	0x1
	.uleb128 0x73
	.string	"WDTIS1 (0x0002)"
	.byte	0x1
	.uleb128 0x74
	.string	"WDTSSEL (0x0004)"
	.byte	0x1
	.uleb128 0x75
	.string	"WDTCNTCL (0x0008)"
	.byte	0x1
	.uleb128 0x76
	.string	"WDTTMSEL (0x0010)"
	.byte	0x1
	.uleb128 0x77
	.string	"WDTNMI (0x0020)"
	.byte	0x1
	.uleb128 0x78
	.string	"WDTNMIES (0x0040)"
	.byte	0x1
	.uleb128 0x79
	.string	"WDTHOLD (0x0080)"
	.byte	0x1
	.uleb128 0x7a
	.string	"WDTPW (0x5A00)"
	.byte	0x1
	.uleb128 0x80
	.string	"OP1_MPY (*(volatile unsigned int *) 0x0130)"
	.byte	0x1
	.uleb128 0x81
	.string	"OP1_MPYS (*(volatile unsigned int *) 0x0132)"
	.byte	0x1
	.uleb128 0x82
	.string	"OP1_MAC (*(volatile unsigned int *) 0x0134)"
	.byte	0x1
	.uleb128 0x83
	.string	"OP1_MACS (*(volatile unsigned int *) 0x0136)"
	.byte	0x1
	.uleb128 0x84
	.string	"OP2 (*(volatile unsigned int *) 0x0138)"
	.byte	0x1
	.uleb128 0x86
	.string	"RESLO (*(volatile unsigned int *) 0x013A)"
	.byte	0x1
	.uleb128 0x87
	.string	"RESHI (*(volatile unsigned int *) 0x013C)"
	.byte	0x1
	.uleb128 0x88
	.string	"SUMEXT (*(volatile unsigned int *) 0x013E)"
	.byte	0x1
	.uleb128 0x8e
	.string	"interrupt(x) void __attribute__((interrupt (x)))"
	.byte	0x1
	.uleb128 0x8f
	.string	"wakeup __attribute__((wakeup))"
	.byte	0x1
	.uleb128 0x90
	.string	"eint() __eint()"
	.byte	0x1
	.uleb128 0x91
	.string	"dint() __dint()"
	.byte	0x1
	.uleb128 0x95
	.string	"RESET_VECTOR (\"reset\")"
	.byte	0x1
	.uleb128 0x96
	.string	"NMI_VECTOR (15)"
	.byte	0x1
	.uleb128 0x97
	.string	"UNUSED_13_VECTOR (14)"
	.byte	0x1
	.uleb128 0x98
	.string	"UNUSED_12_VECTOR (13)"
	.byte	0x1
	.uleb128 0x99
	.string	"UNUSED_11_VECTOR (12)"
	.byte	0x1
	.uleb128 0x9a
	.string	"WDT_VECTOR (11)"
	.byte	0x1
	.uleb128 0x9b
	.string	"TIMERA0_VECTOR (10)"
	.byte	0x1
	.uleb128 0x9c
	.string	"TIMERA1_VECTOR (9)"
	.byte	0x1
	.uleb128 0x9d
	.string	"UNUSED_07_VECTOR (8)"
	.byte	0x1
	.uleb128 0x9e
	.string	"UNUSED_06_VECTOR (7)"
	.byte	0x1
	.uleb128 0x9f
	.string	"UNUSED_05_VECTOR (6)"
	.byte	0x1
	.uleb128 0xa0
	.string	"UNUSED_04_VECTOR (5)"
	.byte	0x1
	.uleb128 0xa1
	.string	"UNUSED_03_VECTOR (4)"
	.byte	0x1
	.uleb128 0xa2
	.string	"PORT1_VECTOR (3)"
	.byte	0x1
	.uleb128 0xa3
	.string	"UNUSED_01_VECTOR (2)"
	.byte	0x1
	.uleb128 0xa4
	.string	"UNUSED_00_VECTOR (1)"
	.byte	0x4
	.file 4 "../qwark.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x9
	.string	"QWARK_H_ "
	.byte	0x1
	.uleb128 0xb
	.string	"QWARK_CTL (*(volatile unsigned int *) 0x02A0)"
	.byte	0x1
	.uleb128 0xc
	.string	"QWARK_VECTOR (5)"
	.byte	0x1
	.uleb128 0xd
	.string	"QWARK_CHECKPOINT() QWARK_CTL |= 0x0020"
	.byte	0x1
	.uleb128 0xf
	.string	"QWARK_EN 0x01"
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.ascii	"GNU C9"
	.string	"9 7.3.1 -mmcu=msp430 -mhwmult=16bit -msmall -mcode-region=none -mdata-region=none -mdevices-csv-loc=/opt/ti/ccsv8/ccs_base/msp430/include_gcc/devices.csv -mcpu=msp430 -g3 -g -gdwarf-3 -gstrict-dwarf -g3 -O2 -std=c99 -std=c99 -fstrict-aliasing -fstack-usage"
.LASF3:
	.string	"unsigned int"
.LASF1:
	.string	"../qwark.c"
.LASF4:
	.string	"INT_Qwark"
.LASF2:
	.string	"/home/hiram/eclipse-workspace/int_cuckoo/Debug"
	.ident	"GCC: (Mitto Systems Limited - msp430-gcc 7.3.1.24) 7.3.1"
