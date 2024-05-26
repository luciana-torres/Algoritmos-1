#include <stdio.h>
int pINt (char name){
    int a;
    printf("ingrese un valor para %c: \n", name);
    scanf("%d", &a);

    return a;
    
}

int minimo (int a, int b){
    int  n, m;
    if ( n > m)
    {
        printf("el minimo entre x e y es: %d", m);
    }
    printf("el minimo entre x e y es: %d \n",n);
    
}

int main()
{
    int x, y;

    x=pINt('x');
    y=pINt('y');

    minimo(x, y);
    return 0;
}
