choice <- c("rock", "paper", "scissors")

game <- function() {
  print("Let's settle it like friends do: Rock, Paper, Scissors! Join me for a quick game of fun and friendly competition.")

  while(TRUE) {
    ai <- sample(choice, 1)  
    match <- readline("Challenge accepted! Rock, Paper, Scissors: ")
    match <- tolower(match)

      if(match == ai) {
        print("Draw!")
      } else if ((match == "rock" & ai == "scissors") |
                 (match == "paper" & ai == "rock") |
                 (match == "scissors" & ai == "paper")) {
        print("You win!")
      } else if ((ai == "rock" & match == "scissors") |
                 (ai == "paper" & match == "rock") |
                 (ai == "scissors" & match == "paper")) {
        print("You lose!")
      } else {
        print("Sorry, we don't understand. Please try again")
      }

      rematch <- readline("Would you like to play again? (Yes/No): ")
      if(tolower(rematch) == "no") {
        print("Thanks for playing Rock, Paper, Scissors! Goodbye!")
        break 
      } else if(tolower(rematch)== "yes"){
        print("Here we go!")
      }
        else {
        print("Sorry, we don't understand. Please try again")
      }
    } 
  }
