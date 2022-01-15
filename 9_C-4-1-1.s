@  4.1.1 If statement - example 1

@  int if_int(int x, int y){
@  if(x == y){x += y;}
@    return x;
@  }

.section .text
.align 2
.global _start

_start:
    mov r0, #2      @x
    mov r1, #2      @y
    bl if_int
    mov r2, #5

_end:
    b _end

if_int:
    cmp r0,r1
    addeq r0,r1
    bx lr


