# Subash Chhetri

import random
def check_winner(player, computer):
    if player == computer:
        return "Draw"

    elif player == "rock" and computer == "scissors":
        return "Player wins"

    elif player == "paper" and computer == "rock":
        return "Player wins"

    elif player == "scissors" and computer == "paper":
        return "Player wins"

    else:
        return "Computer wins"

if __name__== "__main__":

    choices = ["rock", "paper", "scissors"]

    player = input("Enter rock, paper or scissors: ").lower()
    computer = random.choice(choices)

    print("Computer chose:", computer)
    print(check_winner(player, computer))