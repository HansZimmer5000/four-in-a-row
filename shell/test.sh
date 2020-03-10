#!/bin/sh

source ./logic.sh
printf "Begin Testing: "

### Test init_game

field="$(init_game 3 2)"
if [ "$field" == "-;-;- -;-;-" ]; then
    printf "."
else
    printf "\ninit_game_1 Failed with field: $field\n"
fi

field="$(init_game 1 1)"
if [ "$field" == "-" ]; then
    printf "."
else
    printf "\ninit_game_2 Failed with field: $field\n"
fi

field="$(init_game 7 6)"
if [ "$field" == "-;-;-;-;-;-;- -;-;-;-;-;-;- -;-;-;-;-;-;- -;-;-;-;-;-;- -;-;-;-;-;-;- -;-;-;-;-;-;-" ]; then
    printf "."
else
    printf "\ninit_game_2 Failed with field: $field\n"
fi

### Test print_field

print="$(print_field '-;- -;- -;-')"
if [ "$print" == "- -\n- -\n- -" ]; then
    printf "."
else
    printf "\nprint_field_1 Failed with field: $print\n"
fi

print="$(print_field '1;3;5 0;2;4')"

if [ "$print" == "1 3 5\n0 2 4" ]; then
    printf "."
else
    printf "\nprint_field_2 Failed with field: $print\n"
fi




### Test get_input

printf "\nEnter 0 next: "
input="$(get_input)"
if [ "$input" == "0" ]; then
    printf "."
else
    printf "\nget_input_1 Failed with field: $input\n"
fi

printf "\nEnter 9 next:"
input="$(get_input)"
if [ "$input" == "9" ]; then
    printf "."
else
    printf "\nget_input_2 Failed with field: $input\n"
fi


printf "\nEnding\n"