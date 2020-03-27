#!/bin/sh

source ./logic.sh

### Test insert_token

field=$(insert_token "-;-;- -;-;-" 1 A)
if [ "$field" == "-;-;- A;-;-" ]; then 
    printf "."
else
    printf "\ninsert_token_1 Failed with field: $field\n"
fi

field=$(insert_token "-;-;- A;-;-" 1 B)
if [ "$field" == "B;-;- A;-;-" ]; then 
    printf "."
else
    printf "\ninsert_token_2 Failed with field: $field\n"
fi

field=$(insert_token "A;-;- A;-;-" 1 A)
if [ "$field" == "A;-;- A;-;-" ]; then 
    printf "."
else
    printf "\ninsert_token_3 Failed with field: $field\n"
fi

field=$(insert_token "-;-;- A;-;-" 3 A)
if [ "$field" == "-;-;- A;-;A" ]; then 
    printf "."
else
    printf "\ninsert_token_4 Failed with field: $field\n"
fi

### Test check_win

winning_player="$(check_win '-;- -;- -;-')"
if [ "$winning_player" == "Field (3 x 2) is to small to find a four-in-a-row winner" ]; then
    printf "."
else
    printf "\ncheck_win_1 Failed with winning_player: $winning_player\n"
fi

winning_player="$(check_win 'A;- A;- A;- A;-')"
if [ "$winning_player" == "A" ]; then
    printf "."
else
    printf "\ncheck_win_2 Failed with winning_player: $winning_player\n"
fi

winning_player="$(check_win 'A;A;A;A')"
if [ "$winning_player" == "A" ]; then
    printf "."
else
    printf "\ncheck_win_3 Failed with winning_player: $winning_player\n"
fi

# Decline
winning_player="$(check_win 'A;42;43;44 31;A;33;34 21;22;A;24 11;12;13;A')"
if [ "$winning_player" == "A" ]; then
    printf "."
else
    printf "\ncheck_win_4 Failed with winning_player: $winning_player\n"
fi

# Incline
winning_player="$(check_win '41;42;43;A 31;32;A;34 21;A;23;24 A;12;13;14')"
if [ "$winning_player" == "A" ]; then
    printf "."
else
    printf "\ncheck_win_5 Failed with winning_player: $winning_player\n"
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