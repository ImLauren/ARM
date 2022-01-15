.section .text
.align 2
.global _start

@ 1 2 3 4 a b c d

_start:
and r5, #0  @overflow register to check for incorrect value later
mov r8, #1

@load variables
mov r1, #0x80000000
mov r2, #0x5
mov r3, #2
mov r4, #0xfffffff9

@ a * d 
umull r1, r5, r1, r4  @will multiply r1 and r4. result stored in r1 (bits 0-31) and r5 (bits 32 - 63)
    @umull  v4.4s, v17.4h, v1.4h                        (1)
    @v1寄存器的4个值（长度为H），与v17寄存器的4个值，对应元素相乘，所得结果保存在v4寄存器中（长度为S）
cmp r5, #0            @if r5 has any value, then the result has overflowed
movgt r8, #-1         @ser flag calc is wrong

and r5, #0            @reset overflow register

@ b * c
umull r2, r5, r2, r3
cmp r5, #0
movgt r8, #-1

subs r0, r1, r2     @subtract values and set flags
movvs r8, #-1       @vs: condition checks for overflow flag set in cpsr

_end:
b _end


