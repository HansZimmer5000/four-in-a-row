#!/bin/sh

# Game Field is a string
# The top row comes first, then after and after the other rows.
# Rows are seperated by a blank space ' '
# Columns are seperated by a semi colon ';'
# Empty Places are "$empty_place" texts

empty_place="-"

source ./check.sh
source ./field.sh

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
    height=$(get_height "$1")
    width=$(get_width "$1")

    if [ $height -ge 4 ] || [ $width -ge 4 ]; then
        winning_player=$(_check_win_horizontal "$1")
        if [ -z "$winning_player" ]; then 
            winning_player=$(_check_win_vertical "$1")
            if [ -z "$winning_player" ]; then 
                #winning_player=$(_check_win_incline "$1")
                if [ -z "$winning_player" ]; then
                    winning_player=$(_check_win_decline "$1") 
                fi
            fi
        fi
        echo $winning_player
    else
        echo "Field ($height x $width) is to small to find a four-in-a-row winner"
    fi
}

# Param 1: Field
# Param 2: Current Player Token
game_round(){
    print_field "$1"
    width=$(get_width "$1")
    height=$(get_height "$1")

    selected_column=$(get_input)
    if [ $selected_column -le 0 ] || [ $selected_column -gt $width ]; then
        echo "Please enter a number between 1 and $width"
    else
        #selected_column=$((selected_column - 1))
        updated_field=$(insert_token "$1" $selected_column  "$2")
        winning_player=$(check_win "$updated_field")

        if [ -z "$winning_player" ]; then
            if [ "$2" == "A" ]; then
                game_round "$updated_field" "B"
            else
                game_round "$updated_field" "A"
            fi
        else
            echo
            echo "$winning_player has won the game:"
            print_field "$updated_field"
        fi
    fi
}

start_game(){
    field="$(create_field 7 6)"
    game_round "$field" "A"
}