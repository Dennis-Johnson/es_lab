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
	LDR R0, =N1
	LDR R1, =N2
	LDRB R2, [R0]
	LDRB R3, [R1]
	MOV R7, R2
	MOV R8, R3

back	CMP R2, R3
		BEQ exit
		BCS down
		SUB R3,R2
		B back
down    SUB R2,R3
		B back
exit	LDR R0, =GCD
		STRB R2,[R0]
		LDR R6, =LCM
		MOV R5, #0
		MUL R7,R8
		LDR R4, [R0]
		CMP R4, #1
		BEQ prod
up 		SUB R7,R4
		ADD R5, #1
		CMP R7, #0
		BNE up
		STR R5,[R6]
		B STOP
prod	STR R7,[R6]
STOP 	B STOP
N1 DCD 0x00000010
N2 DCD 0x00000006
	AREA data,DATA,READWRITE
GCD DCD 0
LCM DCD 0
	END