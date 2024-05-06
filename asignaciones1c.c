#include <stdio.h>

int main(){
    int x,y;
    printf("Asingale un valor a x:\n");
    scanf("%d", &x);
    printf("Asingale un valor a y:\n");
    scanf("%d", &y);
    y= y+y;
    printf("Ahora el valor de y es:%d\n", y);
    x= x + y;
    printf("El valor de x ahora es:%d\n", x);

    return 0;
}
/*Asingale un valor a x:
5
Asingale un valor a y:
4
Ahora el valor de y es:8
El valor de x ahora es:13*/