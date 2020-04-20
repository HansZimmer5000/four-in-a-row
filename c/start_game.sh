#!/bin/sh

set -e

start_game(){
    gcc $1 -o game.c
}

start_game 