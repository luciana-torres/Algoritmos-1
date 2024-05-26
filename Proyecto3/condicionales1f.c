#include <stdio.h>

int main(void) {
int x, y;

printf("Ingresa un valor para x:");
scanf("%d",&x);
printf("Ingresa un valor para y:");
scanf("%d", &y);
printf("los valores iniciales de x e y son: %d y %d \n", x, y );

if (x>=y){
  printf("El estado de x=%d , y=%d \n", x, y);
  x=0;
  printf("El estado 2 es x=%d , y=%d \n", x, y);
}

else if (x<=y) {
    printf("El estado 1 es x=%d , y=%d \n", x, y);
    x=2;
    printf("El estado 2 es x=%d , y=%d \n", x, y); 
}

return 0;
}