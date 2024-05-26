#include <stdio.h>
#include <float.h>
#define N 5

struct datos_t {
float maximo;
float minimo;
float promedio;
};

void pedir_arreglo(int tam, float a[]) {
	int i = 0;
	while (i<tam) {
		printf("Ingrese el indice %d: ",i);
		scanf("%d",&a[i]);
		i=i+1;
    }
}
/*calcula el mınimo, el maximo, y el promedio de un arreglo no vacıo de numeros flotantes*/
struct datos_t stats(int tam, float a[]){
    struct datos_t s;

    float maxaux = __FLT128_MIN__;
	float minaux = __FLT128_MAX__;
	float prom = 0;
    int i = 0;

    s.maximo;
    s.minimo;
    s.promedio;

    
	while(i<tam) {
		if (a[i]>maxaux) {
			maxaux = a[i];
		}

		if (a[i]<minaux) {
			minaux = a[i];
		}

		prom = prom + a[i];

		i=i+1;
	}
    
    s.maximo= maxaux;
    s.minimo = minaux;
    s.promedio = prom/tam;

}

void imprimir_stats (struct datos_t s){
    printf("el maximo del arreglo es %d \n el minimo del arreglo es %d \n el promedio del arreglo es %d", s.maximo, s.minimo , s.promedio );
}

int main()
{
    int a[N];

    pedir_arreglo(N, a[N]);
    imprimir_stats(stats(N, a[N]));
    return 0;
}
