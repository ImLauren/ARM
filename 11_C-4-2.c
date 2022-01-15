#include<stdio.h>
#include<stdlib.h>
#include<math.h>

char if_else (char a ,char b);

int main(){
    char a = 'a';
    char b = 'b';
    char c;
    c = if_else(a,b);

    return 0;
}

char if_else (char a ,char b) 
{
    if( a == 'a' ) {
        a++;
    } else {
        b++;
    }
    return a+b;
}

