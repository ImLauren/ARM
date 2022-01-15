.section .text 
.align 2
.global _start

_start:
    MOV r1,#4
    MOV r3,#0
    LDR r0,=_data

_loop:
    LDR r2, [r0], #4
    ADD r3, r3, r2
    SUBS r1,r1,#1
    BNE _loop
    STR r3, [r0]

_end: B _end


.section .data
_data: .word 0x12,0xd,0xff,0x55

