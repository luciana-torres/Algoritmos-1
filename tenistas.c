#include <stdio.h>
#include <stdbool.h>

typedef struct {
    int altura;          // Altura en centímetros
    int nacimiento;      // Año de nacimiento
    int titulos;         // Cantidad de torneos ganados
    bool usa_izquierda;  // True si es zurdo / zurda
} tenista;

void imprimir_tenista_joven (tenista tenista[], int x){
    int i = 0;
    
    

}

int main(void)
{
 /*creo los tenistas*/
    tenista tenista1 = {180, 1995, 10, false};
    tenista tenista2 = {160, 2000, 7, true};
    tenista tenista3 = {190, 2005, 9, true};

    /*arreglo de tennistas, es decir, los tenistas creados los almaceno en un arreglo*/
    tenista tenistas[3]= {tenista1, tenista2, tenista3};

    return 0;
}
