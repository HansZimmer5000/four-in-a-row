#include"gamefield.c"

enum token {A='A', B='B'};

int get_input(void){
    int column_number;
    scanf("%d", &column_number);
    return column_number;
}

int switch_player(int current_player_token){
    int next_player = A;
    
    if (A == current_player_token){
        next_player = B;
    } 
    return next_player;
}

void game_round(gameField field, int current_player_token){
    printf("Insert Column Number: \n");
    int column_number = get_input();

    gameField new_field = insert_token(field, column_number, current_player_token);
    int player_won = check(new_field, current_player_token);

    if (player_won == 1){
        printf("Player %c won!\n", current_player_token);
    } else {
        game_round(new_field, switch_player(current_player_token));
    }
}

void start_game(void) {
    gameField field = init_field();
    game_round(field, A);
}
