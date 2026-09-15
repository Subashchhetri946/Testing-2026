# Subash Chhetri

import unittest
from rock_paper_scissors import check_winner

class TestRockPaperScissors(unittest.TestCase):
    def test_player_wins(self):
        # Arrange
        player = "rock"
        computer = "scissors"

        # Act
        result = check_winner(player, computer)

        # Assert
        self.assertEqual(result, "Player wins")

    def test_computer_wins(self):
        # Arrange
        player = "rock"
        computer = "paper"

        # Act
        result = check_winner(player, computer)

        # Assert 
        self.assertEqual(result, "Computer wins")


    def test_draw(self):
            # Arrange
            player = "rock"
            computer = "rock"
    
            # Act
            result = check_winner(player, computer)
    
            # Assert 
            self.assertEqual(result, "Draw")

if __name__ == "__main__":
     unittest.main()
