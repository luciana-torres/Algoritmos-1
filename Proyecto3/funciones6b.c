#include <stdio.h>
#include <stdbool.h>

bool pedir_booleano (void){
    int x;
    printf("Ingresa el valor de verdad de la variable '%c' 0 False, 1 True\n",a);
    scanf("%d",&x);
    return x;     
}

void imprimir_booleano (bool x,char a) {
    if(x){
    printf("El valor de verdad de la variable '%c' es: "verdadero" \n",a);
    }
    else{
    printf("El valor de verdad de la variable '%c' es: "falso" \n",a);
    }
}
int main()
{
    bool c;
    char n = 'A';
    c = pedir_booleano(n);
    imprimir_booleano(c,n);
    return 0;
}
