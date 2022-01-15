.section .text
.global  _start
.align   2

_start:
    mov r0, #0xC
    mov r1, #0x8

_s:
    cmp r0,r1
    blt _swap
    beq _end
    sub r0, r0 ,r1
    b _s

_swap:
    sub r1,r1,r0
    b _s

_end: b _end


