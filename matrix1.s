.section .text
.align 2
.global _start
_start:

       LDR r0, =_martrix

       LDR r1,[r0,#4 * 4] @ e
       LDR r4,[r0,#4 * 8] @ i 
       LDR r2,[r0,#4 * 5] @ f
       LDR r3,[r0,#4 * 7] @ h 
       bl _det_2x2
       mov r8,r7
       LDR r9,[r0] @ a
       MUL r10,r8,r9


       LDR r1,[r0,#4 * 3] @ d
       LDR r4,[r0,#4 * 8] @ i 
       LDR r2,[r0,#4 * 5] @ f
       LDR r3,[r0,#4 * 6] @ g
       bl _det_2x2
       mov r8,r7
       LDR r9,[r0,#4] @ b
       MUL r11,r8,r9


       LDR r1,[r0,#4 * 3] @ d
       LDR r4,[r0,#4 * 7] @ h 
       LDR r2,[r0,#4 * 4] @ e
       LDR r3,[r0,#4 * 6] @ g
       bl _det_2x2
       mov r8,r7
       LDR r9,[r0,#4 * 2] @ c
       MUL r12,r8,r9

       SUB r13,r10,r11
       ADD r14,r12,r13

_end:	b _end


_det_2x2:
       MUL r5,r1,r4  @ a * d
       MUL r6,r2,r3
       SUB r7,r5,r6
       mov pc, lr


.section .data
_martrix:
.word 6,1,1,4,-2,5,2,8,7 @a b c d e f g h i
@     a b c d  e f g h i  

