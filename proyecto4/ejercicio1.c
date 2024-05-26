#include <stdio.h>
#include <assert.h>

/*pide que ingrese la variable*/
int pInt (char a) {
    int a;
    printf("ingresa un valor para %c: \n");
    scanf("%d",&a);

    return a;
}
/*que hago con la variable, los calculosss*/
void hola_hasta(int n){
    assert(n>0);

    while (n>0)
    {
        printf("hola\n");
        n = n-1;

    }
    
}
/*llamo a las funcioness*/
int main(void)
{
    int n= pInt('n');

    hola_hasta(n);
    return 0;
}
