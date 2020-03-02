import unittest

import game
#from main import sum

class TestSum(unittest.TestCase):
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


if __name__ == '__main__':
    unittest.main()
