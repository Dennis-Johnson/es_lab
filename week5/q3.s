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
	LDR R0, =KEY
	LDR R1, [R0]
	LDR R2, =ARR
	LDR R9, =POS
	mov r6, #0
	mov r7, #5
	mov r8, #0
up
	LDR R3, [R2], #4
	add r8, #1
	SUBS R3, R1
	BEQ store
	SUBS R7, R7, #1
	BNE up
store 
	MOV R6, #1
	STR R6, [R9], #4
	STR R7, [R9]
	B STOP
STOP
	B STOP

KEY DCD 3
ARR DCD 01,02,03,04,05
	AREA mydata, DATA, READWRITE
POS DCD 0
	END
		
	