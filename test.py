import unittest

import game
#from main import sum

class TestSum(unittest.TestCase):
    def test_init_game(self):
        field_width = 2
        field_height = 2
        empty_place = "-"
        field = game.init_game()
        expected_field = [[empty_place]*field_height]*field_width
        self.assertEqual(field, expected_field)

    def test_insert_token(self):
        # insert_token(field, col_no, token)
        pass


if __name__ == '__main__':
    unittest.main()
