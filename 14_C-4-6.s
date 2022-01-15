
14_C-4-6.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <While_plus_plus_a>:

int While_plus_plus_a (int a ,int b,int c) 

   0:	e1a03000 	mov	r3, r0
   4:	e1a00001 	mov	r0, r1

    while( a < c) 
   8:	e1530002 	cmp	r3, r2
   c:	a12fff1e 	bxge	lr
        b = ++a + b;
  10:	e2833001 	add	r3, r3, #1
  14:	e0800003 	add	r0, r0, r3

    while( a < c) 
  18:	e1520003 	cmp	r2, r3
  1c:	1afffffb 	bne	10 <While_plus_plus_a+0x10>
  20:	e12fff1e 	bx	lr
