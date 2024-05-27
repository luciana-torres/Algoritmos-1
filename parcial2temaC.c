#include <stdio.h>
#define N 5

/*Para compilar un archivo .c escribir en la terminal:
$> gcc -Wall -Wextra -std=c99 miarchivo.c -o miprograma
Para ejecutar escribir:
$> ./miprograma*/
/*se le pide al usuario que ingrese los elementos del arreglo*/
void pedir_arreglo(int tam, int a[]) {
	int i = 0;
	while (i<tam) {
		printf("Ingrese el indice %d: ",i);
		scanf("%d",&a[i]);
		i=i+1;
    }
}

struct stonks
{
    int sube;
    int baja;
};

struct stonks stonks_master (int tam, int a[])
{
    struct stonks res;

    res.baja = 0;
    res.sube = 0;
    
    int i = 0;

    while (i< tam)
    {
        if (a[i] > a[i + 1])
        {
            res.baja = res.baja + 1;
        }
        else if (a[i]< a[i + 1])
        {
            res.sube= res.sube + 1;
        }

        i= i + 1;
    }
};

int main()
{ 
    int a[N];
    pedir_arreglo(N, a[N]);

    struct stonks res = stonks_master(N, a[N]);

    printf("cantidad de veces que baja: %d", res.baja);
    printf("cantidad de veces que sube: %d", res.sube);


    return 0;
}


