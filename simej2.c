#include <stdio.h>
#include <stdbool.h>
#define N 5

void pedir_arreglo(int tam, int a[]){
    int i = 0;
    assert(tam > 0);

    while (i < tam)
    {
        printf("asignale un valor a la posicion %d: \n", i);
        scanf("%d", a[i]);
        i = i + 1;
    }   
}

typedef struct {
    int cant_v;          
    int cant_pares;      
    int cant_imp;   
    bool hay_8;     
} datos;

datos llenar_estructura(int a[], int tam, int v) {
    datos res; 
    int i = 0;
    
    //Inicializo los campos de la estructura
    
    res.cant_v = 0;
    res.cant_pares = 0;
    res.cant_imp = 0;
    res.hay_8 = false;

    while (i < tam) {
        if (a[i] == v){ 
   	        res.cant_v++;
 	    }

        if (a[i] % 2 == 0){ 
	        res.cant_pares++;
        }
        else{ 
	        res.cant_imp++;
	    }
 
        if (a[i] == 8){ 
	        res.hay_8 = true;
	    }
	
	    i++;
    }

    return res;
}

int main() {
    int a[N];
    int v;
    int i = 0;

    pedir_arreglo(N,a[N]);    

    printf("Ingrese un valor entero v:\n");
    scanf("%d", &v);

    datos res = llenar_estructura(a, N, v);

    printf("===Resultados===\n");
    printf("Cantidad de veces que se encontró a v: %d\n", res.cant_v);
    printf("Cantidad de pares: %d\n", res.cant_pares);
    printf("Cantidad de impares: %d\n", res.cant_imp);
    if(res.hay_8){
	    printf("Hay al menos un 8 en el arreglo\n");
    }
    else{
	    printf("No hay ningún 8 en el arreglo\n");
    }

    return 0;
}
