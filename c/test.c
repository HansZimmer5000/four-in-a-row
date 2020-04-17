#include <stdio.h>
#include <assert.h>
#include "gamefield.c"

int main(void){
    printf("Start Test\n");

    gameField d = init_field();
    print_field(d);

    //assert(0 == returnone());

    //char * d = "1";
    //assert(1 == returnasnum(d));

    return 0;
}

/*
char e = 1;
printf("%d\n", e); // Value
//printf("%d\n", *e); // Value unter Value
printf("%d\n", &e); // Value Location?
*/