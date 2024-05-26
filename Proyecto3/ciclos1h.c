#include <stdio.h>

int main(void)
{
  int i;
  printf("Ingrese un valor para i \n");
  scanf("%d", &i);
  printf("El valor inicial es i=%d \n", i);

  while (i != 0) {
  printf("El valor es i=%d \n", i);
    i = i - 1;
  }
  printf("El valor final es i=%d \n", i);
  return 0;
}