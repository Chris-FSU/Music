# Goofing around
library(audio)

# just a note, for testing
play(sin(1:100000 / 20))

# a minor 3rd interval (like A to C)
play(sin(1:100000 / 20))
play(sin(1:100000 * 1.2 / 20))

# Ratio 6:8:9 (a sus4 chord)
play(sin(1:100000 / 20))
play(sin(1:100000 * 1.33333 / 20))
play(sin(1:100000 * 1.5 / 20))

# Ratio 4:5:6 (a major chord)
play(sin(1:100000 / 20))
play(sin(1:100000 * 1.25 / 20))
play(sin(1:100000 * 1.5 / 20))

# Ratio 10:12:15 (a minor chord)
play(sin(1:100000 / 20))
play(sin(1:100000 * 1.2 / 20))
play(sin(1:100000 * 1.5 / 20))

# Ratio 6:7:8:9
play(sin(1:100000 / 20))
play(sin(1:100000 * 1.16667 / 20)) # This interval doesn't exist in western tuning.
play(sin(1:100000 * 1.33333 / 20)) # fourth
play(sin(1:100000 * 1.5 / 20)) # fifth

# An inverted chord is 3:4:5
play(sin(1:100000 / 40))
play(sin(1:100000 * 1.33333 / 40))
play(sin(1:100000 * 1.66667 / 40))

# Moving that 3 up an octave is 4:5:6
# Which is a major chord
play(sin(1:100000 / 30))
play(sin(1:100000 * 1.25 / 30))
play(sin(1:100000 * 1.5 / 30))

# Make a chord from a ratio
cfr <-function(a,b,c) {
  play(sin(1:100000 / 20))
  play(sin(1:100000 * b / (a*20)))
  play(sin(1:100000 * c / (a*20)))
}

# tonic, octave, and fifth of the octave
cfr(1,2,3)

# tonic, fifth, and octave
cfr(2,3,4)

# tonic, fourth, and octave
cfr(3,4,6)

# Inverted Major chord
cfr(3,4,5)

# Major chord
cfr(4,5,6)

# This is kinda like playing A C Eb
cfr(5,6,7)

# Make a pair from ratio
pfr <- function (a,b) {
  play(sin(1:100000 / 20))
  play(sin(1:100000 * b / (a*20)))
}

pfr(1,2) # Octave
pfr(1,3) # Second octave

pfr(2,3) # Fifth (like G to D)
pfr(2,4) # octave

pfr(3,4) # Fourth (like G to C)
pfr(3,5) # Sixth, but a bit sharp

pfr(4,5) # Major Third (like G to B)
pfr(4,6) # Fifth
pfr(4,7) # Kinda like A to G (but a bit flat)

pfr(5,6) # Minor third (A to C)
pfr(5,7) # Close to the tritone, but not quite
pfr(5,8) # Kinda like A to Eb
pfr(5,9) # Kinda like A to G (but a bit sharp)

# Between 1 and 1 1/2 steps
pfr(6,7)
pfr(6,8) # Fourth
pfr(6,9) # Fifth
pfr(6,10) # Sixth (a bit sharp)
pfr(6,11) # Like C to B, but with the B just a little flat