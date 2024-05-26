#include <stdio.h>

int pINt (char name){
    int a;
    printf("ingrese un valor para %c: \n", name);
    scanf("%d", &a);

    return a;
    
}

int absoluto (int a, char name){
    int  n;
    if ( n >= 0)
    {
        printf("el valor absoluto de %c es: %d \n", name, n);
    }
    else if (n < 0)
    {
        n = -1 * n;
        printf("el valor absoluto de %c es: %d \n", name,  n);
        
    }
    
}

int main()
{
    int x;

    x=pINt('x');
    absoluto(x, 'x');

    return 0;
}