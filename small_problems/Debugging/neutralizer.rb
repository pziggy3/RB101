def neutralize(sentence)
  words = sentence.split(' ')
  boring_words = []
  boring_words << words.select { |word| !negative?(word) }
  
  boring_words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.


##################################################################

# L.S. Solution - Simpler
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end
puts neutralize('These dull boring cards are part of a chaotic board game.')

# PROBLEM: While iterating over an array, avoid mutating it from within the block.
# Instead you can use the Array methods select or reject/reject!.