@4.1.2 If statement - example 2

@  int if_char(char x, char y){
@  if(x ==y){x = ’a’;}
@    return x;
@  }



.section .text
.align 2
.global _start

_start:
    mov r0, #1  @x
    mov r1, #1  @y
    bl if_char
    mov r2, #5

_end:
    b _end

if_char:
    cmp r0, r1
    addeq r0, #97
    andeq r0, #255
    bx lr
