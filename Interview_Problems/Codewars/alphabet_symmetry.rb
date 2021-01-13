# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,
# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

ALPHABET = ('a'..'z').to_a

def solve(arr)
  arr.map do |word|
    correct_position = 0
    word.downcase.chars.each_with_index do |char, index|
      correct_position += 1 if index == ALPHABET.index(char)
    end
    correct_position
  end
end

p solve(["abode","ABc","xyzD"]) = [4, 3, 1]


# Codewars Solution - Clever
def solve(strings)
  strings.map{ |s| s.downcase.each_char.zip('a'..'z').count{ |a, b| a == b } }
end
# merges elements of self with corresponding elements from each argument.
# [['a','a'], ['a','b'], ['a', 'c'], ['a', 'd']]...
