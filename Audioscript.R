library(audio)

### create a dataset of possible notes.
o <- 6  # how many octaves?
octaves <- matrix(c(2 ^ (0:(12*o-1) / 12)))
notes <- matrix(rep(NA,(12*o*100000)),nrow=12*o)
for (i in 1:(12*o)){
  notes[i,]<-sin(1:100000 * octaves[i] / 80)
}

# Test
play(c(notes[13,],notes[17,],notes[20,]))

# Dataset for major chords
M <- m <- sus2 <- sus4 <- dim <- matrix(rep(NA,(12*o-7)*100000), nrow=(12*o-7))
for (i in 1:(12*o-7)){
  M[i,]    <- (notes[i,] + notes[(i+4),] + notes[(i+7),]) / max(notes[i,] + notes[(i+4),] + notes[(i+7),])
  m[i,]    <- (notes[i,] + notes[(i+3),] + notes[(i+7),]) / max(notes[i,] + notes[(i+3),] + notes[(i+7),])
  sus2[i,] <- (notes[i,] + notes[(i+2),] + notes[(i+7),]) / max(notes[i,] + notes[(i+2),] + notes[(i+7),])
  sus4[i,] <- (notes[i,] + notes[(i+5),] + notes[(i+7),]) / max(notes[i,] + notes[(i+5),] + notes[(i+7),])
  dim[i,]  <- (notes[i,] + notes[(i+3),] + notes[(i+6),]) / max(notes[i,] + notes[(i+3),] + notes[(i+6),])
}

# Test
play(c(M[13,],m[15,],m[17,],M[18,],M[20,],m[22,],dim[24,],M[25,]))

# Save notes
write.csv(M,"data/MajorChords.csv")
write.csv(m,"data/MinorChords.csv")
write.csv(sus2,"data/Sus2Chords.csv")
write.csv(sus4,"data/Sus4Chords.csv")
write.csv(dim,"data/dimChords.csv")

M7 <- m7 <- matrix(rep(NA,(12*o-10)*100000), nrow=(12*o-10))
for (i in 1:(12*o-10)){
  M7[i,] <- (notes[i,] + notes[(i+4),] + notes[(i+7),] + notes[(i+10),]) / max(notes[i,] + notes[(i+4),] + notes[(i+7),] + notes[(i+10),])
  m7[i,] <- (notes[i,] + notes[(i+3),] + notes[(i+7),] + notes[(i+10),]) / max(notes[i,] + notes[(i+3),] + notes[(i+7),] + notes[(i+10),])
}

# Test
play(c(M[13,],M7[13,],dim[17,],M[16,]))

# Save notes
write.csv(M7,"data/Maj7Chords.csv")
write.csv(m7,"data/Min7Chords.csv")

# Some common chord progressions
play(c(M[14,],M[19,],M[21,]))
play(c(M[12,],M[21,],m[23,],M[19,]))
play(c(M[14,],m[23,],M[19,],M[21,]))
play(c(M[14,],m[23,],m[16,],M[21,]))
play(c(m[16,],M7[21,],M[14,]))

# Give the notes and chords names
notenames<-c("F#","G","G#","A","Bb","B","C","C#","D","Eb","E","F")
nnames<- NA
for (i in 1:o){
    nnames[(12*(i-1)+1):(12*i)]<-paste0(notenames,i)
}
rownames(M) <- rownames(m) <- rownames(sus2) <- rownames(sus4) <- rownames(dim) <- nnames[1:(o*12-7)]
rownames(M7) <- rownames(m7) <- nnames[1:(o*12-10)]
play(c(M["A3",],sus2["G3",],M["D2",]))

play(c(M["G3",],m7["B3",],M["F2",],M["C3",],m["C#3"]))

play(sin(1:100000 / 40))
bob <- sin(1:100000 / 40)
bob [1:20]
bob[(1:20*2)]
bill <- bob[(1:50000)*2]
