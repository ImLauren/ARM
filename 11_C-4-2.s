
9_C-4-2.o:     file format elf32-littlearm


Disassembly of section .text:

00000000 <main>:
    char b = 'b';
    char c;
    c = if_else(a,b);

    return 0;
}
   0:	e3a00000 	mov	r0, #0
   4:	e12fff1e 	bx	lr

00000008 <if_else>:

char if_else (char a ,char b) 
{
    if( a == 'a' ) {
   8:	e3500061 	cmp	r0, #97	; 0x61
        a++;
        } else {
        b++;
   c:	12811001 	addne	r1, r1, #1
  10:	120110ff 	andne	r1, r1, #255	; 0xff
        a++;
  14:	03a00062 	moveq	r0, #98	; 0x62
    }
    return a+b;
  18:	e0800001 	add	r0, r0, r1
}
  1c:	e20000ff 	and	r0, r0, #255	; 0xff
  20:	e12fff1e 	bx	lr
