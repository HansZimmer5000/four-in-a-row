#include<stdlib.h>
#include"gamefield.c"

enum token {A='A', B='B'};

int get_input(void){
    int column_number;
    scanf("%d", &column_number);
    return column_number;
}

void game_round(current_player_token){
    printf("Insert Column Number: \n");
    int column_number = get_input();

    //todo

    if (A == current_player_token){
        game_round(B);
    } else {
        game_round(A);
    }
}
