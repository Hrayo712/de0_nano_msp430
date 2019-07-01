	.file	"main.c"
.text
.Ltext0:
	.global	__mulsi2
	.balign 2
	.global	sqrt16
	.type	sqrt16, @function
sqrt16:
.LFB1:
	.file 1 "main.c"
	.loc 1 30 0
; start of function
; framesize_regs:     12
; framesize_locals:   30
; framesize_outgoing: 0
; framesize:          42
; elim ap -> fp       14
; elim fp -> sp       30
; saved regs: R5 R6 R7 R8 R9 R10
	; start of prologue
	PUSH	R10
.LCFI0:
	PUSH	R9
.LCFI1:
	PUSH	R8
.LCFI2:
	PUSH	R7
.LCFI3:
	PUSH	R6
.LCFI4:
	PUSH	R5
.LCFI5:
	SUB.W	#30, R1
.LCFI6:
	; end of prologue
	MOV.W	R12, 16(R1)
	MOV.W	R13, 18(R1)
	.loc 1 31 0
	MOV.W	#-1, 28(R1)
	.loc 1 32 0
	MOV.W	#0, 26(R1)
	.loc 1 33 0
	MOV.W	28(R1), R12
	MOV.W	R12, R5
	MOV.B	#0, R6
	MOV.W	26(R1), R12
	MOV.W	R12, R14
	MOV.B	#0, R15
	MOV.W	R5, R12
	ADD	R14, R12 ; cy
	MOV.W	R12, 12(R1)
	MOV.W	R6, R12
	ADDC	R15, R12
	MOV.W	R12, 14(R1)
	MOV.W	12(R1), R12
	MOV.W	14(R1), R13
	CLRC { RRC.W	R13 { RRC.W	R12
	MOV.W	R12, 24(R1)
	.loc 1 34 0
	MOV.W	#0, 20(R1)
	MOV.W	#0, 22(R1)
	.loc 1 36 0
	BR	#.L2
.L7:
	.loc 1 37 0
	MOV.W	28(R1), R12
	MOV.W	R12, R9
	MOV.B	#0, R10
	MOV.W	26(R1), R12
	MOV.W	R12, R7
	MOV.B	#0, R8
	MOV.W	R9, R12
	ADD	R7, R12 ; cy
	MOV.W	R12, 8(R1)
	MOV.W	R10, R12
	ADDC	R8, R12
	MOV.W	R12, 10(R1)
	MOV.W	8(R1), R12
	MOV.W	10(R1), R13
	CLRC { RRC.W	R13 { RRC.W	R12
	MOV.W	R12, 24(R1)
	.loc 1 38 0
	MOV.W	24(R1), R12
	MOV.W	R12, 4(R1)
	MOV.W	#0, 6(R1)
	MOV.W	24(R1), R12
	MOV.W	R12, @R1
	MOV.W	#0, 2(R1)
	MOV.W	@R1, R14
	MOV.W	2(R1), R15
	MOV.W	4(R1), R12
	MOV.W	6(R1), R13
	CALL	#__mulsi2
.LVL0:
	MOV.W	R12, 20(R1)
	MOV.W	R13, 22(R1)
	.loc 1 39 0
	CMP.W	18(R1), 22(R1) { JLO	.L9
	CMP.W	22(R1), 18(R1) { JNE	.L3
	CMP.W	16(R1), 20(R1) { JHS	.L3
.L9:
	.loc 1 40 0
	MOV.W	24(R1), 26(R1)
	BR	#.L2
.L3:
	.loc 1 42 0
	MOV.W	24(R1), 28(R1)
.L2:
	.loc 1 36 0
	CMP.W	16(R1), 20(R1) { JNE	.L10
	CMP.W	18(R1), 22(R1) { JEQ	.L5
.L10:
	.loc 1 36 0 is_stmt 0
	MOV.W	28(R1), R13
	SUB.W	26(R1), R13
	MOV.B	#1, R12
	CMP.W	R13, R12 { JLO	.L7
.L5:
	.loc 1 45 0 is_stmt 1
	MOV.W	24(R1), R12
	.loc 1 46 0
	; start of epilogue
	ADD.W	#30, R1
	BR	#__mspabi_func_epilog_6
.LFE1:
	.size	sqrt16, .-sqrt16
	.global	count
.data
	.balign 2
	.type	count, @object
	.size	count, 2
count:
	.short	1
	.comm	model,128,2
	.global	__mspabi_remu
	.global	__mulhi2
.text
	.balign 2
	.global	ACCEL_singleSample
	.type	ACCEL_singleSample, @function
ACCEL_singleSample:
.LFB2:
	.loc 1 131 0
; start of function
; framesize_regs:     0
; framesize_locals:   4
; framesize_outgoing: 0
; framesize:          4
; elim ap -> fp       2
; elim fp -> sp       4
; saved regs:(none)
	; start of prologue
	SUB.W	#4, R1
.LCFI7:
	; end of prologue
	MOV.W	R12, @R1
	.loc 1 136 0
	MOV.W	&_v_seed.2309, 2(R1)
	.loc 1 138 0
	MOV.W	2(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R12, R12
	ADD.W	R12, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	MOV.B	#85, R13
	CALL	#__mspabi_remu
.LVL1:
	MOV.B	R12, R13
	MOV.W	@R1, R12
	MOV.B	R13, @R12
	.loc 1 139 0
	MOV.W	#289, R13
	MOV.W	2(R1), R12
	CALL	#__mulhi2
.LVL2:
	MOV.B	#85, R13
	CALL	#__mspabi_remu
.LVL3:
	MOV.B	R12, R13
	MOV.W	@R1, R12
	MOV.B	R13, 1(R12)
	.loc 1 140 0
	MOV.W	#4913, R13
	MOV.W	2(R1), R12
	CALL	#__mulhi2
.LVL4:
	MOV.B	#85, R13
	CALL	#__mspabi_remu
.LVL5:
	MOV.B	R12, R13
	MOV.W	@R1, R12
	MOV.B	R13, 2(R12)
	.loc 1 141 0
	ADD.W	#1, 2(R1)
	MOV.W	2(R1), &_v_seed.2309
	.loc 1 142 0
	NOP
	; start of epilogue
	ADD.W	#4, R1
	RET
.LFE2:
	.size	ACCEL_singleSample, .-ACCEL_singleSample
	.balign 2
	.global	acquire_window
	.type	acquire_window, @function
acquire_window:
.LFB3:
	.loc 1 148 0
; start of function
; framesize_regs:     0
; framesize_locals:   8
; framesize_outgoing: 0
; framesize:          8
; elim ap -> fp       2
; elim fp -> sp       8
; saved regs:(none)
	; start of prologue
	SUB.W	#8, R1
.LCFI8:
	; end of prologue
	MOV.W	R12, @R1
	.loc 1 150 0
	MOV.W	#0, 6(R1)
	.loc 1 154 0
	BR	#.L13
.L14:
	.loc 1 155 0
	MOV.W	R1, R12
	ADD.W	#3, R12
	CALL	#ACCEL_singleSample
	.loc 1 158 0
	MOV.W	6(R1), R13
	MOV.W	R13, R12
	ADD.W	#1, R12
	MOV.W	R12, 6(R1)
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	3(R1), @R12
	MOV.B	4(R1), 1(R12)
	MOV.B	5(R1), 2(R12)
.L13:
	.loc 1 154 0
	MOV.B	#2, R12
	CMP.W	6(R1), R12 { JHS	.L14
	.loc 1 160 0
	NOP
	; start of epilogue
	ADD.W	#8, R1
	RET
.LFE3:
	.size	acquire_window, .-acquire_window
	.balign 2
	.global	transform
	.type	transform, @function
transform:
.LFB4:
	.loc 1 163 0
; start of function
; framesize_regs:     0
; framesize_locals:   6
; framesize_outgoing: 0
; framesize:          6
; elim ap -> fp       2
; elim fp -> sp       6
; saved regs:(none)
	; start of prologue
	SUB.W	#6, R1
.LCFI9:
	; end of prologue
	MOV.W	R12, @R1
	.loc 1 164 0
	MOV.W	#0, 4(R1)
	.loc 1 168 0
	MOV.W	#0, 4(R1)
	BR	#.L16
.L25:
.LBB2:
	.loc 1 169 0
	MOV.W	4(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	MOV.W	@R1, R13
	ADD.W	R12, R13
	MOV.W	R13, 2(R1)
	.loc 1 171 0
	MOV.W	2(R1), R12
	MOV.B	@R12, R12
	MOV.B	#9, R13
	CMP.B	R12, R13 { JHS	.L17
	.loc 1 172 0
	MOV.W	2(R1), R12
	MOV.B	1(R12), R12
	.loc 1 171 0
	MOV.B	#9, R13
	CMP.B	R12, R13 { JHS	.L17
	.loc 1 173 0
	MOV.W	2(R1), R12
	MOV.B	2(R12), R12
	.loc 1 172 0
	MOV.B	#9, R13
	CMP.B	R12, R13 { JLO	.L18
.L17:
	.loc 1 178 0
	MOV.W	2(R1), R12
	MOV.B	@R12, R12
	MOV.B	#10, R13
	CMP.B	R12, R13 { JHS	.L19
	.loc 1 178 0 is_stmt 0
	MOV.W	2(R1), R12
	MOV.B	@R12, R12
	BR	#.L20
.L19:
	.loc 1 178 0
	MOV.B	#0, R12
.L20:
	.loc 1 178 0
	MOV.W	2(R1), R13
	MOV.B	R12, @R13
	.loc 1 179 0 is_stmt 1
	MOV.W	2(R1), R12
	MOV.B	1(R12), R12
	MOV.B	#10, R13
	CMP.B	R12, R13 { JHS	.L21
	.loc 1 179 0 is_stmt 0
	MOV.W	2(R1), R12
	MOV.B	1(R12), R12
	BR	#.L22
.L21:
	.loc 1 179 0
	MOV.B	#0, R12
.L22:
	.loc 1 179 0
	MOV.W	2(R1), R13
	MOV.B	R12, 1(R13)
	.loc 1 180 0 is_stmt 1
	MOV.W	2(R1), R12
	MOV.B	2(R12), R12
	MOV.B	#10, R13
	CMP.B	R12, R13 { JHS	.L23
	.loc 1 180 0 is_stmt 0
	MOV.W	2(R1), R12
	MOV.B	2(R12), R12
	BR	#.L24
.L23:
	.loc 1 180 0
	MOV.B	#0, R12
.L24:
	.loc 1 180 0
	MOV.W	2(R1), R13
	MOV.B	R12, 2(R13)
.L18:
.LBE2:
	.loc 1 168 0 is_stmt 1
	ADD.W	#1, 4(R1)
.L16:
	.loc 1 168 0 is_stmt 0
	MOV.B	#2, R12
	CMP.W	4(R1), R12 { JHS	.L25
	.loc 1 183 0 is_stmt 1
	NOP
	; start of epilogue
	ADD.W	#6, R1
	RET
.LFE4:
	.size	transform, .-transform
	.balign 2
	.global	featurize
	.type	featurize, @function
featurize:
.LFB5:
	.loc 1 186 0
; start of function
; framesize_regs:     10
; framesize_locals:   16
; framesize_outgoing: 0
; framesize:          26
; elim ap -> fp       12
; elim fp -> sp       16
; saved regs: R6 R7 R8 R9 R10
	; start of prologue
	PUSH	R10
.LCFI10:
	PUSH	R9
.LCFI11:
	PUSH	R8
.LCFI12:
	PUSH	R7
.LCFI13:
	PUSH	R6
.LCFI14:
	SUB.W	#16, R1
.LCFI15:
	; end of prologue
	MOV.W	R12, 2(R1)
	MOV.W	R13, @R1
	.loc 1 192 0
	MOV.B	#0, 9(R1)
	MOV.B	9(R1), R12
	MOV.B	R12, 8(R1)
	MOV.B	8(R1), R12
	MOV.B	R12, 7(R1)
	.loc 1 193 0
	MOV.B	#0, 6(R1)
	MOV.B	6(R1), R12
	MOV.B	R12, 5(R1)
	MOV.B	5(R1), R12
	MOV.B	R12, 4(R1)
	.loc 1 195 0
	MOV.W	#0, 14(R1)
	BR	#.L27
.L28:
	.loc 1 196 0
	MOV.B	7(R1), R14
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	@R12, R12
	ADD.B	R14, R12
	AND	#0xff, R12
	MOV.B	R12, 7(R1)
	.loc 1 197 0
	MOV.B	8(R1), R14
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	1(R12), R12
	ADD.B	R14, R12
	AND	#0xff, R12
	MOV.B	R12, 8(R1)
	.loc 1 198 0
	MOV.B	9(R1), R14
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	2(R12), R12
	ADD.B	R14, R12
	AND	#0xff, R12
	MOV.B	R12, 9(R1)
	.loc 1 195 0
	ADD.W	#1, 14(R1)
.L27:
	.loc 1 195 0 is_stmt 0
	MOV.B	#2, R12
	CMP.W	14(R1), R12 { JGE	.L28
	.loc 1 205 0 is_stmt 1
	MOV.B	7(R1), R12
	CALL	#__mspabi_srli_2
.LVL6:
	AND	#0xff, R12
	MOV.B	R12, 7(R1)
	.loc 1 206 0
	MOV.B	8(R1), R12
	CALL	#__mspabi_srli_2
.LVL7:
	AND	#0xff, R12
	MOV.B	R12, 8(R1)
	.loc 1 207 0
	MOV.B	9(R1), R12
	CALL	#__mspabi_srli_2
.LVL8:
	AND	#0xff, R12
	MOV.B	R12, 9(R1)
	.loc 1 209 0
	MOV.W	#0, 14(R1)
	BR	#.L29
.L36:
	.loc 1 210 0
	MOV.B	4(R1), R14
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	@R12, R12
	MOV.B	7(R1), R13
	CMP.B	R12, R13 { JHS	.L30
	.loc 1 210 0 is_stmt 0
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	@R12, R13
	MOV.B	7(R1), R12
	SUB.B	R12, R13
	MOV.B	R13, R12
	BR	#.L31
.L30:
	.loc 1 211 0 is_stmt 1
	MOV.B	7(R1), R15
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	@R12, R12
	.loc 1 210 0
	MOV.B	R15, R13 { SUB.B	R12, R13
	MOV.B	R13, R12
.L31:
	.loc 1 210 0 is_stmt 0
	ADD.B	R14, R12
	AND	#0xff, R12
	MOV.B	R12, 4(R1)
	.loc 1 212 0 is_stmt 1
	MOV.B	5(R1), R14
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	1(R12), R12
	MOV.B	8(R1), R13
	CMP.B	R12, R13 { JHS	.L32
	.loc 1 212 0 is_stmt 0
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	1(R12), R13
	MOV.B	8(R1), R12
	SUB.B	R12, R13
	MOV.B	R13, R12
	BR	#.L33
.L32:
	.loc 1 213 0 is_stmt 1
	MOV.B	8(R1), R15
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	1(R12), R12
	.loc 1 212 0
	MOV.B	R15, R13 { SUB.B	R12, R13
	MOV.B	R13, R12
.L33:
	.loc 1 212 0 is_stmt 0
	ADD.B	R14, R12
	AND	#0xff, R12
	MOV.B	R12, 5(R1)
	.loc 1 214 0 is_stmt 1
	MOV.B	6(R1), R14
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	2(R12), R12
	MOV.B	9(R1), R13
	CMP.B	R12, R13 { JHS	.L34
	.loc 1 214 0 is_stmt 0
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	2(R12), R13
	MOV.B	9(R1), R12
	SUB.B	R12, R13
	MOV.B	R13, R12
	BR	#.L35
.L34:
	.loc 1 215 0 is_stmt 1
	MOV.B	9(R1), R15
	MOV.W	14(R1), R13
	MOV.W	R13, R12
	ADD.W	R12, R12
	ADD.W	R13, R12
	ADD.W	@R1, R12
	MOV.B	2(R12), R12
	.loc 1 214 0
	MOV.B	R15, R13 { SUB.B	R12, R13
	MOV.B	R13, R12
.L35:
	.loc 1 214 0 is_stmt 0
	ADD.B	R14, R12
	AND	#0xff, R12
	MOV.B	R12, 6(R1)
	.loc 1 209 0 is_stmt 1
	ADD.W	#1, 14(R1)
.L29:
	.loc 1 209 0 is_stmt 0
	MOV.B	#2, R12
	CMP.W	14(R1), R12 { JGE	.L36
	.loc 1 222 0 is_stmt 1
	MOV.B	4(R1), R12
	CALL	#__mspabi_srli_2
.LVL9:
	AND	#0xff, R12
	MOV.B	R12, 4(R1)
	.loc 1 223 0
	MOV.B	5(R1), R12
	CALL	#__mspabi_srli_2
.LVL10:
	AND	#0xff, R12
	MOV.B	R12, 5(R1)
	.loc 1 224 0
	MOV.B	6(R1), R12
	CALL	#__mspabi_srli_2
.LVL11:
	AND	#0xff, R12
	MOV.B	R12, 6(R1)
	.loc 1 226 0
	MOV.B	7(R1), R12
	MOV.B	7(R1), R13
	CALL	#__mulhi2
.LVL12:
	MOV.W	R12, R6
	MOV.B	8(R1), R12
	MOV.B	8(R1), R13
	CALL	#__mulhi2
.LVL13:
	ADD.W	R12, R6
	MOV.B	9(R1), R12
	MOV.B	9(R1), R13
	CALL	#__mulhi2
.LVL14:
	ADD.W	R6, R12
	MOV.W	R12, 12(R1)
	.loc 1 227 0
	MOV.B	4(R1), R12
	MOV.B	4(R1), R13
	CALL	#__mulhi2
.LVL15:
	MOV.W	R12, R6
	MOV.B	5(R1), R12
	MOV.B	5(R1), R13
	CALL	#__mulhi2
.LVL16:
	ADD.W	R12, R6
	MOV.B	6(R1), R12
	MOV.B	6(R1), R13
	CALL	#__mulhi2
.LVL17:
	ADD.W	R6, R12
	MOV.W	R12, 10(R1)
	.loc 1 229 0
	MOV.W	12(R1), R12
	MOV.W	R12, R7
	MOV.B	#0, R8
	MOV.W	R7, R12
	MOV.W	R8, R13
	CALL	#sqrt16
	MOV.W	R12, R13
	MOV.W	2(R1), R12
	MOV.W	R13, @R12
	.loc 1 230 0
	MOV.W	10(R1), R12
	MOV.W	R12, R9
	MOV.B	#0, R10
	MOV.W	R9, R12
	MOV.W	R10, R13
	CALL	#sqrt16
	MOV.W	R12, R13
	MOV.W	2(R1), R12
	MOV.W	R13, 2(R12)
	.loc 1 233 0
	NOP
	; start of epilogue
	ADD.W	#16, R1
	BR	#__mspabi_func_epilog_5
.LFE5:
	.size	featurize, .-featurize
	.balign 2
	.global	classify
	.type	classify, @function
classify:
.LFB6:
	.loc 1 236 0
; start of function
; framesize_regs:     0
; framesize_locals:   30
; framesize_outgoing: 0
; framesize:          30
; elim ap -> fp       2
; elim fp -> sp       30
; saved regs:(none)
	; start of prologue
	SUB.W	#30, R1
.LCFI16:
	; end of prologue
	MOV.W	R12, 2(R1)
	MOV.W	R13, @R1
	.loc 1 237 0
	MOV.W	#0, 28(R1)
	.loc 1 238 0
	MOV.W	#0, 26(R1)
	.loc 1 244 0
	MOV.W	#0, 24(R1)
	BR	#.L38
.L53:
.LBB3:
	.loc 1 245 0
	MOV.W	24(R1), R12
	ADD.W	R12, R12
	ADD.W	R12, R12
	MOV.W	@R1, R13
	ADD.W	R12, R13
	MOV.W	R13, 20(R1)
	.loc 1 247 0
	MOV.W	20(R1), R12
	MOV.W	@R12, R13
	MOV.W	2(R1), R12
	MOV.W	@R12, R12
	.loc 1 249 0
	CMP.W	R13, R12 { JHS	.L39
	.loc 1 248 0
	MOV.W	20(R1), R12
	MOV.W	@R12, R14
	MOV.W	2(R1), R12
	MOV.W	@R12, R13
	.loc 1 249 0
	MOV.W	R14, R12 { SUB.W	R13, R12
	BR	#.L40
.L39:
	.loc 1 249 0 is_stmt 0
	MOV.W	2(R1), R12
	MOV.W	@R12, R14
	MOV.W	20(R1), R12
	MOV.W	@R12, R13
	MOV.W	R14, R12 { SUB.W	R13, R12
.L40:
	.loc 1 247 0 is_stmt 1
	MOV.W	R12, 16(R1)
	MOV.W	#0, 18(R1)
	.loc 1 251 0
	MOV.W	20(R1), R12
	MOV.W	2(R12), R13
	MOV.W	2(R1), R12
	MOV.W	2(R12), R12
	.loc 1 253 0
	CMP.W	R13, R12 { JHS	.L41
	.loc 1 252 0
	MOV.W	20(R1), R12
	MOV.W	2(R12), R14
	MOV.W	2(R1), R12
	MOV.W	2(R12), R13
	.loc 1 253 0
	MOV.W	R14, R12 { SUB.W	R13, R12
	BR	#.L42
.L41:
	.loc 1 253 0 is_stmt 0
	MOV.W	2(R1), R12
	MOV.W	2(R12), R14
	MOV.W	20(R1), R12
	MOV.W	2(R12), R13
	MOV.W	R14, R12 { SUB.W	R13, R12
.L42:
	.loc 1 251 0 is_stmt 1
	MOV.W	R12, 12(R1)
	MOV.W	#0, 14(R1)
	.loc 1 255 0
	MOV.W	24(R1), R12
	ADD.W	#16, R12
	ADD.W	R12, R12
	ADD.W	R12, R12
	MOV.W	@R1, R13
	ADD.W	R12, R13
	MOV.W	R13, 20(R1)
	.loc 1 257 0
	MOV.W	20(R1), R12
	MOV.W	@R12, R13
	MOV.W	2(R1), R12
	MOV.W	@R12, R12
	.loc 1 259 0
	CMP.W	R13, R12 { JHS	.L43
	.loc 1 258 0
	MOV.W	20(R1), R12
	MOV.W	@R12, R14
	MOV.W	2(R1), R12
	MOV.W	@R12, R13
	.loc 1 259 0
	MOV.W	R14, R12 { SUB.W	R13, R12
	BR	#.L44
.L43:
	.loc 1 259 0 is_stmt 0
	MOV.W	2(R1), R12
	MOV.W	@R12, R14
	MOV.W	20(R1), R12
	MOV.W	@R12, R13
	MOV.W	R14, R12 { SUB.W	R13, R12
.L44:
	.loc 1 257 0 is_stmt 1
	MOV.W	R12, 8(R1)
	MOV.W	#0, 10(R1)
	.loc 1 261 0
	MOV.W	20(R1), R12
	MOV.W	2(R12), R13
	MOV.W	2(R1), R12
	MOV.W	2(R12), R12
	.loc 1 263 0
	CMP.W	R13, R12 { JHS	.L45
	.loc 1 262 0
	MOV.W	20(R1), R12
	MOV.W	2(R12), R14
	MOV.W	2(R1), R12
	MOV.W	2(R12), R13
	.loc 1 263 0
	MOV.W	R14, R12 { SUB.W	R13, R12
	BR	#.L46
.L45:
	.loc 1 263 0 is_stmt 0
	MOV.W	2(R1), R12
	MOV.W	2(R12), R14
	MOV.W	20(R1), R12
	MOV.W	2(R12), R13
	MOV.W	R14, R12 { SUB.W	R13, R12
.L46:
	.loc 1 261 0 is_stmt 1
	MOV.W	R12, 4(R1)
	MOV.W	#0, 6(R1)
	.loc 1 265 0
	CMP.W	18(R1), 10(R1) { JL	.L56
	CMP.W	10(R1), 18(R1) { JNE	.L47
	CMP.W	16(R1), 8(R1) { JHS	.L47
.L56:
	.loc 1 266 0
	ADD.W	#1, 28(R1)
	BR	#.L49
.L47:
	.loc 1 268 0
	ADD.W	#1, 26(R1)
.L49:
	.loc 1 271 0
	CMP.W	14(R1), 6(R1) { JL	.L57
	CMP.W	6(R1), 14(R1) { JNE	.L50
	CMP.W	12(R1), 4(R1) { JHS	.L50
.L57:
	.loc 1 272 0
	ADD.W	#1, 28(R1)
	BR	#.L52
.L50:
	.loc 1 274 0
	ADD.W	#1, 26(R1)
.L52:
.LBE3:
	.loc 1 244 0
	ADD.W	#1, 24(R1)
.L38:
	.loc 1 244 0 is_stmt 0
	MOV.B	#15, R12
	CMP.W	24(R1), R12 { JGE	.L53
	.loc 1 279 0 is_stmt 1
	MOV.B	#1, R12
	CMP.W	28(R1), 26(R1) { JL	.L54
	MOV.B	#0, R12
.L54:
	AND	#0xff, R12
	.loc 1 278 0
	MOV.W	R12, 22(R1)
	.loc 1 282 0
	MOV.W	22(R1), R12
	.loc 1 283 0
	; start of epilogue
	ADD.W	#30, R1
	RET
.LFE6:
	.size	classify, .-classify
	.balign 2
	.global	record_stats
	.type	record_stats, @function
record_stats:
.LFB7:
	.loc 1 286 0
; start of function
; framesize_regs:     0
; framesize_locals:   4
; framesize_outgoing: 0
; framesize:          4
; elim ap -> fp       2
; elim fp -> sp       4
; saved regs:(none)
	; start of prologue
	SUB.W	#4, R1
.LCFI17:
	; end of prologue
	MOV.W	R12, 2(R1)
	MOV.W	R13, @R1
	.loc 1 292 0
	MOV.W	2(R1), R12
	MOV.W	@R12, R12
	MOV.W	R12, R13
	ADD.W	#1, R13
	MOV.W	2(R1), R12
	MOV.W	R13, @R12
	.loc 1 294 0
	MOV.W	@R1, R12
	CMP.W	#0, R12 { JEQ	.L60
	CMP.W	#1, R12 { JEQ	.L61
	.loc 1 306 0
	BR	#.L62
.L61:
	.loc 1 296 0
	MOV.W	2(R1), R12
	MOV.W	2(R12), R12
	MOV.W	R12, R13
	ADD.W	#1, R13
	MOV.W	2(R1), R12
	MOV.W	R13, 2(R12)
	.loc 1 297 0
	BR	#.L59
.L60:
	.loc 1 300 0
	MOV.W	2(R1), R12
	MOV.W	4(R12), R12
	MOV.W	R12, R13
	ADD.W	#1, R13
	MOV.W	2(R1), R12
	MOV.W	R13, 4(R12)
	.loc 1 301 0
	NOP
.L59:
.L62:
	.loc 1 306 0
	NOP
	; start of epilogue
	ADD.W	#4, R1
	RET
.LFE7:
	.size	record_stats, .-record_stats
	.comm	resultStationaryPct,2,2
	.comm	resultMovingPct,2,2
	.comm	sum,2,2
	.global	__mspabi_divu
	.section	.rodata
.LC0:
	.string	"stats: s "
.LC1:
	.string	" ("
.LC2:
	.string	"%) m "
.LC3:
	.string	"%)"
.LC4:
	.string	" sum/tot "
.LC5:
	.string	"/"
.LC6:
	.string	" V"
.LC7:
	.string	" X"
.LC8:
	.string	"\r\n"
.text
	.balign 2
	.global	print_stats
	.type	print_stats, @function
print_stats:
.LFB8:
	.loc 1 313 0
; start of function
; framesize_regs:     0
; framesize_locals:   2
; framesize_outgoing: 0
; framesize:          2
; elim ap -> fp       2
; elim fp -> sp       2
; saved regs:(none)
	; start of prologue
	SUB.W	#2, R1
.LCFI18:
	; end of prologue
	MOV.W	R12, @R1
	.loc 1 318 0
	MOV.W	@R1, R12
	MOV.W	4(R12), R12
	MOV.B	#100, R13
	CALL	#__mulhi2
.LVL18:
	MOV.W	@R1, R13
	MOV.W	@R13, R13
	CALL	#__mspabi_divu
.LVL19:
	MOV.W	R12, &resultStationaryPct
	.loc 1 319 0
	MOV.W	@R1, R12
	MOV.W	2(R12), R12
	MOV.B	#100, R13
	CALL	#__mulhi2
.LVL20:
	MOV.W	@R1, R13
	MOV.W	@R13, R13
	CALL	#__mspabi_divu
.LVL21:
	MOV.W	R12, &resultMovingPct
	.loc 1 320 0
	MOV.W	@R1, R12
	MOV.W	4(R12), R13
	MOV.W	@R1, R12
	MOV.W	2(R12), R12
	ADD.W	R13, R12
	MOV.W	R12, &sum
	.loc 1 330 0
	MOV.W	#.LC0, R12
	CALL	#UART_WriteString
	.loc 1 332 0
	MOV.W	@R1, R12
	MOV.W	4(R12), R12
	CALL	#UART_WriteNumber
	.loc 1 334 0
	MOV.W	#.LC1, R12
	CALL	#UART_WriteString
	.loc 1 336 0
	MOV.W	&resultStationaryPct, R12
	CALL	#UART_WriteNumber
	.loc 1 338 0
	MOV.W	#.LC2, R12
	CALL	#UART_WriteString
	.loc 1 340 0
	MOV.W	@R1, R12
	MOV.W	2(R12), R12
	CALL	#UART_WriteNumber
	.loc 1 342 0
	MOV.W	#.LC1, R12
	CALL	#UART_WriteString
	.loc 1 344 0
	MOV.W	&resultMovingPct, R12
	CALL	#UART_WriteNumber
	.loc 1 346 0
	MOV.W	#.LC3, R12
	CALL	#UART_WriteString
	.loc 1 348 0
	MOV.W	#.LC4, R12
	CALL	#UART_WriteString
	.loc 1 350 0
	MOV.W	@R1, R12
	MOV.W	@R12, R12
	CALL	#UART_WriteNumber
	.loc 1 352 0
	MOV.W	#.LC5, R12
	CALL	#UART_WriteString
	.loc 1 354 0
	MOV.W	&sum, R12
	CALL	#UART_WriteNumber
	.loc 1 356 0
	MOV.W	@R1, R12
	MOV.W	@R12, R13
	MOV.W	&sum, R12
	CMP.W	R12, R13 { JNE	.L64
	.loc 1 356 0 is_stmt 0
	MOV.W	&sum, R12
	CMP.W	#128, R12 { JNE	.L64
	.loc 1 357 0 is_stmt 1
	MOV.W	#.LC6, R12
	CALL	#UART_WriteString
	BR	#.L65
.L64:
	.loc 1 359 0
	MOV.W	#.LC7, R12
	CALL	#UART_WriteString
.L65:
	.loc 1 362 0
	MOV.W	#.LC8, R12
	CALL	#UART_WriteString
	.loc 1 368 0
	NOP
	; start of epilogue
	ADD.W	#2, R1
	RET
.LFE8:
	.size	print_stats, .-print_stats
	.balign 2
	.global	warmup_sensor
	.type	warmup_sensor, @function
warmup_sensor:
.LFB9:
	.loc 1 371 0
; start of function
; framesize_regs:     0
; framesize_locals:   6
; framesize_outgoing: 0
; framesize:          6
; elim ap -> fp       2
; elim fp -> sp       6
; saved regs:(none)
	; start of prologue
	SUB.W	#6, R1
.LCFI19:
	; end of prologue
	.loc 1 372 0
	MOV.W	#0, 4(R1)
	.loc 1 379 0
	BR	#.L67
.L68:
	.loc 1 380 0
	MOV.W	R1, R12
	ADD.W	#1, R12
	CALL	#ACCEL_singleSample
.L67:
	.loc 1 379 0
	MOV.W	4(R1), R12
	MOV.W	R12, R13
	ADD.W	#1, R13
	MOV.W	R13, 4(R1)
	MOV.B	#2, R13
	CMP.W	R12, R13 { JHS	.L68
	.loc 1 382 0
	NOP
	; start of epilogue
	ADD.W	#6, R1
	RET
.LFE9:
	.size	warmup_sensor, .-warmup_sensor
	.section	.rodata
.LC9:
	.string	"train: done: mn "
.LC10:
	.string	" sd "
.text
	.balign 2
	.global	train
	.type	train, @function
train:
.LFB10:
	.loc 1 385 0
; start of function
; framesize_regs:     0
; framesize_locals:   18
; framesize_outgoing: 0
; framesize:          18
; elim ap -> fp       2
; elim fp -> sp       18
; saved regs:(none)
	; start of prologue
	SUB.W	#18, R1
.LCFI20:
	; end of prologue
	MOV.W	R12, @R1
	.loc 1 390 0
	CALL	#warmup_sensor
	.loc 1 392 0
	MOV.W	#0, 16(R1)
	BR	#.L70
.L71:
	.loc 1 393 0
	MOV.W	R1, R12
	ADD.W	#7, R12
	CALL	#acquire_window
	.loc 1 394 0
	MOV.W	R1, R12
	ADD.W	#7, R12
	CALL	#transform
	.loc 1 395 0
	MOV.W	R1, R13
	ADD.W	#7, R13
	MOV.W	R1, R12
	ADD.W	#2, R12
	CALL	#featurize
	.loc 1 399 0
	MOV.W	16(R1), R12
	ADD.W	R12, R12
	ADD.W	R12, R12
	ADD.W	@R1, R12
	MOV.W	2(R1), @R12
	MOV.W	4(R1), 2(R12)
	.loc 1 392 0
	ADD.W	#1, 16(R1)
.L70:
	.loc 1 392 0 is_stmt 0
	MOV.B	#15, R12
	CMP.W	16(R1), R12 { JHS	.L71
	.loc 1 405 0 is_stmt 1
	MOV.W	#.LC9, R12
	CALL	#UART_WriteString
	.loc 1 406 0
	MOV.W	2(R1), R12
	CALL	#UART_WriteNumber
	.loc 1 407 0
	MOV.W	#.LC10, R12
	CALL	#UART_WriteString
	.loc 1 408 0
	MOV.W	4(R1), R12
	CALL	#UART_WriteNumber
	.loc 1 409 0
	MOV.W	#.LC8, R12
	CALL	#UART_WriteString
	.loc 1 414 0
	NOP
	; start of epilogue
	ADD.W	#18, R1
	RET
.LFE10:
	.size	train, .-train
	.balign 2
	.global	recognize
	.type	recognize, @function
recognize:
.LFB11:
	.loc 1 417 0
; start of function
; framesize_regs:     0
; framesize_locals:   26
; framesize_outgoing: 0
; framesize:          26
; elim ap -> fp       2
; elim fp -> sp       26
; saved regs:(none)
	; start of prologue
	SUB.W	#26, R1
.LCFI21:
	; end of prologue
	MOV.W	R12, @R1
	.loc 1 429 0
	MOV.W	#0, 16(R1)
	.loc 1 430 0
	MOV.W	#0, 20(R1)
	.loc 1 431 0
	MOV.W	#0, 18(R1)
	.loc 1 433 0
	MOV.W	#0, 24(R1)
	BR	#.L73
.L74:
	.loc 1 434 0
	MOV.W	R1, R12
	ADD.W	#7, R12
	CALL	#acquire_window
	.loc 1 435 0
	MOV.W	R1, R12
	ADD.W	#7, R12
	CALL	#transform
	.loc 1 436 0
	MOV.W	R1, R13
	ADD.W	#7, R13
	MOV.W	R1, R12
	ADD.W	#2, R12
	CALL	#featurize
	.loc 1 437 0
	MOV.W	R1, R12
	ADD.W	#2, R12
	MOV.W	@R1, R13
	CALL	#classify
	MOV.W	R12, 22(R1)
	.loc 1 438 0
	MOV.W	R1, R12
	ADD.W	#16, R12
	MOV.W	22(R1), R13
	CALL	#record_stats
	.loc 1 433 0
	ADD.W	#1, 24(R1)
.L73:
	.loc 1 433 0 is_stmt 0
	MOV.B	#127, R12
	CMP.W	24(R1), R12 { JHS	.L74
	.loc 1 440 0 is_stmt 1
	MOV.W	R1, R12
	ADD.W	#16, R12
	CALL	#print_stats
	.loc 1 441 0
	NOP
	; start of epilogue
	ADD.W	#26, R1
	RET
.LFE11:
	.size	recognize, .-recognize
	.section	.rodata
.LC11:
	.string	"This is the end of the AR benchmark\n\r"
.text
	.balign 2
	.global	end_of_benchmark
	.type	end_of_benchmark, @function
end_of_benchmark:
.LFB12:
	.loc 1 444 0
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
	.loc 1 445 0
	MOV.B	#144, R12
	MOV.B	#0, @R12
	.loc 1 448 0
	MOV.W	#.LC11, R12
	CALL	#UART_WriteString
	.loc 1 450 0
	MOV.B	#0, R12
	CALL	#exit
.LFE12:
	.size	end_of_benchmark, .-end_of_benchmark
	.balign 2
	.global	count_error
	.type	count_error, @function
count_error:
.LFB13:
	.loc 1 455 0
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
	.loc 1 457 0
	NOP
	; start of epilogue
	RET
.LFE13:
	.size	count_error, .-count_error
	.balign 2
	.global	select_mode
	.type	select_mode, @function
select_mode:
.LFB14:
	.loc 1 461 0
; start of function
; framesize_regs:     0
; framesize_locals:   4
; framesize_outgoing: 0
; framesize:          4
; elim ap -> fp       2
; elim fp -> sp       4
; saved regs:(none)
	; start of prologue
	SUB.W	#4, R1
.LCFI22:
	; end of prologue
	MOV.W	R12, @R1
	.loc 1 466 0
	MOV.W	&count, R12
	ADD.W	#1, R12
	MOV.W	R12, &count
	.loc 1 475 0
	MOV.W	&count, R12
	MOV.B	#4, R13
	CMP.W	R12, R13 { JLO	.L79
	CMP.W	#3, R12 { JHS	.L80
	CMP.W	#1, R12 { JLO	.L78
	BR	#.L89
.L79:
	MOV.B	#6, R13
	CMP.W	R12, R13 { JHS	.L82
	CMP.W	#7, R12 { JEQ	.L83
	BR	#.L78
.L89:
	.loc 1 478 0
	MOV.B	#1, 3(R1)
	.loc 1 479 0
	BR	#.L84
.L80:
	.loc 1 482 0
	MOV.B	#2, 3(R1)
	.loc 1 483 0
	BR	#.L84
.L82:
	.loc 1 486 0
	MOV.B	#0, 3(R1)
	.loc 1 487 0
	BR	#.L84
.L83:
	.loc 1 489 0
	CALL	#end_of_benchmark
	.loc 1 490 0
	BR	#.L84
.L78:
	.loc 1 492 0
	MOV.B	#3, 3(R1)
	.loc 1 493 0
	CALL	#count_error
.L84:
	.loc 1 500 0
	CMP.B	#2, 3(R1) { JEQ	.L85
	.loc 1 500 0 is_stmt 0
	CMP.B	#1, 3(R1) { JNE	.L86
.L85:
	.loc 1 502 0 is_stmt 1
	MOV.W	@R1, R12
	MOV.B	@R12, R12
	.loc 1 501 0
	CMP.B	R12, 3(R1) { JNE	.L86
	.loc 1 503 0
	MOV.B	#3, 3(R1)
	BR	#.L87
.L86:
	.loc 1 505 0
	MOV.W	@R1, R12
	MOV.B	3(R1), @R12
.L87:
	.loc 1 510 0
	MOV.B	3(R1), R12
	.loc 1 511 0
	; start of epilogue
	ADD.W	#4, R1
	RET
.LFE14:
	.size	select_mode, .-select_mode
	.balign 2
	.global	init
	.type	init, @function
init:
.LFB15:
	.loc 1 514 0
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
	.loc 1 515 0
	MOV.W	#288, R12
	MOV.W	#23168, @R12
	.loc 1 516 0
 ; 516 "main.c" 1
	nop
 ; 0 "" 2
	.loc 1 517 0
 ; 517 "main.c" 1
	eint { nop
 ; 0 "" 2
	.loc 1 518 0
	MOV.B	#130, R12
	MOV.W	#8, @R12
	.loc 1 519 0
	MOV.B	#128, R12
	MOV.B	#1, @R12
	.loc 1 521 0
	MOV.W	#672, R12
	MOV.W	#1, @R12
	.loc 1 529 0
	NOP
	; start of epilogue
	RET
.LFE15:
	.size	init, .-init
	.balign 2
	.global	init_moving
	.type	init_moving, @function
init_moving:
.LFB16:
	.loc 1 530 0
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
	.loc 1 532 0
	MOV.W	#36, &model+64
	.loc 1 533 0
	MOV.W	#30, &model+66
	.loc 1 535 0
	MOV.W	#56, &model+68
	.loc 1 536 0
	MOV.W	#22, &model+70
	.loc 1 538 0
	MOV.W	#40, &model+72
	.loc 1 539 0
	MOV.W	#30, &model+74
	.loc 1 541 0
	MOV.W	#48, &model+76
	.loc 1 542 0
	MOV.W	#30, &model+78
	.loc 1 544 0
	MOV.W	#54, &model+80
	.loc 1 545 0
	MOV.W	#20, &model+82
	.loc 1 547 0
	MOV.W	#50, &model+84
	.loc 1 548 0
	MOV.W	#34, &model+86
	.loc 1 550 0
	MOV.W	#56, &model+88
	.loc 1 551 0
	MOV.W	#22, &model+90
	.loc 1 553 0
	MOV.W	#58, &model+92
	.loc 1 554 0
	MOV.W	#24, &model+94
	.loc 1 556 0
	MOV.W	#46, &model+96
	.loc 1 557 0
	MOV.W	#30, &model+98
	.loc 1 559 0
	MOV.W	#52, &model+100
	.loc 1 560 0
	MOV.W	#20, &model+102
	.loc 1 562 0
	MOV.W	#50, &model+104
	.loc 1 563 0
	MOV.W	#34, &model+106
	.loc 1 565 0
	MOV.W	#56, &model+108
	.loc 1 566 0
	MOV.W	#22, &model+110
	.loc 1 568 0
	MOV.W	#56, &model+112
	.loc 1 569 0
	MOV.W	#24, &model+114
	.loc 1 571 0
	MOV.W	#46, &model+116
	.loc 1 572 0
	MOV.W	#30, &model+118
	.loc 1 574 0
	MOV.W	#52, &model+120
	.loc 1 575 0
	MOV.W	#20, &model+122
	.loc 1 577 0
	MOV.W	#50, &model+124
	.loc 1 578 0
	MOV.W	#34, &model+126
	.loc 1 579 0
	NOP
	; start of epilogue
	RET
.LFE16:
	.size	init_moving, .-init_moving
	.balign 2
	.global	init_stationary
	.type	init_stationary, @function
init_stationary:
.LFB17:
	.loc 1 580 0
; start of function
; framesize_regs:     0
; framesize_locals:   0
; framesize_outgoing: 0
; framesize:          0
; elim ap -> fp       2
; elim fp -> sp       0
; saved regs:(none)
	; start of prologue
	; end of prologue
	.loc 1 582 0
	MOV.W	#56, &model
	.loc 1 583 0
	MOV.W	#24, &model+2
	.loc 1 585 0
	MOV.W	#46, &model+4
	.loc 1 586 0
	MOV.W	#30, &model+6
	.loc 1 588 0
	MOV.W	#52, &model+8
	.loc 1 589 0
	MOV.W	#20, &model+10
	.loc 1 591 0
	MOV.W	#50, &model+12
	.loc 1 592 0
	MOV.W	#34, &model+14
	.loc 1 594 0
	MOV.W	#56, &model+16
	.loc 1 595 0
	MOV.W	#22, &model+18
	.loc 1 597 0
	MOV.W	#54, &model+20
	.loc 1 598 0
	MOV.W	#24, &model+22
	.loc 1 600 0
	MOV.W	#46, &model+24
	.loc 1 601 0
	MOV.W	#30, &model+26
	.loc 1 603 0
	MOV.W	#52, &model+28
	.loc 1 604 0
	MOV.W	#20, &model+30
	.loc 1 606 0
	MOV.W	#48, &model+32
	.loc 1 607 0
	MOV.W	#34, &model+34
	.loc 1 609 0
	MOV.W	#56, &model+36
	.loc 1 610 0
	MOV.W	#22, &model+38
	.loc 1 612 0
	MOV.W	#54, &model+40
	.loc 1 613 0
	MOV.W	#24, &model+42
	.loc 1 615 0
	MOV.W	#44, &model+44
	.loc 1 616 0
	MOV.W	#30, &model+46
	.loc 1 618 0
	MOV.W	#50, &model+48
	.loc 1 619 0
	MOV.W	#20, &model+50
	.loc 1 621 0
	MOV.W	#48, &model+52
	.loc 1 622 0
	MOV.W	#34, &model+54
	.loc 1 624 0
	MOV.W	#54, &model+56
	.loc 1 625 0
	MOV.W	#22, &model+58
	.loc 1 627 0
	MOV.W	#52, &model+60
	.loc 1 628 0
	MOV.W	#24, &model+62
	.loc 1 630 0
	NOP
	; start of epilogue
	RET
.LFE17:
	.size	init_stationary, .-init_stationary
	.balign 2
	.global	main
	.type	main, @function
main:
.LFB18:
	.loc 1 633 0
; start of function
; framesize_regs:     0
; framesize_locals:   4
; framesize_outgoing: 0
; framesize:          4
; elim ap -> fp       2
; elim fp -> sp       4
; saved regs:(none)
	; start of prologue
	SUB.W	#4, R1
.LCFI23:
	; end of prologue
	.loc 1 636 0
	MOV.B	#3, 1(R1)
	.loc 1 642 0
	CALL	#init
	.loc 1 643 0
	MOV.W	#4980, R12
	CALL	#ta_wait
	.loc 1 645 0
	MOV.W	#1, &count
	.loc 1 646 0
	MOV.B	#144, R12
	MOV.B	#-1, @R12
.L99:
.LBB4:
	.loc 1 649 0
	MOV.W	R1, R12
	ADD.W	#1, R12
	CALL	#select_mode
	MOV.W	R12, 2(R1)
	.loc 1 652 0
	MOV.W	2(R1), R12
	CMP.W	#1, R12 { JEQ	.L95
	CMP.W	#1, R12 { JLO	.L96
	CMP.W	#2, R12 { JEQ	.L97
	.loc 1 667 0
	BR	#.L98
.L97:
	.loc 1 655 0
	MOV.W	#model, R12
	CALL	#train
	.loc 1 656 0
	BR	#.L98
.L95:
	.loc 1 659 0
	MOV.W	#model+64, R12
	CALL	#train
	.loc 1 660 0
	BR	#.L98
.L96:
	.loc 1 663 0
	MOV.W	#model, R12
	CALL	#recognize
	.loc 1 664 0
	NOP
.L98:
.LBE4:
	.loc 1 648 0
	BR	#.L99
.LFE18:
	.size	main, .-main
.data
	.balign 2
	.type	_v_seed.2309, @object
	.size	_v_seed.2309, 2
_v_seed.2309:
	.short	1
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
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x4
	.4byte	.LCFI0-.LFB1
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0xe
	.uleb128 0x6
	.byte	0x89
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xe
	.uleb128 0x8
	.byte	0x88
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xe
	.uleb128 0xa
	.byte	0x87
	.uleb128 0x5
	.byte	0x4
	.4byte	.LCFI4-.LCFI3
	.byte	0xe
	.uleb128 0xc
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0xe
	.uleb128 0xe
	.byte	0x85
	.uleb128 0x7
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xe
	.uleb128 0x2c
	.balign 4
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x4
	.4byte	.LCFI7-.LFB2
	.byte	0xe
	.uleb128 0x6
	.balign 4
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.byte	0x4
	.4byte	.LCFI8-.LFB3
	.byte	0xe
	.uleb128 0xa
	.balign 4
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI9-.LFB4
	.byte	0xe
	.uleb128 0x8
	.balign 4
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI10-.LFB5
	.byte	0xe
	.uleb128 0x4
	.byte	0x8a
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xe
	.uleb128 0x6
	.byte	0x89
	.uleb128 0x3
	.byte	0x4
	.4byte	.LCFI12-.LCFI11
	.byte	0xe
	.uleb128 0x8
	.byte	0x88
	.uleb128 0x4
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0xe
	.uleb128 0xa
	.byte	0x87
	.uleb128 0x5
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xe
	.uleb128 0xc
	.byte	0x86
	.uleb128 0x6
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xe
	.uleb128 0x1c
	.balign 4
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI16-.LFB6
	.byte	0xe
	.uleb128 0x20
	.balign 4
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI17-.LFB7
	.byte	0xe
	.uleb128 0x6
	.balign 4
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI18-.LFB8
	.byte	0xe
	.uleb128 0x4
	.balign 4
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI19-.LFB9
	.byte	0xe
	.uleb128 0x8
	.balign 4
.LEFDE16:
.LSFDE18:
	.4byte	.LEFDE18-.LASFDE18
.LASFDE18:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI20-.LFB10
	.byte	0xe
	.uleb128 0x14
	.balign 4
.LEFDE18:
.LSFDE20:
	.4byte	.LEFDE20-.LASFDE20
.LASFDE20:
	.4byte	.Lframe0
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.byte	0x4
	.4byte	.LCFI21-.LFB11
	.byte	0xe
	.uleb128 0x1c
	.balign 4
.LEFDE20:
.LSFDE22:
	.4byte	.LEFDE22-.LASFDE22
.LASFDE22:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.balign 4
.LEFDE22:
.LSFDE24:
	.4byte	.LEFDE24-.LASFDE24
.LASFDE24:
	.4byte	.Lframe0
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.balign 4
.LEFDE24:
.LSFDE26:
	.4byte	.LEFDE26-.LASFDE26
.LASFDE26:
	.4byte	.Lframe0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.byte	0x4
	.4byte	.LCFI22-.LFB14
	.byte	0xe
	.uleb128 0x6
	.balign 4
.LEFDE26:
.LSFDE28:
	.4byte	.LEFDE28-.LASFDE28
.LASFDE28:
	.4byte	.Lframe0
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.balign 4
.LEFDE28:
.LSFDE30:
	.4byte	.LEFDE30-.LASFDE30
.LASFDE30:
	.4byte	.Lframe0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.balign 4
.LEFDE30:
.LSFDE32:
	.4byte	.LEFDE32-.LASFDE32
.LASFDE32:
	.4byte	.Lframe0
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.balign 4
.LEFDE32:
.LSFDE34:
	.4byte	.LEFDE34-.LASFDE34
.LASFDE34:
	.4byte	.Lframe0
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.byte	0x4
	.4byte	.LCFI23-.LFB18
	.byte	0xe
	.uleb128 0x6
	.balign 4
.LEFDE34:
.text
.Letext0:
	.file 2 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_default_types.h"
	.file 3 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_stdint.h"
	.file 4 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/lock.h"
	.file 5 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_types.h"
	.file 6 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stddef.h"
	.file 7 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/reent.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0xf3c
	.2byte	0x3
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF193
	.byte	0xc
	.4byte	.LASF194
	.4byte	.LASF195
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.4byte	.Ldebug_macinfo0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x1d
	.4byte	0x3b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2b
	.4byte	0x54
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x41
	.4byte	0x6d
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x14
	.4byte	0x30
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x1a
	.4byte	0x49
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x20
	.4byte	0x62
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x4
	.byte	0x7
	.4byte	0x82
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x5
	.byte	0x10
	.4byte	0x5b
	.uleb128 0x3
	.4byte	.LASF17
	.byte	0x5
	.byte	0x27
	.4byte	0x5b
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x6
	.2byte	0x165
	.4byte	0x89
	.uleb128 0x6
	.byte	0x4
	.byte	0x5
	.byte	0x4a
	.4byte	0xfd
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x5
	.byte	0x4c
	.4byte	0xd2
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x5
	.byte	0x4d
	.4byte	0xfd
	.byte	0
	.uleb128 0x8
	.4byte	0x3b
	.4byte	0x10d
	.uleb128 0x9
	.4byte	0x89
	.byte	0x3
	.byte	0
	.uleb128 0xa
	.byte	0x6
	.byte	0x5
	.byte	0x47
	.4byte	0x12e
	.uleb128 0xb
	.4byte	.LASF21
	.byte	0x5
	.byte	0x49
	.4byte	0x82
	.byte	0
	.uleb128 0xb
	.4byte	.LASF22
	.byte	0x5
	.byte	0x4e
	.4byte	0xde
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF23
	.byte	0x5
	.byte	0x4f
	.4byte	0x10d
	.uleb128 0x3
	.4byte	.LASF24
	.byte	0x5
	.byte	0x53
	.4byte	0xb1
	.uleb128 0xc
	.byte	0x2
	.uleb128 0x3
	.4byte	.LASF25
	.byte	0x7
	.byte	0x16
	.4byte	0x6d
	.uleb128 0xd
	.4byte	.LASF30
	.byte	0xe
	.byte	0x7
	.byte	0x2d
	.4byte	0x1a4
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x7
	.byte	0x2f
	.4byte	0x1a4
	.byte	0
	.uleb128 0xe
	.string	"_k"
	.byte	0x7
	.byte	0x30
	.4byte	0x82
	.byte	0x2
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x7
	.byte	0x30
	.4byte	0x82
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x7
	.byte	0x30
	.4byte	0x82
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF29
	.byte	0x7
	.byte	0x30
	.4byte	0x82
	.byte	0x8
	.uleb128 0xe
	.string	"_x"
	.byte	0x7
	.byte	0x31
	.4byte	0x1aa
	.byte	0xa
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x151
	.uleb128 0x8
	.4byte	0x146
	.4byte	0x1ba
	.uleb128 0x9
	.4byte	0x89
	.byte	0
	.byte	0
	.uleb128 0xd
	.4byte	.LASF31
	.byte	0x12
	.byte	0x7
	.byte	0x35
	.4byte	0x233
	.uleb128 0xb
	.4byte	.LASF32
	.byte	0x7
	.byte	0x37
	.4byte	0x82
	.byte	0
	.uleb128 0xb
	.4byte	.LASF33
	.byte	0x7
	.byte	0x38
	.4byte	0x82
	.byte	0x2
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x7
	.byte	0x39
	.4byte	0x82
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF35
	.byte	0x7
	.byte	0x3a
	.4byte	0x82
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x7
	.byte	0x3b
	.4byte	0x82
	.byte	0x8
	.uleb128 0xb
	.4byte	.LASF37
	.byte	0x7
	.byte	0x3c
	.4byte	0x82
	.byte	0xa
	.uleb128 0xb
	.4byte	.LASF38
	.byte	0x7
	.byte	0x3d
	.4byte	0x82
	.byte	0xc
	.uleb128 0xb
	.4byte	.LASF39
	.byte	0x7
	.byte	0x3e
	.4byte	0x82
	.byte	0xe
	.uleb128 0xb
	.4byte	.LASF40
	.byte	0x7
	.byte	0x3f
	.4byte	0x82
	.byte	0x10
	.byte	0
	.uleb128 0xd
	.4byte	.LASF41
	.byte	0x88
	.byte	0x7
	.byte	0x48
	.4byte	0x270
	.uleb128 0xb
	.4byte	.LASF42
	.byte	0x7
	.byte	0x49
	.4byte	0x270
	.byte	0
	.uleb128 0xb
	.4byte	.LASF43
	.byte	0x7
	.byte	0x4a
	.4byte	0x270
	.byte	0x40
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x7
	.byte	0x4c
	.4byte	0x146
	.byte	0x80
	.uleb128 0xb
	.4byte	.LASF45
	.byte	0x7
	.byte	0x4f
	.4byte	0x146
	.byte	0x84
	.byte	0
	.uleb128 0x8
	.4byte	0x144
	.4byte	0x280
	.uleb128 0x9
	.4byte	0x89
	.byte	0x1f
	.byte	0
	.uleb128 0xd
	.4byte	.LASF46
	.byte	0x46
	.byte	0x7
	.byte	0x53
	.4byte	0x2bd
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x7
	.byte	0x54
	.4byte	0x2bd
	.byte	0
	.uleb128 0xb
	.4byte	.LASF47
	.byte	0x7
	.byte	0x55
	.4byte	0x82
	.byte	0x2
	.uleb128 0xb
	.4byte	.LASF48
	.byte	0x7
	.byte	0x56
	.4byte	0x2c3
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF49
	.byte	0x7
	.byte	0x57
	.4byte	0x2db
	.byte	0x44
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x280
	.uleb128 0x8
	.4byte	0x2d3
	.4byte	0x2d3
	.uleb128 0x9
	.4byte	0x89
	.byte	0x1f
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x2d9
	.uleb128 0x10
	.byte	0x1
	.uleb128 0xf
	.byte	0x2
	.4byte	0x233
	.uleb128 0xd
	.4byte	.LASF50
	.byte	0x4
	.byte	0x7
	.byte	0x73
	.4byte	0x306
	.uleb128 0xb
	.4byte	.LASF51
	.byte	0x7
	.byte	0x74
	.4byte	0x306
	.byte	0
	.uleb128 0xb
	.4byte	.LASF52
	.byte	0x7
	.byte	0x75
	.4byte	0x82
	.byte	0x2
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x3b
	.uleb128 0xd
	.4byte	.LASF53
	.byte	0x12
	.byte	0x7
	.byte	0x97
	.4byte	0x376
	.uleb128 0xe
	.string	"_p"
	.byte	0x7
	.byte	0x98
	.4byte	0x306
	.byte	0
	.uleb128 0xe
	.string	"_r"
	.byte	0x7
	.byte	0x99
	.4byte	0x82
	.byte	0x2
	.uleb128 0xe
	.string	"_w"
	.byte	0x7
	.byte	0x9a
	.4byte	0x82
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x7
	.byte	0x9b
	.4byte	0x42
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x7
	.byte	0x9c
	.4byte	0x42
	.byte	0x8
	.uleb128 0xe
	.string	"_bf"
	.byte	0x7
	.byte	0x9d
	.4byte	0x2e1
	.byte	0xa
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x7
	.byte	0x9e
	.4byte	0x82
	.byte	0xe
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x7
	.byte	0xa0
	.4byte	0x4c1
	.byte	0x10
	.byte	0
	.uleb128 0x11
	.4byte	0x30c
	.uleb128 0x12
	.4byte	.LASF58
	.byte	0x78
	.byte	0x7
	.2byte	0x172
	.4byte	0x4c1
	.uleb128 0x13
	.4byte	.LASF59
	.byte	0x7
	.2byte	0x176
	.4byte	0x82
	.byte	0
	.uleb128 0x13
	.4byte	.LASF60
	.byte	0x7
	.2byte	0x17b
	.4byte	0x6ff
	.byte	0x2
	.uleb128 0x13
	.4byte	.LASF61
	.byte	0x7
	.2byte	0x17b
	.4byte	0x6ff
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF62
	.byte	0x7
	.2byte	0x17b
	.4byte	0x6ff
	.byte	0x6
	.uleb128 0x13
	.4byte	.LASF63
	.byte	0x7
	.2byte	0x17d
	.4byte	0x82
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF64
	.byte	0x7
	.2byte	0x17f
	.4byte	0x615
	.byte	0xa
	.uleb128 0x13
	.4byte	.LASF65
	.byte	0x7
	.2byte	0x181
	.4byte	0x82
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF66
	.byte	0x7
	.2byte	0x183
	.4byte	0x82
	.byte	0xe
	.uleb128 0x13
	.4byte	.LASF67
	.byte	0x7
	.2byte	0x184
	.4byte	0x64c
	.byte	0x10
	.uleb128 0x14
	.string	"_mp"
	.byte	0x7
	.2byte	0x186
	.4byte	0x84c
	.byte	0x12
	.uleb128 0x13
	.4byte	.LASF68
	.byte	0x7
	.2byte	0x188
	.4byte	0x85e
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF69
	.byte	0x7
	.2byte	0x18a
	.4byte	0x82
	.byte	0x16
	.uleb128 0x13
	.4byte	.LASF70
	.byte	0x7
	.2byte	0x18d
	.4byte	0x82
	.byte	0x18
	.uleb128 0x13
	.4byte	.LASF71
	.byte	0x7
	.2byte	0x18e
	.4byte	0x615
	.byte	0x1a
	.uleb128 0x13
	.4byte	.LASF72
	.byte	0x7
	.2byte	0x190
	.4byte	0x864
	.byte	0x1c
	.uleb128 0x13
	.4byte	.LASF73
	.byte	0x7
	.2byte	0x191
	.4byte	0x86a
	.byte	0x1e
	.uleb128 0x13
	.4byte	.LASF74
	.byte	0x7
	.2byte	0x192
	.4byte	0x615
	.byte	0x20
	.uleb128 0x13
	.4byte	.LASF75
	.byte	0x7
	.2byte	0x195
	.4byte	0x87c
	.byte	0x22
	.uleb128 0x13
	.4byte	.LASF46
	.byte	0x7
	.2byte	0x199
	.4byte	0x2bd
	.byte	0x24
	.uleb128 0x13
	.4byte	.LASF76
	.byte	0x7
	.2byte	0x19a
	.4byte	0x280
	.byte	0x26
	.uleb128 0x13
	.4byte	.LASF77
	.byte	0x7
	.2byte	0x19d
	.4byte	0x6c4
	.byte	0x6c
	.uleb128 0x13
	.4byte	.LASF78
	.byte	0x7
	.2byte	0x19e
	.4byte	0x6ff
	.byte	0x72
	.uleb128 0x13
	.4byte	.LASF79
	.byte	0x7
	.2byte	0x19f
	.4byte	0x888
	.byte	0x74
	.uleb128 0x13
	.4byte	.LASF80
	.byte	0x7
	.2byte	0x1a0
	.4byte	0x615
	.byte	0x76
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x37b
	.uleb128 0x11
	.4byte	0x4c1
	.uleb128 0xd
	.4byte	.LASF81
	.byte	0x3c
	.byte	0x7
	.byte	0xb3
	.4byte	0x5f6
	.uleb128 0xe
	.string	"_p"
	.byte	0x7
	.byte	0xb4
	.4byte	0x306
	.byte	0
	.uleb128 0xe
	.string	"_r"
	.byte	0x7
	.byte	0xb5
	.4byte	0x82
	.byte	0x2
	.uleb128 0xe
	.string	"_w"
	.byte	0x7
	.byte	0xb6
	.4byte	0x82
	.byte	0x4
	.uleb128 0xb
	.4byte	.LASF54
	.byte	0x7
	.byte	0xb7
	.4byte	0x42
	.byte	0x6
	.uleb128 0xb
	.4byte	.LASF55
	.byte	0x7
	.byte	0xb8
	.4byte	0x42
	.byte	0x8
	.uleb128 0xe
	.string	"_bf"
	.byte	0x7
	.byte	0xb9
	.4byte	0x2e1
	.byte	0xa
	.uleb128 0xb
	.4byte	.LASF56
	.byte	0x7
	.byte	0xba
	.4byte	0x82
	.byte	0xe
	.uleb128 0xb
	.4byte	.LASF57
	.byte	0x7
	.byte	0xbd
	.4byte	0x4c1
	.byte	0x10
	.uleb128 0xb
	.4byte	.LASF82
	.byte	0x7
	.byte	0xc1
	.4byte	0x144
	.byte	0x12
	.uleb128 0xb
	.4byte	.LASF83
	.byte	0x7
	.byte	0xc3
	.4byte	0x627
	.byte	0x14
	.uleb128 0xb
	.4byte	.LASF84
	.byte	0x7
	.byte	0xc5
	.4byte	0x652
	.byte	0x16
	.uleb128 0xb
	.4byte	.LASF85
	.byte	0x7
	.byte	0xc8
	.4byte	0x677
	.byte	0x18
	.uleb128 0xb
	.4byte	.LASF86
	.byte	0x7
	.byte	0xc9
	.4byte	0x692
	.byte	0x1a
	.uleb128 0xe
	.string	"_ub"
	.byte	0x7
	.byte	0xcc
	.4byte	0x2e1
	.byte	0x1c
	.uleb128 0xe
	.string	"_up"
	.byte	0x7
	.byte	0xcd
	.4byte	0x306
	.byte	0x20
	.uleb128 0xe
	.string	"_ur"
	.byte	0x7
	.byte	0xce
	.4byte	0x82
	.byte	0x22
	.uleb128 0xb
	.4byte	.LASF87
	.byte	0x7
	.byte	0xd1
	.4byte	0x698
	.byte	0x24
	.uleb128 0xb
	.4byte	.LASF88
	.byte	0x7
	.byte	0xd2
	.4byte	0x6a8
	.byte	0x27
	.uleb128 0xe
	.string	"_lb"
	.byte	0x7
	.byte	0xd5
	.4byte	0x2e1
	.byte	0x28
	.uleb128 0xb
	.4byte	.LASF89
	.byte	0x7
	.byte	0xd8
	.4byte	0x82
	.byte	0x2c
	.uleb128 0xb
	.4byte	.LASF90
	.byte	0x7
	.byte	0xd9
	.4byte	0xbc
	.byte	0x2e
	.uleb128 0xb
	.4byte	.LASF91
	.byte	0x7
	.byte	0xe0
	.4byte	0x139
	.byte	0x32
	.uleb128 0xb
	.4byte	.LASF92
	.byte	0x7
	.byte	0xe2
	.4byte	0x12e
	.byte	0x34
	.uleb128 0xb
	.4byte	.LASF93
	.byte	0x7
	.byte	0xe3
	.4byte	0x82
	.byte	0x3a
	.byte	0
	.uleb128 0x15
	.byte	0x1
	.4byte	0x82
	.4byte	0x615
	.uleb128 0x16
	.4byte	0x4c1
	.uleb128 0x16
	.4byte	0x144
	.uleb128 0x16
	.4byte	0x615
	.uleb128 0x16
	.4byte	0x82
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x61b
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF94
	.uleb128 0x11
	.4byte	0x61b
	.uleb128 0xf
	.byte	0x2
	.4byte	0x5f6
	.uleb128 0x15
	.byte	0x1
	.4byte	0x82
	.4byte	0x64c
	.uleb128 0x16
	.4byte	0x4c1
	.uleb128 0x16
	.4byte	0x144
	.uleb128 0x16
	.4byte	0x64c
	.uleb128 0x16
	.4byte	0x82
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x622
	.uleb128 0xf
	.byte	0x2
	.4byte	0x62d
	.uleb128 0x15
	.byte	0x1
	.4byte	0xc7
	.4byte	0x677
	.uleb128 0x16
	.4byte	0x4c1
	.uleb128 0x16
	.4byte	0x144
	.uleb128 0x16
	.4byte	0xc7
	.uleb128 0x16
	.4byte	0x82
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x658
	.uleb128 0x15
	.byte	0x1
	.4byte	0x82
	.4byte	0x692
	.uleb128 0x16
	.4byte	0x4c1
	.uleb128 0x16
	.4byte	0x144
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x67d
	.uleb128 0x8
	.4byte	0x3b
	.4byte	0x6a8
	.uleb128 0x9
	.4byte	0x89
	.byte	0x2
	.byte	0
	.uleb128 0x8
	.4byte	0x3b
	.4byte	0x6b8
	.uleb128 0x9
	.4byte	0x89
	.byte	0
	.byte	0
	.uleb128 0x5
	.4byte	.LASF95
	.byte	0x7
	.2byte	0x11d
	.4byte	0x4cc
	.uleb128 0x12
	.4byte	.LASF96
	.byte	0x6
	.byte	0x7
	.2byte	0x121
	.4byte	0x6f9
	.uleb128 0x13
	.4byte	.LASF26
	.byte	0x7
	.2byte	0x123
	.4byte	0x6f9
	.byte	0
	.uleb128 0x13
	.4byte	.LASF97
	.byte	0x7
	.2byte	0x124
	.4byte	0x82
	.byte	0x2
	.uleb128 0x13
	.4byte	.LASF98
	.byte	0x7
	.2byte	0x125
	.4byte	0x6ff
	.byte	0x4
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x6c4
	.uleb128 0xf
	.byte	0x2
	.4byte	0x6b8
	.uleb128 0x12
	.4byte	.LASF99
	.byte	0x16
	.byte	0x7
	.2byte	0x13d
	.4byte	0x747
	.uleb128 0x13
	.4byte	.LASF100
	.byte	0x7
	.2byte	0x13e
	.4byte	0x747
	.byte	0
	.uleb128 0x13
	.4byte	.LASF101
	.byte	0x7
	.2byte	0x13f
	.4byte	0x747
	.byte	0x6
	.uleb128 0x13
	.4byte	.LASF102
	.byte	0x7
	.2byte	0x140
	.4byte	0x54
	.byte	0xc
	.uleb128 0x13
	.4byte	.LASF103
	.byte	0x7
	.2byte	0x143
	.4byte	0x7b
	.byte	0xe
	.byte	0
	.uleb128 0x8
	.4byte	0x54
	.4byte	0x757
	.uleb128 0x9
	.4byte	0x89
	.byte	0x2
	.byte	0
	.uleb128 0x12
	.4byte	.LASF104
	.byte	0x8
	.byte	0x7
	.2byte	0x156
	.4byte	0x799
	.uleb128 0x13
	.4byte	.LASF105
	.byte	0x7
	.2byte	0x159
	.4byte	0x1a4
	.byte	0
	.uleb128 0x13
	.4byte	.LASF106
	.byte	0x7
	.2byte	0x15a
	.4byte	0x82
	.byte	0x2
	.uleb128 0x13
	.4byte	.LASF107
	.byte	0x7
	.2byte	0x15b
	.4byte	0x1a4
	.byte	0x4
	.uleb128 0x13
	.4byte	.LASF108
	.byte	0x7
	.2byte	0x15c
	.4byte	0x799
	.byte	0x6
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x1a4
	.uleb128 0x12
	.4byte	.LASF109
	.byte	0x3c
	.byte	0x7
	.2byte	0x160
	.4byte	0x83c
	.uleb128 0x13
	.4byte	.LASF110
	.byte	0x7
	.2byte	0x163
	.4byte	0x615
	.byte	0
	.uleb128 0x13
	.4byte	.LASF111
	.byte	0x7
	.2byte	0x164
	.4byte	0x12e
	.byte	0x2
	.uleb128 0x13
	.4byte	.LASF112
	.byte	0x7
	.2byte	0x165
	.4byte	0x12e
	.byte	0x8
	.uleb128 0x13
	.4byte	.LASF113
	.byte	0x7
	.2byte	0x166
	.4byte	0x12e
	.byte	0xe
	.uleb128 0x13
	.4byte	.LASF114
	.byte	0x7
	.2byte	0x167
	.4byte	0x83c
	.byte	0x14
	.uleb128 0x13
	.4byte	.LASF115
	.byte	0x7
	.2byte	0x168
	.4byte	0x82
	.byte	0x1c
	.uleb128 0x13
	.4byte	.LASF116
	.byte	0x7
	.2byte	0x169
	.4byte	0x12e
	.byte	0x1e
	.uleb128 0x13
	.4byte	.LASF117
	.byte	0x7
	.2byte	0x16a
	.4byte	0x12e
	.byte	0x24
	.uleb128 0x13
	.4byte	.LASF118
	.byte	0x7
	.2byte	0x16b
	.4byte	0x12e
	.byte	0x2a
	.uleb128 0x13
	.4byte	.LASF119
	.byte	0x7
	.2byte	0x16c
	.4byte	0x12e
	.byte	0x30
	.uleb128 0x13
	.4byte	.LASF120
	.byte	0x7
	.2byte	0x16d
	.4byte	0x12e
	.byte	0x36
	.byte	0
	.uleb128 0x8
	.4byte	0x61b
	.4byte	0x84c
	.uleb128 0x9
	.4byte	0x89
	.byte	0x7
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x757
	.uleb128 0x17
	.byte	0x1
	.4byte	0x85e
	.uleb128 0x16
	.4byte	0x4c1
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x852
	.uleb128 0xf
	.byte	0x2
	.4byte	0x705
	.uleb128 0xf
	.byte	0x2
	.4byte	0x1ba
	.uleb128 0x17
	.byte	0x1
	.4byte	0x87c
	.uleb128 0x16
	.4byte	0x82
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x882
	.uleb128 0xf
	.byte	0x2
	.4byte	0x870
	.uleb128 0xf
	.byte	0x2
	.4byte	0x79f
	.uleb128 0x18
	.4byte	.LASF121
	.byte	0x7
	.2byte	0x1a3
	.4byte	0x376
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF122
	.byte	0x7
	.2byte	0x1a4
	.4byte	0x376
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF123
	.byte	0x7
	.2byte	0x1a5
	.4byte	0x376
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF124
	.byte	0x7
	.2byte	0x2fd
	.4byte	0x4c1
	.byte	0x1
	.byte	0x1
	.uleb128 0x18
	.4byte	.LASF125
	.byte	0x7
	.2byte	0x2fe
	.4byte	0x4c7
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.byte	0x3
	.byte	0x1
	.byte	0x56
	.4byte	0x8fb
	.uleb128 0xe
	.string	"x"
	.byte	0x1
	.byte	0x57
	.4byte	0x90
	.byte	0
	.uleb128 0xe
	.string	"y"
	.byte	0x1
	.byte	0x58
	.4byte	0x90
	.byte	0x1
	.uleb128 0xe
	.string	"z"
	.byte	0x1
	.byte	0x59
	.4byte	0x90
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF126
	.byte	0x1
	.byte	0x5a
	.4byte	0x8d4
	.uleb128 0x3
	.4byte	.LASF127
	.byte	0x1
	.byte	0x5c
	.4byte	0x8fb
	.uleb128 0x3
	.4byte	.LASF128
	.byte	0x1
	.byte	0x5d
	.4byte	0x91c
	.uleb128 0x8
	.4byte	0x906
	.4byte	0x92c
	.uleb128 0x9
	.4byte	0x89
	.byte	0x2
	.byte	0
	.uleb128 0xa
	.byte	0x4
	.byte	0x1
	.byte	0x5f
	.4byte	0x94d
	.uleb128 0xb
	.4byte	.LASF129
	.byte	0x1
	.byte	0x60
	.4byte	0x89
	.byte	0
	.uleb128 0xb
	.4byte	.LASF130
	.byte	0x1
	.byte	0x61
	.4byte	0x89
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.4byte	.LASF131
	.byte	0x1
	.byte	0x62
	.4byte	0x92c
	.uleb128 0x19
	.byte	0x2
	.4byte	0x89
	.byte	0x1
	.byte	0x64
	.4byte	0x971
	.uleb128 0x1a
	.4byte	.LASF132
	.byte	0
	.uleb128 0x1a
	.4byte	.LASF133
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.4byte	.LASF134
	.byte	0x1
	.byte	0x67
	.4byte	0x958
	.uleb128 0xa
	.byte	0x80
	.byte	0x1
	.byte	0x69
	.4byte	0x99d
	.uleb128 0xb
	.4byte	.LASF135
	.byte	0x1
	.byte	0x6a
	.4byte	0x99d
	.byte	0
	.uleb128 0xb
	.4byte	.LASF136
	.byte	0x1
	.byte	0x6b
	.4byte	0x99d
	.byte	0x40
	.byte	0
	.uleb128 0x8
	.4byte	0x94d
	.4byte	0x9ad
	.uleb128 0x9
	.4byte	0x89
	.byte	0xf
	.byte	0
	.uleb128 0x3
	.4byte	.LASF137
	.byte	0x1
	.byte	0x6c
	.4byte	0x97c
	.uleb128 0x19
	.byte	0x2
	.4byte	0x89
	.byte	0x1
	.byte	0x6e
	.4byte	0x9dd
	.uleb128 0x1a
	.4byte	.LASF138
	.byte	0x3
	.uleb128 0x1a
	.4byte	.LASF139
	.byte	0x2
	.uleb128 0x1a
	.4byte	.LASF140
	.byte	0x1
	.uleb128 0x1a
	.4byte	.LASF141
	.byte	0
	.byte	0
	.uleb128 0x3
	.4byte	.LASF142
	.byte	0x1
	.byte	0x73
	.4byte	0x9b8
	.uleb128 0xa
	.byte	0x6
	.byte	0x1
	.byte	0x75
	.4byte	0xa15
	.uleb128 0xb
	.4byte	.LASF143
	.byte	0x1
	.byte	0x76
	.4byte	0x89
	.byte	0
	.uleb128 0xb
	.4byte	.LASF144
	.byte	0x1
	.byte	0x77
	.4byte	0x89
	.byte	0x2
	.uleb128 0xb
	.4byte	.LASF145
	.byte	0x1
	.byte	0x78
	.4byte	0x89
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.4byte	.LASF146
	.byte	0x1
	.byte	0x79
	.4byte	0x9e8
	.uleb128 0x1b
	.4byte	.LASF147
	.byte	0x1
	.byte	0x80
	.4byte	0x89
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	count
	.uleb128 0x1b
	.4byte	.LASF148
	.byte	0x1
	.byte	0x81
	.4byte	0x9ad
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	model
	.uleb128 0x1c
	.4byte	.LASF149
	.byte	0x1
	.2byte	0x134
	.4byte	0x89
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	resultStationaryPct
	.uleb128 0x1c
	.4byte	.LASF150
	.byte	0x1
	.2byte	0x135
	.4byte	0x89
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	resultMovingPct
	.uleb128 0x1d
	.string	"sum"
	.byte	0x1
	.2byte	0x136
	.4byte	0x89
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	sum
	.uleb128 0x1e
	.byte	0x1
	.4byte	.LASF158
	.byte	0x1
	.2byte	0x278
	.4byte	0x82
	.4byte	.LFB18
	.4byte	.LFE18
	.byte	0x1
	.byte	0x9c
	.4byte	0xac1
	.uleb128 0x1f
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x27c
	.4byte	0x90
	.byte	0x2
	.byte	0x91
	.sleb128 -5
	.uleb128 0x20
	.4byte	.LBB4
	.4byte	.LBE4
	.uleb128 0x1f
	.4byte	.LASF152
	.byte	0x1
	.2byte	0x289
	.4byte	0x9dd
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.4byte	.LASF153
	.byte	0x1
	.2byte	0x244
	.byte	0x1
	.4byte	.LFB17
	.4byte	.LFE17
	.byte	0x1
	.byte	0x9c
	.uleb128 0x21
	.byte	0x1
	.4byte	.LASF154
	.byte	0x1
	.2byte	0x212
	.byte	0x1
	.4byte	.LFB16
	.4byte	.LFE16
	.byte	0x1
	.byte	0x9c
	.uleb128 0x22
	.byte	0x1
	.4byte	.LASF196
	.byte	0x1
	.2byte	0x201
	.4byte	.LFB15
	.4byte	.LFE15
	.byte	0x1
	.byte	0x9c
	.uleb128 0x23
	.byte	0x1
	.4byte	.LASF171
	.byte	0x1
	.2byte	0x1cc
	.byte	0x1
	.4byte	0x9dd
	.4byte	.LFB14
	.4byte	.LFE14
	.byte	0x1
	.byte	0x9c
	.4byte	0xb37
	.uleb128 0x24
	.4byte	.LASF151
	.byte	0x1
	.2byte	0x1cc
	.4byte	0xb37
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x1f
	.4byte	.LASF155
	.byte	0x1
	.2byte	0x1ce
	.4byte	0x90
	.byte	0x2
	.byte	0x91
	.sleb128 -3
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x90
	.uleb128 0x21
	.byte	0x1
	.4byte	.LASF156
	.byte	0x1
	.2byte	0x1c6
	.byte	0x1
	.4byte	.LFB13
	.4byte	.LFE13
	.byte	0x1
	.byte	0x9c
	.uleb128 0x21
	.byte	0x1
	.4byte	.LASF157
	.byte	0x1
	.2byte	0x1bb
	.byte	0x1
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x1
	.byte	0x9c
	.uleb128 0x25
	.byte	0x1
	.4byte	.LASF159
	.byte	0x1
	.2byte	0x1a0
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x1
	.byte	0x9c
	.4byte	0xbd6
	.uleb128 0x24
	.4byte	.LASF148
	.byte	0x1
	.2byte	0x1a0
	.4byte	0xbd6
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1f
	.4byte	.LASF160
	.byte	0x1
	.2byte	0x1a5
	.4byte	0xa15
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1f
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x1a8
	.4byte	0x911
	.byte	0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x1f
	.4byte	.LASF162
	.byte	0x1
	.2byte	0x1a9
	.4byte	0x94d
	.byte	0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x1f
	.4byte	.LASF163
	.byte	0x1
	.2byte	0x1aa
	.4byte	0x971
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.2byte	0x1ab
	.4byte	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x9ad
	.uleb128 0x25
	.byte	0x1
	.4byte	.LASF164
	.byte	0x1
	.2byte	0x180
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x9c
	.4byte	0xc2f
	.uleb128 0x24
	.4byte	.LASF165
	.byte	0x1
	.2byte	0x180
	.4byte	0xc2f
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.4byte	.LASF161
	.byte	0x1
	.2byte	0x182
	.4byte	0x911
	.byte	0x2
	.byte	0x91
	.sleb128 -13
	.uleb128 0x1f
	.4byte	.LASF162
	.byte	0x1
	.2byte	0x183
	.4byte	0x94d
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.2byte	0x184
	.4byte	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x94d
	.uleb128 0x25
	.byte	0x1
	.4byte	.LASF166
	.byte	0x1
	.2byte	0x172
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x9c
	.4byte	0xc6c
	.uleb128 0x1f
	.4byte	.LASF167
	.byte	0x1
	.2byte	0x174
	.4byte	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x1f
	.4byte	.LASF168
	.byte	0x1
	.2byte	0x175
	.4byte	0x906
	.byte	0x2
	.byte	0x91
	.sleb128 -7
	.byte	0
	.uleb128 0x25
	.byte	0x1
	.4byte	.LASF169
	.byte	0x1
	.2byte	0x138
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x9c
	.4byte	0xc94
	.uleb128 0x24
	.4byte	.LASF160
	.byte	0x1
	.2byte	0x138
	.4byte	0xc94
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0xa15
	.uleb128 0x25
	.byte	0x1
	.4byte	.LASF170
	.byte	0x1
	.2byte	0x11d
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x9c
	.4byte	0xcd1
	.uleb128 0x24
	.4byte	.LASF160
	.byte	0x1
	.2byte	0x11d
	.4byte	0xc94
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x24
	.4byte	.LASF163
	.byte	0x1
	.2byte	0x11d
	.4byte	0x971
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.byte	0
	.uleb128 0x27
	.byte	0x1
	.4byte	.LASF172
	.byte	0x1
	.byte	0xeb
	.byte	0x1
	.4byte	0x971
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x9c
	.4byte	0xd92
	.uleb128 0x28
	.4byte	.LASF162
	.byte	0x1
	.byte	0xeb
	.4byte	0xc2f
	.byte	0x2
	.byte	0x91
	.sleb128 -30
	.uleb128 0x28
	.4byte	.LASF148
	.byte	0x1
	.byte	0xeb
	.4byte	0xbd6
	.byte	0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x29
	.4byte	.LASF173
	.byte	0x1
	.byte	0xed
	.4byte	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x29
	.4byte	.LASF174
	.byte	0x1
	.byte	0xee
	.4byte	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x29
	.4byte	.LASF175
	.byte	0x1
	.byte	0xef
	.4byte	0xc2f
	.byte	0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x2a
	.string	"i"
	.byte	0x1
	.byte	0xf0
	.4byte	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x1f
	.4byte	.LASF163
	.byte	0x1
	.2byte	0x116
	.4byte	0x971
	.byte	0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x20
	.4byte	.LBB3
	.4byte	.LBE3
	.uleb128 0x29
	.4byte	.LASF176
	.byte	0x1
	.byte	0xf7
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x29
	.4byte	.LASF177
	.byte	0x1
	.byte	0xfb
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1f
	.4byte	.LASF178
	.byte	0x1
	.2byte	0x101
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x1f
	.4byte	.LASF179
	.byte	0x1
	.2byte	0x105
	.4byte	0x5b
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x2b
	.byte	0x1
	.4byte	.LASF180
	.byte	0x1
	.byte	0xb9
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x9c
	.4byte	0xe0a
	.uleb128 0x28
	.4byte	.LASF162
	.byte	0x1
	.byte	0xb9
	.4byte	0xc2f
	.byte	0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x28
	.4byte	.LASF181
	.byte	0x1
	.byte	0xb9
	.4byte	0xe0a
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x29
	.4byte	.LASF182
	.byte	0x1
	.byte	0xbd
	.4byte	0x906
	.byte	0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x29
	.4byte	.LASF183
	.byte	0x1
	.byte	0xbe
	.4byte	0x906
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2a
	.string	"i"
	.byte	0x1
	.byte	0xc2
	.4byte	0x82
	.byte	0x2
	.byte	0x91
	.sleb128 -14
	.uleb128 0x29
	.4byte	.LASF129
	.byte	0x1
	.byte	0xe2
	.4byte	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x29
	.4byte	.LASF130
	.byte	0x1
	.byte	0xe3
	.4byte	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x906
	.uleb128 0x2b
	.byte	0x1
	.4byte	.LASF184
	.byte	0x1
	.byte	0xa2
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x9c
	.4byte	0xe5a
	.uleb128 0x28
	.4byte	.LASF185
	.byte	0x1
	.byte	0xa2
	.4byte	0xe0a
	.byte	0x2
	.byte	0x91
	.sleb128 -8
	.uleb128 0x2a
	.string	"i"
	.byte	0x1
	.byte	0xa4
	.4byte	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.uleb128 0x20
	.4byte	.LBB2
	.4byte	.LBE2
	.uleb128 0x29
	.4byte	.LASF168
	.byte	0x1
	.byte	0xa9
	.4byte	0xe0a
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.byte	0
	.byte	0
	.uleb128 0x2b
	.byte	0x1
	.4byte	.LASF186
	.byte	0x1
	.byte	0x93
	.byte	0x1
	.4byte	.LFB3
	.4byte	.LFE3
	.byte	0x1
	.byte	0x9c
	.4byte	0xe9c
	.uleb128 0x28
	.4byte	.LASF185
	.byte	0x1
	.byte	0x93
	.4byte	0xe0a
	.byte	0x2
	.byte	0x91
	.sleb128 -10
	.uleb128 0x29
	.4byte	.LASF168
	.byte	0x1
	.byte	0x95
	.4byte	0x906
	.byte	0x2
	.byte	0x91
	.sleb128 -7
	.uleb128 0x29
	.4byte	.LASF187
	.byte	0x1
	.byte	0x96
	.4byte	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0x2b
	.byte	0x1
	.4byte	.LASF188
	.byte	0x1
	.byte	0x83
	.byte	0x1
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0x1
	.byte	0x9c
	.4byte	0xee1
	.uleb128 0x28
	.4byte	.LASF189
	.byte	0x1
	.byte	0x83
	.4byte	0xee1
	.byte	0x2
	.byte	0x91
	.sleb128 -6
	.uleb128 0x29
	.4byte	.LASF190
	.byte	0x1
	.byte	0x86
	.4byte	0x89
	.byte	0x5
	.byte	0x3
	.4byte	_v_seed.2309
	.uleb128 0x29
	.4byte	.LASF191
	.byte	0x1
	.byte	0x88
	.4byte	0x89
	.byte	0x2
	.byte	0x91
	.sleb128 -4
	.byte	0
	.uleb128 0xf
	.byte	0x2
	.4byte	0x8fb
	.uleb128 0x2c
	.byte	0x1
	.4byte	.LASF192
	.byte	0x1
	.byte	0x1d
	.byte	0x1
	.4byte	0x9b
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x1
	.byte	0x9c
	.uleb128 0x2d
	.string	"x"
	.byte	0x1
	.byte	0x1d
	.4byte	0xa6
	.byte	0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x2a
	.string	"hi"
	.byte	0x1
	.byte	0x1f
	.4byte	0x9b
	.byte	0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x2a
	.string	"lo"
	.byte	0x1
	.byte	0x20
	.4byte	0x9b
	.byte	0x2
	.byte	0x91
	.sleb128 -18
	.uleb128 0x2a
	.string	"mid"
	.byte	0x1
	.byte	0x21
	.4byte	0x9b
	.byte	0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x2a
	.string	"s"
	.byte	0x1
	.byte	0x22
	.4byte	0xa6
	.byte	0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x26
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x27
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x28
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x29
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2b
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x2c
	.uleb128 0x2e
	.byte	0x1
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x2d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
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
	.file 8 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdint.h"
	.byte	0x3
	.uleb128 0x5
	.uleb128 0x8
	.file 9 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdint.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x9
	.byte	0x1
	.uleb128 0xa
	.string	"_STDINT_H "
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x6
	.string	"_MACHINE__DEFAULT_TYPES_H "
	.file 10 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/features.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0xa
	.byte	0x1
	.uleb128 0x16
	.string	"_SYS_FEATURES_H "
	.file 11 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_newlib_version.h"
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x4
	.string	"_NEWLIB_VERSION_H__ 1"
	.byte	0x1
	.uleb128 0x6
	.string	"_NEWLIB_VERSION \"2.4.0\""
	.byte	0x1
	.uleb128 0x7
	.string	"__NEWLIB__ 2"
	.byte	0x1
	.uleb128 0x8
	.string	"__NEWLIB_MINOR__ 4"
	.byte	0x1
	.uleb128 0x9
	.string	"__NEWLIB_PATCHLEVEL__ 0"
	.byte	0x4
	.byte	0x1
	.uleb128 0x21
	.string	"__GNUC_PREREQ(maj,min) ((__GNUC__ << 16) + __GNUC_MINOR__ >= ((maj) << 16) + (min))"
	.byte	0x1
	.uleb128 0x28
	.string	"__GNUC_PREREQ__(ma,mi) __GNUC_PREREQ(ma, mi)"
	.byte	0x1
	.uleb128 0xf4
	.string	"__ATFILE_VISIBLE 0"
	.byte	0x1
	.uleb128 0xfa
	.string	"__BSD_VISIBLE 0"
	.byte	0x1
	.uleb128 0x100
	.string	"__GNU_VISIBLE 0"
	.byte	0x1
	.uleb128 0x108
	.string	"__ISO_C_VISIBLE 1999"
	.byte	0x1
	.uleb128 0x110
	.string	"__LARGEFILE_VISIBLE 0"
	.byte	0x1
	.uleb128 0x116
	.string	"__MISC_VISIBLE 0"
	.byte	0x1
	.uleb128 0x126
	.string	"__POSIX_VISIBLE 0"
	.byte	0x1
	.uleb128 0x12c
	.string	"__SVID_VISIBLE 0"
	.byte	0x1
	.uleb128 0x13a
	.string	"__XSI_VISIBLE 0"
	.byte	0x4
	.byte	0x1
	.uleb128 0xf
	.string	"__EXP(x) __ ##x ##__"
	.byte	0x1
	.uleb128 0x21
	.string	"___int8_t_defined 1"
	.byte	0x1
	.uleb128 0x2f
	.string	"___int16_t_defined 1"
	.byte	0x1
	.uleb128 0x45
	.string	"___int32_t_defined 1"
	.byte	0x1
	.uleb128 0x5f
	.string	"___int64_t_defined 1"
	.byte	0x1
	.uleb128 0x7e
	.string	"___int_least8_t_defined 1"
	.byte	0x1
	.uleb128 0x98
	.string	"___int_least16_t_defined 1"
	.byte	0x1
	.uleb128 0xae
	.string	"___int_least32_t_defined 1"
	.byte	0x1
	.uleb128 0xc0
	.string	"___int_least64_t_defined 1"
	.byte	0x2
	.uleb128 0xd6
	.string	"__EXP"
	.byte	0x4
	.file 12 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/_intsup.h"
	.byte	0x3
	.uleb128 0xd
	.uleb128 0xc
	.byte	0x1
	.uleb128 0xa
	.string	"_SYS__INTSUP_H "
	.byte	0x1
	.uleb128 0x10
	.string	"__STDINT_EXP(x) __ ##x ##__"
	.byte	0x1
	.uleb128 0x1a
	.string	"__have_longlong64 1"
	.byte	0x1
	.uleb128 0x21
	.string	"__have_long32 1"
	.byte	0x2
	.uleb128 0x38
	.string	"signed"
	.byte	0x2
	.uleb128 0x39
	.string	"unsigned"
	.byte	0x2
	.uleb128 0x3a
	.string	"char"
	.byte	0x2
	.uleb128 0x3b
	.string	"short"
	.byte	0x2
	.uleb128 0x3c
	.string	"int"
	.byte	0x2
	.uleb128 0x3d
	.string	"__int20"
	.byte	0x2
	.uleb128 0x3e
	.string	"long"
	.byte	0x1
	.uleb128 0x3f
	.string	"signed +0"
	.byte	0x1
	.uleb128 0x40
	.string	"unsigned +0"
	.byte	0x1
	.uleb128 0x41
	.string	"char +0"
	.byte	0x1
	.uleb128 0x42
	.string	"short +1"
	.byte	0x1
	.uleb128 0x43
	.string	"__int20 +2"
	.byte	0x1
	.uleb128 0x44
	.string	"int +2"
	.byte	0x1
	.uleb128 0x45
	.string	"long +4"
	.byte	0x1
	.uleb128 0x4e
	.string	"_INTPTR_EQ_INT "
	.byte	0x1
	.uleb128 0x55
	.string	"_INT32_EQ_LONG "
	.byte	0x1
	.uleb128 0x5d
	.string	"__INT8 \"hh\""
	.byte	0x1
	.uleb128 0x68
	.string	"__INT16 \"h\""
	.byte	0x1
	.uleb128 0x73
	.string	"__INT32 \"l\""
	.byte	0x1
	.uleb128 0x7c
	.string	"__INT64 \"ll\""
	.byte	0x1
	.uleb128 0x83
	.string	"__FAST8 "
	.byte	0x1
	.uleb128 0x8c
	.string	"__FAST16 "
	.byte	0x1
	.uleb128 0x95
	.string	"__FAST32 \"l\""
	.byte	0x1
	.uleb128 0x9e
	.string	"__FAST64 \"ll\""
	.byte	0x1
	.uleb128 0xa2
	.string	"__LEAST8 \"hh\""
	.byte	0x1
	.uleb128 0xad
	.string	"__LEAST16 \"h\""
	.byte	0x1
	.uleb128 0xb8
	.string	"__LEAST32 \"l\""
	.byte	0x1
	.uleb128 0xc1
	.string	"__LEAST64 \"ll\""
	.byte	0x2
	.uleb128 0xc3
	.string	"signed"
	.byte	0x2
	.uleb128 0xc4
	.string	"unsigned"
	.byte	0x2
	.uleb128 0xc5
	.string	"char"
	.byte	0x2
	.uleb128 0xc6
	.string	"short"
	.byte	0x2
	.uleb128 0xc7
	.string	"int"
	.byte	0x2
	.uleb128 0xc8
	.string	"long"
	.byte	0x2
	.uleb128 0xcd
	.string	"__int20"
	.byte	0x4
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x3
	.byte	0x1
	.uleb128 0xa
	.string	"_SYS__STDINT_H "
	.byte	0x1
	.uleb128 0x15
	.string	"__int8_t_defined 1"
	.byte	0x1
	.uleb128 0x1b
	.string	"__int16_t_defined 1"
	.byte	0x1
	.uleb128 0x21
	.string	"__int32_t_defined 1"
	.byte	0x1
	.uleb128 0x27
	.string	"__int64_t_defined 1"
	.byte	0x4
	.byte	0x1
	.uleb128 0x17
	.string	"__int_least8_t_defined 1"
	.byte	0x1
	.uleb128 0x1d
	.string	"__int_least16_t_defined 1"
	.byte	0x1
	.uleb128 0x23
	.string	"__int_least32_t_defined 1"
	.byte	0x1
	.uleb128 0x29
	.string	"__int_least64_t_defined 1"
	.byte	0x1
	.uleb128 0x35
	.string	"__int_fast8_t_defined 1"
	.byte	0x1
	.uleb128 0x3f
	.string	"__int_fast16_t_defined 1"
	.byte	0x1
	.uleb128 0x49
	.string	"__int_fast32_t_defined 1"
	.byte	0x1
	.uleb128 0x53
	.string	"__int_fast64_t_defined 1"
	.byte	0x1
	.uleb128 0x93
	.string	"INTPTR_MIN (-__INTPTR_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x94
	.string	"INTPTR_MAX (__INTPTR_MAX__)"
	.byte	0x1
	.uleb128 0x95
	.string	"UINTPTR_MAX (__UINTPTR_MAX__)"
	.byte	0x1
	.uleb128 0xab
	.string	"INT8_MIN (-__INT8_MAX__ - 1)"
	.byte	0x1
	.uleb128 0xac
	.string	"INT8_MAX (__INT8_MAX__)"
	.byte	0x1
	.uleb128 0xad
	.string	"UINT8_MAX (__UINT8_MAX__)"
	.byte	0x1
	.uleb128 0xb5
	.string	"INT_LEAST8_MIN (-__INT_LEAST8_MAX__ - 1)"
	.byte	0x1
	.uleb128 0xb6
	.string	"INT_LEAST8_MAX (__INT_LEAST8_MAX__)"
	.byte	0x1
	.uleb128 0xb7
	.string	"UINT_LEAST8_MAX (__UINT_LEAST8_MAX__)"
	.byte	0x1
	.uleb128 0xc1
	.string	"INT16_MIN (-__INT16_MAX__ - 1)"
	.byte	0x1
	.uleb128 0xc2
	.string	"INT16_MAX (__INT16_MAX__)"
	.byte	0x1
	.uleb128 0xc3
	.string	"UINT16_MAX (__UINT16_MAX__)"
	.byte	0x1
	.uleb128 0xcb
	.string	"INT_LEAST16_MIN (-__INT_LEAST16_MAX__ - 1)"
	.byte	0x1
	.uleb128 0xcc
	.string	"INT_LEAST16_MAX (__INT_LEAST16_MAX__)"
	.byte	0x1
	.uleb128 0xcd
	.string	"UINT_LEAST16_MAX (__UINT_LEAST16_MAX__)"
	.byte	0x1
	.uleb128 0xd7
	.string	"INT32_MIN (-__INT32_MAX__ - 1)"
	.byte	0x1
	.uleb128 0xd8
	.string	"INT32_MAX (__INT32_MAX__)"
	.byte	0x1
	.uleb128 0xd9
	.string	"UINT32_MAX (__UINT32_MAX__)"
	.byte	0x1
	.uleb128 0xe7
	.string	"INT_LEAST32_MIN (-__INT_LEAST32_MAX__ - 1)"
	.byte	0x1
	.uleb128 0xe8
	.string	"INT_LEAST32_MAX (__INT_LEAST32_MAX__)"
	.byte	0x1
	.uleb128 0xe9
	.string	"UINT_LEAST32_MAX (__UINT_LEAST32_MAX__)"
	.byte	0x1
	.uleb128 0xf9
	.string	"INT64_MIN (-__INT64_MAX__ - 1)"
	.byte	0x1
	.uleb128 0xfa
	.string	"INT64_MAX (__INT64_MAX__)"
	.byte	0x1
	.uleb128 0xfb
	.string	"UINT64_MAX (__UINT64_MAX__)"
	.byte	0x1
	.uleb128 0x109
	.string	"INT_LEAST64_MIN (-__INT_LEAST64_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x10a
	.string	"INT_LEAST64_MAX (__INT_LEAST64_MAX__)"
	.byte	0x1
	.uleb128 0x10b
	.string	"UINT_LEAST64_MAX (__UINT_LEAST64_MAX__)"
	.byte	0x1
	.uleb128 0x119
	.string	"INT_FAST8_MIN (-__INT_FAST8_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x11a
	.string	"INT_FAST8_MAX (__INT_FAST8_MAX__)"
	.byte	0x1
	.uleb128 0x11b
	.string	"UINT_FAST8_MAX (__UINT_FAST8_MAX__)"
	.byte	0x1
	.uleb128 0x129
	.string	"INT_FAST16_MIN (-__INT_FAST16_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x12a
	.string	"INT_FAST16_MAX (__INT_FAST16_MAX__)"
	.byte	0x1
	.uleb128 0x12b
	.string	"UINT_FAST16_MAX (__UINT_FAST16_MAX__)"
	.byte	0x1
	.uleb128 0x139
	.string	"INT_FAST32_MIN (-__INT_FAST32_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x13a
	.string	"INT_FAST32_MAX (__INT_FAST32_MAX__)"
	.byte	0x1
	.uleb128 0x13b
	.string	"UINT_FAST32_MAX (__UINT_FAST32_MAX__)"
	.byte	0x1
	.uleb128 0x149
	.string	"INT_FAST64_MIN (-__INT_FAST64_MAX__ - 1)"
	.byte	0x1
	.uleb128 0x14a
	.string	"INT_FAST64_MAX (__INT_FAST64_MAX__)"
	.byte	0x1
	.uleb128 0x14b
	.string	"UINT_FAST64_MAX (__UINT_FAST64_MAX__)"
	.byte	0x1
	.uleb128 0x159
	.string	"INTMAX_MAX (__INTMAX_MAX__)"
	.byte	0x1
	.uleb128 0x15a
	.string	"INTMAX_MIN (-INTMAX_MAX - 1)"
	.byte	0x1
	.uleb128 0x162
	.string	"UINTMAX_MAX (__UINTMAX_MAX__)"
	.byte	0x1
	.uleb128 0x16a
	.string	"SIZE_MAX (__SIZE_MAX__)"
	.byte	0x1
	.uleb128 0x170
	.string	"SIG_ATOMIC_MIN (-__STDINT_EXP(INT_MAX) - 1)"
	.byte	0x1
	.uleb128 0x171
	.string	"SIG_ATOMIC_MAX (__STDINT_EXP(INT_MAX))"
	.byte	0x1
	.uleb128 0x175
	.string	"PTRDIFF_MAX (__PTRDIFF_MAX__)"
	.byte	0x1
	.uleb128 0x179
	.string	"PTRDIFF_MIN (-PTRDIFF_MAX - 1)"
	.byte	0x1
	.uleb128 0x17e
	.string	"WCHAR_MIN (__WCHAR_MIN__)"
	.byte	0x1
	.uleb128 0x189
	.string	"WCHAR_MAX (__WCHAR_MAX__)"
	.byte	0x1
	.uleb128 0x193
	.string	"WINT_MAX (__WINT_MAX__)"
	.byte	0x1
	.uleb128 0x198
	.string	"WINT_MIN (__WINT_MIN__)"
	.byte	0x1
	.uleb128 0x19f
	.string	"INT8_C(x) __INT8_C(x)"
	.byte	0x1
	.uleb128 0x1a0
	.string	"UINT8_C(x) __UINT8_C(x)"
	.byte	0x1
	.uleb128 0x1ab
	.string	"INT16_C(x) __INT16_C(x)"
	.byte	0x1
	.uleb128 0x1ac
	.string	"UINT16_C(x) __UINT16_C(x)"
	.byte	0x1
	.uleb128 0x1b7
	.string	"INT32_C(x) __INT32_C(x)"
	.byte	0x1
	.uleb128 0x1b8
	.string	"UINT32_C(x) __UINT32_C(x)"
	.byte	0x1
	.uleb128 0x1c4
	.string	"INT64_C(x) __INT64_C(x)"
	.byte	0x1
	.uleb128 0x1c5
	.string	"UINT64_C(x) __UINT64_C(x)"
	.byte	0x1
	.uleb128 0x1d4
	.string	"INTMAX_C(x) __INTMAX_C(x)"
	.byte	0x1
	.uleb128 0x1d5
	.string	"UINTMAX_C(x) __UINTMAX_C(x)"
	.byte	0x4
	.byte	0x1
	.uleb128 0xd
	.string	"_GCC_WRAP_STDINT_H "
	.byte	0x4
	.file 13 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdbool.h"
	.byte	0x3
	.uleb128 0x6
	.uleb128 0xd
	.byte	0x1
	.uleb128 0x1d
	.string	"_STDBOOL_H "
	.byte	0x1
	.uleb128 0x21
	.string	"bool _Bool"
	.byte	0x1
	.uleb128 0x22
	.string	"true 1"
	.byte	0x1
	.uleb128 0x23
	.string	"false 0"
	.byte	0x1
	.uleb128 0x34
	.string	"__bool_true_false_are_defined 1"
	.byte	0x4
	.file 14 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdio.h"
	.byte	0x3
	.uleb128 0x7
	.uleb128 0xe
	.byte	0x1
	.uleb128 0x1b
	.string	"_STDIO_H_ "
	.file 15 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/_ansi.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0xf
	.byte	0x1
	.uleb128 0xd
	.string	"_ANSIDECL_H_ "
	.file 16 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/newlib.h"
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x10
	.byte	0x1
	.uleb128 0x8
	.string	"__NEWLIB_H__ 1"
	.byte	0x1
	.uleb128 0x28
	.string	"_MB_LEN_MAX 1"
	.byte	0x1
	.uleb128 0x32
	.string	"HAVE_INITFINI_ARRAY 1"
	.byte	0x1
	.uleb128 0x36
	.string	"_ATEXIT_DYNAMIC_ALLOC 1"
	.byte	0x1
	.uleb128 0x39
	.string	"_HAVE_LONG_DOUBLE 1"
	.byte	0x1
	.uleb128 0x3c
	.string	"_HAVE_CC_INHIBIT_LOOP_TO_LIBCALL 1"
	.byte	0x1
	.uleb128 0x3f
	.string	"_LDBL_EQ_DBL 1"
	.byte	0x1
	.uleb128 0x42
	.string	"_FVWRITE_IN_STREAMIO 1"
	.byte	0x1
	.uleb128 0x45
	.string	"_FSEEK_OPTIMIZATION 1"
	.byte	0x1
	.uleb128 0x48
	.string	"_WIDE_ORIENT 1"
	.byte	0x1
	.uleb128 0x4b
	.string	"_UNBUF_STREAM_OPT 1"
	.byte	0x1
	.uleb128 0x54
	.string	"_NANO_FORMATTED_IO 1"
	.byte	0x4
	.file 17 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/config.h"
	.byte	0x3
	.uleb128 0x10
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x2
	.string	"__SYS_CONFIG_H__ "
	.file 18 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/ieeefp.h"
	.byte	0x3
	.uleb128 0x4
	.uleb128 0x12
	.byte	0x1
	.uleb128 0x17b
	.string	"__IEEE_LITTLE_ENDIAN "
	.byte	0x1
	.uleb128 0x17c
	.string	"__SMALL_BITFIELDS "
	.byte	0x4
	.byte	0x1
	.uleb128 0x9b
	.string	"_REENT_SMALL "
	.byte	0x1
	.uleb128 0x9e
	.string	"__BUFSIZ__ 256"
	.byte	0x1
	.uleb128 0x9f
	.string	"__SMALL_BITFIELDS "
	.byte	0x1
	.uleb128 0xa4
	.string	"_POINTER_INT int"
	.byte	0x2
	.uleb128 0xe3
	.string	"__RAND_MAX"
	.byte	0x1
	.uleb128 0xe5
	.string	"__RAND_MAX 32767"
	.byte	0x1
	.uleb128 0xf6
	.string	"__EXPORT "
	.byte	0x1
	.uleb128 0xfa
	.string	"__IMPORT "
	.byte	0x1
	.uleb128 0x101
	.string	"_READ_WRITE_RETURN_TYPE int"
	.byte	0x1
	.uleb128 0x107
	.string	"_READ_WRITE_BUFSIZE_TYPE int"
	.byte	0x4
	.byte	0x1
	.uleb128 0x17
	.string	"_HAVE_STDC "
	.byte	0x1
	.uleb128 0x2c
	.string	"_BEGIN_STD_C "
	.byte	0x1
	.uleb128 0x2d
	.string	"_END_STD_C "
	.byte	0x1
	.uleb128 0x2e
	.string	"_NOTHROW "
	.byte	0x1
	.uleb128 0x32
	.string	"_PTR void *"
	.byte	0x1
	.uleb128 0x33
	.string	"_AND ,"
	.byte	0x1
	.uleb128 0x34
	.string	"_NOARGS void"
	.byte	0x1
	.uleb128 0x35
	.string	"_CONST const"
	.byte	0x1
	.uleb128 0x36
	.string	"_VOLATILE volatile"
	.byte	0x1
	.uleb128 0x37
	.string	"_SIGNED signed"
	.byte	0x1
	.uleb128 0x38
	.string	"_DOTS , ..."
	.byte	0x1
	.uleb128 0x39
	.string	"_VOID void"
	.byte	0x1
	.uleb128 0x40
	.string	"_EXFUN_NOTHROW(name,proto) name proto _NOTHROW"
	.byte	0x1
	.uleb128 0x41
	.string	"_EXFUN(name,proto) name proto"
	.byte	0x1
	.uleb128 0x42
	.string	"_EXPARM(name,proto) (* name) proto"
	.byte	0x1
	.uleb128 0x43
	.string	"_EXFNPTR(name,proto) (* name) proto"
	.byte	0x1
	.uleb128 0x45
	.string	"_DEFUN(name,arglist,args) name(args)"
	.byte	0x1
	.uleb128 0x46
	.string	"_DEFUN_VOID(name) name(_NOARGS)"
	.byte	0x1
	.uleb128 0x47
	.string	"_CAST_VOID (void)"
	.byte	0x1
	.uleb128 0x49
	.string	"_LONG_DOUBLE long double"
	.byte	0x1
	.uleb128 0x4c
	.string	"_PARAMS(paramlist) paramlist"
	.byte	0x1
	.uleb128 0x65
	.string	"_ATTRIBUTE(attrs) __attribute__ (attrs)"
	.byte	0x1
	.uleb128 0x7f
	.string	"_ELIDABLE_INLINE static __inline__"
	.byte	0x1
	.uleb128 0x83
	.string	"_NOINLINE __attribute__ ((__noinline__))"
	.byte	0x1
	.uleb128 0x84
	.string	"_NOINLINE_STATIC _NOINLINE static"
	.byte	0x4
	.byte	0x1
	.uleb128 0x1f
	.string	"_FSTDIO "
	.byte	0x1
	.uleb128 0x21
	.string	"__need_size_t "
	.byte	0x1
	.uleb128 0x22
	.string	"__need_NULL "
	.file 19 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/cdefs.h"
	.byte	0x3
	.uleb128 0x23
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x29
	.string	"_SYS_CDEFS_H_ "
	.byte	0x3
	.uleb128 0x2d
	.uleb128 0x6
	.byte	0x1
	.uleb128 0xbb
	.string	"__size_t__ "
	.byte	0x1
	.uleb128 0xbc
	.string	"__SIZE_T__ "
	.byte	0x1
	.uleb128 0xbd
	.string	"_SIZE_T "
	.byte	0x1
	.uleb128 0xbe
	.string	"_SYS_SIZE_T_H "
	.byte	0x1
	.uleb128 0xbf
	.string	"_T_SIZE_ "
	.byte	0x1
	.uleb128 0xc0
	.string	"_T_SIZE "
	.byte	0x1
	.uleb128 0xc1
	.string	"__SIZE_T "
	.byte	0x1
	.uleb128 0xc2
	.string	"_SIZE_T_ "
	.byte	0x1
	.uleb128 0xc3
	.string	"_BSD_SIZE_T_ "
	.byte	0x1
	.uleb128 0xc4
	.string	"_SIZE_T_DEFINED_ "
	.byte	0x1
	.uleb128 0xc5
	.string	"_SIZE_T_DEFINED "
	.byte	0x1
	.uleb128 0xc6
	.string	"_BSD_SIZE_T_DEFINED_ "
	.byte	0x1
	.uleb128 0xc7
	.string	"_SIZE_T_DECLARED "
	.byte	0x1
	.uleb128 0xc8
	.string	"___int_size_t_h "
	.byte	0x1
	.uleb128 0xc9
	.string	"_GCC_SIZE_T "
	.byte	0x1
	.uleb128 0xca
	.string	"_SIZET_ "
	.byte	0x1
	.uleb128 0xd2
	.string	"__size_t "
	.byte	0x2
	.uleb128 0xee
	.string	"__need_size_t"
	.byte	0x2
	.uleb128 0x191
	.string	"NULL"
	.byte	0x1
	.uleb128 0x196
	.string	"NULL ((void *)0)"
	.byte	0x2
	.uleb128 0x19c
	.string	"__need_NULL"
	.byte	0x4
	.byte	0x1
	.uleb128 0x2f
	.string	"__PMT(args) args"
	.byte	0x1
	.uleb128 0x30
	.string	"__DOTS , ..."
	.byte	0x1
	.uleb128 0x31
	.string	"__THROW "
	.byte	0x1
	.uleb128 0x34
	.string	"__ASMNAME(cname) __XSTRING (__USER_LABEL_PREFIX__) cname"
	.byte	0x1
	.uleb128 0x37
	.string	"__ptr_t void *"
	.byte	0x1
	.uleb128 0x38
	.string	"__long_double_t long double"
	.byte	0x1
	.uleb128 0x3a
	.string	"__attribute_malloc__ "
	.byte	0x1
	.uleb128 0x3b
	.string	"__attribute_pure__ "
	.byte	0x1
	.uleb128 0x3c
	.string	"__attribute_format_strfmon__(a,b) "
	.byte	0x1
	.uleb128 0x3d
	.string	"__flexarr [0]"
	.byte	0x1
	.uleb128 0x40
	.string	"__bounded "
	.byte	0x1
	.uleb128 0x41
	.string	"__unbounded "
	.byte	0x1
	.uleb128 0x42
	.string	"__ptrvalue "
	.byte	0x1
	.uleb128 0x4c
	.string	"__has_extension __has_feature"
	.byte	0x1
	.uleb128 0x4f
	.string	"__has_feature(x) 0"
	.byte	0x1
	.uleb128 0x55
	.string	"__has_builtin(x) 0"
	.byte	0x1
	.uleb128 0x5c
	.string	"__BEGIN_DECLS "
	.byte	0x1
	.uleb128 0x5d
	.string	"__END_DECLS "
	.byte	0x1
	.uleb128 0x69
	.string	"__GNUCLIKE_ASM 3"
	.byte	0x1
	.uleb128 0x6a
	.string	"__GNUCLIKE_MATH_BUILTIN_CONSTANTS "
	.byte	0x1
	.uleb128 0x6e
	.string	"__GNUCLIKE___TYPEOF 1"
	.byte	0x1
	.uleb128 0x6f
	.string	"__GNUCLIKE___OFFSETOF 1"
	.byte	0x1
	.uleb128 0x70
	.string	"__GNUCLIKE___SECTION 1"
	.byte	0x1
	.uleb128 0x73
	.string	"__GNUCLIKE_CTOR_SECTION_HANDLING 1"
	.byte	0x1
	.uleb128 0x76
	.string	"__GNUCLIKE_BUILTIN_CONSTANT_P 1"
	.byte	0x1
	.uleb128 0x7d
	.string	"__GNUCLIKE_BUILTIN_VARARGS 1"
	.byte	0x1
	.uleb128 0x7e
	.string	"__GNUCLIKE_BUILTIN_STDARG 1"
	.byte	0x1
	.uleb128 0x7f
	.string	"__GNUCLIKE_BUILTIN_VAALIST 1"
	.byte	0x1
	.uleb128 0x83
	.string	"__GNUC_VA_LIST_COMPATIBILITY 1"
	.byte	0x1
	.uleb128 0x8a
	.string	"__compiler_membar() __asm __volatile(\" \" : : : \"memory\")"
	.byte	0x1
	.uleb128 0x8e
	.string	"__GNUCLIKE_BUILTIN_NEXT_ARG 1"
	.byte	0x1
	.uleb128 0x8f
	.string	"__GNUCLIKE_MATH_BUILTIN_RELOPS "
	.byte	0x1
	.uleb128 0x92
	.string	"__GNUCLIKE_BUILTIN_MEMCPY 1"
	.byte	0x1
	.uleb128 0x95
	.string	"__CC_SUPPORTS_INLINE 1"
	.byte	0x1
	.uleb128 0x96
	.string	"__CC_SUPPORTS___INLINE 1"
	.byte	0x1
	.uleb128 0x97
	.string	"__CC_SUPPORTS___INLINE__ 1"
	.byte	0x1
	.uleb128 0x99
	.string	"__CC_SUPPORTS___FUNC__ 1"
	.byte	0x1
	.uleb128 0x9a
	.string	"__CC_SUPPORTS_WARNING 1"
	.byte	0x1
	.uleb128 0x9c
	.string	"__CC_SUPPORTS_VARADIC_XXX 1"
	.byte	0x1
	.uleb128 0x9e
	.string	"__CC_SUPPORTS_DYNAMIC_ARRAY_INIT 1"
	.byte	0x1
	.uleb128 0xaf
	.string	"__P(protos) protos"
	.byte	0x1
	.uleb128 0xb0
	.string	"__CONCAT1(x,y) x ## y"
	.byte	0x1
	.uleb128 0xb1
	.string	"__CONCAT(x,y) __CONCAT1(x,y)"
	.byte	0x1
	.uleb128 0xb2
	.string	"__STRING(x) #x"
	.byte	0x1
	.uleb128 0xb3
	.string	"__XSTRING(x) __STRING(x)"
	.byte	0x1
	.uleb128 0xb5
	.string	"__const const"
	.byte	0x1
	.uleb128 0xb6
	.string	"__signed signed"
	.byte	0x1
	.uleb128 0xb7
	.string	"__volatile volatile"
	.byte	0x1
	.uleb128 0xef
	.string	"__weak_symbol __attribute__((__weak__))"
	.byte	0x1
	.uleb128 0xfc
	.string	"__dead2 __attribute__((__noreturn__))"
	.byte	0x1
	.uleb128 0xfd
	.string	"__pure2 __attribute__((__const__))"
	.byte	0x1
	.uleb128 0xfe
	.string	"__unused __attribute__((__unused__))"
	.byte	0x1
	.uleb128 0xff
	.string	"__used __attribute__((__used__))"
	.byte	0x1
	.uleb128 0x100
	.string	"__packed __attribute__((__packed__))"
	.byte	0x1
	.uleb128 0x101
	.string	"__aligned(x) __attribute__((__aligned__(x)))"
	.byte	0x1
	.uleb128 0x102
	.string	"__section(x) __attribute__((__section__(x)))"
	.byte	0x1
	.uleb128 0x105
	.string	"__alloc_size(x) __attribute__((__alloc_size__(x)))"
	.byte	0x1
	.uleb128 0x10a
	.string	"__alloc_align(x) __attribute__((__alloc_align__(x)))"
	.byte	0x1
	.uleb128 0x120
	.string	"_Alignas(x) __aligned(x)"
	.byte	0x1
	.uleb128 0x127
	.string	"_Alignof(x) __alignof(x)"
	.byte	0x1
	.uleb128 0x12f
	.string	"_Atomic(T) struct { T volatile __val; }"
	.byte	0x1
	.uleb128 0x135
	.string	"_Noreturn __dead2"
	.byte	0x1
	.uleb128 0x152
	.string	"_Thread_local __thread"
	.byte	0x1
	.uleb128 0x166
	.string	"__generic(expr,t,yes,no) __builtin_choose_expr( __builtin_types_compatible_p(__typeof(expr), t), yes, no)"
	.byte	0x1
	.uleb128 0x16c
	.string	"__malloc_like __attribute__((__malloc__))"
	.byte	0x1
	.uleb128 0x16d
	.string	"__pure __attribute__((__pure__))"
	.byte	0x1
	.uleb128 0x174
	.string	"__always_inline __attribute__((__always_inline__))"
	.byte	0x1
	.uleb128 0x17a
	.string	"__noinline __attribute__ ((__noinline__))"
	.byte	0x1
	.uleb128 0x180
	.string	"__nonnull(x) __attribute__((__nonnull__(x)))"
	.byte	0x1
	.uleb128 0x181
	.string	"__nonnull_all __attribute__((__nonnull__))"
	.byte	0x1
	.uleb128 0x188
	.string	"__fastcall __attribute__((__fastcall__))"
	.byte	0x1
	.uleb128 0x189
	.string	"__result_use_check __attribute__((__warn_unused_result__))"
	.byte	0x1
	.uleb128 0x190
	.string	"__returns_twice __attribute__((__returns_twice__))"
	.byte	0x1
	.uleb128 0x196
	.string	"__unreachable() __builtin_unreachable()"
	.byte	0x1
	.uleb128 0x1aa
	.string	"__restrict restrict"
	.byte	0x1
	.uleb128 0x1cb
	.string	"__predict_true(exp) __builtin_expect((exp), 1)"
	.byte	0x1
	.uleb128 0x1cc
	.string	"__predict_false(exp) __builtin_expect((exp), 0)"
	.byte	0x1
	.uleb128 0x1d3
	.string	"__sentinel __attribute__((__sentinel__))"
	.byte	0x1
	.uleb128 0x1d4
	.string	"__exported __attribute__((__visibility__(\"default\")))"
	.byte	0x1
	.uleb128 0x1d5
	.string	"__hidden __attribute__((__visibility__(\"hidden\")))"
	.byte	0x1
	.uleb128 0x1dc
	.string	"__offsetof(type,field) offsetof(type, field)"
	.byte	0x1
	.uleb128 0x1dd
	.string	"__rangeof(type,start,end) (__offsetof(type, end) - __offsetof(type, start))"
	.byte	0x1
	.uleb128 0x1e7
	.string	"__containerof(x,s,m) ({ const volatile __typeof(((s *)0)->m) *__x = (x); __DEQUALIFY(s *, (const volatile char *)__x - __offsetof(s, m));})"
	.byte	0x1
	.uleb128 0x1fd
	.string	"__printflike(fmtarg,firstvararg) __attribute__((__format__ (__printf__, fmtarg, firstvararg)))"
	.byte	0x1
	.uleb128 0x1ff
	.string	"__scanflike(fmtarg,firstvararg) __attribute__((__format__ (__scanf__, fmtarg, firstvararg)))"
	.byte	0x1
	.uleb128 0x201
	.string	"__format_arg(fmtarg) __attribute__((__format_arg__ (fmtarg)))"
	.byte	0x1
	.uleb128 0x202
	.string	"__strfmonlike(fmtarg,firstvararg) __attribute__((__format__ (__strfmon__, fmtarg, firstvararg)))"
	.byte	0x1
	.uleb128 0x204
	.string	"__strftimelike(fmtarg,firstvararg) __attribute__((__format__ (__strftime__, fmtarg, firstvararg)))"
	.byte	0x1
	.uleb128 0x210
	.string	"__gnu_inline __attribute__((__gnu_inline__, __artificial__))"
	.byte	0x1
	.uleb128 0x21e
	.string	"__printf0like(fmtarg,firstvararg) "
	.byte	0x1
	.uleb128 0x223
	.string	"__strong_reference(sym,aliassym) extern __typeof (sym) aliassym __attribute__ ((__alias__ (#sym)))"
	.byte	0x1
	.uleb128 0x228
	.string	"__weak_reference(sym,alias) __asm__(\".weak \" #alias); __asm__(\".equ \" #alias \", \" #sym)"
	.byte	0x1
	.uleb128 0x22b
	.string	"__warn_references(sym,msg) __asm__(\".section .gnu.warning.\" #sym); __asm__(\".asciz \\\"\" msg \"\\\"\"); __asm__(\".previous\")"
	.byte	0x1
	.uleb128 0x22f
	.string	"__sym_compat(sym,impl,verid) __asm__(\".symver \" #impl \", \" #sym \"@\" #verid)"
	.byte	0x1
	.uleb128 0x231
	.string	"__sym_default(sym,impl,verid) __asm__(\".symver \" #impl \", \" #sym \"@@\" #verid)"
	.byte	0x1
	.uleb128 0x254
	.string	"__FBSDID(s) struct __hack"
	.byte	0x1
	.uleb128 0x258
	.string	"__RCSID(s) struct __hack"
	.byte	0x1
	.uleb128 0x25c
	.string	"__RCSID_SOURCE(s) struct __hack"
	.byte	0x1
	.uleb128 0x260
	.string	"__SCCSID(s) struct __hack"
	.byte	0x1
	.uleb128 0x264
	.string	"__COPYRIGHT(s) struct __hack"
	.byte	0x1
	.uleb128 0x268
	.string	"__DECONST(type,var) ((type)(__uintptr_t)(const void *)(var))"
	.byte	0x1
	.uleb128 0x26c
	.string	"__DEVOLATILE(type,var) ((type)(__uintptr_t)(volatile void *)(var))"
	.byte	0x1
	.uleb128 0x270
	.string	"__DEQUALIFY(type,var) ((type)(__uintptr_t)(const volatile void *)(var))"
	.byte	0x1
	.uleb128 0x281
	.string	"__arg_type_tag(arg_kind,arg_idx,type_tag_idx) "
	.byte	0x1
	.uleb128 0x282
	.string	"__datatype_type_tag(kind,type) "
	.byte	0x1
	.uleb128 0x294
	.string	"__lock_annotate(x) "
	.byte	0x1
	.uleb128 0x298
	.string	"__lockable __lock_annotate(lockable)"
	.byte	0x1
	.uleb128 0x29b
	.string	"__locks_exclusive(...) __lock_annotate(exclusive_lock_function(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x29d
	.string	"__locks_shared(...) __lock_annotate(shared_lock_function(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x2a1
	.string	"__trylocks_exclusive(...) __lock_annotate(exclusive_trylock_function(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x2a3
	.string	"__trylocks_shared(...) __lock_annotate(shared_trylock_function(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x2a7
	.string	"__unlocks(...) __lock_annotate(unlock_function(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x2aa
	.string	"__asserts_exclusive(...) __lock_annotate(assert_exclusive_lock(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x2ac
	.string	"__asserts_shared(...) __lock_annotate(assert_shared_lock(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x2b0
	.string	"__requires_exclusive(...) __lock_annotate(exclusive_locks_required(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x2b2
	.string	"__requires_shared(...) __lock_annotate(shared_locks_required(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x2b4
	.string	"__requires_unlocked(...) __lock_annotate(locks_excluded(__VA_ARGS__))"
	.byte	0x1
	.uleb128 0x2b8
	.string	"__no_lock_analysis __lock_annotate(no_thread_safety_analysis)"
	.byte	0x1
	.uleb128 0x2bb
	.string	"__guarded_by(x) __lock_annotate(guarded_by(x))"
	.byte	0x1
	.uleb128 0x2bc
	.string	"__pt_guarded_by(x) __lock_annotate(pt_guarded_by(x))"
	.byte	0x4
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x6
	.byte	0x1
	.uleb128 0x27
	.string	"_STDDEF_H "
	.byte	0x1
	.uleb128 0x28
	.string	"_STDDEF_H_ "
	.byte	0x1
	.uleb128 0x2a
	.string	"_ANSI_STDDEF_H "
	.byte	0x1
	.uleb128 0x89
	.string	"_PTRDIFF_T "
	.byte	0x1
	.uleb128 0x8a
	.string	"_T_PTRDIFF_ "
	.byte	0x1
	.uleb128 0x8b
	.string	"_T_PTRDIFF "
	.byte	0x1
	.uleb128 0x8c
	.string	"__PTRDIFF_T "
	.byte	0x1
	.uleb128 0x8d
	.string	"_PTRDIFF_T_ "
	.byte	0x1
	.uleb128 0x8e
	.string	"_BSD_PTRDIFF_T_ "
	.byte	0x1
	.uleb128 0x8f
	.string	"___int_ptrdiff_t_h "
	.byte	0x1
	.uleb128 0x90
	.string	"_GCC_PTRDIFF_T "
	.byte	0x1
	.uleb128 0x91
	.string	"_PTRDIFF_T_DECLARED "
	.byte	0x2
	.uleb128 0xa1
	.string	"__need_ptrdiff_t"
	.byte	0x2
	.uleb128 0xee
	.string	"__need_size_t"
	.byte	0x1
	.uleb128 0x10b
	.string	"__wchar_t__ "
	.byte	0x1
	.uleb128 0x10c
	.string	"__WCHAR_T__ "
	.byte	0x1
	.uleb128 0x10d
	.string	"_WCHAR_T "
	.byte	0x1
	.uleb128 0x10e
	.string	"_T_WCHAR_ "
	.byte	0x1
	.uleb128 0x10f
	.string	"_T_WCHAR "
	.byte	0x1
	.uleb128 0x110
	.string	"__WCHAR_T "
	.byte	0x1
	.uleb128 0x111
	.string	"_WCHAR_T_ "
	.byte	0x1
	.uleb128 0x112
	.string	"_BSD_WCHAR_T_ "
	.byte	0x1
	.uleb128 0x113
	.string	"_WCHAR_T_DEFINED_ "
	.byte	0x1
	.uleb128 0x114
	.string	"_WCHAR_T_DEFINED "
	.byte	0x1
	.uleb128 0x115
	.string	"_WCHAR_T_H "
	.byte	0x1
	.uleb128 0x116
	.string	"___int_wchar_t_h "
	.byte	0x1
	.uleb128 0x117
	.string	"__INT_WCHAR_T_H "
	.byte	0x1
	.uleb128 0x118
	.string	"_GCC_WCHAR_T "
	.byte	0x1
	.uleb128 0x119
	.string	"_WCHAR_T_DECLARED "
	.byte	0x2
	.uleb128 0x126
	.string	"_BSD_WCHAR_T_"
	.byte	0x2
	.uleb128 0x15b
	.string	"__need_wchar_t"
	.byte	0x2
	.uleb128 0x191
	.string	"NULL"
	.byte	0x1
	.uleb128 0x196
	.string	"NULL ((void *)0)"
	.byte	0x2
	.uleb128 0x19c
	.string	"__need_NULL"
	.byte	0x1
	.uleb128 0x1a1
	.string	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)"
	.byte	0x4
	.byte	0x1
	.uleb128 0x26
	.string	"__need___va_list "
	.file 20 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/lib/gcc/msp430-elf/7.3.1/include/stdarg.h"
	.byte	0x3
	.uleb128 0x27
	.uleb128 0x14
	.byte	0x2
	.uleb128 0x22
	.string	"__need___va_list"
	.byte	0x1
	.uleb128 0x27
	.string	"__GNUC_VA_LIST "
	.byte	0x4
	.byte	0x3
	.uleb128 0x2f
	.uleb128 0x7
	.byte	0x1
	.uleb128 0xb
	.string	"_SYS_REENT_H_ "
	.byte	0x3
	.uleb128 0xd
	.uleb128 0xf
	.byte	0x4
	.byte	0x3
	.uleb128 0xe
	.uleb128 0x6
	.byte	0x4
	.byte	0x3
	.uleb128 0xf
	.uleb128 0x5
	.byte	0x1
	.uleb128 0xa
	.string	"_SYS__TYPES_H "
	.file 21 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/_types.h"
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x6
	.string	"_MACHINE__TYPES_H "
	.byte	0x4
	.byte	0x3
	.uleb128 0xd
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x2
	.string	"__SYS_LOCK_H__ "
	.byte	0x1
	.uleb128 0xb
	.string	"__LOCK_INIT(class,lock) static int lock = 0;"
	.byte	0x1
	.uleb128 0xc
	.string	"__LOCK_INIT_RECURSIVE(class,lock) static int lock = 0;"
	.byte	0x1
	.uleb128 0xd
	.string	"__lock_init(lock) (_CAST_VOID 0)"
	.byte	0x1
	.uleb128 0xe
	.string	"__lock_init_recursive(lock) (_CAST_VOID 0)"
	.byte	0x1
	.uleb128 0xf
	.string	"__lock_close(lock) (_CAST_VOID 0)"
	.byte	0x1
	.uleb128 0x10
	.string	"__lock_close_recursive(lock) (_CAST_VOID 0)"
	.byte	0x1
	.uleb128 0x11
	.string	"__lock_acquire(lock) (_CAST_VOID 0)"
	.byte	0x1
	.uleb128 0x12
	.string	"__lock_acquire_recursive(lock) (_CAST_VOID 0)"
	.byte	0x1
	.uleb128 0x13
	.string	"__lock_try_acquire(lock) (_CAST_VOID 0)"
	.byte	0x1
	.uleb128 0x14
	.string	"__lock_try_acquire_recursive(lock) (_CAST_VOID 0)"
	.byte	0x1
	.uleb128 0x15
	.string	"__lock_release(lock) (_CAST_VOID 0)"
	.byte	0x1
	.uleb128 0x16
	.string	"__lock_release_recursive(lock) (_CAST_VOID 0)"
	.byte	0x4
	.byte	0x1
	.uleb128 0x36
	.string	"unsigned signed"
	.byte	0x2
	.uleb128 0x38
	.string	"unsigned"
	.byte	0x1
	.uleb128 0x42
	.string	"__need_wint_t "
	.byte	0x3
	.uleb128 0x43
	.uleb128 0x6
	.byte	0x2
	.uleb128 0xa1
	.string	"__need_ptrdiff_t"
	.byte	0x2
	.uleb128 0xee
	.string	"__need_size_t"
	.byte	0x2
	.uleb128 0x15b
	.string	"__need_wchar_t"
	.byte	0x1
	.uleb128 0x160
	.string	"_WINT_T "
	.byte	0x2
	.uleb128 0x167
	.string	"__need_wint_t"
	.byte	0x2
	.uleb128 0x191
	.string	"NULL"
	.byte	0x1
	.uleb128 0x196
	.string	"NULL ((void *)0)"
	.byte	0x2
	.uleb128 0x19c
	.string	"__need_NULL"
	.byte	0x1
	.uleb128 0x1a1
	.string	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)"
	.byte	0x4
	.byte	0x4
	.byte	0x1
	.uleb128 0x11
	.string	"_NULL 0"
	.byte	0x1
	.uleb128 0x15
	.string	"__Long long"
	.byte	0x1
	.uleb128 0x46
	.string	"_ATEXIT_SIZE 32"
	.byte	0x1
	.uleb128 0x59
	.string	"_ATEXIT_INIT {_NULL, 0, {_NULL}, _NULL}"
	.byte	0x1
	.uleb128 0x68
	.string	"_REENT_INIT_ATEXIT _NULL, _ATEXIT_INIT,"
	.byte	0x1
	.uleb128 0xa8
	.string	"_REENT_SMALL_CHECK_INIT(ptr) do { if ((ptr) && !(ptr)->__sdidinit) __sinit (ptr); } while (0)"
	.byte	0x1
	.uleb128 0x136
	.string	"_RAND48_SEED_0 (0x330e)"
	.byte	0x1
	.uleb128 0x137
	.string	"_RAND48_SEED_1 (0xabcd)"
	.byte	0x1
	.uleb128 0x138
	.string	"_RAND48_SEED_2 (0x1234)"
	.byte	0x1
	.uleb128 0x139
	.string	"_RAND48_MULT_0 (0xe66d)"
	.byte	0x1
	.uleb128 0x13a
	.string	"_RAND48_MULT_1 (0xdeec)"
	.byte	0x1
	.uleb128 0x13b
	.string	"_RAND48_MULT_2 (0x0005)"
	.byte	0x1
	.uleb128 0x13c
	.string	"_RAND48_ADD (0x000b)"
	.byte	0x1
	.uleb128 0x148
	.string	"_REENT_EMERGENCY_SIZE 25"
	.byte	0x1
	.uleb128 0x149
	.string	"_REENT_ASCTIME_SIZE 26"
	.byte	0x1
	.uleb128 0x14a
	.string	"_REENT_SIGNAL_SIZE 24"
	.byte	0x1
	.uleb128 0x1a7
	.string	"_REENT_INIT(var) { 0, (__FILE *)&__sf_fake_stdin, (__FILE *)&__sf_fake_stdout, (__FILE *)&__sf_fake_stderr, 0, _NULL, 0, 0, \"C\", _NULL, _NULL, 0, 0, _NULL, _NULL, _NULL, _NULL, _NULL, _REENT_INIT_ATEXIT {_NULL, 0, _NULL}, _NULL, _NULL, _NULL }"
	.byte	0x1
	.uleb128 0x1c1
	.string	"_REENT_INIT_PTR_ZEROED(var) { (var)->_stdin = (__FILE *)&__sf_fake_stdin; (var)->_stdout = (__FILE *)&__sf_fake_stdout; (var)->_stderr = (__FILE *)&__sf_fake_stderr; (var)->_current_locale = \"C\"; }"
	.byte	0x1
	.uleb128 0x1cd
	.string	"__reent_assert(x) ((void)0)"
	.byte	0x1
	.uleb128 0x1d5
	.string	"_REENT_CHECK(var,what,type,size,init) do { struct _reent *_r = (var); if (_r->what == NULL) { _r->what = (type)malloc(size); __reent_assert(_r->what); init; } } while (0)"
	.byte	0x1
	.uleb128 0x1de
	.string	"_REENT_CHECK_TM(var) _REENT_CHECK(var, _localtime_buf, struct __tm *, sizeof *((var)->_localtime_buf), )"
	.byte	0x1
	.uleb128 0x1e2
	.string	"_REENT_CHECK_ASCTIME_BUF(var) _REENT_CHECK(var, _asctime_buf, char *, _REENT_ASCTIME_SIZE, memset((var)->_asctime_buf, 0, _REENT_ASCTIME_SIZE))"
	.byte	0x1
	.uleb128 0x1e7
	.ascii	"_REENT_INIT_RAND48(var) do { struct _reent *_r = (var); _r->"
	.ascii	"_r48->_seed[0] = _RAND48_SEED"
	.string	"_0; _r->_r48->_seed[1] = _RAND48_SEED_1; _r->_r48->_seed[2] = _RAND48_SEED_2; _r->_r48->_mult[0] = _RAND48_MULT_0; _r->_r48->_mult[1] = _RAND48_MULT_1; _r->_r48->_mult[2] = _RAND48_MULT_2; _r->_r48->_add = _RAND48_ADD; _r->_r48->_rand_next = 1; } while (0)"
	.byte	0x1
	.uleb128 0x1f2
	.string	"_REENT_CHECK_RAND48(var) _REENT_CHECK(var, _r48, struct _rand48 *, sizeof *((var)->_r48), _REENT_INIT_RAND48((var)))"
	.byte	0x1
	.uleb128 0x1f5
	.string	"_REENT_INIT_MP(var) do { struct _reent *_r = (var); _r->_mp->_result_k = 0; _r->_mp->_result = _r->_mp->_p5s = _NULL; _r->_mp->_freelist = _NULL; } while (0)"
	.byte	0x1
	.uleb128 0x1fb
	.string	"_REENT_CHECK_MP(var) _REENT_CHECK(var, _mp, struct _mprec *, sizeof *((var)->_mp), _REENT_INIT_MP(var))"
	.byte	0x1
	.uleb128 0x1fe
	.string	"_REENT_CHECK_EMERGENCY(var) _REENT_CHECK(var, _emergency, char *, _REENT_EMERGENCY_SIZE, )"
	.byte	0x1
	.uleb128 0x201
	.ascii	"_REENT_INIT_MISC(var) do { struct _reent *_r = (var); _r->_m"
	.ascii	"isc->_strtok_last = _NULL; _r->_misc->_mblen_state.__count ="
	.ascii	" 0; _r->_misc->_mblen_state.__value.__wch = 0; _r->_misc->_w"
	.ascii	"ctomb_state.__count = 0; _r->_misc->_wctomb_state.__value.__"
	.ascii	"wch = 0; _r->_misc->_mbtowc_state.__count = 0; _r->_misc->_m"
	.ascii	"btowc_state.__value.__wch = 0; _r->_misc->_mbrlen_state.__co"
	.ascii	"unt = 0; _r->_misc->_mbrlen_state.__value.__wch = 0; _r->_mi"
	.ascii	"sc->_mbrtowc_state.__count = 0; _r->_misc->_mbrtowc_state.__"
	.ascii	"value.__wch = 0; _r->_misc->_mbsrtowcs_state.__count = 0; _r"
	.ascii	"->_misc->_mbsrtowcs_state.__value"
	.string	".__wch = 0; _r->_misc->_wcrtomb_state.__count = 0; _r->_misc->_wcrtomb_state.__value.__wch = 0; _r->_misc->_wcsrtombs_state.__count = 0; _r->_misc->_wcsrtombs_state.__value.__wch = 0; _r->_misc->_l64a_buf[0] = '\\0'; _r->_misc->_getdate_err = 0; } while (0)"
	.byte	0x1
	.uleb128 0x217
	.string	"_REENT_CHECK_MISC(var) _REENT_CHECK(var, _misc, struct _misc_reent *, sizeof *((var)->_misc), _REENT_INIT_MISC(var))"
	.byte	0x1
	.uleb128 0x21a
	.string	"_REENT_CHECK_SIGNAL_BUF(var) _REENT_CHECK(var, _signal_buf, char *, _REENT_SIGNAL_SIZE, )"
	.byte	0x1
	.uleb128 0x21d
	.string	"_REENT_SIGNGAM(ptr) ((ptr)->_gamma_signgam)"
	.byte	0x1
	.uleb128 0x21e
	.string	"_REENT_RAND_NEXT(ptr) ((ptr)->_r48->_rand_next)"
	.byte	0x1
	.uleb128 0x21f
	.string	"_REENT_RAND48_SEED(ptr) ((ptr)->_r48->_seed)"
	.byte	0x1
	.uleb128 0x220
	.string	"_REENT_RAND48_MULT(ptr) ((ptr)->_r48->_mult)"
	.byte	0x1
	.uleb128 0x221
	.string	"_REENT_RAND48_ADD(ptr) ((ptr)->_r48->_add)"
	.byte	0x1
	.uleb128 0x222
	.string	"_REENT_MP_RESULT(ptr) ((ptr)->_mp->_result)"
	.byte	0x1
	.uleb128 0x223
	.string	"_REENT_MP_RESULT_K(ptr) ((ptr)->_mp->_result_k)"
	.byte	0x1
	.uleb128 0x224
	.string	"_REENT_MP_P5S(ptr) ((ptr)->_mp->_p5s)"
	.byte	0x1
	.uleb128 0x225
	.string	"_REENT_MP_FREELIST(ptr) ((ptr)->_mp->_freelist)"
	.byte	0x1
	.uleb128 0x226
	.string	"_REENT_ASCTIME_BUF(ptr) ((ptr)->_asctime_buf)"
	.byte	0x1
	.uleb128 0x227
	.string	"_REENT_TM(ptr) ((ptr)->_localtime_buf)"
	.byte	0x1
	.uleb128 0x228
	.string	"_REENT_EMERGENCY(ptr) ((ptr)->_emergency)"
	.byte	0x1
	.uleb128 0x229
	.string	"_REENT_STRTOK_LAST(ptr) ((ptr)->_misc->_strtok_last)"
	.byte	0x1
	.uleb128 0x22a
	.string	"_REENT_MBLEN_STATE(ptr) ((ptr)->_misc->_mblen_state)"
	.byte	0x1
	.uleb128 0x22b
	.string	"_REENT_MBTOWC_STATE(ptr) ((ptr)->_misc->_mbtowc_state)"
	.byte	0x1
	.uleb128 0x22c
	.string	"_REENT_WCTOMB_STATE(ptr) ((ptr)->_misc->_wctomb_state)"
	.byte	0x1
	.uleb128 0x22d
	.string	"_REENT_MBRLEN_STATE(ptr) ((ptr)->_misc->_mbrlen_state)"
	.byte	0x1
	.uleb128 0x22e
	.string	"_REENT_MBRTOWC_STATE(ptr) ((ptr)->_misc->_mbrtowc_state)"
	.byte	0x1
	.uleb128 0x22f
	.string	"_REENT_MBSRTOWCS_STATE(ptr) ((ptr)->_misc->_mbsrtowcs_state)"
	.byte	0x1
	.uleb128 0x230
	.string	"_REENT_WCRTOMB_STATE(ptr) ((ptr)->_misc->_wcrtomb_state)"
	.byte	0x1
	.uleb128 0x231
	.string	"_REENT_WCSRTOMBS_STATE(ptr) ((ptr)->_misc->_wcsrtombs_state)"
	.byte	0x1
	.uleb128 0x232
	.string	"_REENT_L64A_BUF(ptr) ((ptr)->_misc->_l64a_buf)"
	.byte	0x1
	.uleb128 0x233
	.string	"_REENT_GETDATE_ERR_P(ptr) (&((ptr)->_misc->_getdate_err))"
	.byte	0x1
	.uleb128 0x234
	.string	"_REENT_SIGNAL_BUF(ptr) ((ptr)->_signal_buf)"
	.byte	0x1
	.uleb128 0x2ea
	.string	"_REENT_INIT_PTR(var) { memset((var), 0, sizeof(*(var))); _REENT_INIT_PTR_ZEROED(var); }"
	.byte	0x1
	.uleb128 0x2f2
	.string	"_Kmax (sizeof (size_t) << 3)"
	.byte	0x1
	.uleb128 0x2fa
	.string	"__ATTRIBUTE_IMPURE_PTR__ "
	.byte	0x1
	.uleb128 0x30a
	.string	"_REENT _impure_ptr"
	.byte	0x1
	.uleb128 0x30d
	.string	"_GLOBAL_REENT _global_impure_ptr"
	.byte	0x1
	.uleb128 0x313
	.string	"_GLOBAL_ATEXIT (_GLOBAL_REENT->_atexit)"
	.byte	0x4
	.file 22 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/types.h"
	.byte	0x3
	.uleb128 0x30
	.uleb128 0x16
	.byte	0x1
	.uleb128 0x3a
	.string	"_SYS_TYPES_H "
	.byte	0x3
	.uleb128 0x44
	.uleb128 0x6
	.byte	0x4
	.file 23 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/types.h"
	.byte	0x3
	.uleb128 0x45
	.uleb128 0x17
	.byte	0x1
	.uleb128 0x2
	.string	"_MACHTYPES_H_ "
	.byte	0x1
	.uleb128 0xd
	.string	"_CLOCK_T_ unsigned long"
	.byte	0x1
	.uleb128 0xe
	.string	"_TIME_T_ long"
	.byte	0x1
	.uleb128 0xf
	.string	"_CLOCKID_T_ unsigned long"
	.byte	0x1
	.uleb128 0x10
	.string	"_TIMER_T_ unsigned long"
	.byte	0x4
	.byte	0x1
	.uleb128 0x4f
	.string	"_ST_INT32 __attribute__ ((__mode__ (__SI__)))"
	.byte	0x1
	.uleb128 0x79
	.string	"__clock_t_defined "
	.byte	0x1
	.uleb128 0x7e
	.string	"__time_t_defined "
	.byte	0x1
	.uleb128 0x83
	.string	"__daddr_t_defined "
	.byte	0x1
	.uleb128 0x87
	.string	"__caddr_t_defined "
	.byte	0x1
	.uleb128 0xc2
	.string	"_SSIZE_T_DECLARED "
	.byte	0x2
	.uleb128 0xd8
	.string	"__MS_types__"
	.byte	0x2
	.uleb128 0xd9
	.string	"_ST_INT32"
	.byte	0x1
	.uleb128 0xde
	.string	"__clockid_t_defined "
	.byte	0x1
	.uleb128 0xe3
	.string	"__timer_t_defined "
	.byte	0x1
	.uleb128 0xea
	.string	"_SUSECONDS_T_DECLARED "
	.byte	0x2
	.uleb128 0x1d8
	.string	"__need_inttypes"
	.byte	0x4
	.byte	0x1
	.uleb128 0x36
	.string	"__FILE_defined "
	.file 24 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/sys/stdio.h"
	.byte	0x3
	.uleb128 0x42
	.uleb128 0x18
	.byte	0x1
	.uleb128 0x2
	.string	"_NEWLIB_STDIO_H "
	.byte	0x1
	.uleb128 0xd
	.string	"_flockfile(fp) (((fp)->_flags & __SSTR) ? 0 : __lock_acquire_recursive((fp)->_lock))"
	.byte	0x1
	.uleb128 0x15
	.string	"_funlockfile(fp) (((fp)->_flags & __SSTR) ? 0 : __lock_release_recursive((fp)->_lock))"
	.byte	0x4
	.byte	0x1
	.uleb128 0x44
	.string	"__SLBF 0x0001"
	.byte	0x1
	.uleb128 0x45
	.string	"__SNBF 0x0002"
	.byte	0x1
	.uleb128 0x46
	.string	"__SRD 0x0004"
	.byte	0x1
	.uleb128 0x47
	.string	"__SWR 0x0008"
	.byte	0x1
	.uleb128 0x49
	.string	"__SRW 0x0010"
	.byte	0x1
	.uleb128 0x4a
	.string	"__SEOF 0x0020"
	.byte	0x1
	.uleb128 0x4b
	.string	"__SERR 0x0040"
	.byte	0x1
	.uleb128 0x4c
	.string	"__SMBF 0x0080"
	.byte	0x1
	.uleb128 0x4d
	.string	"__SAPP 0x0100"
	.byte	0x1
	.uleb128 0x4e
	.string	"__SSTR 0x0200"
	.byte	0x1
	.uleb128 0x4f
	.string	"__SOPT 0x0400"
	.byte	0x1
	.uleb128 0x50
	.string	"__SNPT 0x0800"
	.byte	0x1
	.uleb128 0x51
	.string	"__SOFF 0x1000"
	.byte	0x1
	.uleb128 0x52
	.string	"__SORD 0x2000"
	.byte	0x1
	.uleb128 0x56
	.string	"__SL64 0x8000"
	.byte	0x1
	.uleb128 0x59
	.string	"__SNLK 0x0001"
	.byte	0x1
	.uleb128 0x5a
	.string	"__SWID 0x2000"
	.byte	0x1
	.uleb128 0x65
	.string	"_IOFBF 0"
	.byte	0x1
	.uleb128 0x66
	.string	"_IOLBF 1"
	.byte	0x1
	.uleb128 0x67
	.string	"_IONBF 2"
	.byte	0x1
	.uleb128 0x69
	.string	"EOF (-1)"
	.byte	0x1
	.uleb128 0x6c
	.string	"BUFSIZ __BUFSIZ__"
	.byte	0x1
	.uleb128 0x74
	.string	"FOPEN_MAX 20"
	.byte	0x1
	.uleb128 0x7a
	.string	"FILENAME_MAX 1024"
	.byte	0x1
	.uleb128 0x80
	.string	"L_tmpnam FILENAME_MAX"
	.byte	0x1
	.uleb128 0x88
	.string	"SEEK_SET 0"
	.byte	0x1
	.uleb128 0x8b
	.string	"SEEK_CUR 1"
	.byte	0x1
	.uleb128 0x8e
	.string	"SEEK_END 2"
	.byte	0x1
	.uleb128 0x91
	.string	"TMP_MAX 26"
	.byte	0x1
	.uleb128 0x93
	.string	"stdin (_REENT->_stdin)"
	.byte	0x1
	.uleb128 0x94
	.string	"stdout (_REENT->_stdout)"
	.byte	0x1
	.uleb128 0x95
	.string	"stderr (_REENT->_stderr)"
	.byte	0x1
	.uleb128 0x97
	.string	"_stdin_r(x) ((x)->_stdin)"
	.byte	0x1
	.uleb128 0x98
	.string	"_stdout_r(x) ((x)->_stdout)"
	.byte	0x1
	.uleb128 0x99
	.string	"_stderr_r(x) ((x)->_stderr)"
	.byte	0x1
	.uleb128 0xa1
	.string	"__VALIST __gnuc_va_list"
	.byte	0x1
	.uleb128 0x278
	.string	"__sgetc_raw_r(__ptr,__f) (--(__f)->_r < 0 ? __srget_r(__ptr, __f) : (int)(*(__f)->_p++))"
	.byte	0x1
	.uleb128 0x295
	.string	"__sgetc_r(__ptr,__p) __sgetc_raw_r(__ptr, __p)"
	.byte	0x1
	.uleb128 0x2b9
	.string	"__sfeof(p) ((int)(((p)->_flags & __SEOF) != 0))"
	.byte	0x1
	.uleb128 0x2ba
	.string	"__sferror(p) ((int)(((p)->_flags & __SERR) != 0))"
	.byte	0x1
	.uleb128 0x2bb
	.string	"__sclearerr(p) ((void)((p)->_flags &= ~(__SERR|__SEOF)))"
	.byte	0x1
	.uleb128 0x2bc
	.string	"__sfileno(p) ((p)->_file)"
	.byte	0x1
	.uleb128 0x2d0
	.string	"getc(fp) __sgetc_r(_REENT, fp)"
	.byte	0x1
	.uleb128 0x2d1
	.string	"putc(x,fp) __sputc_r(_REENT, x, fp)"
	.byte	0x1
	.uleb128 0x2e4
	.string	"getchar() getc(stdin)"
	.byte	0x1
	.uleb128 0x2e5
	.string	"putchar(x) putc(x, stdout)"
	.byte	0x4
	.file 25 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/stdlib.h"
	.byte	0x3
	.uleb128 0x8
	.uleb128 0x19
	.byte	0x1
	.uleb128 0x8
	.string	"_STDLIB_H_ "
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x12
	.byte	0x4
	.byte	0x1
	.uleb128 0xd
	.string	"__need_size_t "
	.byte	0x1
	.uleb128 0xe
	.string	"__need_wchar_t "
	.byte	0x1
	.uleb128 0xf
	.string	"__need_NULL "
	.byte	0x3
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x2
	.uleb128 0xa1
	.string	"__need_ptrdiff_t"
	.byte	0x2
	.uleb128 0xee
	.string	"__need_size_t"
	.byte	0x2
	.uleb128 0x15b
	.string	"__need_wchar_t"
	.byte	0x2
	.uleb128 0x191
	.string	"NULL"
	.byte	0x1
	.uleb128 0x196
	.string	"NULL ((void *)0)"
	.byte	0x2
	.uleb128 0x19c
	.string	"__need_NULL"
	.byte	0x1
	.uleb128 0x1a1
	.string	"offsetof(TYPE,MEMBER) __builtin_offsetof (TYPE, MEMBER)"
	.byte	0x4
	.file 26 "/opt/ti/ccsv8/tools/compiler/msp430-gcc-7.3.1.24_linux64/msp430-elf/include/machine/stdlib.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0x1a
	.byte	0x1
	.uleb128 0x2
	.string	"_MACHSTDLIB_H_ "
	.byte	0x4
	.byte	0x1
	.uleb128 0x34
	.string	"__compar_fn_t_defined "
	.byte	0x1
	.uleb128 0x38
	.string	"EXIT_FAILURE 1"
	.byte	0x1
	.uleb128 0x39
	.string	"EXIT_SUCCESS 0"
	.byte	0x1
	.uleb128 0x3b
	.string	"RAND_MAX __RAND_MAX"
	.byte	0x1
	.uleb128 0x3f
	.string	"MB_CUR_MAX __locale_mb_cur_max()"
	.byte	0x4
	.file 27 "../../libs/omsp_system.h"
	.byte	0x3
	.uleb128 0x9
	.uleb128 0x1b
	.file 28 "/opt/ti/ccsv8/ccs_base/msp430/include_gcc/in430.h"
	.byte	0x3
	.uleb128 0x24
	.uleb128 0x1c
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
	.file 29 "qwark.h"
	.byte	0x3
	.uleb128 0xa
	.uleb128 0x1d
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
	.file 30 "uart.h"
	.byte	0x3
	.uleb128 0xb
	.uleb128 0x1e
	.byte	0x1
	.uleb128 0x9
	.string	"UART_H_ "
	.byte	0x1
	.uleb128 0x13
	.string	"UART_CTL (*(volatile unsigned char *) 0x0080)"
	.byte	0x1
	.uleb128 0x14
	.string	"UART_STAT (*(volatile unsigned char *) 0x0081)"
	.byte	0x1
	.uleb128 0x15
	.string	"UART_BAUD (*(volatile unsigned int *) 0x0082)"
	.byte	0x1
	.uleb128 0x16
	.string	"UART_TXD (*(volatile unsigned char *) 0x0084)"
	.byte	0x1
	.uleb128 0x17
	.string	"UART_RXD (*(volatile unsigned char *) 0x0085)"
	.byte	0x1
	.uleb128 0x1f
	.string	"UART_IEN_TX_EMPTY 0x80"
	.byte	0x1
	.uleb128 0x20
	.string	"UART_IEN_TX 0x40"
	.byte	0x1
	.uleb128 0x21
	.string	"UART_IEN_RX_OVFLW 0x20"
	.byte	0x1
	.uleb128 0x22
	.string	"UART_IEN_RX 0x10"
	.byte	0x1
	.uleb128 0x23
	.string	"UART_SMCLK_SEL 0x02"
	.byte	0x1
	.uleb128 0x24
	.string	"UART_EN 0x01"
	.byte	0x1
	.uleb128 0x27
	.string	"UART_TX_EMPTY_PND 0x80"
	.byte	0x1
	.uleb128 0x28
	.string	"UART_TX_PND 0x40"
	.byte	0x1
	.uleb128 0x29
	.string	"UART_RX_OVFLW_PND 0x20"
	.byte	0x1
	.uleb128 0x2a
	.string	"UART_RX_PND 0x10"
	.byte	0x1
	.uleb128 0x2b
	.string	"UART_TX_FULL 0x08"
	.byte	0x1
	.uleb128 0x2c
	.string	"UART_TX_BUSY 0x04"
	.byte	0x1
	.uleb128 0x2d
	.string	"UART_RX_BUSY 0x01"
	.byte	0x1
	.uleb128 0x34
	.string	"UART_TX_VECTOR (6 *2)"
	.byte	0x1
	.uleb128 0x35
	.string	"UART_RX_VECTOR (7 *2)"
	.byte	0x1
	.uleb128 0x44
	.string	"BAUD 8"
	.byte	0x4
	.file 31 "timerA.h"
	.byte	0x3
	.uleb128 0xc
	.uleb128 0x1f
	.byte	0x1
	.uleb128 0x2
	.string	"TIMERA_H "
	.byte	0x1
	.uleb128 0xf
	.string	"DCO_CLK_PERIOD 20"
	.byte	0x1
	.uleb128 0x10
	.string	"LFXT_CLK_PERIOD 10240"
	.byte	0x1
	.uleb128 0x13
	.string	"WT_20US ( 20000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x14
	.string	"WT_50US ( 50000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x23
	.string	"WT_100US ( 100000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x24
	.string	"WT_200US ( 200000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x25
	.string	"WT_500US ( 500000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x26
	.string	"WT_1MS ( 1000000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x27
	.string	"WT_2MS ( 2000000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x28
	.string	"WT_5MS ( 5000000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x29
	.string	"WT_10MS ( 10000000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x2a
	.string	"WT_20MS ( 20000000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x2b
	.string	"WT_50MS ( 50000000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x2c
	.string	"WT_100MS (100000000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x2d
	.string	"WT_200MS (200000000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x2e
	.string	"WT_500MS (500000000/LFXT_CLK_PERIOD)+1"
	.byte	0x1
	.uleb128 0x35
	.string	"TACTL (*(volatile unsigned int *) 0x0160)"
	.byte	0x1
	.uleb128 0x36
	.string	"TAR (*(volatile unsigned int *) 0x0170)"
	.byte	0x1
	.uleb128 0x37
	.string	"TACCTL0 (*(volatile unsigned int *) 0x0162)"
	.byte	0x1
	.uleb128 0x38
	.string	"TACCR0 (*(volatile unsigned int *) 0x0172)"
	.byte	0x1
	.uleb128 0x39
	.string	"TACCTL1 (*(volatile unsigned int *) 0x0164)"
	.byte	0x1
	.uleb128 0x3a
	.string	"TACCR1 (*(volatile unsigned int *) 0x0174)"
	.byte	0x1
	.uleb128 0x3b
	.string	"TACCTL2 (*(volatile unsigned int *) 0x0166)"
	.byte	0x1
	.uleb128 0x3c
	.string	"TACCR2 (*(volatile unsigned int *) 0x0176)"
	.byte	0x1
	.uleb128 0x3d
	.string	"TAIV (*(volatile unsigned int *) 0x012E)"
	.byte	0x1
	.uleb128 0x44
	.string	"CCTL0 TACCTL0"
	.byte	0x1
	.uleb128 0x45
	.string	"CCTL1 TACCTL1"
	.byte	0x1
	.uleb128 0x46
	.string	"CCR0 TACCR0"
	.byte	0x1
	.uleb128 0x47
	.string	"CCR1 TACCR1"
	.byte	0x1
	.uleb128 0x4a
	.string	"TASSEL1 (0x0200)"
	.byte	0x1
	.uleb128 0x4b
	.string	"TASSEL0 (0x0100)"
	.byte	0x1
	.uleb128 0x4c
	.string	"ID1 (0x0080)"
	.byte	0x1
	.uleb128 0x4d
	.string	"ID0 (0x0040)"
	.byte	0x1
	.uleb128 0x4e
	.string	"MC1 (0x0020)"
	.byte	0x1
	.uleb128 0x4f
	.string	"MC0 (0x0010)"
	.byte	0x1
	.uleb128 0x50
	.string	"TACLR (0x0004)"
	.byte	0x1
	.uleb128 0x51
	.string	"TAIE (0x0002)"
	.byte	0x1
	.uleb128 0x52
	.string	"TAIFG (0x0001)"
	.byte	0x1
	.uleb128 0x54
	.string	"MC_0 (0x0000)"
	.byte	0x1
	.uleb128 0x55
	.string	"MC_1 (0x0010)"
	.byte	0x1
	.uleb128 0x56
	.string	"MC_2 (0x0020)"
	.byte	0x1
	.uleb128 0x57
	.string	"MC_3 (0x0030)"
	.byte	0x1
	.uleb128 0x58
	.string	"ID_0 (0x0000)"
	.byte	0x1
	.uleb128 0x59
	.string	"ID_1 (0x0040)"
	.byte	0x1
	.uleb128 0x5a
	.string	"ID_2 (0x0080)"
	.byte	0x1
	.uleb128 0x5b
	.string	"ID_3 (0x00C0)"
	.byte	0x1
	.uleb128 0x5c
	.string	"TASSEL_0 (0x0000)"
	.byte	0x1
	.uleb128 0x5d
	.string	"TASSEL_1 (0x0100)"
	.byte	0x1
	.uleb128 0x5e
	.string	"TASSEL_2 (0x0200)"
	.byte	0x1
	.uleb128 0x5f
	.string	"TASSEL_3 (0x0300)"
	.byte	0x1
	.uleb128 0x61
	.string	"CM1 (0x8000)"
	.byte	0x1
	.uleb128 0x62
	.string	"CM0 (0x4000)"
	.byte	0x1
	.uleb128 0x63
	.string	"CCIS1 (0x2000)"
	.byte	0x1
	.uleb128 0x64
	.string	"CCIS0 (0x1000)"
	.byte	0x1
	.uleb128 0x65
	.string	"SCS (0x0800)"
	.byte	0x1
	.uleb128 0x66
	.string	"SCCI (0x0400)"
	.byte	0x1
	.uleb128 0x67
	.string	"CAP (0x0100)"
	.byte	0x1
	.uleb128 0x68
	.string	"OUTMOD2 (0x0080)"
	.byte	0x1
	.uleb128 0x69
	.string	"OUTMOD1 (0x0040)"
	.byte	0x1
	.uleb128 0x6a
	.string	"OUTMOD0 (0x0020)"
	.byte	0x1
	.uleb128 0x6b
	.string	"CCIE (0x0010)"
	.byte	0x1
	.uleb128 0x6c
	.string	"CCI (0x0008)"
	.byte	0x1
	.uleb128 0x6d
	.string	"OUT (0x0004)"
	.byte	0x1
	.uleb128 0x6e
	.string	"COV (0x0002)"
	.byte	0x1
	.uleb128 0x6f
	.string	"CCIFG (0x0001)"
	.byte	0x4
	.byte	0x1
	.uleb128 0xe
	.string	"UART_DBG "
	.byte	0x1
	.uleb128 0x37
	.string	"LOG(...) "
	.byte	0x1
	.uleb128 0x3d
	.string	"PRINTF(...) "
	.byte	0x1
	.uleb128 0x43
	.string	"NUM_WARMUP_SAMPLES 3"
	.byte	0x1
	.uleb128 0x45
	.string	"ACCEL_WINDOW_SIZE 3"
	.byte	0x1
	.uleb128 0x46
	.string	"MODEL_SIZE 16"
	.byte	0x1
	.uleb128 0x47
	.string	"SAMPLE_NOISE_FLOOR 10"
	.byte	0x1
	.uleb128 0x4a
	.string	"SAMPLES_TO_COLLECT 128"
	.byte	0x1
	.uleb128 0x52
	.string	"TASK_CHECKPOINT(...) "
	.byte	0x1
	.uleb128 0x91
	.string	"accel_sample ACCEL_singleSample"
	.byte	0x4
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF43:
	.string	"_dso_handle"
.LASF147:
	.string	"count"
.LASF173:
	.string	"move_less_error"
.LASF52:
	.string	"_size"
.LASF99:
	.string	"_rand48"
.LASF190:
	.string	"_v_seed"
.LASF64:
	.string	"_emergency"
.LASF162:
	.string	"features"
.LASF192:
	.string	"sqrt16"
.LASF3:
	.string	"__uint8_t"
.LASF154:
	.string	"init_moving"
.LASF57:
	.string	"_data"
.LASF196:
	.string	"init"
.LASF119:
	.string	"_wcrtomb_state"
.LASF120:
	.string	"_wcsrtombs_state"
.LASF10:
	.string	"long long unsigned int"
.LASF56:
	.string	"_lbfsize"
.LASF181:
	.string	"aWin"
.LASF130:
	.string	"stddevmag"
.LASF188:
	.string	"ACCEL_singleSample"
.LASF117:
	.string	"_mbrtowc_state"
.LASF168:
	.string	"sample"
.LASF136:
	.string	"moving"
.LASF112:
	.string	"_wctomb_state"
.LASF32:
	.string	"__tm_sec"
.LASF9:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF157:
	.string	"end_of_benchmark"
.LASF156:
	.string	"count_error"
.LASF87:
	.string	"_ubuf"
.LASF51:
	.string	"_base"
.LASF34:
	.string	"__tm_hour"
.LASF78:
	.string	"__sf"
.LASF41:
	.string	"_on_exit_args"
.LASF129:
	.string	"meanmag"
.LASF169:
	.string	"print_stats"
.LASF82:
	.string	"_cookie"
.LASF127:
	.string	"accelReading"
.LASF77:
	.string	"__sglue"
.LASF6:
	.string	"long int"
.LASF104:
	.string	"_mprec"
.LASF54:
	.string	"_flags"
.LASF45:
	.string	"_is_cxa"
.LASF60:
	.string	"_stdin"
.LASF89:
	.string	"_blksize"
.LASF160:
	.string	"stats"
.LASF13:
	.string	"uint16_t"
.LASF177:
	.string	"stat_sd_err"
.LASF143:
	.string	"totalCount"
.LASF71:
	.string	"_cvtbuf"
.LASF90:
	.string	"_offset"
.LASF118:
	.string	"_mbsrtowcs_state"
.LASF116:
	.string	"_mbrlen_state"
.LASF131:
	.string	"features_t"
.LASF42:
	.string	"_fnargs"
.LASF167:
	.string	"discardedSamplesCount"
.LASF134:
	.string	"class_t"
.LASF48:
	.string	"_fns"
.LASF7:
	.string	"__uint32_t"
.LASF146:
	.string	"stats_t"
.LASF28:
	.string	"_sign"
.LASF24:
	.string	"_flock_t"
.LASF62:
	.string	"_stderr"
.LASF30:
	.string	"_Bigint"
.LASF69:
	.string	"_gamma_signgam"
.LASF83:
	.string	"_read"
.LASF106:
	.string	"_result_k"
.LASF31:
	.string	"__tm"
.LASF49:
	.string	"_on_exit_args_ptr"
.LASF11:
	.string	"unsigned int"
.LASF20:
	.string	"__wchb"
.LASF61:
	.string	"_stdout"
.LASF191:
	.string	"seed"
.LASF70:
	.string	"_cvtlen"
.LASF186:
	.string	"acquire_window"
.LASF8:
	.string	"long unsigned int"
.LASF53:
	.string	"__sFILE_fake"
.LASF165:
	.string	"classModel"
.LASF153:
	.string	"init_stationary"
.LASF97:
	.string	"_niobs"
.LASF5:
	.string	"short unsigned int"
.LASF76:
	.string	"_atexit0"
.LASF80:
	.string	"_signal_buf"
.LASF74:
	.string	"_asctime_buf"
.LASF159:
	.string	"recognize"
.LASF105:
	.string	"_result"
.LASF19:
	.string	"__wch"
.LASF141:
	.string	"MODE_RECOGNIZE"
.LASF194:
	.string	"main.c"
.LASF18:
	.string	"wint_t"
.LASF185:
	.string	"window"
.LASF91:
	.string	"_lock"
.LASF93:
	.string	"_flags2"
.LASF126:
	.string	"threeAxis_t_8"
.LASF149:
	.string	"resultStationaryPct"
.LASF135:
	.string	"stationary"
.LASF84:
	.string	"_write"
.LASF37:
	.string	"__tm_year"
.LASF132:
	.string	"CLASS_STATIONARY"
.LASF161:
	.string	"sampleWindow"
.LASF183:
	.string	"stddev"
.LASF79:
	.string	"_misc"
.LASF121:
	.string	"__sf_fake_stdin"
.LASF180:
	.string	"featurize"
.LASF122:
	.string	"__sf_fake_stdout"
.LASF36:
	.string	"__tm_mon"
.LASF46:
	.string	"_atexit"
.LASF187:
	.string	"samplesInWindow"
.LASF65:
	.string	"__sdidinit"
.LASF16:
	.string	"_off_t"
.LASF170:
	.string	"record_stats"
.LASF108:
	.string	"_freelist"
.LASF155:
	.string	"pin_state"
.LASF163:
	.string	"class"
.LASF151:
	.string	"prev_pin_state"
.LASF164:
	.string	"train"
.LASF15:
	.string	"_LOCK_RECURSIVE_T"
.LASF166:
	.string	"warmup_sensor"
.LASF150:
	.string	"resultMovingPct"
.LASF171:
	.string	"select_mode"
.LASF1:
	.string	"unsigned char"
.LASF172:
	.string	"classify"
.LASF98:
	.string	"_iobs"
.LASF2:
	.string	"short int"
.LASF39:
	.string	"__tm_yday"
.LASF139:
	.string	"MODE_TRAIN_STATIONARY"
.LASF50:
	.string	"__sbuf"
.LASF95:
	.string	"__FILE"
.LASF23:
	.string	"_mbstate_t"
.LASF81:
	.string	"__sFILE"
.LASF92:
	.string	"_mbstate"
.LASF103:
	.string	"_rand_next"
.LASF111:
	.string	"_mblen_state"
.LASF63:
	.string	"_inc"
.LASF47:
	.string	"_ind"
.LASF67:
	.string	"_current_locale"
.LASF148:
	.string	"model"
.LASF68:
	.string	"__cleanup"
.LASF137:
	.string	"model_t"
.LASF27:
	.string	"_maxwds"
.LASF58:
	.string	"_reent"
.LASF100:
	.string	"_seed"
.LASF145:
	.string	"stationaryCount"
.LASF21:
	.string	"__count"
.LASF14:
	.string	"uint32_t"
.LASF85:
	.string	"_seek"
.LASF128:
	.string	"accelWindow"
.LASF124:
	.string	"_impure_ptr"
.LASF17:
	.string	"_fpos_t"
.LASF178:
	.string	"move_mean_err"
.LASF175:
	.string	"model_features"
.LASF59:
	.string	"_errno"
.LASF94:
	.string	"char"
.LASF152:
	.string	"mode"
.LASF33:
	.string	"__tm_min"
.LASF4:
	.string	"__uint16_t"
.LASF174:
	.string	"stat_less_error"
.LASF140:
	.string	"MODE_TRAIN_MOVING"
.LASF101:
	.string	"_mult"
.LASF26:
	.string	"_next"
.LASF110:
	.string	"_strtok_last"
.LASF22:
	.string	"__value"
.LASF44:
	.string	"_fntypes"
.LASF109:
	.string	"_misc_reent"
.LASF142:
	.string	"run_mode_t"
.LASF182:
	.string	"mean"
.LASF102:
	.string	"_add"
.LASF25:
	.string	"__ULong"
.LASF115:
	.string	"_getdate_err"
.LASF125:
	.string	"_global_impure_ptr"
.LASF66:
	.string	"_current_category"
.LASF55:
	.string	"_file"
.LASF29:
	.string	"_wds"
.LASF38:
	.string	"__tm_wday"
.LASF96:
	.string	"_glue"
.LASF184:
	.string	"transform"
.LASF12:
	.string	"uint8_t"
.LASF114:
	.string	"_l64a_buf"
.LASF179:
	.string	"move_sd_err"
.LASF75:
	.string	"_sig_func"
.LASF193:
	.string	"GNU C99 7.3.1 -mcpu=msp430 -mhwmult=16bit -msmall -mcode-region=none -mdata-region=none -mdevices-csv-loc=/opt/ti/ccsv8/ccs_base/msp430/include_gcc/devices.csv -g3 -g -gdwarf-3 -gstrict-dwarf -O0 -std=c99 -std=c99 -fstrict-aliasing -fstack-usage"
.LASF88:
	.string	"_nbuf"
.LASF40:
	.string	"__tm_isdst"
.LASF73:
	.string	"_localtime_buf"
.LASF86:
	.string	"_close"
.LASF123:
	.string	"__sf_fake_stderr"
.LASF72:
	.string	"_r48"
.LASF195:
	.string	"/home/hiram/master/Qwark_stack/altera_de0_nano/software/apps/leds"
.LASF138:
	.string	"MODE_IDLE"
.LASF113:
	.string	"_mbtowc_state"
.LASF107:
	.string	"_p5s"
.LASF158:
	.string	"main"
.LASF133:
	.string	"CLASS_MOVING"
.LASF144:
	.string	"movingCount"
.LASF189:
	.string	"result"
.LASF35:
	.string	"__tm_mday"
.LASF176:
	.string	"stat_mean_err"
	.ident	"GCC: (Mitto Systems Limited - msp430-gcc 7.3.1.24) 7.3.1"
