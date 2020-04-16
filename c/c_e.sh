#!/bin/sh

set -e

# TODO use Valgrind?
#gcc game.c -o game.out
gcc test.c -o test.out

./test.out