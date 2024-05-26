#include <stdio.h>
#define N 5
/*defino la estructura*/
struct comp_t {
    int menores;
    int iguales;
    int mayores;
};

/*pido al usuario que ingrese los elementos del arreglo*/
void pedir_arreglo(int tam, int a[]) {
	int i = 0;
	while (i<tam) {
		printf("Ingrese el indice %d: ",i);
		scanf("%d",&a[i]);
		i=i+1;
    }
}
/*pido que se ingrese el elemento a comparar*/
int pedir_entero(char name) {
	int var;

	printf("Ingrese un valor para %c: ", name);
	scanf("%d", &var);
	return var;
}

/*cuantos elementos menores, iguales y mayores a un numero hay en un arreglo.*/
/*declaro las variables que tienen el tipo  comp_t (1 var)*/
struct comp_t cuantos(int tam, int a[], int elem) {
	struct comp_t c;
	int i = 0;

	c.menores = 0; /*Accedo a los miembros de la estructura por medio del punto*/
	c.iguales = 0;
	c.mayores = 0;

	while (i<tam) {
		if(a[i]<elem) {
			c.menores = c.menores+1;
		}

		if(a[i]==elem) {
			c.iguales = c.iguales+1;
		}

		if(a[i]>elem) {
			c.mayores = c.mayores+1;
		}
		i=i+1; 
	}
	return c;
}

void imprimir_cuantos(int e, struct comp_t c){
  	printf("\nElementos menores a %d = %d\nElementos iguales a %d = %d\nElementos mayores a %d = %d\n",e, c.menores, e, c.iguales, e, c.mayores); 
}

int main()
{
    int a[N];

	int elem = pedir_entero('e');
	pedir_arreglo(N, a);

	imprimir_cuantos(elem, cuantos(N, a, elem));
    return 0;
}
