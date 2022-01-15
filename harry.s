.section .text
.align 2
.global _start

@ We are using signed representation
@ If we place -6 in r1 and 6 in r2, the command adds r1, r2 will set zero and carry flags
@ If we place 0 in r1 and 0 in r2, the command adds r1, r2 will only set zero flag. Suggests we are in unsigned representation by default
@ Max value for 32 bit unsigned int is 4,294,967,295
@ range of determinate we can calculate is -2147483648 to 2147483647 - the minimum and maximum of a signed 32 bit integer, but depending on how you read the data can be as high as 4,294,967,295
@ The range of an individual register depends on how you decide to read the data stored there
@ Assuming we have no way of constraining the value of the variables beyond the capacity of the registers, we cannot guarantee the reult of them beign multiplied can be stored in the registers.
@ This is because the max value storable multiplied by 2 is not storable in a single register. This can be worked around by extending into 2 registers and splitting the answer

@ Notes:
    @ muls with 2 negatives doesn't change values of any cpsr flags
    @ Values to test with were:
        @ Playing around with negatives and how they affect cpsr flags/operations
        @ negative minus nagative == negative add positive
        @ Lowest number - positive number sets carry and overflow flags
        @ Using the umull instruction allows solid recognition of overflow bits and incorrect reopresentation

@ r1 = a -> a * d
@ r2 = b
@ r3 = c
@ r4 = d

_start:
    and r5, #0            @ Overflow register to check for incorrect values later
    mov r8, #1            @ Begin assuming result will be correct
    
    @ Load variables
    mov r1, #0x80000000
    mov r2, #0x5
    mov r3, #2
    mov r4, #0x1
    
    @ a * d 
    umull r1, r5, r1, r4  @ Will multiply r1 and r4. result stored in r1 (bits 0 - 31) and r5 (bits 32 - 63)
    cmp r5, #0            @ If r5 has any value, then the result has overflowed
    movgt r8, #-1         @ Set flag calc is wrong

    and r5, #0            @ Reset overflow register

    @ b * c 
    umull r2, r5, r2, r3  @ Will multiply r2 and r3. result stored in r2 (bits 0 - 31) and r5 (bits 32 - 63) if required
    cmp r5, #0            @ If r5 has any value, then the result has overflowed
    movgt r8, #-1         @ Set flag calc is wrong

    subs r0, r1, r2       @ Subtract values and set flags
    movvs r8, #-1         @ {vs} condition checks for overflow flag set in cpsr

_end: 
    b _end
