#include<stdio.h>

typedef struct gameField {
    int field[2][2];
} gameField;

gameField init_field(void){
    gameField field;
    field.field[0][0] = 0;
    field.field[0][1] = 0; //1;
    field.field[1][0] = 0; //2;
    field.field[1][1] = 0; //3;
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

int check(gameField field, int current_player_token){
    return 0;
}