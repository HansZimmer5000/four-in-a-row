#!/bin/sh

set -e

start_game(){
    gcc game.c -o game.out
    ./game.out
}

start_game 
