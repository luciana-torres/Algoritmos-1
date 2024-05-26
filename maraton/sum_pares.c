#include <stdio.h>
#include <assert.h>
#define N 5

void pedir_arreglo(int tam, int a[]){
    int i = 0;
    assert(tam > 0);

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

int suma_val_posiciones_pares(int a[], int tam){
    int i = 0;
    int j = 0;

    while (i < tam)
    {
        if (i % 2 == 0)
        {
            j = j + a[i];
        }
        i = i+1;
    }
    printf("La suma de las posiciones pares es %d:", j);
}

int main()
{
    int a[N];

    pedir_arreglo(N, a[N]);
    suma_val_posiciones_pares(N, a[N]);

    return 0;
}
