#!/bin/sh

empty_place="-"
source ./field.sh

### Test create_field

field="$(create_field 3 2)"
if [ "$field" == "-;-;- -;-;-" ]; then
    printf "."
else
    printf "\ncreate_field_1 Failed with field: $field\n"
fi

field="$(create_field 1 1)"
if [ "$field" == "-" ]; then
    printf "."
else
    printf "\ncreate_field_2 Failed with field: $field\n"
fi

field="$(create_field 7 6)"
if [ "$field" == "-;-;-;-;-;-;- -;-;-;-;-;-;- -;-;-;-;-;-;- -;-;-;-;-;-;- -;-;-;-;-;-;- -;-;-;-;-;-;-" ]; then
    printf "."
else
    printf "\ncreate_field_2 Failed with field: $field\n"
fi

### Test get_row

row="$(get_row 'A;-;- -;B;-' 0)"
if [ "$row" == "A - -" ]; then
    printf "."
else
    printf "\nget_row_1 Failed with field: $row\n"
fi

row="$(get_row 'A;-;- -;B;-' 2)"
if [ "$row" == "" ]; then
    printf "."
else
    printf "\nget_row_2 Failed with field: $row\n"
fi


### Test get_column

column="$(get_column 'A;-;- -;B;-' 0)"
if [ "$column" == "A -" ]; then
    printf "."
else
    printf "\nget_column_1 Failed with field: $column\n"
fi

column="$(get_column 'A;-;- -;B;-' 3)"
if [ "$column" == "" ]; then
    printf "."
else
    printf "\nget_column_2 Failed with field: $column\n"
fi

### Test get_token

token="$(get_token 'A;-;- -;B;-' 0 0)"
if [ "$token" == "A" ]; then
    printf "."
else
    printf "\nget_token_1 Failed with field: $token\n"
fi

token="$(get_token 'A;-;- -;B;-' 2 0)"
if [ "$token" == "" ]; then
    printf "."
else
    printf "\nget_token_2 Failed with field: $token\n"
fi

token="$(get_token 'A;-;- -;B;-' 1 3)"
if [ "$token" == "" ]; then
    printf "."
else
    printf "\nget_token_3 Failed with field: $token\n"
fi

### Test get_width

width="$(get_width 'A;-;- -;B;-')"
if [ $width -eq 3 ]; then
    printf "."
else
    printf "\nget_width_1 Failed with field: $width\n"
fi

width="$(get_width '-;B;-')"
if [ $width -eq 3 ]; then
    printf "."
else
    printf "\nget_width_2 Failed with field: $width\n"
fi

### Test get_height

height="$(get_height 'A;-;- -;B;-')"
if [ $height -eq 2 ]; then
    printf "."
else
    printf "\nget_height_1 Failed with field: $height\n"
fi

height="$(get_height '-;B;-')"
if [ $height -eq 1 ]; then
    printf "."
else
    printf "\nget_height_2 Failed with field: $height\n"
fi