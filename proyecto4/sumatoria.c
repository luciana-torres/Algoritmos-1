#include <stdio.h>
#define N 5

/*se le pide al usuario que ingrese los elementos del arreglo*/
void pedir_arreglo(int tam, int a[]) {
	int i = 0;
	while (i<tam) {
		printf("Ingrese el indice %d: ",i);
		scanf("%d",&a[i]);
		i=i+1;
    }
}
/*suma los elementos del arregloo*/
int sumatoria(int tam, int a[]){
    int x = 0;
    int i = 0;
    while (i< tam)
    {
        x = x + a[i];
        i = i + 1;
    }
    printf("la sumatoria de los elementos es: %d\n");

return x;
}
/*llama a las funciones*/
int main(void)
{
    int a[N];

    pedir_arreglo(N, a);
    sumatoria(N, a);

    return 0;
}
