#!/bin/sh

empty_place="-"

# Param 1 == field width
# Param 2 == field height
init_game(){
    #Hint: Alternatively to string use Arrays ${row[@]}

    row=""
    field=""

    if [ "$1" -gt "0" ]; then
        row="$empty_place"
        current_width=1
        while [ "$1" -gt "$current_width" ]; do
            row="$row;$empty_place"
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
# Returns a string which is expected to be printed with 'printf' due to newlines '\n'
print_field(){
    field="$1"

    print="${field//' '/'\n'}" 
    echo "${print//';'/' '}"   
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

check_win(){
    echo "NIPY"
}

# Param 1: Field
# Param 2: Current Player Token
game_round(){
    echo "NIPY"

    selected_column=$(get_input)
    insert_token "$1" $selected_column  "$2"
    # check_win

    if [ "$2" == "A" ]; then
        game_round "$new_field" "B"
    else
        game_round "$new_field" "A"
    fi
}

start_game(){
    field="$(init_game 7 6)"
    game_round "$field" "A"
}