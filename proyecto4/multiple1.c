#include <stdio.h>
#include <assert.h>

int pInt (char a){
    int var;
    printf("Ingresa un valor para %c: \n");
    scanf("%d",&var);

return var;
}

void asignaciones (int x, int y){
    int x, y, auxx, auxy;
    x = auxx;
    y= auxy;
    assert(x== auxx && y==auxy);

    x = auxx + 1;
    y= auxx + auxy;
    assert(x == auxx + 1 && y== auxx + auxy);

    printf("el valor de x es:%d\n", x);
    printf("el valor de y es:%d\n", y);


}


int main(void)
{
    int x = pInt('x');
    int y = pInt('y');

    asignaciones(x, y);

    return 0;
}
