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
	MOV R6, #10
	LDR R4, =1
lo	STR R4, [R0]
	ADD R4, #1
	ADD R0, #4
	SUBS R6, #1
	BNE lo
	
	LDR R0, =SRC
	LDR R1, =SRC
	ADD R1, #36
	MOV R5, #5
up	LDR R2, [R0]
	LDR R3, [R1] 
	STR R2, [R1], #-4
	STR R3, [R0], #4
	SUBS R5, #1
	BNE up
STOP
	B STOP
	AREA mydata, DATA, READWRITE
SRC DCD 0
	END