#include <stdio.h>
int pInt (char a){
    
    int n;
    printf("ingrese un valor para %c\n");
    scanf("%d", &n);

    return n;
}

int suma_hasta(int n){
    int i=0; 
    
    while (i <= n){
        i = i + 1;
    }
    printf("la suma de los primeros n naturales es:%d'n", i);
return i;
}

int main()
{
    int x = pInt('x');
    suma_hasta(x);

    return 0;
}
