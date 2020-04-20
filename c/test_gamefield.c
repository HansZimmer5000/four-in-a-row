#include <stdio.h>
#include <assert.h>
#include "gamefield.c"

void test_check_vertical(void){
    int height = 5;
    int width = 2;
    //TODO Field is still a 7x6 array, make dynamic in the future. 
    //TODO Since field is still a 7x6 array, -1 is on [0][5] (col 1, row 6), a location which will not be visible in a 5x2 field.
    int platzhalter= -1;
    gameField field = {height,width,1,1,1,1,1,platzhalter,0,65,65,65,65};
    int win = check_vertical(field, 65);
    assert(1 == win);
}

void test_check_horizontal(void){
    int height = 2;
    int width = 5;
    // TODO like in test_check_vertical
    int platzhalter= -1;
    gameField field = {height, width, 
        0,5,platzhalter,platzhalter,platzhalter,platzhalter,
        1,65,platzhalter,platzhalter,platzhalter,platzhalter,
        2,65,platzhalter,platzhalter,platzhalter,platzhalter,
        3,65,platzhalter,platzhalter,platzhalter,platzhalter,
        4,65,platzhalter,platzhalter,platzhalter,platzhalter};

    int win = check_horizontal(field, 65);
    assert(1 == win);
}

void test_check_incline(void){
    int height = 5;
    int width = 5;
    // TODO like in test_check_vertical
    int platzhalter= -1;
    gameField field = {height, width, 
        0,5,11,11,11,platzhalter,
        1,65,22,22,22,platzhalter,
        2,6,65,33,33,platzhalter,
        3,7,44,65,44,platzhalter,
        4,8,55,55,65,platzhalter};

    int win = check_incline(field, 65);
    assert(1 == win);
}

void test_check_decline(void){
    int height = 5;
    int width = 5;
    // TODO like in test_check_vertical
    int platzhalter= -1;
    gameField field = {height, width, 
        0,5,11,11,11,platzhalter,
        1,6,22,22,65,platzhalter,
        2,7,33,65,33,platzhalter,
        3,8,65,44,44,platzhalter,
        4,65,55,55,55,platzhalter};

    int win = check_decline(field, 65);
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
    test_check_horizontal();
    test_check_incline();
    test_check_decline();

    return 0;
}
