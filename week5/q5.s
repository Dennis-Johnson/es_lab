
		AREA RESET, DATA, READONLY
		EXPORT __Vectors
__Vectors
	DCD 0X10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
		
Reset_Handler
	LDR R0, =1
	LDR R1, =9
	LDR R2, =2
	LDR R3, =7
	LDR R4, =6
	LDR R5, =3
	LDR R6, =8
	LDR R7, =5
	LDR R8, =4
	LDR R9, =0
	
	STMDB R13!, {R0-R9}
	MOV R0, R13
L2	MOV R1, R0
	MOV R3, R0
	SUB R3, #4
	ADD R11, R10, #1
L1	LDM R3, {R4}
	LDM R1, {R7}
	CMP R4, R7
	BCC UP
	MOV R1,R3
UP	SUB R3,#4
	ADD R11, #1
	CMP R11, #10
	BNE L1
	LDM R0!, {R2}
	LDM R1!, {R6}
	STMDB R1, {R2}
	STMDB R0, {R6}
	ADD R10, #1
	CMP R10, #9
	BNE L2
	LDM R13!, {R0-R9}
STOP
	B STOP
	END
	