	.file	"qwark.c"
.text
.Ltext0:
	.section	.crt_0001_qwark,"ax",@progbits
	.balign 2
	.global	qwark_restore
	.type	qwark_restore, @function
qwark_restore:
.LFB0:
	.file 1 "qwark.c"
	.loc 1 21 0
; start of function
; attributes: naked 
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	.loc 1 28 0
 ; 28 "qwark.c" 1
	mov #0x0000, &0x02A0
 ; 0 "" 2
	.loc 1 30 0
 ; 30 "qwark.c" 1
	cmp.b #0x02, &0x6074
 ; 0 "" 2
	.loc 1 31 0
 ; 31 "qwark.c" 1
	jz __qwark_retry_1st_setup
 ; 0 "" 2
	.loc 1 33 0
 ; 33 "qwark.c" 1
	cmp.b #0x03, &0x6075
 ; 0 "" 2
	.loc 1 34 0
 ; 34 "qwark.c" 1
	jz __qwark_restore_2nd_setup
 ; 0 "" 2
	.loc 1 35 0
 ; 35 "qwark.c" 1
	cmp.b #0x03, &0x6074
 ; 0 "" 2
	.loc 1 36 0
 ; 36 "qwark.c" 1
	jnz __crt0_init_bss
 ; 0 "" 2
	.loc 1 38 0
 ; 38 "qwark.c" 1
	cmp.b #0x02, &0x6075
 ; 0 "" 2
	.loc 1 39 0
 ; 39 "qwark.c" 1
	jz  __qwark_retry_2nd_setup
 ; 0 "" 2
	.loc 1 41 0
 ; 41 "qwark.c" 1
	__qwark_restore_1st_setup:
 ; 0 "" 2
	.loc 1 43 0
 ; 43 "qwark.c" 1
	mov &0X6012,   r12 
 ; 0 "" 2
	.loc 1 44 0
 ; 44 "qwark.c" 1
	mov #0x6FFE,   r13 
 ; 0 "" 2
	.loc 1 45 0
 ; 45 "qwark.c" 1
	br  #__system_restore
 ; 0 "" 2
	.loc 1 47 0
 ; 47 "qwark.c" 1
	__qwark_restore_2nd_setup:
 ; 0 "" 2
	.loc 1 49 0
 ; 49 "qwark.c" 1
	mov &0X6042, r12   
 ; 0 "" 2
	.loc 1 50 0
 ; 50 "qwark.c" 1
	mov #0x6BFE, r13   
 ; 0 "" 2
	.loc 1 51 0
 ; 51 "qwark.c" 1
	br  #__system_restore
 ; 0 "" 2
	.loc 1 53 0
 ; 53 "qwark.c" 1
	__qwark_retry_1st_setup:
 ; 0 "" 2
	.loc 1 55 0
 ; 55 "qwark.c" 1
	mov  #0x6030,   r10 
 ; 0 "" 2
	.loc 1 56 0
 ; 56 "qwark.c" 1
	mov  &0X6012,   r12 
 ; 0 "" 2
	.loc 1 57 0
 ; 57 "qwark.c" 1
	mov  #0x6FFE,   r13 
 ; 0 "" 2
	.loc 1 58 0
 ; 58 "qwark.c" 1
	mov  &0x602E,   r15 
 ; 0 "" 2
	.loc 1 59 0
 ; 59 "qwark.c" 1
	br  #__second_stage_retry
 ; 0 "" 2
	.loc 1 61 0
 ; 61 "qwark.c" 1
	__qwark_retry_2nd_setup:
 ; 0 "" 2
	.loc 1 63 0
 ; 63 "qwark.c" 1
	mov #0x6060,   r10 
 ; 0 "" 2
	.loc 1 64 0
 ; 64 "qwark.c" 1
	mov &0X6042,   r12 
 ; 0 "" 2
	.loc 1 65 0
 ; 65 "qwark.c" 1
	mov #0x6BFE,   r13 
 ; 0 "" 2
	.loc 1 66 0
 ; 66 "qwark.c" 1
	mov &0x605E,   r15 
 ; 0 "" 2
	.loc 1 71 0
 ; 71 "qwark.c" 1
	__second_stage_retry:
 ; 0 "" 2
	.loc 1 73 0
 ; 73 "qwark.c" 1
	tst r15 
 ; 0 "" 2
	.loc 1 74 0
 ; 74 "qwark.c" 1
	jz  _stack_write_back_retry
 ; 0 "" 2
	.loc 1 76 0
 ; 76 "qwark.c" 1
	mov #0x6000,  r14
 ; 0 "" 2
	.loc 1 78 0
 ; 78 "qwark.c" 1
	_retry_second_phase_commit_strt:
 ; 0 "" 2
	.loc 1 80 0
 ; 80 "qwark.c" 1
	mov @r10+2,  r9 
 ; 0 "" 2
	.loc 1 82 0
 ; 82 "qwark.c" 1
	mov r9,  r11 
 ; 0 "" 2
	.loc 1 84 0
 ; 84 "qwark.c" 1
	and #0x8000,  r11 
 ; 0 "" 2
	.loc 1 85 0
 ; 85 "qwark.c" 1
	cmp #0x8000,  r11 
 ; 0 "" 2
	.loc 1 86 0
 ; 86 "qwark.c" 1
	jeq _retry_byte_copy 
 ; 0 "" 2
	.loc 1 88 0
 ; 88 "qwark.c" 1
	mov @r14+2, @r9 
 ; 0 "" 2
	.loc 1 90 0
 ; 90 "qwark.c" 1
	dec r15
 ; 0 "" 2
	.loc 1 91 0
 ; 91 "qwark.c" 1
	tst r15
 ; 0 "" 2
	.loc 1 93 0
 ; 93 "qwark.c" 1
	jnz  _retry_second_phase_commit_strt
 ; 0 "" 2
	.loc 1 94 0
 ; 94 "qwark.c" 1
	br #__retry_complete
 ; 0 "" 2
	.loc 1 96 0
 ; 96 "qwark.c" 1
	_retry_byte_copy: 
 ; 0 "" 2
	.loc 1 97 0
 ; 97 "qwark.c" 1
	and #0x7FFF,  r9  
 ; 0 "" 2
	.loc 1 98 0
 ; 98 "qwark.c" 1
	mov r9,      r11  
 ; 0 "" 2
	.loc 1 99 0
 ; 99 "qwark.c" 1
	and #0x01,    r11 
 ; 0 "" 2
	.loc 1 100 0
 ; 100 "qwark.c" 1
	bis  r11,     r14 
 ; 0 "" 2
	.loc 1 102 0
 ; 102 "qwark.c" 1
	mov.b @r14, @r9  
 ; 0 "" 2
	.loc 1 103 0
 ; 103 "qwark.c" 1
	and #0xFFFE, r14 
 ; 0 "" 2
	.loc 1 104 0
 ; 104 "qwark.c" 1
	incd r14 
 ; 0 "" 2
	.loc 1 106 0
 ; 106 "qwark.c" 1
	dec r15
 ; 0 "" 2
	.loc 1 107 0
 ; 107 "qwark.c" 1
	tst r15
 ; 0 "" 2
	.loc 1 108 0
 ; 108 "qwark.c" 1
	jnz  _retry_second_phase_commit_strt
 ; 0 "" 2
	.loc 1 110 0
 ; 110 "qwark.c" 1
	__retry_complete:
 ; 0 "" 2
	.loc 1 115 0
 ; 115 "qwark.c" 1
	_stack_write_back_retry:
 ; 0 "" 2
	.loc 1 117 0
 ; 117 "qwark.c" 1
	cmp #0x0000,  &0x6BFE
 ; 0 "" 2
	.loc 1 118 0
 ; 118 "qwark.c" 1
	jeq _second_phase_retry_finished
 ; 0 "" 2
	.loc 1 120 0
 ; 120 "qwark.c" 1
	mov &0x6BFE,  r13 
 ; 0 "" 2
	.loc 1 121 0
 ; 121 "qwark.c" 1
	mov &0x6BFC,  r12 
 ; 0 "" 2
	.loc 1 123 0
 ; 123 "qwark.c" 1
	mov r13,  r14 
 ; 0 "" 2
	.loc 1 124 0
 ; 124 "qwark.c" 1
	sub #0x1000,  r14 
 ; 0 "" 2
	.loc 1 125 0
 ; 125 "qwark.c" 1
	mov #0x6BFA,  r10 
 ; 0 "" 2
	.loc 1 127 0
 ; 127 "qwark.c" 1
	_second_phase_retry_stack_cpy:
 ; 0 "" 2
	.loc 1 128 0
 ; 128 "qwark.c" 1
	mov @r10,@r14
 ; 0 "" 2
	.loc 1 130 0
 ; 130 "qwark.c" 1
	cmp r13, r12
 ; 0 "" 2
	.loc 1 131 0
 ; 131 "qwark.c" 1
	jeq _second_phase_retry_finished
 ; 0 "" 2
	.loc 1 132 0
 ; 132 "qwark.c" 1
	decd r10
 ; 0 "" 2
	.loc 1 133 0
 ; 133 "qwark.c" 1
	decd r13
 ; 0 "" 2
	.loc 1 134 0
 ; 134 "qwark.c" 1
	decd r14
 ; 0 "" 2
	.loc 1 135 0
 ; 135 "qwark.c" 1
	br # _second_phase_retry_stack_cpy
 ; 0 "" 2
	.loc 1 141 0
 ; 141 "qwark.c" 1
	_second_phase_retry_finished:
 ; 0 "" 2
	.loc 1 143 0
 ; 143 "qwark.c" 1
	cmp.b #0x02, &0x6074
 ; 0 "" 2
	.loc 1 144 0
 ; 144 "qwark.c" 1
	jz __set_flag_complete
 ; 0 "" 2
	.loc 1 146 0
 ; 146 "qwark.c" 1
	mov #0x0301, &0x6074 
 ; 0 "" 2
	.loc 1 147 0
 ; 147 "qwark.c" 1
	br #__system_restore:
 ; 0 "" 2
	.loc 1 149 0
 ; 149 "qwark.c" 1
	__set_flag_complete:
 ; 0 "" 2
	.loc 1 150 0
 ; 150 "qwark.c" 1
	mov #0x0103, &0x6074 
 ; 0 "" 2
	.loc 1 156 0
 ; 156 "qwark.c" 1
	__system_restore:
 ; 0 "" 2
	.loc 1 159 0
 ; 159 "qwark.c" 1
	mov #288, r8
 ; 0 "" 2
	.loc 1 160 0
 ; 160 "qwark.c" 1
	mov #23168, 0(r8)
 ; 0 "" 2
	.loc 1 163 0
 ; 163 "qwark.c" 1
	mov.b #130, r8
 ; 0 "" 2
	.loc 1 164 0
 ; 164 "qwark.c" 1
	mov   #8, 0(r8)
 ; 0 "" 2
	.loc 1 166 0
 ; 166 "qwark.c" 1
	mov.b #128, r8
 ; 0 "" 2
	.loc 1 167 0
 ; 167 "qwark.c" 1
	mov.b   #1, 0(r8)
 ; 0 "" 2
	.loc 1 173 0
 ; 173 "qwark.c" 1
	mov  #370, r8
 ; 0 "" 2
	.loc 1 174 0
 ; 174 "qwark.c" 1
	mov  #4980, 0(r8)
 ; 0 "" 2
	.loc 1 176 0
 ; 176 "qwark.c" 1
	mov  #352, r8
 ; 0 "" 2
	.loc 1 177 0
 ; 177 "qwark.c" 1
	mov  #534, 0(r8)
 ; 0 "" 2
	.loc 1 185 0
 ; 185 "qwark.c" 1
	mov #0x7FFE, r14
 ; 0 "" 2
	.loc 1 187 0
 ; 187 "qwark.c" 1
	__erase_stack:
 ; 0 "" 2
	.loc 1 189 0
 ; 189 "qwark.c" 1
	cmp #0x7FA0,r14
 ; 0 "" 2
	.loc 1 190 0
 ; 190 "qwark.c" 1
	jz __deletion_stack_complete
 ; 0 "" 2
	.loc 1 192 0
 ; 192 "qwark.c" 1
	mov #0x00000,@r14
 ; 0 "" 2
	.loc 1 193 0
 ; 193 "qwark.c" 1
	decd r14
 ; 0 "" 2
	.loc 1 194 0
 ; 194 "qwark.c" 1
	br #__erase_stack
 ; 0 "" 2
	.loc 1 196 0
 ; 196 "qwark.c" 1
	__deletion_stack_complete:
 ; 0 "" 2
	.loc 1 204 0
 ; 204 "qwark.c" 1
	cmp.b #0x03,&0x6075
 ; 0 "" 2
	.loc 1 205 0
 ; 205 "qwark.c" 1
	jeq __Second_buffer_restore_stack
 ; 0 "" 2
	.loc 1 212 0
 ; 212 "qwark.c" 1
	__First_buffer_restore_stack:
 ; 0 "" 2
	.loc 1 214 0
 ; 214 "qwark.c" 1
	mov &0x6016,r4
 ; 0 "" 2
	.loc 1 215 0
 ; 215 "qwark.c" 1
	mov &0x6018,r5
 ; 0 "" 2
	.loc 1 216 0
 ; 216 "qwark.c" 1
	mov &0x601A,r6
 ; 0 "" 2
	.loc 1 217 0
 ; 217 "qwark.c" 1
	mov &0x601C,r7
 ; 0 "" 2
	.loc 1 218 0
 ; 218 "qwark.c" 1
	mov &0x601E,r8
 ; 0 "" 2
	.loc 1 219 0
 ; 219 "qwark.c" 1
	mov &0x6020,r9
 ; 0 "" 2
	.loc 1 220 0
 ; 220 "qwark.c" 1
	mov &0x6022,r10
 ; 0 "" 2
	.loc 1 221 0
 ; 221 "qwark.c" 1
	mov &0x6024,r11
 ; 0 "" 2
	.loc 1 222 0
 ; 222 "qwark.c" 1
	mov &0x6026,r12
 ; 0 "" 2
	.loc 1 223 0
 ; 223 "qwark.c" 1
	mov &0x6028,r13
 ; 0 "" 2
	.loc 1 224 0
 ; 224 "qwark.c" 1
	mov &0x602A,r14
 ; 0 "" 2
	.loc 1 225 0
 ; 225 "qwark.c" 1
	mov &0x602C,r15
 ; 0 "" 2
	.loc 1 226 0
 ; 226 "qwark.c" 1
	mov &0x6012,r1
 ; 0 "" 2
	.loc 1 227 0
 ; 227 "qwark.c" 1
	mov &0x6014,r2
 ; 0 "" 2
	.loc 1 228 0
 ; 228 "qwark.c" 1
	mov &0x6076,&0x02B2
 ; 0 "" 2
	.loc 1 229 0
 ; 229 "qwark.c" 1
	mov &0x6076,&0x02B4
 ; 0 "" 2
	.loc 1 230 0
 ; 230 "qwark.c" 1
	mov &0x6076,&0x02B6
 ; 0 "" 2
	.loc 1 234 0
 ; 234 "qwark.c" 1
	mov #0x0001 , &0x02A0
 ; 0 "" 2
	.loc 1 237 0
 ; 237 "qwark.c" 1
	mov &0x6010, pc
 ; 0 "" 2
	.loc 1 239 0
 ; 239 "qwark.c" 1
	__Second_buffer_restore_stack:
 ; 0 "" 2
	.loc 1 241 0
 ; 241 "qwark.c" 1
	mov &0x6046,r4
 ; 0 "" 2
	.loc 1 242 0
 ; 242 "qwark.c" 1
	mov &0x6048,r5
 ; 0 "" 2
	.loc 1 243 0
 ; 243 "qwark.c" 1
	mov &0x604A,r6
 ; 0 "" 2
	.loc 1 244 0
 ; 244 "qwark.c" 1
	mov &0x604C,r7
 ; 0 "" 2
	.loc 1 245 0
 ; 245 "qwark.c" 1
	mov &0x604E,r8
 ; 0 "" 2
	.loc 1 246 0
 ; 246 "qwark.c" 1
	mov &0x6050,r9
 ; 0 "" 2
	.loc 1 247 0
 ; 247 "qwark.c" 1
	mov &0x6052,r10
 ; 0 "" 2
	.loc 1 248 0
 ; 248 "qwark.c" 1
	mov &0x6054,r11
 ; 0 "" 2
	.loc 1 249 0
 ; 249 "qwark.c" 1
	mov &0x6056,r12
 ; 0 "" 2
	.loc 1 250 0
 ; 250 "qwark.c" 1
	mov &0x6058,r13
 ; 0 "" 2
	.loc 1 251 0
 ; 251 "qwark.c" 1
	mov &0x605A,r14
 ; 0 "" 2
	.loc 1 252 0
 ; 252 "qwark.c" 1
	mov &0x605C,r15
 ; 0 "" 2
	.loc 1 253 0
 ; 253 "qwark.c" 1
	mov &0x6042,r1
 ; 0 "" 2
	.loc 1 254 0
 ; 254 "qwark.c" 1
	mov &0x6044,r2
 ; 0 "" 2
	.loc 1 257 0
 ; 257 "qwark.c" 1
	mov &0x6078,&0x02B2
 ; 0 "" 2
	.loc 1 258 0
 ; 258 "qwark.c" 1
	mov &0x6078,&0x02B4
 ; 0 "" 2
	.loc 1 259 0
 ; 259 "qwark.c" 1
	mov &0x6078,&0x02B6
 ; 0 "" 2
	.loc 1 260 0
 ; 260 "qwark.c" 1
	mov #0x0001 , &0x02A0
 ; 0 "" 2
	.loc 1 263 0
 ; 263 "qwark.c" 1
	mov &0x6040, pc
 ; 0 "" 2
	.loc 1 265 0
	NOP
