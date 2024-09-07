import random

hands = ["rock", "paper", "scissors"]

def game():
    print("Let's settle it like friends do: Rock, Paper, Scissors! Join me for a quick game of fun and friendly competition.")

    while True:
        ai = random.choice(hands)
        match = input("Challenge accepted! Rock, Paper, Scissors: ").lower()  # Convert user input to lowercase

        if match == ai:
            print("Draw!")
        elif (match == "rock" and ai == "scissors") or \
             (match == "paper" and ai == "rock") or \
             (match == "scissors" and ai == "paper"):
            print("You win!")
        elif match in hands:
            print("AI wins!")
        else:
            print("Invalid input. Please try again.")
            continue  # Ask for input again if invalid

        rematch = input("Would you like to play again? (Yes/No): ").lower()

        if rematch == "no":
            print("Thanks for playing Rock, Paper, Scissors! Goodbye!")
            break
        elif rematch == "yes":
            print("Here we go!")
        else:
            print("Invalid input. Exiting game.")
            break
