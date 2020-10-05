def palindrome2?(string)
  string == string.reverse
end

def palindrome?(string)
  array = string.scan /\w/
  new_array = []
  index = -1
  while index >= -(array.size)
    new_array << array[index]
    index -= 1
  end

  joined_array = new_array.join
  joined_array == string
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# Note: 'string'.split("") ==> array of characters, including spaces
# Note: 'string'.scan /\w/ ==> array of character not including spaces




# Launch School Solution - MUCH EASIER
def palindrome2?(string)
  string == string.reverse
end
