# The tiniest format
library(audio)

# This creates a zigzagged line with the appropriate length and a
# standardised amplitude.
zigzag <- function(len) {
  temp <- (c(0:(len/4),(len/4-1):-(len/4),-(len/4-1):-1))/(len/4)
  return(temp)
}

play(rep(zigzag(100),40))
