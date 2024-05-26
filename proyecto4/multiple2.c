#include <stdio.h>
#include <assert.h>

int pINt(char a){
    int n;
    printf("ingrese un valor para %c\n");
    scanf("%d", &n);

    return n;
}

void  asignacion_m (int x, int y, int z) {
    int x, y, z, auxx, auxy, auxz;
    x = auxx;
    y= auxy;
    z=auxz;

    assert(x==auxx && y==auxy && z==auxz);

    x=auxy;
    y= auxy + auxx + auxz;
    z= auxy + auxx;

    assert( x==auxy && y==auxy + auxx + auxz && z==auxy + auxx);

    printf("el valor de x es:%d\n", x);
    printf("el valor de y es:%d\n", y);
    printf("el valor de z es:%d\n", z);

}
int main()
{
    int x =pINt('x');
    int y =pINt('y');
    int z =pINt('z');

    asignaciones_m(x, y, z);

    return 0;
}
