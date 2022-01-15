.section .text
.align 2
.global _start

_start:
    ldr r0, =_num       @地址存放
    ldr r1, [r0], #4     @第一个数
    ldr r2, [r0], #4     @第二个数

_div:
    udiv r3, r1, r2      @r3 = r1 / r2  （无符号除数 整数）
    mul r5, r2, r3       @r5 = r2 * r3
    sub r4, r1, r5       @r4 = r1 - r5 = r1 - r2 * r3
    str r4, [r0], #4     @r4余数存到r0地址中
    cmp r4, #0
    beq _end
    bne _move

_move:
    mov r1, r2
    mov r2, r4
    b _div

_end:
    mov r0, r2           @r0存放答案
    b _end


.section .data
_num:
.word 45,10  @第一、二个数

