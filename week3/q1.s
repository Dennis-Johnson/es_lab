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
	LDR R7, =VALUE1
	LDR R8, =VALUE2
	LDR R1, [R7]
	LDR R2, [R8]
	UMULL R3,R4,R2,R1
	LDR R2, =RESULT
	STR R4, [R2]
	ADD R2, #4
	STR R3, [R2]
STOP
	B STOP
VALUE1 DCD 0x00000003
VALUE2 DCD 0x10000002
	AREA data, DATA,READWRITE
RESULT DCD 0
	END