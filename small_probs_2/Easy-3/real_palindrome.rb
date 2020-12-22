"""
Write another method that returns true if the string passed as an argument is a palindrome, false otherwise.
This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters. 
"""

def real_palindrome?(string)
  # ignores all non-alphanumeric characters
  string = string.downcase.delete('^a-z0-9')

  reverse_array = []
  index = -1

  while index.abs <= string.size
    reverse_array << string.chars[index]
    index -= 1
  end

  reverse_array.join == string
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false