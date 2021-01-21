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
	LDR R0, =SRC
	LDR R1, [R0]
	MOV R2, #00
	LDR R6, =RESULT
up  CMP R1, #0xA
	BCC store                                                
	SUB R1, #0xA
	ADD R2, #01
	B up
store 
	ADD R1,#0x30
	STRB R1,[R6],#1
	MOV R1,R2
	MOV R2, #0
	CMP R1, #0xA
	BCS up
	ADD R1, #0x30
	STRB R1, [R6]
stop 
	B stop
SRC DCD 0xFF
	AREA data,DATA,READWRITE
RESULT DCD 0
	END