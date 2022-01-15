.section .text
.align 2
.global _start

_start:
mov r0, #4
ldr r1, =_n  @载入_n的地址
ldr r2, [r1]  @载入n的值
ldr r1, =_repetition_num
ldr r3, [r1]
ldr r1, =_data

_fn:
str r2, [r1], #4
cmp r2, #1
bleq _end_test
tst r2, #1  @逻辑和运算
beq _even
bne _odd
b _fn

_even:
mov r2, r2, lsr #1
b _fn

_odd:
add r2, r2, lsl #1   @3*r = 2*r+r
add r2, #1
b _fn

_end_test:
cmp r0,r3
beq _end
add r3, #1
bx lr

_end: b _end

.section .data
_n:
.word 1
_data:
.skip 100

_repetition_num:
.word 3

