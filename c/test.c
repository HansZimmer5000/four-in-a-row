/*
g
*/
#include <stdio.h>
#include <assert.h>
#include "logic.c"

int main(void){
    printf("Hallo\n");

    printf("%d\n", returnone());
    assert(0 == returnone());

    return 0;
}
