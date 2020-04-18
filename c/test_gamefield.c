#include <stdio.h>
#include <assert.h>
#include "gamefield.c"

int main(void){
    printf("Start Gamefield Test\n");

    gameField d = init_field();
    print_field(d);

    gameField new_field = insert_token(d, 2, 'A');
    assert(65 == new_field.field[1][0]);

    int win = check(new_field, 'A');
    assert(0 == win);

    return 0;
}

/*
char e = 1;
printf("%d\n", e); // Value
//printf("%d\n", *e); // Value unter Value
printf("%d\n", &e); // Value Location?
*/