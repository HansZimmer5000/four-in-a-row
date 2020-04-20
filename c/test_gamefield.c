#include <stdio.h>
#include <assert.h>
#include "gamefield.c"

void test_check_vertical(void){
    int height = 5;
    int width = 2;
    //TODO Field is still a 7x6 array, make dynamic in the future. 
    //TODO Since field is still a 7x6 array, -1 is on [0][5] (col 1, row 6), a location which will not be visible in a 5x2 field.
    gameField field = {height,width,1,1,1,1,1,-1,0,65,65,65,65};

    printf("df\n\n");
    print_field(field);

    int win = check_vertical(field, 65);
    assert(1 == win);
}

int main(void){
    printf("Start Gamefield Test\n");

    gameField field = init_field();
    print_field(field);

    gameField new_field = insert_token(field, 2, 'A');
    assert(65 == new_field.field[1][0]);

    int win = check(new_field, 'A');
    assert(0 == win);

    test_check_vertical();

    return 0;
}
