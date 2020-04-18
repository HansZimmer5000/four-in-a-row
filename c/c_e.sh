#!/bin/sh

set -e
# TODO use Valgrind?

execute_test(){
    gcc $1 -o test.out
    ./test.out
    rm ./test.out
}

execute_test "test_gamefield.c"
execute_test "test_logic.c"