#!/bin/sh

# Param 1: Field
_check_win_horizontal(){
    rows=($1)
    max_row_index=$(get_height "$1")
    max_column_index=$(get_width "$1")

    for current_row_index in $(seq 0 $max_row_index); do
        current_row=$(get_row "$1" $current_row_index)

        for current_column_index in $(seq 0 $max_column_index); do
            current_token=$(get_token "$1" $current_row_index $current_column_index )
            next_1_token=$(get_token "$1" $current_row_index $(($current_column_index + 1)))
            next_2_token=$(get_token "$1" $current_row_index $(($current_column_index + 2)))
            next_3_token=$(get_token "$1" $current_row_index $(($current_column_index + 3)))
            if [ "$current_token" != "" ] &&
                [ "$current_token" != "$empty_place" ] &&
                [ "$next_1_token" == "$current_token" ] &&
                [ "$next_2_token" == "$current_token" ] &&
                [ "$next_3_token" == "$current_token" ]; then
                echo "$current_token"
                break
            fi
        done
    done
}

# Param 1: Field
_check_win_vertical(){
    rows=($1)
    max_row_index=$(get_height "$1")
    max_column_index=$(get_width "$1")

    for current_row_index in $(seq 0 $max_row_index); do
        current_row=$(get_row "$1" $current_row_index)

        for current_column_index in $(seq 0 $max_column_index); do
            current_token=$(get_token "$1" $current_row_index $current_column_index)
            next_1_token=$(get_token "$1" $(($current_row_index + 1)) $current_column_index)
            next_2_token=$(get_token "$1" $(($current_row_index + 2)) $current_column_index)
            next_3_token=$(get_token "$1" $(($current_row_index + 3)) $current_column_index)
            if [ "$current_token" != "" ] &&
                [ "$current_token" != "$empty_place" ] &&
                [ "$next_1_token" == "$current_token" ] &&
                [ "$next_2_token" == "$current_token" ] &&
                [ "$next_3_token" == "$current_token" ]; then
                echo "$current_token"
                break
            fi
        done
    done
}

# Param 1: Field
_check_win_incline(){
    rows=($1)
    max_row_index=$(($(get_height "$1") - 1))
    max_column_index=$(($(get_width "$1") - 1))

    for current_row_index in $(seq 0 $max_row_index); do
        current_row=$(get_row "$1" $current_row_index)

        for current_column_index in $(seq 0 $max_column_index); do
            current_token=$(get_token "$1" $current_row_index $current_column_index)
            next_1_token=$(get_token "$1" $(($current_row_index + 1)) $(($current_column_index + 1)))
            next_2_token=$(get_token "$1" $(($current_row_index + 2)) $(($current_column_index + 2)))
            next_3_token=$(get_token "$1" $(($current_row_index + 3)) $(($current_column_index + 3)))
            
            if [ "$current_token" != "" ] && 
                [ "$current_token" != "$empty_place" ] && 
                [ "$next_1_token" == "$current_token" ] &&
                [ "$next_2_token" == "$current_token" ] &&
                [ "$next_3_token" == "$current_token" ]; then
                echo "$current_token"
                break
            fi
        done
    done
}

# Param 1: Field
_check_win_decline(){
    rows=($1)
    max_row_index=$(($(get_height "$1") - 1))
    max_column_index=$(($(get_width "$1") - 1))
    
    for current_row_index in $(seq 3 $max_row_index); do
        current_row=$(get_row "$1" $current_row_index)

        for current_column_index in $(seq 0 $(($max_column_index-3))); do
            current_token=$(get_token "$1" $current_row_index $current_column_index)
            next_1_token=$(get_token "$1" $(($current_row_index - 1)) $(($current_column_index + 1)))
            next_2_token=$(get_token "$1" $(($current_row_index - 2)) $(($current_column_index + 2)))
            next_3_token=$(get_token "$1" $(($current_row_index - 3)) $(($current_column_index + 3)))

            if [ "$current_token" != "" ] && 
                [ "$current_token" != "$empty_place" ] && 
                [ "$next_1_token" == "$current_token" ] &&
                [ "$next_2_token" == "$current_token" ] &&
                [ "$next_3_token" == "$current_token" ]; then
                echo "$current_token"
                break
            fi
        done
    done
}