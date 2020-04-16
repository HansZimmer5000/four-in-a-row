#include<stdlib.h>

enum token {A=0, B=1};

typedef struct gameField {
    int dzug;
} gameFieldAlias;

int returnone(void){
    gameFieldAlias d;
    d.dzug = 0;
    return d.dzug;
}

int returnparamone(char * argv){
    int res;
    res = atoi(argv);
    return res;
}
