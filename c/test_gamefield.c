#include <stdio.h>
#include <assert.h>
#include "gamefield.c"

int main(void){
    printf("Start Gamefield Test\n");

    gameField d = init_field();
    print_field(d);

    gameField new_field = insert_token(d, 1, 'A');
    assert(65 == new_field.field[1][0]);

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