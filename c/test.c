#include <stdio.h>
#include <assert.h>
#include "logic.c"

int main(void){
    printf("Hallo\n");

    assert(0 == returnone());

    char * d = "1";
    assert(1 == returnparamone(d));

    printf("%d\n", d);
    printf("%d\n", *d);
    printf("%d\n", &d);

    return 0;
}
