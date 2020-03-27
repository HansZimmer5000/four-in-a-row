#!/bin/sh

# Param 1: Field
_check_win_horizontal(){
    rows=($1)
    current_index=$((${#rows[@]} - 1 ))

    while [ $current_index -ge 0 ]; do
        current_row="${rows[current_index]}"
        current_row=(${current_row//';'/' '})

        current_row_count=${#current_row[@]}
        current_place_index=0
        while [ $((current_row_count - current_place_index)) -ge 0 ] && [ $current_place_index -lt $current_row_count ]; do
            current_player_token=${current_row[current_place_index]}
            if [ "$current_player_token" != "$empty_place" ] && [ "${current_row[((1 + $current_place_index))]}" == "$current_player_token" ] && [ "${current_row[$((2 + $current_place_index))]}" == "$current_player_token" ] && [ "${current_row[$((3 + $current_place_index))]}" == "$current_player_token" ]; then
                echo "$current_player_token"
            fi
            current_place_index=$((current_place_index + 1))
        done

        current_index=$((current_index - 1))
    done 
}