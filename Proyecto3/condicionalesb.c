#include <stdio.h>

int main(int argc, char const *argv[])
{
    int x, y, z, m;
    printf("Asignale un valor a x\n");
    scanf("%d", &x);
    printf("Asignale un valor a y\n");
    scanf("%d", &y);
    printf("Asignale un valor a z\n");
    scanf("%d", &z);
    printf("Asignale un valor a m\n");
    scanf("%d", &m);
    printf("El estado inicial de x , y, z, m es: %d, %d, %d, %d\n", x, y, z m);


if (x<y)
{
    printf("El estado inicial de m es: %d\n", m);
    m=x;
    printf("El estado 2 de m es: %d\n", m);
}
else if (x>=y)
{
    printf("El estado 2 de m es: %d\n", m);
    m=y;
    printf("El estado 2 de m es: %d\n", m);
}
    printf("El estado actual de x , y, z, m es: %d, %d, %d, %d\n", x, y, z m);

if (m<z)
{}
else if (m>=z)
{
    m=z;
}

    printf("El estado final de x , y, z, m es: %d, %d, %d, %d\n", x, y, z m);

    return 0;
}
