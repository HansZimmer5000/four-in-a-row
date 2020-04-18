#include<stdio.h>

typedef struct gameField {
    int field[2][2];
} gameField;

gameField init_field(void){
    gameField field = {0,0,0,0};
    return field;
}

void print_field(gameField field){
    for (int i = 1; i >= 0; i--){
        for (int j = 0; j < 2; j++) {
            printf("%d ", field.field[j][i]);
        }
        printf("\n");
    }
}

gameField insert_token(gameField field, int column_number, int player_token){
    int column_index = column_number-1;
    for (int i = 0; i < 2; i++){
        int token = field.field[column_index][i];
        if (token == 0){
            field.field[column_index][i]=player_token;
            break;
        }
    }
    return field;
}

int * get_column(gameField * field, int column_index){
    return field->field[column_index];
}

int get_width(gameField field){
    return (sizeof field.field);
}

int get_height(gameField field){
    return (sizeof field.field[0]);
}

// CHECKS

int check_horizontal(gameField field, int current_player_token){
    return 0;
}

int check_vertical(gameField field, int current_player_token){
    for (int col_index = 0; col_index < get_width(field); col_index++){
        
    }
    return 0;
}

int check_incline(gameField field, int current_player_token){
    return 0;
}

int check_decline(gameField field, int current_player_token){
    return 0;
}

int check(gameField field, int current_player_token){
    //int width = (sizeof field.field[0][0]);
    //int height = (sizeof field.field[0]);
   
    int win = check_horizontal(field, current_player_token);
    if (win == 0){
        win = check_vertical(field, current_player_token);
        if (win == 0){
            win = check_incline(field, current_player_token);
            if (win == 0){
                win = check_decline(field, current_player_token);
            } 
        } 
    } 

    return win;
}

