#include <stdio.h>
#include <stdbool.h>

struct lienzos
{
    int l1;
    int l2;
    int l3;
    int l4;
};

struct tipo_lienzo
{
    bool es_paisaje;
    bool es_figura;
    bool ninguna_anteriores;
};

struct tipo_lienzo verificar (struct lienzos t)
{
    struct tipo_lienzo ver;

    ver.ninguna_anteriores=false;

    if (t.l1 == t.l2 == t.l3 == t.l4)
    {
        ver.es_figura = true;
    }
    if (t.l1 == t.l3 && t.l2 == t.l4 && t.l1 != t.l2)
    {
        ver.es_paisaje=true;
    }
    else ver.ninguna_anteriores=true;

return ver;
};

int main()
{
    struct lienzos t;
    struct tipo_lienzo ver;

    printf("ingrese los valores de los lados");
    scanf("%d, %d, %d, %d", &t.l1, &t.l2, &t.l3, &t.l4);

    ver = verificar (t);

    printf("es_figura: %s \n", ver.es_figura);
    return 0;
}


