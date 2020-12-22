# Obvious Method
def palindrome?(string)
  string == string.reverse
end

puts palin0drome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

# More difficult
def palindrome2?(string)
  reverse_array = []
  index = -1

  while index.abs <= string.size
    reverse_array << string.chars[index]
    index -= 1
  end

  reverse_array.join == string
end

puts palindrome2?('madam') == true
puts palindrome2?('Madam') == false          # (case matters)
puts palindrome2?("madam i'm adam") == false # (all characters matter)
puts palindrome2?('356653') == true

