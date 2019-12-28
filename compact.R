# This is an attempt to make a more compressed file format for the notes data.

library(audio)
library(numbers)

# The higher this number, the more crisp everything will be, but the more info it will take up.
# It needs to be a power of 2 times 10 so that the note names will be correct.
x <- 20 

F <- sin(1:(2*pi*x) / x)
rat <- 2^((1:12)/12)
Gb <- sin(1:(2*pi*x/rat[1]) * rat[1] / x)
G <- sin(1:(2*pi*x/rat[2]) * rat[2] / x)
Ab <- sin(1:(2*pi*x/rat[3]) * rat[3] / x)
A <- sin(1:(2*pi*x/rat[4]) * rat[4] / x)
Bb <- sin(1:(2*pi*x/rat[5]) * rat[5] / x)
B <- sin(1:(2*pi*x/rat[6]) * rat[6] / x)
C <- sin(1:(2*pi*x/rat[7]) * rat[7] / x)
Db <- sin(1:(2*pi*x/rat[8]) * rat[8] / x)
D <- sin(1:(2*pi*x/rat[9]) * rat[9] / x)
Eb <- sin(1:(2*pi*x/rat[10]) * rat[10] / x)
E <- sin(1:(2*pi*x/rat[11]) * rat[11] / x)

playnote <- function (note,oct,dur) {
  play(rep(note[(1:(length(note)/(2^oct)))*2^oct],dur*2^oct))
}

extend <- function(vec) {
  new.vec <- NA
  new.vec[1:length(vec)*2] <- vec
  new.vec[(1:length(vec)*2-1)] <- vec
  return(new.vec)
}
# If I could get that to run quickly, I could use it to drop octaves

#Examples
playnote(C,1,400)
playnote(E,1,400)
playnote(G,2,400)
playnote(C,2,400)
playnote(E,2,400)

# Testing playing multiple waves
playchord <- function(noteA,noteB) {
  thing <- (rep(noteA,LCM(length(noteA),length(noteB))/length(noteA)) +
              rep(noteB,LCM(length(noteB),length(noteA))/length(noteB)))/2
  play(thing)
}


playchord(A,D)
playchord(B,G)
playchord(D,B)
