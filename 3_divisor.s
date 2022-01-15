.section .text
.align 2
.global _start

@ r0 = result
@ r1 = a
@ r2 = b
@ r3 = counter

_start:
mov r1, #45
mov r2, #10
mov r3,#0

_loop_div:
sub r1, r1, r2   @ r1 = r1 - r2  a-b
add r3, #1       @ increment counter
cmp r1, r2
moveq r0,r1
beq _end
blt _move_items    @lt  less than
b _loop_div

_move_items:
mov r3,r1
mov r1,r2
mov r2,r3
mov r3, #0
b _loop_div

_end: b _end



