#include <stdio.h>
#include <assert.h>
#include "logic.c"

int main(void){
    printf("Hallo\n");

    assert(0 == returnone());

    char * d = "1";
    assert(1 == returnasnum(d));

    char e = "1";
    printf("%d\n", e); // Value
    //printf("%d\n", *e); // Value unter Value
    printf("%d\n", &e); // Value Location?

    return 0;
}
