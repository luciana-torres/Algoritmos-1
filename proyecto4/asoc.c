#include <stdio.h>
#include <stdbool.h>
#define N 5

typedef char clave_t;
typedef int valor_t;

struct asoc {
clave_t clave;
valor_t valor;
};

void pedir_arreglo(int tam, struct asoc a[]){
    int i = 0; /*comienza en la posicion 0*/

    while (i<tam) { /*mientras la posicion sea menor que el tamaño, ingresar in valor */

		printf("Ingrese un valor y una clave para a[%d]: \n ",i);
		scanf("%d",& a[i].valor); 
        scanf("%c", &a[i].clave); /*guarda el valor en cada posicion*/

		i=i+1; /*pasa a la siguiente posicion*/
    }
}

/*pido que se ingrese una clave comparar*/
char pClave() {
	int n;

	printf("Ingrese una clave");
	scanf("%c", &n);
	return n;
}


bool asoc_existe(int tam, struct asoc a[], clave_t c){
    int i = 0;

    while (i < tam) /*mientras la posicion sea menor al tamaño*/
    {
        if (a[i].clave== c) /*si el indice de la pos. es igual a la clave retorna true*/
        {
            return true;
        }
        i = i + 1; /*sino avanca a la siguiente posicion*/
    }
    
return false;
}

int main(void)
{
    struct asoc a[N];

    pedir_arreglo_asoc(N, a);

	clave_t clave = pedir_clave();
	bool existe_clave = asoc_existe(N, a, clave);

	if(existe_clave) {
		printf("La clave '%c' si existe en el arreglo\n", clave);
	} else {
		printf("La clave '%c' no existe en el arreglo\n", clave);
	}
    return 0;
}
