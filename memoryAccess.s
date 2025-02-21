	.equ	LEDS, 0xFF200000// create a constant
	
	.section	.data// DATA memory
sAddress:	
	.word	0x12345678
	.word	0x11223344
	.word	0x55667788
	.word	0x99AABBCC

	.section	.text// PROGRAM memory
	.syntax		unified// to accept older versions
	.global		main
	
main:
	/* PC-relative */
	ldr	r1, =sAddress// r1 points to variable sAddress
	/* Immediate */
	mov	r0, #100// r0=100
	/* Indexed:
	 * with constant value */
	ldr	r0, [r1]// r0 = word pointed by r1+0
	ldr	r0, [r1, #4]// r0 = word pointed by r1+4
	/* with register value */
	mov	r2, #12
	ldr	r0, [r1, r2]// r0 = word pointed by r1+r2
	mov	r2, #2
	ldr	r0, [r1, r2, lsl #2]// r0 = word pointed by r1+(r2*4)
	/* pre-increment */
	ldr	r0, [r1, #4]!// first r1=r1+4, then r0=word pointed by r1
	/* post-increment */
	ldr	r0, [r1], #-4// first r0=word pointed by r1, then r1=r1+4
	
	/* Memory optional modifiers */
	ldr		r0, [r1, #8]// word
	ldrb	r0, [r1, #8]// unsigned byte
	ldrsb	r0, [r1, #8]// signed byte
	ldrh	r0, [r1, #8]// unsigned halfword
	ldrsh	r0, [r1, #8]// signed halfword
	ldrd	r2, r3, [r1, #8]// double word
	
foreverLoop:
	b		foreverLoop
