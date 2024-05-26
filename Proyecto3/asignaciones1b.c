#include <stdio.h>

int main(void)
{
    int x;
    printf("Asignale un valor a x\n");
    scanf("%d", &x);
     rintf("Asignale un valor a y\n");
    scanf("%d", &y);
    printf("El valor de x es : %d\n", x);
    x= x + y;
    printf("Ahora el valor de x es: %d\n", x);
    y = y+y;
    printf("Ahora el valor de y es: %d\n", y);

    return 0;
}
