#include <stdio.h>
#include <stdbool.h>

#define N 5

int pINt (char name){
    int a;
    printf("ingrese un valor para %c: \n", name);
    scanf("%d", &a);

    return a;
}

/*se le pide al usuario que ingrese los elementos del arreglo*/
void pedir_arreglo(int tam, int a[]) {
	int i = 0;
	while (i<tam) {
		printf("Ingrese un valor para la posicion %d:",i);
		scanf("%d",&a[i]);
		i=i+1;
    }
}

bool todos_pares(int tam, int a[]){
    int i = 0;

    while (i < tam)
    {
        if (a[i] % 2 !=0)
        {
            return false;
        }
        i = i + 1;
    }
 return true;   
}

bool existe_multiplo(int m, int tam, int a[]){
    int i = 0;

    while (i < 0)
    {
        if (a[i] % m == 0)
        {
            return true;
        }
        i = i + 1;
    }
    
}
/*llama a las funciones*/
int main(void)
{
    int y = pINt('y');
    int a[N];

    pedir_arreglo(N, a);
    todos_pares(N, a[N]);
    existe_multiplo(y, N, a[N]);

    return 0;
}