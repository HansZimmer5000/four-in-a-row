#include<stdio.h>

typedef struct gameField {
    int height;
    int width;
    int field[7][6];
} gameField;

gameField init_field(void){
    gameField field;
    field.height = 6;
    field.width = 7;

    for (int col_index = 0; col_index < field.width; col_index++){
        for (int row_index = 0; row_index < field.height; row_index++){
            field.field[col_index][row_index] = 0;
        }
    }
    
    return field;
}

void print_field(gameField field){
    for (int row_index = field.height-1; row_index >= 0; row_index--){
        for (int col_index = 0; col_index < field.width; col_index++) {
            int value = field.field[col_index][row_index];
            if (value >= 42){
                printf("%c ", value);
            } else {
                printf("%d ", value);
            }
        }
        printf("\n");
    }
}

gameField insert_token(gameField field, int column_number, int player_token){
    int column_index = column_number-1;
    for (int i = 0; i <= 6; i++){
        int token = field.field[column_index][i];
        if (token == 0){
            field.field[column_index][i]=player_token;
            break;
        }
    }
    return field;
}

int * get_column(gameField field, int column_index){
    int * col = field.field[column_index];
    return col;
}

// CHECKS

int check_horizontal(gameField field, int current_player_token){
    for (int col_index = 0; col_index < (field.width-3); col_index++){
        for (int row_index = 0; row_index < field.height; row_index++){
            if (field.field[col_index][row_index] == current_player_token && 
                field.field[col_index][row_index] == field.field[col_index + 1][row_index] &&
                field.field[col_index][row_index] == field.field[col_index + 2][row_index] &&
                field.field[col_index][row_index] == field.field[col_index + 3][row_index]){
                    return 1;
            }
        }
    }
    return 0;
}

int check_vertical(gameField field, int current_player_token){
    int * col;
    for (int col_index = 0; col_index < field.width; col_index++){
        col = get_column(field, col_index);
        for (int row_index = 0; row_index < (field.height-3); row_index++){
            if (col[row_index] == current_player_token && 
                col[row_index] == col[row_index + 1] &&
                col[row_index] == col[row_index + 2] &&
                col[row_index] == col[row_index + 3]){
                    return 1;
            }
        }
    }
    return 0;
}

int check_incline(gameField field, int current_player_token){
    for (int col_index = 0; col_index < (field.width-3); col_index++){
        for (int row_index = 0; row_index < (field.height-3); row_index++){
            if (field.field[col_index][row_index] == current_player_token && 
                field.field[col_index][row_index] == field.field[col_index + 1][row_index + 1] &&
                field.field[col_index][row_index] == field.field[col_index + 2][row_index + 2] &&
                field.field[col_index][row_index] == field.field[col_index + 3][row_index + 3]){
                    return 1;
            }
        }
    }
    return 0;
}

int check_decline(gameField field, int current_player_token){
    for (int col_index = 3; col_index < field.width; col_index++){
        for (int row_index = 0; row_index < (field.height-3); row_index++){
            if (field.field[col_index][row_index] == current_player_token && 
                field.field[col_index][row_index] == field.field[col_index - 1][row_index + 1] &&
                field.field[col_index][row_index] == field.field[col_index - 2][row_index + 2] &&
                field.field[col_index][row_index] == field.field[col_index - 3][row_index + 3]){
                    return 1;
            }
        }
    }
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

