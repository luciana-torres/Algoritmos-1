#include <stdio.h>
#include <assert.h>

int pINt(char a){
    int n;
    printf("ingrese un valor para %c\n");
    scanf("%d", &n);

    return n;
}

struct div_t {
int cociente;
int resto;
};


struct div_t division(int x, int y){
    struct div_t res;

	assert(x>=0 && y>=0 && y!=0);
	res.cociente = x/y; /*cocienteee*/
	res.resto = x%y; /*restoo*/

	return res;
}

void imprimir_div_t(struct div_t res) {
	printf("Cociente = %d, Resto = %d\n", res.cociente, res.resto);
}

int main(void)
{
    struct div_t div;

	int x = pedir_entero('x');
	int y = pedir_entero('y');

	div = division(x, y);
	imprimir_div_t(div);
	return 0;
}