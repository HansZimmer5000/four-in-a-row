#include"gamefield.c"
#include"check.c"

enum token {A='A', B='B'};

int get_input(void){
    int column_number;
    scanf("%d", &column_number);
    return column_number;
}

void game_round(gameField field, int current_player_token){
    printf("Insert Column Number: \n");
    int column_number = get_input();

    gameField new_field = insert_token(field, column_number, current_player_token);
    //todo

    if (A == current_player_token){
        game_round(new_field, B);
    } else {
        game_round(new_field, A);
    }
}
