.section .text
.align 2
.global _start

_start:
    mov r1, #3  @n值

_loop:
    cmp r1, #1
    beq _end
    tst r1, #1
    beq _even
    bne _odd
    b _loop

_even:
    mov r1, r1, lsr #1
    b _loop

_odd:
    add r1, r1, lsl #1
    add r1, #1
    b _loop

_end:
    b _end

