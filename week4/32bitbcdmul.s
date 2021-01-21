
	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
		ldr r0,=n1
		ldr r2,[r0];op1
		bl b_h
		mov r9,r5;r9 op1 in h
		ldr r0,=n2
		ldr r2,[r0];op2
		bl b_h
		mov r10,r5;r10 op2 in h
		ldr r0,=product
		mul r9,r10
		bl h_b
		ldr r9,=temp
up2		ldr r12,[r9],#1
		ldr r11,[r9],#1
		lsl r11,#4
		orr r12,r11
		strb r12,[r0],#1
		subs r1,#1
		bne up2
stop	b stop
b_h		mov r3,#1
		mov r4,#0xa
		mov r5,#0
		mov r7,#0xf
up		mov r6,r2
		and r6,r7
		mla r5,r6,r3,r5
		mul r3,r4
		lsr r2,#4
		cmp r2,#0
		bne up
		bx lr
h_b		mov r8,#0
		ldr r1,=temp
up1		cmp r9,#0xa
		bcc store
		sub r9,#0xa
		add r8,#01
		b up1
store	strb r9,[r1],#1
		mov r9,r8
		mov r8,#0
		cmp r9,#0xa
		bcs up1
		strb r9,[r1]
		ldr r8,=temp
		sub r1,r8
		bx lr
n1 dcd 0x11
n2 dcd 0x11
		area mydata,data,readwrite
result dcd 0
product dcd 0
temp dcd 0
		end