#include <stdio.h>
#include <assert.h>
#define N 5
/*pide al usuario ingresar los valores del arreglo*/
void pedir_arreglo(int tam, int a[]) {
	int i = 0;
	while (i<tam) {
		printf("Ingrese el indice %d: ",i);
		scanf("%d",&a[i]);
		i=i+1;
    }
}
/*pide dos posiciones para luego intercambiar sus valores*/
int pedir_posicion (int tam, char a){
    int var;
    assert( var > 0 && var < tam);

    printf("ingrese un valor para la posicion %d :\n", a );
    scanf("%d", &var);

return var;
}
/*intercambia los valores en las posiciones*/
void intercambiar(int tam, int a[], int i, int j){
    int iaux, jaux;
    iaux=a[i];
    jaux=a[j];

    assert(i<tam && j<tam && i!=j);

    a[i]=jaux;
    a[j]=iaux;
}

/*imprime todooo el arreglo*/
void imprimir_arreglo(int tam, int a[]) {
	int i = 0;
    printf("\nEl arreglo es: ");
    while (i<tam) {
    printf("a[%d] = %d  ", i, a[i]);
    i=i+1;
	}
	printf("\n");
}

int main(void)
{
    int a[N];

    pedir_arreglo(N, a);

    int i = pedir_posicion(N, 'i');
    int j = pedir_posicion(N, 'j');

    intercambiar(N, a, i, j);

    imprimir_arreglo(N,a);


return 0;
}
