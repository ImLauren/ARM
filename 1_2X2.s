.section .text
.align 2
.global _start
_start: mov r0, #3  @a
        mov r1, #1  @b
        mov r2, #2  @c
        mov r3, #4  @d
        mul r0, r0, r3  @a*d 
        mul r1, r1, r2  @b*c 
        sub r0, r0, r1  @a*d - b*c 
_end: b _end
