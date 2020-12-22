# Write a method that takes a single String argument and returns a new
# string that contains the original value of the argument with the first
# character of every word capitalized and all other letters lowercase.

########################################################################

# My Solution
def word_cap(string)
  new_word_array = string.split.map do |word|
    word = word.capitalize
  end
  new_word_array.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

########################################################################

#L.S. Solution 2
def word_cap2(words)
  words.split.map(&:capitalize).join(' ')
end

########################################################################

# Further Exploration - Ruby conveniently provides the String#capitalize method to capitalize strings. Without that method, how would you solve this problem? Try to come up with at least two solutions.
# NOTE: DOESNT WORK FOR LAST EXAMPLE

def word_cap3(string)
  new_word_array = string.downcase.split.map do |word|
    if (97..122).include?(word[0].ord)
      word[0] = (word[0].ord - 32).chr
      word
    end
  end
  new_word_array.join(' ')
end

p word_cap3('four score and seven') == 'Four Score And Seven'
p word_cap3('the javaScript language') == 'The Javascript Language'
p word_cap3('this is a "quoted" word') == 'This Is A "quoted" Word'