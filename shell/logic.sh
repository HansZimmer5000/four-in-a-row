#!/bin/sh

# Param 1 == field width
# Param 2 == field height
init_game(){
    #Hint: Alternatively to string use Arrays ${row[@]}

    empty_place="-"
    row=""
    field=""

    if [ "$1" -gt "0" ]; then
        row="-"
        current_width=1
        while [ "$1" -gt "$current_width" ]; do
            row="$row;-"
            current_width=$((current_width+1))
        done
    fi

    current_height=0
    while [ "$2" -gt "$current_height" ]; do
        field="$field $row"
        current_height=$((current_height+1))
    done
    echo $field
}

# Param 1: A field
# Returns a string which is expected to be printed with 'printf'
print_field(){
    field="$1"  
    #echo "$field"

    print="${field//' '/'\n'}" 
    echo "${print//';'/' '}"   
}

get_input(){
    read -p "Enter Column Number: " input
    echo $input
}

insert_token(){
    echo "NIPY"
}

check_win(){
    echo "NIPY"
}

# Param 1: Field
# Param 2: Current Player Token
game_round(){
    echo "NIPY"

    # get_input
    # insert_token
    # check_win
}

start_game(){
    field="$(init_game 7 6)"

    game_round "$field" "A"
}