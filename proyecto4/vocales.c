#include <stdio.h>
#include <stdbool.h>

char pChar (){
    char letra;
    printf("Ingrese una letra: %c");
    scanf("%d", &letra);

return letra;
}

bool es_vocal(char letra){
    char x;

    if (x== 'a' || x=='A' || x=='e' || x=='E', x=='i' || x=='I' || x=='o' || x=='O' || x=='u' || x=='U')
    {
        return true;
        printf("Verdadero");
    } else {
        return false;
        printf("falso");
    }
}

int main()
{
    char x =pChar();
    es_vocal(x);

    return 0;
    
}

