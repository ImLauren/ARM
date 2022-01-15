
15_C-4-7.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <do_while>:

int do_while (int a ,int b) 

  0:	e1a03000 	mov	r3, r0

  do 
        a = a + 1;
  4:	e2833001 	add	r3, r3, #1    @r3 = a

  while( a < b );
  8:	e1530001 	cmp	r3, r1       @ a b
  c:	bafffffc 	blt	4 <do_while+0x4>
  10:	e2803001 	add	r3, r0, #1
  14:	e2412001 	sub	r2, r1, #1
  18:	e1500001 	cmp	r0, r1
  1c:	b0420000 	sublt	r0, r2, r0
  20:	a3a00000 	movge	r0, #0

  return a;
  24:	e0830000 	add	r0, r3, r0
  28:	e12fff1e 	bx	lr
