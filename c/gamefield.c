#include<stdio.h>

typedef struct gameField {
    int field[2][2];
} gameField;

gameField init_field(void){
    gameField field;
    field.field[0][0] = 0;
    field.field[0][1] = 1;
    field.field[1][0] = 2;
    field.field[1][1] = 3;
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

void insert_token(gameField field, int column_number){
    //int column[] = field.field[column_number];
    
}