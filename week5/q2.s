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
	LDR R0, =N
	LDR R1, =RESULT
	LDR R2, [R0]
	BL fact
	STR R2,[R1]
STOP B STOP

fact PUSH{R3, LR}
	MOV R3, R2
	CMP R2, #0
	BNE down 
	MOV R2, #1
	B down1
	
down sub r2,#1
	bl fact
	mov r4,r3
	mul r2,r4

down1 pop{r3, lr}
	bx lr
	
N dcd 0x04
		
	AREA mydata, DATA, READWRITE
RESULT DCD 0
	END