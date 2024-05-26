#include <stdio.h>
#define N 5

/*pide al usuario el tamaño del arreglo*/
int tamaño (void){
    int x ;
    printf("define el tamaño del arreglo: %d\n");
    scanf("%d", &x); /*guarda el valor ingresado*/
return x;

}
/*pide al usuario que ingrese valores para el arreglo*/
void pedir_arreglo(int n_max, int a[]){
    int i = 0; /*comienza en la posicion 0*/

    while (i<n_max) { /*mientras la posicion sea menor que el tamaño, ingresar in valor */

		printf("Ingrese el indice a[%d]: \n ",i);
		scanf("%d",&a[i]); /*guarda el valor en cada posicion*/

		i=i+1; /*pasa a la siguiente posicion*/
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

int main(void)
{
    int x = tamaño();
/*primero pide el tamañooo*/

    int a[x];
/*define el arregloooo*/

    pedir_arreglo(x, a);

    imprimir_arreglo(x, a);
    
    return 0;
}
