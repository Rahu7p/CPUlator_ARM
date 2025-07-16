.equ	LEDS, 0xFF200000// create a constant
	
	.section	.data// DATA memory
D:.word	0
F:.word	1
E:.word	7
G:.word	10

	.section	.text// PROGRAM memory
	.syntax		unified// to accept older versions
	.global		main
	
main:
	/* USER CODE BEGIN */

  ldr  r0, =D//  r0 points to D
  ldr  r1, [r0]//  r1 = D
  ldr  r2, [r0, #4]//  r2 = E
  ldr  r3, [r0, #8]//  r3 = F
  ldr  r4, [r0, #12]//  r4 = G
  add  r1, r2, r3//  r1 = r2 + r3
  sub  r1, r1, r4//  r1 = (r2 + r3) - r4
  str  r1, [r0]//  D = E + F - G

  /* Condition Flags
   * unsigned addition, C = 1 */
  ldr  r0, =4000000000
  ldr  r1, =300000000
  adds  r2, r0, r1
  /* signed addition, V=1 */
  ldr  r0, =2000000000
  ldr  r1, =300000000
  adds  r2, r0, r1

  /* USER CODE END */
foreverLoop:
	b	foreverLoop
