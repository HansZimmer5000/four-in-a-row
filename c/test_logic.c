#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "logic.c"

int main(void){
    printf("Start Logic Test\n");

    printf("Insert 0 next:\n");
    int column_number = get_input();
    assert(0 == column_number);

    return 0;
}
