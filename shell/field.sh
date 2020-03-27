#!/bin/sh

# Param 1: field width
# Param 2: field height
create_field(){
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

# Param 1: field
# Param 2: 0-n row index
# Beware: Returned as array with spaces between tokens
get_row(){
    rows=($1)
    height=$((${#rows[@]} - 1))
    if [ $2 -le $height ]; then
        row=${rows[$(($height - $2))]}
        row=${row[@]//';'/' '}
        echo $row
    fi
}

# Param 1: field
# Param 2: 0-n column index
# Beware: Returned as array with spaces between tokens
get_column(){
    rows=($1)
    width=$(($(get_width "$1") - 1))
    result=""

    if [ $2 -le $width ]; then
        for current_row in ${rows[@]}; do
            current_row=(${current_row//';'/' '})
            result="${current_row[$2]} $result"
        done
    fi

    echo $result
}

# Param 1: field
# Param 2: 0-n row index
# Param 3: 0-n column index
get_token(){
    row=($(get_row "$1" $2))
    if [ "$row" != "" ]; then
        token=${row[$3]}
        echo $token
    fi
}

# Param 1: field
# Requirement: Every row has the same length
get_width(){
    rows=($1)
    first_row=${rows[0]}
    first_row=(${first_row//';'/' '})
    width=${#first_row[@]}
    echo $width
}

# Param 1: field
get_height(){
    rows=($1)
    height=${#rows[@]}
    echo $height
}

# Param 1: A field
# Returns a string which is expected to be printed with 'printf "%s.."' due to newlines '\n'
print_field(){
    field="$1"

    print="${field//' '/'\n'}" 
    printf "%s${print//';'/' '}\n"   
}