.LFE0:
	.size	qwark_restore, .-qwark_restore
.text
	.balign 2
	.global	INT_Qwark
	.section	__interrupt_vector_5,"ax",@progbits
	.word	INT_Qwark
	.text
	.type	INT_Qwark, @function
INT_Qwark:
.LFB1:
	.loc 1 272 0
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
	.loc 1 282 0
 ; 282 "qwark.c" 1
	mov r13, &0x6070
 ; 0 "" 2
	.loc 1 283 0
 ; 283 "qwark.c" 1
	mov r12, &0x6072
 ; 0 "" 2
	.loc 1 285 0
 ; 285 "qwark.c" 1
	cmp.b #0x01,&0x6075
 ; 0 "" 2
	.loc 1 286 0
 ; 286 "qwark.c" 1
	jz __second_buffer_init
 ; 0 "" 2
	.loc 1 288 0
 ; 288 "qwark.c" 1
	mov #0x6010, r12
 ; 0 "" 2
	.loc 1 289 0
 ; 289 "qwark.c" 1
	mov.b #0x01,&0x6074
 ; 0 "" 2
	.loc 1 290 0
 ; 290 "qwark.c" 1
	br #__first_phase_commit
 ; 0 "" 2
	.loc 1 292 0
 ; 292 "qwark.c" 1
	__second_buffer_init:
 ; 0 "" 2
	.loc 1 294 0
 ; 294 "qwark.c" 1
	mov #0x6040, r12
 ; 0 "" 2
	.loc 1 306 0
 ; 306 "qwark.c" 1
	__first_phase_commit:
 ; 0 "" 2
	.loc 1 308 0
 ; 308 "qwark.c" 1
	mov 2(r1),@r12
 ; 0 "" 2
	.loc 1 310 0
 ; 310 "qwark.c" 1
	cmp #0x0000,&0x02B8
 ; 0 "" 2
	.loc 1 311 0
 ; 311 "qwark.c" 1
	jeq __continue_first_phase_commit
 ; 0 "" 2
	.loc 1 312 0
 ; 312 "qwark.c" 1
	sub &0x02B8,@r12
 ; 0 "" 2
	.loc 1 314 0
 ; 314 "qwark.c" 1
	__continue_first_phase_commit:
 ; 0 "" 2
	.loc 1 316 0
 ; 316 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 318 0
 ; 318 "qwark.c" 1
	mov r1,@r12
 ; 0 "" 2
	.loc 1 319 0
 ; 319 "qwark.c" 1
	add #0x04,@r12
 ; 0 "" 2
	.loc 1 320 0
 ; 320 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 322 0
 ; 322 "qwark.c" 1
	mov 0(r1),@r12
 ; 0 "" 2
	.loc 1 323 0
 ; 323 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 325 0
 ; 325 "qwark.c" 1
	mov &0x02A0,r13
 ; 0 "" 2
	.loc 1 326 0
 ; 326 "qwark.c" 1
	and #0x3E,r13
 ; 0 "" 2
	.loc 1 327 0
 ; 327 "qwark.c" 1
	bis #0x40,r13
 ; 0 "" 2
	.loc 1 328 0
 ; 328 "qwark.c" 1
	mov r13,&0x02A0
 ; 0 "" 2
	.loc 1 329 0
 ; 329 "qwark.c" 1
	and #0xBF,r13
 ; 0 "" 2
	.loc 1 330 0
 ; 330 "qwark.c" 1
	mov r13,&0x02A0
 ; 0 "" 2
	.loc 1 332 0
 ; 332 "qwark.c" 1
	mov r4,@r12
 ; 0 "" 2
	.loc 1 333 0
 ; 333 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 335 0
 ; 335 "qwark.c" 1
	mov r5,@r12
 ; 0 "" 2
	.loc 1 336 0
 ; 336 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 338 0
 ; 338 "qwark.c" 1
	mov r6,@r12
 ; 0 "" 2
	.loc 1 339 0
 ; 339 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 341 0
 ; 341 "qwark.c" 1
	mov r7,@r12
 ; 0 "" 2
	.loc 1 342 0
 ; 342 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 344 0
 ; 344 "qwark.c" 1
	mov r8,@r12
 ; 0 "" 2
	.loc 1 345 0
 ; 345 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 347 0
 ; 347 "qwark.c" 1
	mov r9,@r12
 ; 0 "" 2
	.loc 1 348 0
 ; 348 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 350 0
 ; 350 "qwark.c" 1
	mov r10,@r12
 ; 0 "" 2
	.loc 1 351 0
 ; 351 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 353 0
 ; 353 "qwark.c" 1
	mov r11,@r12
 ; 0 "" 2
	.loc 1 354 0
 ; 354 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 356 0
 ; 356 "qwark.c" 1
	mov &0x6072,@r12
 ; 0 "" 2
	.loc 1 357 0
 ; 357 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 359 0
 ; 359 "qwark.c" 1
	mov &0x6070,@r12
 ; 0 "" 2
	.loc 1 360 0
 ; 360 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 362 0
 ; 362 "qwark.c" 1
	mov r14,@r12
 ; 0 "" 2
	.loc 1 363 0
 ; 363 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 365 0
 ; 365 "qwark.c" 1
	mov r15,@r12
 ; 0 "" 2
	.loc 1 366 0
 ; 366 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 374 0
 ; 374 "qwark.c" 1
	mov &0x02A0, r14
 ; 0 "" 2
	.loc 1 375 0
 ; 375 "qwark.c" 1
	RRA r14
 ; 0 "" 2
	.loc 1 376 0
 ; 376 "qwark.c" 1
	mov.b r14, @r12
 ; 0 "" 2
	.loc 1 377 0
 ; 377 "qwark.c" 1
	mov r14, r15 
 ; 0 "" 2
	.loc 1 378 0
 ; 378 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 388 0
 ; 388 "qwark.c" 1
	tst r14 
 ; 0 "" 2
	.loc 1 389 0
 ; 389 "qwark.c" 1
	jz  __seg_logic
 ; 0 "" 2
	.loc 1 391 0
 ; 391 "qwark.c" 1
	mov #0x02A2, r13
 ; 0 "" 2
	.loc 1 393 0
 ; 393 "qwark.c" 1
	_scratchpad_addr_cpy:
 ; 0 "" 2
	.loc 1 395 0
 ; 395 "qwark.c" 1
	mov @r13+2, @r12
 ; 0 "" 2
	.loc 1 396 0
 ; 396 "qwark.c" 1
	incd r12
 ; 0 "" 2
	.loc 1 397 0
 ; 397 "qwark.c" 1
	dec r14 
 ; 0 "" 2
	.loc 1 398 0
 ; 398 "qwark.c" 1
	tst r14 
 ; 0 "" 2
	.loc 1 399 0
 ; 399 "qwark.c" 1
	jnz  _scratchpad_addr_cpy
 ; 0 "" 2
	.loc 1 407 0
 ; 407 "qwark.c" 1
	__seg_logic:
 ; 0 "" 2
	.loc 1 412 0
 ; 412 "qwark.c" 1
	mov &0x02B2, r12 
 ; 0 "" 2
	.loc 1 413 0
 ; 413 "qwark.c" 1
	and #0x8000, r12 
 ; 0 "" 2
	.loc 1 414 0
 ; 414 "qwark.c" 1
	cmp #0x8000, r12 
 ; 0 "" 2
	.loc 1 417 0
 ; 417 "qwark.c" 1
	jeq __segmentation_isr
 ; 0 "" 2
	.loc 1 420 0
 ; 420 "qwark.c" 1
	mov &0X6042, r12
 ; 0 "" 2
	.loc 1 422 0
 ; 422 "qwark.c" 1
	cmp.b #0x01,&0x6075
 ; 0 "" 2
	.loc 1 423 0
 ; 423 "qwark.c" 1
	jz __commit_th
 ; 0 "" 2
	.loc 1 426 0
 ; 426 "qwark.c" 1
	mov &0X6012, r12
 ; 0 "" 2
	.loc 1 427 0
 ; 427 "qwark.c" 1
	cmp.b #0x01,&0x6074
 ; 0 "" 2
	.loc 1 428 0
 ; 428 "qwark.c" 1
	jz __commit_th
 ; 0 "" 2
	.loc 1 430 0
 ; 430 "qwark.c" 1
	__segmentation_isr:
 ; 0 "" 2
	.loc 1 431 0
 ; 431 "qwark.c" 1
	mov &0x02B2, r12 
 ; 0 "" 2
	.loc 1 432 0
 ; 432 "qwark.c" 1
	and #0x7FFF, r12 
 ; 0 "" 2
	.loc 1 438 0
 ; 438 "qwark.c" 1
	__commit_th:
 ; 0 "" 2
	.loc 1 439 0
 ; 439 "qwark.c" 1
	cmp.b #0x01,&0x6075
 ; 0 "" 2
	.loc 1 440 0
 ; 440 "qwark.c" 1
	jz  __commit_on_2nd 
 ; 0 "" 2
	.loc 1 441 0
 ; 441 "qwark.c" 1
	mov r12, &0x6076
 ; 0 "" 2
	.loc 1 443 0
 ; 443 "qwark.c" 1
	br #_chkpt_stack
 ; 0 "" 2
	.loc 1 445 0
 ; 445 "qwark.c" 1
	__commit_on_2nd: 
 ; 0 "" 2
	.loc 1 446 0
 ; 446 "qwark.c" 1
	mov r12, &0x6078 
 ; 0 "" 2
	.loc 1 452 0
 ; 452 "qwark.c" 1
	_chkpt_stack:
 ; 0 "" 2
	.loc 1 455 0
 ; 455 "qwark.c" 1
	mov #0x0000, &0x6BFE
 ; 0 "" 2
	.loc 1 456 0
 ; 456 "qwark.c" 1
	mov #0x0000, &0x6BFC
 ; 0 "" 2
	.loc 1 460 0
 ; 460 "qwark.c" 1
	__first_stack_chkpt_setup:
 ; 0 "" 2
	.loc 1 461 0
 ; 461 "qwark.c" 1
	cmp.b #0x00, &0x6075 
 ; 0 "" 2
	.loc 1 462 0
 ; 462 "qwark.c" 1
	jne __segmentation_logic
 ; 0 "" 2
	.loc 1 466 0
 ; 466 "qwark.c" 1
	mov #0x6FFE, r13
 ; 0 "" 2
	.loc 1 467 0
 ; 467 "qwark.c" 1
	mov #0x7FFE, r14
 ; 0 "" 2
	.loc 1 468 0
 ; 468 "qwark.c" 1
	br #__copy_stack
 ; 0 "" 2
	.loc 1 474 0
 ; 474 "qwark.c" 1
	__segmentation_logic:
 ; 0 "" 2
	.loc 1 476 0
 ; 476 "qwark.c" 1
	mov &0x02B4, r14
 ; 0 "" 2
	.loc 1 477 0
 ; 477 "qwark.c" 1
	mov &0x6076, r10
 ; 0 "" 2
	.loc 1 478 0
 ; 478 "qwark.c" 1
	cmp.b #0x01, &0x6075 
 ; 0 "" 2
	.loc 1 479 0
 ; 479 "qwark.c" 1
	jeq __sp_seg_define 
 ; 0 "" 2
	.loc 1 480 0
 ; 480 "qwark.c" 1
	mov &0x6078, r10
 ; 0 "" 2
	.loc 1 485 0
 ; 485 "qwark.c" 1
	__sp_seg_define:
 ; 0 "" 2
	.loc 1 488 0
 ; 488 "qwark.c" 1
	cmp r10, r14
 ; 0 "" 2
	.loc 1 489 0
 ; 489 "qwark.c" 1
	jne __sp_overlap
 ; 0 "" 2
	.loc 1 493 0
 ; 493 "qwark.c" 1
	cmp r10, r12
 ; 0 "" 2
	.loc 1 494 0
 ; 494 "qwark.c" 1
	jeq __stack_chkpt_end
 ; 0 "" 2
	.loc 1 495 0
 ; 495 "qwark.c" 1
	br #__sp_pre_copy
 ; 0 "" 2
	.loc 1 500 0
 ; 500 "qwark.c" 1
	__sp_overlap:
 ; 0 "" 2
	.loc 1 503 0
 ; 503 "qwark.c" 1
	cmp r14, r12
 ; 0 "" 2
	.loc 1 504 0
 ; 504 "qwark.c" 1
	jeq __stack_chkpt_end
 ; 0 "" 2
	.loc 1 506 0
 ; 506 "qwark.c" 1
	decd r14 
 ; 0 "" 2
	.loc 1 508 0
 ; 508 "qwark.c" 1
	mov #0x6BFE, r13
 ; 0 "" 2
	.loc 1 509 0
 ; 509 "qwark.c" 1
	mov r14, @r13 
 ; 0 "" 2
	.loc 1 510 0
 ; 510 "qwark.c" 1
	decd r13 
 ; 0 "" 2
	.loc 1 511 0
 ; 511 "qwark.c" 1
	mov r10, @r13
 ; 0 "" 2
	.loc 1 512 0
 ; 512 "qwark.c" 1
	decd r13 
 ; 0 "" 2
	.loc 1 514 0
 ; 514 "qwark.c" 1
	mov r12, r11 
 ; 0 "" 2
	.loc 1 515 0
 ; 515 "qwark.c" 1
	cmp r10, r12
 ; 0 "" 2
	.loc 1 516 0
 ; 516 "qwark.c" 1
	jge __overlap_copy
 ; 0 "" 2
	.loc 1 517 0
 ; 517 "qwark.c" 1
	mov r10, r11 
 ; 0 "" 2
	.loc 1 519 0
 ; 519 "qwark.c" 1
	__overlap_copy:
 ; 0 "" 2
	.loc 1 521 0
 ; 521 "qwark.c" 1
	mov @r14, @r13 
 ; 0 "" 2
	.loc 1 522 0
 ; 522 "qwark.c" 1
	cmp r14,r11
 ; 0 "" 2
	.loc 1 524 0
 ; 524 "qwark.c" 1
	jeq __sp_ovl_copy
 ; 0 "" 2
	.loc 1 525 0
 ; 525 "qwark.c" 1
	decd r13
 ; 0 "" 2
	.loc 1 526 0
 ; 526 "qwark.c" 1
	decd r14
 ; 0 "" 2
	.loc 1 527 0
 ; 527 "qwark.c" 1
	br #__overlap_copy
 ; 0 "" 2
	.loc 1 532 0
 ; 532 "qwark.c" 1
	__sp_ovl_copy:
 ; 0 "" 2
	.loc 1 534 0
 ; 534 "qwark.c" 1
	cmp r10,r12
 ; 0 "" 2
	.loc 1 535 0
 ; 535 "qwark.c" 1
	jge __stack_chkpt_end
 ; 0 "" 2
	.loc 1 537 0
 ; 537 "qwark.c" 1
	__sp_pre_copy:
 ; 0 "" 2
	.loc 1 539 0
 ; 539 "qwark.c" 1
	decd r14 
 ; 0 "" 2
	.loc 1 540 0
 ; 540 "qwark.c" 1
	mov r14, r13
 ; 0 "" 2
	.loc 1 541 0
 ; 541 "qwark.c" 1
	sub #0x1000, r13
 ; 0 "" 2
	.loc 1 546 0
 ; 546 "qwark.c" 1
	__copy_stack:
 ; 0 "" 2
	.loc 1 548 0
 ; 548 "qwark.c" 1
	mov @r14,@r13
 ; 0 "" 2
	.loc 1 550 0
 ; 550 "qwark.c" 1
	cmp r14,r12
 ; 0 "" 2
	.loc 1 551 0
 ; 551 "qwark.c" 1
	jz __stack_chkpt_end
 ; 0 "" 2
	.loc 1 553 0
 ; 553 "qwark.c" 1
	decd r13
 ; 0 "" 2
	.loc 1 554 0
 ; 554 "qwark.c" 1
	decd r14
 ; 0 "" 2
	.loc 1 555 0
 ; 555 "qwark.c" 1
	br #__copy_stack
 ; 0 "" 2
	.loc 1 557 0
 ; 557 "qwark.c" 1
	__stack_chkpt_end:
 ; 0 "" 2
	.loc 1 565 0
 ; 565 "qwark.c" 1
	cmp.b #0x01,&0x6075
 ; 0 "" 2
	.loc 1 566 0
 ; 566 "qwark.c" 1
	jz  __set_flag_2nd 
 ; 0 "" 2
	.loc 1 568 0
 ; 568 "qwark.c" 1
	add.b #0x01, &0x6074 
 ; 0 "" 2
	.loc 1 569 0
 ; 569 "qwark.c" 1
	br  #_WAR_commit 
 ; 0 "" 2
	.loc 1 571 0
 ; 571 "qwark.c" 1
	__set_flag_2nd:
 ; 0 "" 2
	.loc 1 572 0
 ; 572 "qwark.c" 1
	add.b #0x01, &0x6075 
 ; 0 "" 2
	.loc 1 585 0
 ; 585 "qwark.c" 1
	_WAR_commit:
 ; 0 "" 2
	.loc 1 588 0
 ; 588 "qwark.c" 1
	tst r15 
 ; 0 "" 2
	.loc 1 589 0
 ; 589 "qwark.c" 1
	jz  _stack_write_back
 ; 0 "" 2
	.loc 1 591 0
 ; 591 "qwark.c" 1
	mov #0x6000,  r14 
 ; 0 "" 2
	.loc 1 593 0
 ; 593 "qwark.c" 1
	mov #0x6060,  r12 
 ; 0 "" 2
	.loc 1 594 0
 ; 594 "qwark.c" 1
	cmp.b #0x02,&0x6075
 ; 0 "" 2
	.loc 1 595 0
 ; 595 "qwark.c" 1
	jz _second_phase_commit_strt
 ; 0 "" 2
	.loc 1 597 0
 ; 597 "qwark.c" 1
	mov #0x6030,  r12 
 ; 0 "" 2
	.loc 1 599 0
 ; 599 "qwark.c" 1
	_second_phase_commit_strt:
 ; 0 "" 2
	.loc 1 601 0
 ; 601 "qwark.c" 1
	mov @r12+2,  r13 
 ; 0 "" 2
	.loc 1 603 0
 ; 603 "qwark.c" 1
	mov r13,  r11 
 ; 0 "" 2
	.loc 1 605 0
 ; 605 "qwark.c" 1
	and #0x8000,  r11 
 ; 0 "" 2
	.loc 1 606 0
 ; 606 "qwark.c" 1
	cmp #0x8000,  r11 
 ; 0 "" 2
	.loc 1 607 0
 ; 607 "qwark.c" 1
	jeq _byte_copy 
 ; 0 "" 2
	.loc 1 609 0
 ; 609 "qwark.c" 1
	mov @r14, @r13 
 ; 0 "" 2
	.loc 1 611 0
 ; 611 "qwark.c" 1
	_pre_end_copy:
 ; 0 "" 2
	.loc 1 612 0
 ; 612 "qwark.c" 1
	incd r14
 ; 0 "" 2
	.loc 1 613 0
 ; 613 "qwark.c" 1
	dec r15
 ; 0 "" 2
	.loc 1 614 0
 ; 614 "qwark.c" 1
	tst r15
 ; 0 "" 2
	.loc 1 616 0
 ; 616 "qwark.c" 1
	jnz  _second_phase_commit_strt
 ; 0 "" 2
	.loc 1 617 0
 ; 617 "qwark.c" 1
	br #_stack_write_back
 ; 0 "" 2
	.loc 1 619 0
 ; 619 "qwark.c" 1
	_byte_copy:
 ; 0 "" 2
	.loc 1 620 0
 ; 620 "qwark.c" 1
	and #0x7FFF,  r13 
 ; 0 "" 2
	.loc 1 621 0
 ; 621 "qwark.c" 1
	mov r13,      r11 
 ; 0 "" 2
	.loc 1 622 0
 ; 622 "qwark.c" 1
	and #0x01,    r11 
 ; 0 "" 2
	.loc 1 623 0
 ; 623 "qwark.c" 1
	bis  r11,     r14 
 ; 0 "" 2
	.loc 1 626 0
 ; 626 "qwark.c" 1
	mov.b @r14, @r13 
 ; 0 "" 2
	.loc 1 628 0
 ; 628 "qwark.c" 1
	and #0xFFFE, r14
 ; 0 "" 2
	.loc 1 629 0
 ; 629 "qwark.c" 1
	incd r14
 ; 0 "" 2
	.loc 1 630 0
 ; 630 "qwark.c" 1
	dec r15
 ; 0 "" 2
	.loc 1 631 0
 ; 631 "qwark.c" 1
	tst r15
 ; 0 "" 2
	.loc 1 632 0
 ; 632 "qwark.c" 1
	jnz  _second_phase_commit_strt
 ; 0 "" 2
	.loc 1 637 0
 ; 637 "qwark.c" 1
	_stack_write_back:
 ; 0 "" 2
	.loc 1 640 0
 ; 640 "qwark.c" 1
	cmp #0x0000,  &0x6BFE
 ; 0 "" 2
	.loc 1 641 0
 ; 641 "qwark.c" 1
	jeq _chkpt_finished
 ; 0 "" 2
	.loc 1 645 0
 ; 645 "qwark.c" 1
	mov &0x6BFE,  r13 
 ; 0 "" 2
	.loc 1 646 0
 ; 646 "qwark.c" 1
	mov &0x6BFC,  r12 
 ; 0 "" 2
	.loc 1 648 0
 ; 648 "qwark.c" 1
	mov r13,  r14 
 ; 0 "" 2
	.loc 1 649 0
 ; 649 "qwark.c" 1
	sub #0x1000,  r14 
 ; 0 "" 2
	.loc 1 650 0
 ; 650 "qwark.c" 1
	mov #0x6BFA,  r10 
 ; 0 "" 2
	.loc 1 652 0
 ; 652 "qwark.c" 1
	_second_phase_stack_cpy:
 ; 0 "" 2
	.loc 1 653 0
 ; 653 "qwark.c" 1
	mov @r10,@r14
 ; 0 "" 2
	.loc 1 655 0
 ; 655 "qwark.c" 1
	cmp r13, r12
 ; 0 "" 2
	.loc 1 656 0
 ; 656 "qwark.c" 1
	jeq _chkpt_finished
 ; 0 "" 2
	.loc 1 657 0
 ; 657 "qwark.c" 1
	decd r10
 ; 0 "" 2
	.loc 1 658 0
 ; 658 "qwark.c" 1
	decd r13
 ; 0 "" 2
	.loc 1 659 0
 ; 659 "qwark.c" 1
	decd r14
 ; 0 "" 2
	.loc 1 660 0
 ; 660 "qwark.c" 1
	br # _second_phase_stack_cpy
 ; 0 "" 2
	.loc 1 666 0
 ; 666 "qwark.c" 1
	_chkpt_finished:
 ; 0 "" 2
	.loc 1 669 0
 ; 669 "qwark.c" 1
	cmp.b #0x02,&0x6075
 ; 0 "" 2
	.loc 1 670 0
 ; 670 "qwark.c" 1
	jeq  __pre_finish_2nd_buffer 
 ; 0 "" 2
	.loc 1 672 0
 ; 672 "qwark.c" 1
	mov #0x0103, &0x6074 
 ; 0 "" 2
	.loc 1 678 0
 ; 678 "qwark.c" 1
	mov &0x6022,r10
 ; 0 "" 2
	.loc 1 679 0
 ; 679 "qwark.c" 1
	mov &0x6024,r11
 ; 0 "" 2
	.loc 1 680 0
 ; 680 "qwark.c" 1
	mov &0x6026,r12
 ; 0 "" 2
	.loc 1 681 0
 ; 681 "qwark.c" 1
	mov &0x6028,r13
 ; 0 "" 2
	.loc 1 682 0
 ; 682 "qwark.c" 1
	mov &0x602A,r14
 ; 0 "" 2
	.loc 1 683 0
 ; 683 "qwark.c" 1
	mov &0x602C,r15
 ; 0 "" 2
	.loc 1 684 0
 ; 684 "qwark.c" 1
	mov &0x6076,&0x02B2
 ; 0 "" 2
	.loc 1 685 0
 ; 685 "qwark.c" 1
	mov &0x6076,&0x02B4
 ; 0 "" 2
	.loc 1 686 0
 ; 686 "qwark.c" 1
	mov &0x6076,&0x02B6
 ; 0 "" 2
	.loc 1 687 0
 ; 687 "qwark.c" 1
	br #_finish
 ; 0 "" 2
	.loc 1 692 0
 ; 692 "qwark.c" 1
	__pre_finish_2nd_buffer:
 ; 0 "" 2
	.loc 1 694 0
 ; 694 "qwark.c" 1
	mov #0x0301, &0x6074 
 ; 0 "" 2
	.loc 1 696 0
 ; 696 "qwark.c" 1
	mov &0x6052,r10
 ; 0 "" 2
	.loc 1 697 0
 ; 697 "qwark.c" 1
	mov &0x6054,r11
 ; 0 "" 2
	.loc 1 698 0
 ; 698 "qwark.c" 1
	mov &0x6056,r12
 ; 0 "" 2
	.loc 1 699 0
 ; 699 "qwark.c" 1
	mov &0x6058,r13
 ; 0 "" 2
	.loc 1 700 0
 ; 700 "qwark.c" 1
	mov &0x605A,r14
 ; 0 "" 2
	.loc 1 701 0
 ; 701 "qwark.c" 1
	mov &0x605C,r15
 ; 0 "" 2
	.loc 1 702 0
 ; 702 "qwark.c" 1
	mov &0x6078,&0x02B2
 ; 0 "" 2
	.loc 1 703 0
 ; 703 "qwark.c" 1
	mov &0x6078,&0x02B4
 ; 0 "" 2
	.loc 1 704 0
 ; 704 "qwark.c" 1
	mov &0x6078,&0x02B6
 ; 0 "" 2
	.loc 1 705 0
 ; 705 "qwark.c" 1
	_finish:
 ; 0 "" 2
	.loc 1 708 0
 ; 708 "qwark.c" 1
	mov #0x0000, &0x6000
 ; 0 "" 2
	.loc 1 709 0
 ; 709 "qwark.c" 1
	mov #0x0000, &0x6002
 ; 0 "" 2
	.loc 1 710 0
 ; 710 "qwark.c" 1
	mov #0x0000, &0x6004
 ; 0 "" 2
	.loc 1 711 0
 ; 711 "qwark.c" 1
	mov #0x0000, &0x6006
 ; 0 "" 2
	.loc 1 712 0
 ; 712 "qwark.c" 1
	mov #0x0000, &0x6008
 ; 0 "" 2
	.loc 1 713 0
 ; 713 "qwark.c" 1
	mov #0x0000, &0x600A
 ; 0 "" 2
	.loc 1 714 0
 ; 714 "qwark.c" 1
	mov #0x0000, &0x600C
 ; 0 "" 2
	.loc 1 715 0
 ; 715 "qwark.c" 1
	mov #0x0000, &0x600E
 ; 0 "" 2
	.loc 1 717 0
 ; 717 "qwark.c" 1
	mov #0x0000, &0x02A2
 ; 0 "" 2
	.loc 1 718 0
 ; 718 "qwark.c" 1
	mov #0x0000, &0x02A4
 ; 0 "" 2
	.loc 1 719 0
 ; 719 "qwark.c" 1
	mov #0x0000, &0x02A6
 ; 0 "" 2
	.loc 1 720 0
 ; 720 "qwark.c" 1
	mov #0x0000, &0x02A8
 ; 0 "" 2
	.loc 1 721 0
 ; 721 "qwark.c" 1
	mov #0x0000, &0x02AA
 ; 0 "" 2
	.loc 1 722 0
 ; 722 "qwark.c" 1
	mov #0x0000, &0x02AC
 ; 0 "" 2
	.loc 1 723 0
 ; 723 "qwark.c" 1
	mov #0x0000, &0x02AE
 ; 0 "" 2
	.loc 1 724 0
 ; 724 "qwark.c" 1
	mov #0x0000, &0x02B0
 ; 0 "" 2
	.loc 1 728 0
 ; 728 "qwark.c" 1
	mov #0x0001, &0x02A0
 ; 0 "" 2
	.loc 1 729 0
	NOP
	; start of epilogue
	RETI
