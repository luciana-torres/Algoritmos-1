#include <stdio.h>
#include <limits.h>
#define N 5
/*ingresamos los indices*/
void pedir_arreglo(int tam, int a[]){
    int i = 0; /*comienza en la posicion 0*/

    while (i< tam) { /*mientras la posicion sea menor que el tamaño, ingresar in valor */

		printf("Ingrese el indice a[%d]: \n ",i);
		scanf("%d",&a[i]); /*guarda el valor en cada posicion*/

		i=i+1; /*pasa a la siguiente posicion*/
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


int minimo_pares(int tam, int a[]){
    int minaux;

    minaux = INT_MAX;
    int i = 0;

    while (i < tam)
    {
        if (a[i] % 2 == 0 && a[i] < minaux) /*si el elemento en la posicion es par (resto 0 en la div por 2) y es menos al minauxx*/
        {
            a[i] = minaux; /*es el nuevo minaux*/
        }
        i= i + 1; 
    }
}

int minimo_impares(int tam, int a[]){
    int minaux;

    minaux = INT_MAX;
    int i = 0;
    while (i < tam)
    {
        if (a[i] % 2 != 0 && a[i] < minaux)
        {
            a[i] = minaux;
        }
        i= i + 1;  
    }
}

int main()
{
    int a[N];

    pedir_arreglo(N, a[N]);
    imprimir_arreglo(N, a[N]);

    minimo_pares(N, a[N]);
    minimo_impares(N, a[N]);
    return 0;
}
