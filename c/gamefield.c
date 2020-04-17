#include<stdio.h>

typedef struct gameField {
    int field[6];//[7];
} gameField;

gameField init_field(void){
    gameField field;
    return field;
}

void print_field(gameField field){
    printf("%f\n", field.field);
    for (int i = 0; i < 7; i++){
        //printf("%d\n", field.field[i]);
    }
}