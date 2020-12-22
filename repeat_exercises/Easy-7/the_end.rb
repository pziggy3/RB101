# Write a method that returns the next to last word in the String passed to it as an argument.
# Words are any sequence of non-blank characters.
# You may assume that the input String will always contain at least two words.

########################################################################

# My Solution
def penultimate(string)
  string.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

########################################################################

# L.S. Solution - a bit more clear?
def penultimate2(string)
  words_array = words.split
  words_array[-2]
end

########################################################################

# Further eXploration - Our solution ignored a couple of edge cases because we explicitly stated that you didn't have to handle them: strings that contain just one word, and strings that contain no words.
# Suppose we need a method that retrieves the middle word of a phrase/sentence. What edge cases need to be considered?
# How would you handle those edge cases without ignoring them? Write a method that returns the middle word of a phrase or sentence.
# It should handle all of the edge cases you thought of.

def middle_word(string)
  word_array = string.split
  if word_array.size.odd?
    word_array[-((word_array.size/2)+ 1)]
  else
    word_array[-((word_array.size/2)+ 1), 2].join(' ')
  end
end

# Odd number of words 
p middle_word('hi there mister poo poo')
p middle_word('hi there mister poo pee mister pee')
# Even number of words
p middle_word('hi there mister poo pee mister')
p middle_word('hi there mister poo pee mister shark fin')