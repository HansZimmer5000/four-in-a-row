import unittest

import game
#from main import sum

class TestGameField(unittest.TestCase):
    def test_init_GameField(self):
        field_height = 2
        field_width = 3

        gameField = game.GameField(field_width,field_height)
        is_field = gameField.field
        expected_field = [[game.GameField.empty_place]*field_height]*field_width
        self.assertEqual(is_field, expected_field)

    def test_insert_token_pos(self):
        gameField = game.GameField(1,2)

        gameField.insert_token(1, "A")
        is_field = gameField.field
        expected_field = [["A", gameField.empty_place]]
        self.assertEqual(is_field, expected_field)

        gameField.insert_token(1,"B")
        is_field = gameField.field
        expected_field = [["A", "B"]]
        self.assertEqual(is_field, expected_field)

        gameField.insert_token(1,"B")
        is_field = gameField.field
        expected_field = [["A", "B"]]
        self.assertEqual(is_field, expected_field)

    def test_insert_token_neg(self):
        gameField = game.GameField(1,2)

        try:
            gameField.insert_token(2, "A")
            self.assertTrue(False, "IndexError is expected to be thrown!")
        except IndexError:
            self.assertTrue(True)

    def test_check_win_horizontal(self):
        gameField = game.GameField(4,1)
        gameField.field = [["A"],["A"],["A"],["A"]]
        try:
            gameField._GameField__check_win_horizontal(0,0)
        except SystemExit:
            pass
        else:
            self.assertTrue(False)

    def test_check_win_vertical(self):
        gameField = game.GameField(1,4)
        gameField.field = [["A","A","A","A"]]
        try:
            gameField._GameField__check_win_vertical(0,0)
        except SystemExit:
            pass
        else:
            self.assertTrue(False)

    def test_check_win_incline(self):
        gameField = game.GameField(4,4)
        gameField.field = [
            ["A", gameField.empty_place,gameField.empty_place,gameField.empty_place],
            [gameField.empty_place,"A",gameField.empty_place,gameField.empty_place],
            [gameField.empty_place,gameField.empty_place,"A",gameField.empty_place],
            [gameField.empty_place,gameField.empty_place,gameField.empty_place,"A"]
        ]
        try:
            gameField._GameField__check_win_incline(0,0)
        except SystemExit:
            pass
        else:
            self.assertTrue(False)

    def test_check_win_decline(self):
        gameField = game.GameField(4,4)
        gameField.field = [
            [gameField.empty_place,gameField.empty_place,gameField.empty_place,"A"],
            [gameField.empty_place,gameField.empty_place,"A",gameField.empty_place],
            [gameField.empty_place,"A",gameField.empty_place,gameField.empty_place],
            ["A", gameField.empty_place,gameField.empty_place,gameField.empty_place]
        ]
        try:
            gameField._GameField__check_win_decline(0,3)
        except SystemExit:
            pass
        else:
            self.assertTrue(False)

if __name__ == '__main__':
    unittest.main()
