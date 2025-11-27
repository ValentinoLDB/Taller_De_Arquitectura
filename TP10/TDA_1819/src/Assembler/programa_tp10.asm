	.data
VAR_A:	.hword	3530
VAR_B:	.hword	5313
SUMA:	.hword	0
MAYOR:	.hword	0
MENOR:	.hword	0
	.code
	lh r1, VAR_A(r0)
	lh r2, VAR_B(r0)
	slt r3, r1, r2
	bnez r3, A_ES_MENOR
	dadd r4, r0, r1
	dadd r5, r0, r2
	jmp CALC_SUMA
A_ES_MENOR:	dadd r4, r0, r2
	dadd r5, r0, r1
CALC_SUMA:	dadd r6, r4, r5
	pushh r6
	andi r7, r6, 1
	bnez r7, ES_IMPAR
ES_PAR:	pushh r4
	pushh r5
	lh r8, 4(sp)
	sh r8, SUMA(r0)
	lh r9, 2(sp)
	sh r9, MAYOR(r0)
	lh r10, 0(sp)
	sh r10, MENOR(r0)
	daddi r11, r0, 0
	sh r11, 4(sp)
	jmp VACIA_PILA
ES_IMPAR:	pushh r5
	pushh r4
	lh r8, 4(sp)
	sh r8, SUMA(r0)
	lh r9, 0(sp)
	sh r9, MAYOR(r0)
	lh r10, 2(sp)
	sh r10, MENOR(r0)
	daddi r11, r0, 1
	sh r11, 4(sp)
VACIA_PILA:	poph r1
	daddi sp, sp, 2
	poph r2
	daddi sp, sp, 2
	poph r3
	daddi sp, sp, 2
fin:	halt
	halt