		AREA RESET,DATA,READONLY
		EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=N1
	LDR R2, [R0]
	LDR R0, =N2
	LDR R3, [R0]
	LDR R0, =DST
	LDR R5, [R0]
	
	MOV R5, #8
	MOV R6, #10
	MOV R9, #0xf
	MOV R4, #0
up 	MOV R1, #0
	MOV R7, R2
	MOV R8, R3
	AND R7, R9
	LSR R7, R4
	ADD R7, R6
	MOV R6, #0
	AND R8, R9
	LSR R8, R4
	BL addn
	
	ADD R1, #4
	ADD R4, #4
	LSR R9, R1
	SUBS R5, #1
	BNE up
	STRB R6, [R0]
STOP 
	B STOP
addn ADD R7,R8
	CMP R7, #0xA
	BCC store
	SUB R7, #0xA
	ADD R6, #01
store STRB r7, [R0],#1
	BX LR

N1 DCD 0x00000003
N2 DCD 0x00000123
	AREA mydata, DATA, READWRITE
DST dcd 0
	end
	