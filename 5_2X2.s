.section .text
.align 2
.global _start

_start:
    ldr r0, =_matrix
    ldr r1, [r0]  @a
    ldr r2, [r0, #4*1]  @b
    ldr r3, [r0, #4*2]  @c
    ldr r4, [r0, #4*3]  @d

    mul r5, r1, r4  @a*d 
    mul r6, r2, r3  @b*c 
    sub r0, r5, r6  @a*d - b*c 

_end: b _end



.section .data
_matrix:
.word 1,2,3,4 @ a,b,c, and d values

