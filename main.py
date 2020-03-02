#!/bin/python

# Field Configurations
empty_place="-"

field_height=6
field_width=7

# Player Configuration
player1_color = '\033[92m'
player2_color = '\033[94m'
blank_color = '\033[0m'

player1_token = player1_color + "A" + blank_color
player2_token = player2_color + "B" + blank_color

def init_game():
    empty_col = [empty_place] * field_height
    return [
        empty_col.copy(), 
        empty_col.copy(),
        empty_col.copy(),
        empty_col.copy(),
        empty_col.copy(),
        empty_col.copy(),
        empty_col.copy()
    ]

def print_field(field):
    current_height = field_height
    while current_height > 0:
        for col in field:
            print(col[current_height-1], end=" ")
        print("")
        current_height -= 1

def insert_token(field, col_no, token):
    col = field[col_no - 1]
    current_height = 0
    while current_height < field_width:
        if col[current_height] == empty_place:
            col[current_height] = token
            break
        current_height += 1
    return field

def get_input():
    current_col_raw = input()
    current_col = int(current_col_raw)
    if current_col < 1 or current_col > field_width:
        raise ValueError()
    return current_col

def check_win_horizontal(field):   
    current_height = 0
    while current_height < field_height:
        current_col = 0
        while current_col < (field_width - 3):
            if field[current_col][current_height] == empty_place:
                break
            elif field[current_col][current_height] == field[current_col + 1][current_height] and field[current_col][current_height] == field[current_col + 2][current_height] and field[current_col][current_height] == field[current_col + 3][current_height]:
                print("-------------")
                print(field[current_col][current_height], " Won the Game horizontally!")
                exit()
            current_col += 1

        current_height += 1


def check_win_vertical(field):
    for col in field:
        current_height = 0
        while current_height < (field_height - 3):
            if col[current_height] == empty_place:
                break
            elif col[current_height] == col[current_height + 1] and col[current_height] == col[current_height + 2] and col[current_height] == col[current_height + 3]:
                print("-------------")
                print(col[current_height], " Won the Game vertically!")
                exit()
            current_height += 1

def check_win_incline(field):
    current_col = 0
    while current_col < (field_width - 3):
        current_height = 0
        while current_height < (field_height - 3):
            if field[current_col][current_height] == empty_place:
                break
            elif field[current_col][current_height] == field[current_col + 1][current_height + 1] and field[current_col][current_height] == field[current_col + 2][current_height + 2] and field[current_col][current_height] == field[current_col + 3][current_height + 3]:
                print("-------------")
                print(field[current_col][current_height], " Won the Game incline!")
                exit()
            current_height += 1
        current_col += 1


def check_win_decline(field):
    current_col = 6
    while current_col > 2:
        current_height = 0
        while current_height < (field_height-3):
            if field[current_col][current_height] == empty_place:
                break
            elif field[current_col][current_height] == field[current_col-1][current_height + 1] and field[current_col][current_height] == field[current_col - 2][current_height + 2] and field[current_col][current_height] == field[current_col - 3][current_height + 3]:
                print("-------------")
                print(field[current_col][current_height], " Won the Game decline!")
                exit()
            current_height += 1
        current_col -= 1

def check_win(field):
    check_win_horizontal(field)
    check_win_vertical(field)
    check_win_incline(field)
    check_win_decline(field)

def check_win_horizontal_alt(field, current_col_index, current_height_index):
    if field[current_col_index][current_height_index] == field[current_col_index + 1][current_height_index] and field[current_col_index][current_height_index] == field[current_col_index + 2][current_height_index] and field[current_col_index][current_height_index] == field[current_col_index + 3][current_height_index]:
        print("-------------")
        print(field[current_col_index][current_height_index], " Won the Game horizontal!")
        exit()

def check_win_vertical_alt(field, current_col_index, current_height_index):
    if field[current_col_index][current_height_index] == field[current_col_index][current_height_index + 1] and field[current_col_index][current_height_index] == field[current_col_index][current_height_index + 2] and field[current_col_index][current_height_index] == field[current_col_index][current_height_index + 3]:
        print("-------------")
        print(field[current_col_index][current_height_index], " Won the Game vertical!")
        exit()

def check_win_incline_alt(field, current_col_index, current_height_index):
    if field[current_col_index][current_height_index] == field[current_col_index + 1][current_height_index + 1] and field[current_col_index][current_height_index] == field[current_col_index + 2][current_height_index + 2] and field[current_col_index][current_height_index] == field[current_col_index + 3][current_height_index + 3]:
        print("-------------")
        print(field[current_col_index][current_height_index], " Won the Game incline!")
        exit()

def check_win_decline_alt(field, current_col_index, current_height_index):
    if field[current_col_index][current_height_index] == field[current_col_index + 1][current_height_index - 1] and field[current_col_index][current_height_index] == field[current_col_index + 2][current_height_index - 2] and field[current_col_index][current_height_index] == field[current_col_index + 3][current_height_index - 3]:
        print("-------------")
        print(field[current_col_index][current_height_index], " Won the Game decline!")
        exit()

def check_win_alt(field):
    current_col_index = 0
    while current_col_index < field_width:
        current_height_index = 0
        while current_height_index < field_height:

            if field[current_col_index][current_height_index] != empty_place:

                # If there is space above: Check Horizontal
                if current_col_index < (field_width - 3):
                    check_win_horizontal_alt(field, current_col_index, current_height_index)

                # If there is space right: Check Vertical
                if current_height_index < (field_height - 3):
                    check_win_vertical_alt(field,current_col_index, current_height_index)

                # If there is space above & right: Check incline
                if (current_col_index < (field_width - 3) and current_height_index < (field_height - 3)):
                    check_win_incline_alt(field, current_col_index, current_height_index)

                # If there is space under & right: Check decline
                if (current_col_index < (field_width - 3) and current_height_index > 2):
                    check_win_decline_alt(field, current_col_index, current_height_index)

            current_height_index += 1
        current_col_index += 1

def game_round(field, current_player, current_round_no):
    print_field(field)
    print("---- ROUND NUMBER:", current_round_no, "-- Current PLayer:", current_player, "----")
    try:
        current_col = get_input()
        
        next_field = insert_token(field, current_col, current_player)

        if current_player == player1_token:
            next_player = player2_token
        else:
            next_player = player1_token
        
        check_win_alt(next_field)
        game_round(next_field, next_player, current_round_no + 1)
    except ValueError:
        print("Inserted Number was not a number or not between 1 and",field_width,"!")   
        game_round(field, current_player,current_round_no) 

if __name__ == "__main__":
    try:
        field = init_game()
        game_round(field, player1_token, 1)
    except KeyboardInterrupt:  
        print(" Live long and prosper!")