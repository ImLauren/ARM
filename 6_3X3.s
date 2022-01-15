.section .text
.align 2
.global _start

_start:
    ldr r0, =_matrix
    ldr r1, [r0, #4 * 4]  @e
    ldr r2, [r0, #4 * 5]  @f
    ldr r3, [r0, #4 * 7]  @h
    ldr r4, [r0, #4 * 8]  @i
    bl _2x2matrix
    ldr r1, [r0] @a
    mul r8, r1, r7

    ldr r1, [r0, #4 * 3]  @d
    ldr r2, [r0, #4 * 5]  @f
    ldr r3, [r0, #4 * 6]  @g
    ldr r4, [r0, #4 * 8]  @i
    bl _2x2matrix
    ldr r1, [r0, #4 * 1]  @b
    mul r9, r1, r7

    ldr r1, [r0, #4 * 3]  @d
    ldr r2, [r0, #4 * 4]  @e
    ldr r3, [r0, #4 * 6]  @g
    ldr r4, [r0, #4 * 7]  @h
    bl _2x2matrix
    ldr r1, [r0, #4 * 2]  @c
    mul r10, r1, r7

    sub r0, r8, r9
    add r0, r0, r10

_end: b _end



_2x2matrix:
    mul r5, r1, r4  
    mul r6, r2, r3 
    sub r7, r5, r6
    mov pc, lr

.section .data
_matrix:
.word 6,1,1,4,-2,5,2,8,7 @ a,b,c,d,e,f,g,h, and i values