.LFE1:
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
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.balign 4
.LEFDE2:
.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x54
	.2byte	0x3
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF2
	.byte	0xc
	.4byte	.LASF3
	.4byte	.LASF4
	.4byte	.Ldebug_ranges0+0
	.4byte	0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macinfo0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x1
	.4byte	.LASF0
	.byte	0x1
	.2byte	0x110
	.byte	0x1
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x9c
	.uleb128 0x4
	.byte	0x1
	.4byte	.LASF1
	.byte	0x1
	.byte	0x14
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
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
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
	.uleb128 0x5
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
	.uleb128 0x4
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
	.4byte	0x24
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	0
	.4byte	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.LFB0
	.4byte	.LFE0
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
	.string	"__FINITE_MATH_ONLY__ 0"
	.byte	0x1
	.uleb128 0xf
	.string	"__SIZEOF_INT__ 2"
	.byte	0x1
	.uleb128 0x10
	.string	"__SIZEOF_LONG__ 4"
	.byte	0x1
	.uleb128 0x11
	.string	"__SIZEOF_LONG_LONG__ 8"
	.byte	0x1
	.uleb128 0x12
	.string	"__SIZEOF_SHORT__ 2"
	.byte	0x1
	.uleb128 0x13
	.string	"__SIZEOF_FLOAT__ 4"
	.byte	0x1
	.uleb128 0x14
	.string	"__SIZEOF_DOUBLE__ 8"
	.byte	0x1
	.uleb128 0x15
	.string	"__SIZEOF_LONG_DOUBLE__ 8"
	.byte	0x1
	.uleb128 0x16
	.string	"__SIZEOF_SIZE_T__ 2"
	.byte	0x1
	.uleb128 0x17
	.string	"__CHAR_BIT__ 8"
	.byte	0x1
	.uleb128 0x18
	.string	"__BIGGEST_ALIGNMENT__ 2"
	.byte	0x1
	.uleb128 0x19
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
	.byte	0x1
	.uleb128 0x1a
	.string	"__ORDER_BIG_ENDIAN__ 4321"
	.byte	0x1
	.uleb128 0x1b
	.string	"__ORDER_PDP_ENDIAN__ 3412"
	.byte	0x1
	.uleb128 0x1c
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
	.byte	0x1
	.uleb128 0x1d
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
	.byte	0x1
	.uleb128 0x1e
	.string	"__SIZEOF_POINTER__ 2"
	.byte	0x1
	.uleb128 0x1f
	.string	"__SIZE_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x20
	.string	"__PTRDIFF_TYPE__ int"
	.byte	0x1
	.uleb128 0x21
	.string	"__WCHAR_TYPE__ long int"
	.byte	0x1
	.uleb128 0x22
	.string	"__WINT_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x23
	.string	"__INTMAX_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x24
	.string	"__UINTMAX_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x25
	.string	"__CHAR16_TYPE__ short unsigned int"
	.byte	0x1
	.uleb128 0x26
	.string	"__CHAR32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x27
	.string	"__SIG_ATOMIC_TYPE__ int"
	.byte	0x1
	.uleb128 0x28
	.string	"__INT8_TYPE__ signed char"
	.byte	0x1
	.uleb128 0x29
	.string	"__INT16_TYPE__ short int"
	.byte	0x1
	.uleb128 0x2a
	.string	"__INT32_TYPE__ long int"
	.byte	0x1
	.uleb128 0x2b
	.string	"__INT64_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x2c
	.string	"__UINT8_TYPE__ unsigned char"
	.byte	0x1
	.uleb128 0x2d
	.string	"__UINT16_TYPE__ short unsigned int"
	.byte	0x1
	.uleb128 0x2e
	.string	"__UINT32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x2f
	.string	"__UINT64_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x30
	.string	"__INT_LEAST8_TYPE__ signed char"
	.byte	0x1
	.uleb128 0x31
	.string	"__INT_LEAST16_TYPE__ short int"
	.byte	0x1
	.uleb128 0x32
	.string	"__INT_LEAST32_TYPE__ long int"
	.byte	0x1
	.uleb128 0x33
	.string	"__INT_LEAST64_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x34
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
	.byte	0x1
	.uleb128 0x35
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
	.byte	0x1
	.uleb128 0x36
	.string	"__UINT_LEAST32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x37
	.string	"__UINT_LEAST64_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x38
	.string	"__INT_FAST8_TYPE__ int"
	.byte	0x1
	.uleb128 0x39
	.string	"__INT_FAST16_TYPE__ int"
	.byte	0x1
	.uleb128 0x3a
	.string	"__INT_FAST32_TYPE__ long int"
	.byte	0x1
	.uleb128 0x3b
	.string	"__INT_FAST64_TYPE__ long long int"
	.byte	0x1
	.uleb128 0x3c
	.string	"__UINT_FAST8_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x3d
	.string	"__UINT_FAST16_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x3e
	.string	"__UINT_FAST32_TYPE__ long unsigned int"
	.byte	0x1
	.uleb128 0x3f
	.string	"__UINT_FAST64_TYPE__ long long unsigned int"
	.byte	0x1
	.uleb128 0x40
	.string	"__INTPTR_TYPE__ int"
	.byte	0x1
	.uleb128 0x41
	.string	"__UINTPTR_TYPE__ unsigned int"
	.byte	0x1
	.uleb128 0x42
	.string	"__has_include(STR) __has_include__(STR)"
	.byte	0x1
	.uleb128 0x43
	.string	"__has_include_next(STR) __has_include_next__(STR)"
	.byte	0x1
	.uleb128 0x44
	.string	"__GXX_ABI_VERSION 1011"
	.byte	0x1
	.uleb128 0x45
	.string	"__SCHAR_MAX__ 0x7f"
	.byte	0x1
	.uleb128 0x46
	.string	"__SHRT_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x47
	.string	"__INT_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x48
	.string	"__LONG_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x49
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x4a
	.string	"__WCHAR_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x4b
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x4c
	.string	"__WINT_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x4d
	.string	"__WINT_MIN__ 0U"
	.byte	0x1
	.uleb128 0x4e
	.string	"__PTRDIFF_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x4f
	.string	"__SIZE_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x50
	.string	"__SCHAR_WIDTH__ 8"
	.byte	0x1
	.uleb128 0x51
	.string	"__SHRT_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x52
	.string	"__INT_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x53
	.string	"__LONG_WIDTH__ 32"
	.byte	0x1
	.uleb128 0x54
	.string	"__LONG_LONG_WIDTH__ 64"
	.byte	0x1
	.uleb128 0x55
	.string	"__WCHAR_WIDTH__ 32"
	.byte	0x1
	.uleb128 0x56
	.string	"__WINT_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x57
	.string	"__PTRDIFF_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x58
	.string	"__SIZE_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x59
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x5a
	.string	"__INTMAX_C(c) c ## LL"
	.byte	0x1
	.uleb128 0x5b
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffULL"
	.byte	0x1
	.uleb128 0x5c
	.string	"__UINTMAX_C(c) c ## ULL"
	.byte	0x1
	.uleb128 0x5d
	.string	"__INTMAX_WIDTH__ 64"
	.byte	0x1
	.uleb128 0x5e
	.string	"__SIG_ATOMIC_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x5f
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x60
	.string	"__SIG_ATOMIC_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x61
	.string	"__INT8_MAX__ 0x7f"
	.byte	0x1
	.uleb128 0x62
	.string	"__INT16_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x63
	.string	"__INT32_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x64
	.string	"__INT64_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x65
	.string	"__UINT8_MAX__ 0xff"
	.byte	0x1
	.uleb128 0x66
	.string	"__UINT16_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x67
	.string	"__UINT32_MAX__ 0xffffffffUL"
	.byte	0x1
	.uleb128 0x68
	.string	"__UINT64_MAX__ 0xffffffffffffffffULL"
	.byte	0x1
	.uleb128 0x69
	.string	"__INT_LEAST8_MAX__ 0x7f"
	.byte	0x1
	.uleb128 0x6a
	.string	"__INT8_C(c) c"
	.byte	0x1
	.uleb128 0x6b
	.string	"__INT_LEAST8_WIDTH__ 8"
	.byte	0x1
	.uleb128 0x6c
	.string	"__INT_LEAST16_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x6d
	.string	"__INT16_C(c) c"
	.byte	0x1
	.uleb128 0x6e
	.string	"__INT_LEAST16_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x6f
	.string	"__INT_LEAST32_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x70
	.string	"__INT32_C(c) c ## L"
	.byte	0x1
	.uleb128 0x71
	.string	"__INT_LEAST32_WIDTH__ 32"
	.byte	0x1
	.uleb128 0x72
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x73
	.string	"__INT64_C(c) c ## LL"
	.byte	0x1
	.uleb128 0x74
	.string	"__INT_LEAST64_WIDTH__ 64"
	.byte	0x1
	.uleb128 0x75
	.string	"__UINT_LEAST8_MAX__ 0xff"
	.byte	0x1
	.uleb128 0x76
	.string	"__UINT8_C(c) c"
	.byte	0x1
	.uleb128 0x77
	.string	"__UINT_LEAST16_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x78
	.string	"__UINT16_C(c) c ## U"
	.byte	0x1
	.uleb128 0x79
	.string	"__UINT_LEAST32_MAX__ 0xffffffffUL"
	.byte	0x1
	.uleb128 0x7a
	.string	"__UINT32_C(c) c ## UL"
	.byte	0x1
	.uleb128 0x7b
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL"
	.byte	0x1
	.uleb128 0x7c
	.string	"__UINT64_C(c) c ## ULL"
	.byte	0x1
	.uleb128 0x7d
	.string	"__INT_FAST8_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x7e
	.string	"__INT_FAST8_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x7f
	.string	"__INT_FAST16_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x80
	.string	"__INT_FAST16_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x81
	.string	"__INT_FAST32_MAX__ 0x7fffffffL"
	.byte	0x1
	.uleb128 0x82
	.string	"__INT_FAST32_WIDTH__ 32"
	.byte	0x1
	.uleb128 0x83
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL"
	.byte	0x1
	.uleb128 0x84
	.string	"__INT_FAST64_WIDTH__ 64"
	.byte	0x1
	.uleb128 0x85
	.string	"__UINT_FAST8_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x86
	.string	"__UINT_FAST16_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x87
	.string	"__UINT_FAST32_MAX__ 0xffffffffUL"
	.byte	0x1
	.uleb128 0x88
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL"
	.byte	0x1
	.uleb128 0x89
	.string	"__INTPTR_MAX__ 0x7fff"
	.byte	0x1
	.uleb128 0x8a
	.string	"__INTPTR_WIDTH__ 16"
	.byte	0x1
	.uleb128 0x8b
	.string	"__UINTPTR_MAX__ 0xffffU"
	.byte	0x1
	.uleb128 0x8c
	.string	"__GCC_IEC_559 0"
	.byte	0x1
	.uleb128 0x8d
	.string	"__GCC_IEC_559_COMPLEX 0"
	.byte	0x1
	.uleb128 0x8e
	.string	"__FLT_EVAL_METHOD__ 0"
	.byte	0x1
	.uleb128 0x8f
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 0"
	.byte	0x1
	.uleb128 0x90
	.string	"__DEC_EVAL_METHOD__ 2"
	.byte	0x1
	.uleb128 0x91
	.string	"__FLT_RADIX__ 2"
	.byte	0x1
	.uleb128 0x92
	.string	"__FLT_MANT_DIG__ 24"
	.byte	0x1
	.uleb128 0x93
	.string	"__FLT_DIG__ 6"
	.byte	0x1
	.uleb128 0x94
	.string	"__FLT_MIN_EXP__ (-125)"
	.byte	0x1
	.uleb128 0x95
	.string	"__FLT_MIN_10_EXP__ (-37)"
	.byte	0x1
	.uleb128 0x96
	.string	"__FLT_MAX_EXP__ 128"
	.byte	0x1
	.uleb128 0x97
	.string	"__FLT_MAX_10_EXP__ 38"
	.byte	0x1
	.uleb128 0x98
	.string	"__FLT_DECIMAL_DIG__ 9"
	.byte	0x1
	.uleb128 0x99
	.string	"__FLT_MAX__ 3.4028234663852886e+38F"
	.byte	0x1
	.uleb128 0x9a
	.string	"__FLT_MIN__ 1.1754943508222875e-38F"
	.byte	0x1
	.uleb128 0x9b
	.string	"__FLT_EPSILON__ 1.1920928955078125e-7F"
	.byte	0x1
	.uleb128 0x9c
	.string	"__FLT_DENORM_MIN__ 1.4012984643248171e-45F"
	.byte	0x1
	.uleb128 0x9d
	.string	"__FLT_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0x9e
	.string	"__FLT_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0x9f
	.string	"__FLT_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xa0
	.string	"__DBL_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0xa1
	.string	"__DBL_DIG__ 15"
	.byte	0x1
	.uleb128 0xa2
	.string	"__DBL_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0xa3
	.string	"__DBL_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0xa4
	.string	"__DBL_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0xa5
	.string	"__DBL_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0xa6
	.string	"__DBL_DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xa7
	.string	"__DBL_MAX__ ((double)1.7976931348623157e+308L)"
	.byte	0x1
	.uleb128 0xa8
	.string	"__DBL_MIN__ ((double)2.2250738585072014e-308L)"
	.byte	0x1
	.uleb128 0xa9
	.string	"__DBL_EPSILON__ ((double)2.2204460492503131e-16L)"
	.byte	0x1
	.uleb128 0xaa
	.string	"__DBL_DENORM_MIN__ ((double)4.9406564584124654e-324L)"
	.byte	0x1
	.uleb128 0xab
	.string	"__DBL_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xac
	.string	"__DBL_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xad
	.string	"__DBL_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xae
	.string	"__LDBL_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0xaf
	.string	"__LDBL_DIG__ 15"
	.byte	0x1
	.uleb128 0xb0
	.string	"__LDBL_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0xb1
	.string	"__LDBL_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0xb2
	.string	"__LDBL_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0xb3
	.string	"__LDBL_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0xb4
	.string	"__DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xb5
	.string	"__LDBL_DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xb6
	.string	"__LDBL_MAX__ 1.7976931348623157e+308L"
	.byte	0x1
	.uleb128 0xb7
	.string	"__LDBL_MIN__ 2.2250738585072014e-308L"
	.byte	0x1
	.uleb128 0xb8
	.string	"__LDBL_EPSILON__ 2.2204460492503131e-16L"
	.byte	0x1
	.uleb128 0xb9
	.string	"__LDBL_DENORM_MIN__ 4.9406564584124654e-324L"
	.byte	0x1
	.uleb128 0xba
	.string	"__LDBL_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xbb
	.string	"__LDBL_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xbc
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xbd
	.string	"__FLT32_MANT_DIG__ 24"
	.byte	0x1
	.uleb128 0xbe
	.string	"__FLT32_DIG__ 6"
	.byte	0x1
	.uleb128 0xbf
	.string	"__FLT32_MIN_EXP__ (-125)"
	.byte	0x1
	.uleb128 0xc0
	.string	"__FLT32_MIN_10_EXP__ (-37)"
	.byte	0x1
	.uleb128 0xc1
	.string	"__FLT32_MAX_EXP__ 128"
	.byte	0x1
	.uleb128 0xc2
	.string	"__FLT32_MAX_10_EXP__ 38"
	.byte	0x1
	.uleb128 0xc3
	.string	"__FLT32_DECIMAL_DIG__ 9"
	.byte	0x1
	.uleb128 0xc4
	.string	"__FLT32_MAX__ 3.4028234663852886e+38F32"
	.byte	0x1
	.uleb128 0xc5
	.string	"__FLT32_MIN__ 1.1754943508222875e-38F32"
	.byte	0x1
	.uleb128 0xc6
	.string	"__FLT32_EPSILON__ 1.1920928955078125e-7F32"
	.byte	0x1
	.uleb128 0xc7
	.string	"__FLT32_DENORM_MIN__ 1.4012984643248171e-45F32"
	.byte	0x1
	.uleb128 0xc8
	.string	"__FLT32_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xc9
	.string	"__FLT32_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xca
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xcb
	.string	"__FLT64_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0xcc
	.string	"__FLT64_DIG__ 15"
	.byte	0x1
	.uleb128 0xcd
	.string	"__FLT64_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0xce
	.string	"__FLT64_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0xcf
	.string	"__FLT64_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0xd0
	.string	"__FLT64_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0xd1
	.string	"__FLT64_DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xd2
	.string	"__FLT64_MAX__ 1.7976931348623157e+308F64"
	.byte	0x1
	.uleb128 0xd3
	.string	"__FLT64_MIN__ 2.2250738585072014e-308F64"
	.byte	0x1
	.uleb128 0xd4
	.string	"__FLT64_EPSILON__ 2.2204460492503131e-16F64"
	.byte	0x1
	.uleb128 0xd5
	.string	"__FLT64_DENORM_MIN__ 4.9406564584124654e-324F64"
	.byte	0x1
	.uleb128 0xd6
	.string	"__FLT64_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xd7
	.string	"__FLT64_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xd8
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xd9
	.string	"__FLT32X_MANT_DIG__ 53"
	.byte	0x1
	.uleb128 0xda
	.string	"__FLT32X_DIG__ 15"
	.byte	0x1
	.uleb128 0xdb
	.string	"__FLT32X_MIN_EXP__ (-1021)"
	.byte	0x1
	.uleb128 0xdc
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
	.byte	0x1
	.uleb128 0xdd
	.string	"__FLT32X_MAX_EXP__ 1024"
	.byte	0x1
	.uleb128 0xde
	.string	"__FLT32X_MAX_10_EXP__ 308"
	.byte	0x1
	.uleb128 0xdf
	.string	"__FLT32X_DECIMAL_DIG__ 17"
	.byte	0x1
	.uleb128 0xe0
	.string	"__FLT32X_MAX__ 1.7976931348623157e+308F32x"
	.byte	0x1
	.uleb128 0xe1
	.string	"__FLT32X_MIN__ 2.2250738585072014e-308F32x"
	.byte	0x1
	.uleb128 0xe2
	.string	"__FLT32X_EPSILON__ 2.2204460492503131e-16F32x"
	.byte	0x1
	.uleb128 0xe3
	.string	"__FLT32X_DENORM_MIN__ 4.9406564584124654e-324F32x"
	.byte	0x1
	.uleb128 0xe4
	.string	"__FLT32X_HAS_DENORM__ 1"
	.byte	0x1
	.uleb128 0xe5
	.string	"__FLT32X_HAS_INFINITY__ 1"
	.byte	0x1
	.uleb128 0xe6
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
	.byte	0x1
	.uleb128 0xe7
	.string	"__DEC32_MANT_DIG__ 7"
	.byte	0x1
	.uleb128 0xe8
	.string	"__DEC32_MIN_EXP__ (-94)"
	.byte	0x1
	.uleb128 0xe9
	.string	"__DEC32_MAX_EXP__ 97"
	.byte	0x1
	.uleb128 0xea
	.string	"__DEC32_MIN__ 1E-95DF"
	.byte	0x1
	.uleb128 0xeb
	.string	"__DEC32_MAX__ 9.999999E96DF"
	.byte	0x1
	.uleb128 0xec
	.string	"__DEC32_EPSILON__ 1E-6DF"
	.byte	0x1
	.uleb128 0xed
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
	.byte	0x1
	.uleb128 0xee
	.string	"__DEC64_MANT_DIG__ 16"
	.byte	0x1
	.uleb128 0xef
	.string	"__DEC64_MIN_EXP__ (-382)"
	.byte	0x1
	.uleb128 0xf0
	.string	"__DEC64_MAX_EXP__ 385"
	.byte	0x1
	.uleb128 0xf1
	.string	"__DEC64_MIN__ 1E-383DD"
	.byte	0x1
	.uleb128 0xf2
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
	.byte	0x1
	.uleb128 0xf3
	.string	"__DEC64_EPSILON__ 1E-15DD"
	.byte	0x1
	.uleb128 0xf4
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
	.byte	0x1
	.uleb128 0xf5
	.string	"__DEC128_MANT_DIG__ 34"
	.byte	0x1
	.uleb128 0xf6
	.string	"__DEC128_MIN_EXP__ (-6142)"
	.byte	0x1
	.uleb128 0xf7
	.string	"__DEC128_MAX_EXP__ 6145"
	.byte	0x1
	.uleb128 0xf8
	.string	"__DEC128_MIN__ 1E-6143DL"
	.byte	0x1
	.uleb128 0xf9
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
	.byte	0x1
	.uleb128 0xfa
	.string	"__DEC128_EPSILON__ 1E-33DL"
	.byte	0x1
	.uleb128 0xfb
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
	.byte	0x1
	.uleb128 0xfc
	.string	"__REGISTER_PREFIX__ "
	.byte	0x1
	.uleb128 0xfd
	.string	"__USER_LABEL_PREFIX__ "
	.byte	0x1
	.uleb128 0xfe
	.string	"__GNUC_STDC_INLINE__ 1"
	.byte	0x1
	.uleb128 0xff
	.string	"__NO_INLINE__ 1"
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
	.file 2 "../../libs/omsp_system.h"
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
	.file 4 "qwark.h"
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
	.byte	0x1
	.uleb128 0xb
	.string	"asm __asm__ __volatile__"
	.byte	0x1
	.uleb128 0xc
	.string	"INTERMITTENCY_HANDLING_ENABLED "
	.byte	0x1
	.uleb128 0xd
	.string	"TIMER_TEST "
	.byte	0x4
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF0:
	.string	"INT_Qwark"
.LASF5:
	.string	"unsigned int"
.LASF2:
	.string	"GNU C99 7.3.1 -mcpu=msp430 -mhwmult=16bit -msmall -mcode-region=none -mdata-region=none -mdevices-csv-loc=/opt/ti/ccsv8/ccs_base/msp430/include_gcc/devices.csv -g3 -g -gdwarf-3 -gstrict-dwarf -O0 -std=c99 -std=c99 -fstrict-aliasing -fstack-usage"
.LASF4:
	.string	"/home/hiram/master/Qwark_stack/altera_de0_nano/software/apps/leds"
.LASF1:
	.string	"qwark_restore"
.LASF3:
	.string	"qwark.c"
	.ident	"GCC: (Mitto Systems Limited - msp430-gcc 7.3.1.24) 7.3.1"
