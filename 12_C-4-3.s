
12_C-4-3.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <for_loop>:

int for_loop (int a ,int b) 

  int c = 0;
  for( int i = a; i < b; i++ ){
   0:	e1500001 	cmp	r0, r1   @ a b
   4:	aa000005 	bge	20 <for_loop+0x20>

   8:	e1a03000 	mov	r3, r0       @ i = a
   c:	e2833001 	add	r3, r3, #1   @r3 = i
  10:	e1510003 	cmp	r1, r3       @b  i
  14:	1afffffc 	bne	c <for_loop+0xc>
  18:	e0430000 	sub	r0, r3, r0
  1c:	e12fff1e 	bx	lr
    int c = 0;
  20:	e3a00000 	mov	r0, #0
        c++;
    }
    return c;

  24:	e12fff1e 	bx	lr
