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
    row=${rows[$2]}
    row=${row[@]//';'/' '}
    echo $row
}

# Param 1: field
# Param 2: 0-n column index
# Beware: Returned as array with spaces between tokens
get_column(){
    rows=($1)
    rows_count=${#rows[@]}
    result=""

    if [ $2 -le $rows_count ]; then
        for current_row in ${rows[@]}; do
            current_row=(${current_row//';'/' '})
            result="$result ${current_row[$2]}"
        done
    fi

    echo $result
}

# Param 1: field
# Param 2: 0-n row index
# Param 3: 0-n column index
get_token(){
    rows=($1)
    rows_count=${#rows[@]}
    result=""

    row=${rows[$2]}
    row=(${row//';'/' '})
    token=${row[$3]}

    echo $token
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