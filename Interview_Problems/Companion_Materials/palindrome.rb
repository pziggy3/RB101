# Write a method to determine if a word is a palindrome, without using the reverse method.

def palindrome?(word)
  reversed_string = ''
  index = -1

  loop do
    reversed_string << word[index]
    index -= 1
    break if index < -(word.size)
  end

  word == reversed_string
end

p palindrome?("hello") == false
p palindrome?("Wow") == false
p palindrome?("wow") == true
