#include <stdio.h>
#include <assert.h>

int pINt (char name){
    int n;
    assert( n > 0);

    printf("ingrese un valor para %c: \n", name);
    scanf("%d", &n);

    return n;
}

struct info_t {
    int op_sum; // Guarda la suma
    int op_mul; // Guarda la multiplicación
    int op_div; // Guarda la división entera
    int op_dist; // Guarda el valor absoluto de la resta
};

int valor_abs (int x){
    int abs;

    if (x < 0){
        abs= -x;
    }
    else abs = x;
}

struct info_t operar(int x, int y){
    struct info_t res;

    res.op_sum = x + y;
    res.op_mul = x * y;
    res.op_div = x / y;
    res.op_dist = valor_abs(x-y);

    return res;
}


int main()
{
    int a, b;

    a= pINt('a');
    b= pINt('b');
    assert(a > 0 && b > 0 && a > b);
    
    struct info_t res= operar(a,b);

    printf("la suma de %d y %d es %d. \n", a, b, res.op_sum);
    printf("la multiplicacion de %d y %d es %d. \n", a, b, res.op_mul);
    printf("la division de %d y %d es %d. \n", a, b, res.op_div);
    printf("el valor abs. de la resta de %d y %d es %d. \n", a, b, res.op_dist);


    return 0;
}
