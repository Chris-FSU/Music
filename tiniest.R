# The tiniest format
library(audio)
library(numbers)

# This creates a zigzagged line with the appropriate length and a
# standardised amplitude.
zigzag <- function(len) {
  temp <- (c(0:(len),(len-1):-(len),-(len-1):-1))/(len)
  return(temp)
}

play(rep(zigzag(40),200))
play(rep(zigzag(50),200))
play(rep(zigzag(60),200))

# This makes sounds like a 1980s video game.
# That's cool, but it's not what I want.
# I think the more natural sound will require more bitspace.