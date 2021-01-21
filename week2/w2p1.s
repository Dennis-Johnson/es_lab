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
	LDR R0, =VALUE
	LDR R5, =RESULT
	MOV R1, #0
	MOV R3, #10
	MOV R4, #0
up	LDR R2, [R0], #4
	ADDS R1, R2
	ADC R4, #0
	SUBS R3, #1
	BNE up
	STR R1,[R5], #4
	STR R4, [R5]

STOP
	B STOP
VALUE DCD 0xFFFFFFFF,0x00000001,0x00000001,0x00000001,0x0000000B,0x00000001,0x00000001,0x00000001,0x00000001,0x00000001
	AREA mydata, DATA, READWRITE
RESULT DCD 0
	END