# Write a method that returns true if the string passed as an argument is a palindrome, false otherwise

# My solution - UNNCESSARY CONVERSION TO ARRAY
# You can use reverse on a string, DONT need to convert it to an array
def palindrome?(string)
  string == string.chars.reverse.join
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# L.S. Solution
def palindrome2?(string)
  string == string.reverse
end


# FURTHER EXPLORATION - Write a method that determines whether an array is palindromic; that is, the element values appear in the same sequence both forwards and backwards in the array
def palindromic_array?(array)
  array == array.reverse
end

puts palindromic_array?([1, 2, 2, 1]) == true
puts palindromic_array?([1, 2, 2, 1, 3]) == false


# Now write a method that determines whether an array or a string is palindromic; that is, write a method that can take either an array or a string argument, and determines whether that argument is a palindrome
def palindromic?(input)
  # can take a string or array
  input == input.reverse
end

puts palindromic?([1, 2, 2, 1]) == true
puts palindromic?('madam') == true