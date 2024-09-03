pizza <- c("cheese", "pepperoni", "vegetarian", "supreme")

dessert <- c("brownie", "cheesecake", "cookie", "pie")

drink <- c("soda", "milkshake", "coffee", "tea")

welcome <- function(){
  print("Hi there! Welcome to Pizzatopia🍕. Ready to satisfy your cravings?")
  print("Explore our delicious menu and exclusive deals today.") 
  print("Before we continue, would you like to order: pizza, dessert, or drink?")

  while(TRUE) {
  order <- readline("Order: ")
  if(tolower(order)=="pizza"){
    print("Here are our delicious pizzas")
    print(pizza)

    A <- readline("What kind of pizza would you like: ")
    if(tolower(A) %in% pizza){
      print("Your order is prepared.")

      Z <- readline("Is there anything else you would like to order?(Yes/No): ")
      if(tolower(Z)=="no"){
        print("Thank you for your order!")
        print("We're working on it and will have it ready soon.")
        break
      } else {
        print("What else would you like to order: pizza, dessert, or drink??")
        print("If you would like to exit, Please type exit")
      }
    } else {
      print("I'm sorry, we don't have that.")
      print("What would you like to order?")
      print("If you would like to exit, Please type exit")
    }

  } else if(tolower(order)=="dessert"){
    print("Here are our dessert")
    print(dessert)

    B <- readline("What kind of dessert would you like: ")
    if(tolower(B) %in% dessert){
      print("Your order is prepared.")

      Z <- readline("Is there anything else you would like to order?(Yes/No): ")
      if(tolower(Z)=="no"){
        print("Thank you for your order!")
        print("We're working on it and will have it ready soon.")
        break
      } else {
        print("What else would you like to order: pizza, dessert, or drink??")
        print("If you would like to exit, Please type exit")
      }
    } else {
      print("I'm sorry, we don't have that.")
      print("What would you like to order?")
      print("If you would like to exit, Please type exit")

  }
  } else if(tolower(order)=="drink"){
    print("Here are our fresh drink")
    print(drink)

    C <- readline("What kind of drink would you like: ")
    if(tolower(C) %in% drink){
      print("Your order is prepared.")

      Z <- readline("Is there anything else you would like to order?(Yes/No): ")
      if(tolower(Z)=="no"){
        print("Thank you for your order!")
        print("We're working on it and will have it ready soon.")
        break
      } else {
        print("What else would you like to order: pizza, dessert, or drink??")
        print("If you would like to exit, Please type exit")
      }
    } else {
      print("I'm sorry, we don't have that.")
      print("What would you like to order?")
      print("If you would like to exit, Please type exit")

  }      
  } else if(tolower(order)=="exit"){
    print("Thank you for visiting Pizzatopia! Have a great day.")
    break
  } else {
    print("I'm sorry, we didn't understand your order. Please choose pizza, dessert, or drink.")
    print("If you would like to exit, Please type exit")
  }
  }
}
