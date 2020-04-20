#include <stdio.h>
#include <assert.h>
#include "gamefield.c"

void test_check_vertical(void){
    //gameField * field = {0,0,0,0}; // init_field();

    //int win = check_vertical(field, 65);
    //assert(1 == win);
}

int main(void){
    printf("Start Gamefield Test\n");

    gameField field = init_field();
    print_field(field);

    gameField new_field = insert_token(field, 2, 'A');
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