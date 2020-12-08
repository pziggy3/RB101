# Write a method that takes one argument, a string containing one or more words, and returns the given string with words that contain five or more characters reversed. 
# Each string will consist of only letters and spaces. Spaces should be included only when more than one word is present.

# My Solution - does the same thing
def reverse_words(string)
  new_array = string.split.map do |word|
    word.size >= 5 ? word.reverse : word
  end
  new_array.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcSs


# L.S. Solution
def reverse_words2(string)
  words = []

  string.split.each do |word|
    word.reverse! if word.size >= 5
    words << word
  end

  words.join(' ')
end