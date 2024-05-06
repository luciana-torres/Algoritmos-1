#include <stdio.h>

int main(){
    int x,y;
    printf("Asignale un valor a x\n");
    scanf("%d", &x) ;
     printf("Asignale un valor a y\n");
    scanf("%d", &y) ;
    printf("El valor de x es:%d\n",x);
    printf("El valor de y es:%d\n",y);
    x= x + y;
    printf("el valor de x ahora es:%d\n", x);
    printf("El valor de y es:%d\n",y);
    y= y + y;
    printf("el valor de y ahora es:%d\n", y);

    return 0;
}
/*Asignale un valor a x
7
Asignale un valor a y
3
El valor de x es:7
El valor de y es:3
el valor de x ahora es:10
El valor de y es:3
el valor de y ahora es:6*/