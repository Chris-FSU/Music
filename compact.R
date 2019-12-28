# This is an attempt to make a more compressed file format for the notes data.

library(audio)

# The higher this number, the more crisp everything will be, but the more info it will take up.
# It needs to be a power of 2 times 10 so that the note names will be correct.
x <- 320 

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

#Examples
playnote(C,3,40)
playnote(E,3,40)
playnote(G,4,40)
playnote(C,4,40)
playnote(E,4,40)

# This is the highest note I can hear:
playnote(E,8,40)

# I can't hear this one:
playnote(F,9,40)
