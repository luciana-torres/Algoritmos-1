#include <stdio.h>

int main(void){
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