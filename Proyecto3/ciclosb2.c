#include <stdio.h>

int main(void)
{
    int x, i, rest;
  printf("Ingrese un valor para x \n");
  scanf("%d", &x);
  printf("Ingrese un valor para i \n");
  scanf("%d", &i);
  printf("Ingrese un valor para rest\n");
  scanf("%d", &rest);
  i=2;
  rest=1;
  printf("El estado actual de i es: %d y el de rest es:%d\n", i, rest;

while (i < x && rest)
{
  rest=rest&&(mod(x,i)!=0);
  i= i+1;
}
  printf("El estado actual de i es: %d y el de rest es:%d\n", i, rest);
return 0;
}