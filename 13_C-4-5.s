
13_C-4-5.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <While_a_plus_plus>:

int While_a_plus_plus (int a ,int b ,int c) 

  0:	e1a03000 	mov	r3, r0
  4:	e1a00001 	mov	r0, r1
  
  while( a < c) 
  8:	e1530002 	cmp	r3, r2    @a c cmp
  c:	a12fff1e 	bxge	lr      @>=
        b = a++ + b;
  10:	e1a01003 	mov	r1, r3
  14:	e2833001 	add	r3, r3, #1
  18:	e0800001 	add	r0, r0, r1
  
    while( a < c) 
  1c:	e1520003 	cmp	r2, r3
  20:	1afffffa 	bne	10 <While_a_plus_plus+0x10>
  24:	e12fff1e 	bx	lr
