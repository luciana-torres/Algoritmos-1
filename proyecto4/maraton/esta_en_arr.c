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

int pInt (char a){
    
    int n;
    printf("ingrese un valor para %c\n");
    scanf("%d", &n);

    return n;
}

bool esta_en_arreglo(int a[], int tam, int v){
    int i = 0;

    while (i < tam)
    {
        if (a[i] == v)
        {
            return true;
            printf("el valor %d esta en el arreglo", v);
        }
        i = i + 1;  
    }
    return false;
}

int esta_en_posicion(int a[], int tam, int v){
    int i = 0;

    while (i < tam)
    {
        if (a[i] == v)
        {
            printf("el valor %d esta en la posicion %d", v, i);
        }
        i = i + 1;  
    }
    return i;
}

void imprimir_arreglo(int tam, int a[]){
    int i = 0;

    while (i < tam)
    {
        printf("el valor del arreglo en la posicion %d es: %d\n", i, a[i]);
        i = i + 1;
    }
}


int main()
{
    int x;
    int a[N];
    pedir_arreglo(N, a[N]);
    x = pInt('x');

    if (esta_en_arreglo(a[N], N, x) == true)
    {
        esta_en_posicion(a[N], N, x);
    }
    else printf("el elemento no esta en el arreglo");
    
    return 0;
}
