"""
Write a method that takes one argument, a string containing
one or more words, and returns the given string with words
that contain five or more characters reversed.
Each string will consist of only letters and spaces.
Spaces should be included only when more than one word is present.
"""

# My solution
# Using each instead of map, because map will return 'nil' for words under 5 letters
def reverse_words(string)
  new_string = string.split.each do |word|
    if word.length >= 5
      word.reverse!
    end   
  end

  new_string.join(' ')
end

# L.S. Solution
def reverse_words2(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS