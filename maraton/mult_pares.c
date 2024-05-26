#include <stdio.h>
#define N 5

void pedir_arreglo(int tam, int a[]){
    int i = 0;

    while (i < tam)
    {
        printf("asignale un valor a la posicion %d: \n", i);
        scanf("%d", a[i]);
        i = i + 1;
    }   
}

void imprimir_arreglo(int tam, int a[]){
    int i = 0;

    while (i < tam)
    {
        printf("el valor del arreglo en la posicion %d es: %d\n", i, a[i]);
        i = i + 1;
    }
}

int mult_pares(int tam, int a[]){
    int i= 0;
    int j = 1;

    while (i< tam)
    {
        if(a[i] % 2 == 0){
            j = j * a[i];
        }
    i = i + 1;
    }

    printf("la multiplicacion de todos los valores el arreglo es %d", j);

return j;
}


int main(int argc, char const *argv[])
{
    int a[N];

    pedir_arreglo(N, a[N]);
    imprimir_arreglo(N, a[N]);
    mult_pares(N, a[N]);

    return 0;
}
