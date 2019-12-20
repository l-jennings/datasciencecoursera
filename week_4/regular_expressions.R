### metacharacters for regular expressions ###

# ^term selects lines starting with the term
# term$ selects lines ending with the term

# [] lists a set of characters we will accept at any give point in the match
# e.g. [Bb][Uu][Ss][Hh] will select Bush, bush, bUSH, bushwalking, etc

## combining
# ^[Ii]am will select lines starting I am, i am