# Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards.

# My Solution
def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

# L.S. Solution - uses palindrome method
def palindrome?(string)
  string == string.reverse
end

def palindromic_number2?(number)
  palindrome?(number.to_s)
end

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true


# Further Exploration - Suppose your number begins with one or more 0s. Will your method still work? Why or why not? Is there any way to address this?
puts palindromic_number?(003300) == true
# No it doesn't work - how do you convert it to a string?
def p(number)
  if number != number.to_i
    
end