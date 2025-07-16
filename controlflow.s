	.equ	LEDS, 0xFF200000// create a constant
	
	.section	.data// DATA memory
E:	.word	7
G:	.word	10

	.section	.text// PROGRAM memory
	.syntax		unified// to accept older versions
	.global		main
	
main:
	/* USER CODE BEGIN */

  	ldr    r0, =G//    r0 points to G
    	ldr    r1, [r0]//    r1 = G
    	ldr    r2, =E//    r2 points to E
    	ldr    r3, [r2]//    r3 = E
    	mov    r4, #0//    r4 = 0
    	cmp    r1, r3//    compare G with E (G - E)
    	ble    then//    skip to 'then' if G <= E (signed)
    	b    else//    skip to 'else' if G > E (signed)
then:
    	str    r4, [r0]//    G = 0
    	b    foreverLoop//    skip to the forever loop
else:
    	str    r4, [r2]//  E = 0

  	/* USER CODE END */
foreverLoop:
    	b	foreverLoop
