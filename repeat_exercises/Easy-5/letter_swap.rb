# Given a string of words separated by spaces, write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(string)
  split_array = string.split.map do |word|
    swap_first_last_characters(word)
  end
  split_array.join(' ')
end

p swap('Oh what a wonderful day it is')