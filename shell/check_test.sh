#!/bin/sh

source ./check.sh


### Test check_win


winning_player="$(_check_win_vertical 'A;- A;- A;- A;-')"
if [ "$winning_player" == "A" ]; then
    printf "."
else
    printf "\ncheck_win_2 Failed with winning_player: $winning_player\n"
fi

winning_player="$(_check_win_horizontal 'A;A;A;A')"
if [ "$winning_player" == "A" ]; then
    printf "."
else
    printf "\ncheck_win_3 Failed with winning_player: $winning_player\n"
fi

# Decline
winning_player="$(_check_win_decline 'A;42;43;44 31;A;33;34 21;22;A;24 11;12;13;A')"
if [ "$winning_player" == "A" ]; then
    printf "."
else
    printf "\ncheck_win_4 Failed with winning_player: $winning_player\n"
fi

# Incline
winning_player="$(_check_win_incline '41;42;43;A 31;32;A;34 21;A;23;24 A;12;13;14')"
if [ "$winning_player" == "A" ]; then
    printf "."
else
    printf "\ncheck_win_5 Failed with winning_player: $winning_player\n"
fi
