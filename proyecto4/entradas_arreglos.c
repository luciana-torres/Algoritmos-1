#include <stdio.h>
#define N 5

void pedir_arreglo(int n_max, int a[]){
    int i = 0;

    while (i < n_max)
    {
        printf("asignale un valor a la posicion %d: \n", i);
        scanf("%d", a[i]);
        i = i + 1;
    }   
}

void imprimir_arreglo(int n_max, int a[]){
    int i = 0;

    while (i < n_max)
    {
        printf("el valor del arreglo en la posicion %d es: %d\n", i, a[i]);
        i = i + 1;
    }
}

int main(void){
    int a[N];

    pedir_arreglo(N, a[N]);

    imprimir_arreglo(N, a[N]);
    return 0;
}
