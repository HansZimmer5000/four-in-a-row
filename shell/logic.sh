#!/bin/sh

# Game Field is a string
# The top row comes first, then after and after the other rows.
# Rows are seperated by a blank space ' '
# Columns are seperated by a semi colon ';'
# Empty Places are "$empty_place" texts

empty_place="-"

source ./check.sh
source ./field.sh

# Param 1 == field width
# Param 2 == field height
init_game(){
    create_field $1 $2
}

# Param 1: A field
# Returns a string which is expected to be printed with 'printf "%s.."' due to newlines '\n'
print_field(){
    field="$1"

    print="${field//' '/'\n'}" 
    printf "%s${print//';'/' '}\n"   
}

# Returns number from stdin
get_input(){
    read -p "Enter Column Number: " input
    echo $input
}

# Param 1: Field
# Param 2: Selected Column
# Param 3: Player Token
insert_token(){
    rows=($1)
    current_index=$((${#rows[@]} - 1 ))
    place_index=$(($2-1))

    # Go From Bottom to Top
    while [ $current_index -ge 0 ]; do
        current_row="${rows[current_index]}"
        current_row=(${current_row//';'/' '})
        if [ "${current_row[place_index]}" ==  "$empty_place" ]; then
            current_row[$place_index]=$3
            current_row="${current_row[@]}"
            current_row=(${current_row//' '/';'})
            rows[$current_index]=${current_row[@]}
            break
        fi
        current_index=$((current_index - 1))
    done

    echo ${rows[@]}
}

# Param 1: Field
check_win(){
    _check_win_horizontal "$1"
    _check_win_vertical "$1"
    _check_win_incline "$1"
    _check_win_decline "$1"
}

# Param 1: Field
# Param 2: Current Player Token
game_round(){
    print_field "$1"

    selected_column=$(get_input)
    updated_field=$(insert_token "$1" $selected_column  "$2")
    winning_player=$(check_win "$updated_field")

    if [ -z "$winning_player" ]; then
        if [ "$2" == "A" ]; then
            game_round "$new_field" "B"
        else
            game_round "$new_field" "A"
        fi
    else
        echo "$winning_player has won the game!"
    fi
}

start_game(){
    field="$(init_game 7 6)"
    game_round "$field" "A"
}