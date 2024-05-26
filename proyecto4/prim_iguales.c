#include <stdio.h>
#define N 5

void pedir_arreglo(int tam, int a[]) {
	int i = 0;
	while (i<tam) {
		printf("Ingrese el indice %d: ",i);
		scanf("%d",&a[i]);
		i=i+1;
    }
}

void imprimir_arreglo(int n_max, int a[]){
    int i = 0;
    printf("\nEl arreglo es: \n");
    while (i<n_max) {
    printf("a[%d] = %d \n ", i, a[i]); /*devuelve el entero en la posicion i*/
    i=i+1; /*recorre todas las posiciones*/
	}
}
int prim_iguales(int tam, int a[]){
    int i= 1;

    
        while (i<tam){
            if (a[0]!=a[i])
            {
                imprimir_arreglo(i,a);
            }
           i= i+1;
            
        }
return i;
}


int main()
{
    int a[N];

    pedir_arreglo(N, a);

    int prim= prim_iguales(N, a);
    printf("El tramo inicial más largo del array es %d\n", prim);
    
    return 0;
}
