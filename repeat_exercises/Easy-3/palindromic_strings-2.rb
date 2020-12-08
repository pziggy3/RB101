# another method that returns true if the string passed as an argument is a palindrome, false otherwise
# This time, however, your method should be case-insensitive, and it should ignore all non-alphanumeric characters

alphanumeric = ('a'..'z').to_a + ("1".."9").to_a

def palindrome?(string)
  string == string.reverse
end

##################################################################
# Solution 1 - Uses `delete`
def real_palindrome?(string)
  alphanumeric = ('a'..'z').to_a + ("1".."9").to_a
  array = string.downcase.chars

  array.map do |char|
    if alphanumeric.count(char) == 0
      array.delete(char)
    end
  end

  palindrome?(array.join)
end
##################################################################
# Solution 2 - uses new array (except doesnt map in above method also return new array?)
def real_palindrome2?(string)
  alphanumeric = ('a'..'z').to_a + ("1".."9").to_a
  array = string.downcase.chars
  final_array = []

  array.each do |char|
    if alphanumeric.count(char) >= 1
      final_array << char
    end
  end

  palindrome?(final_array.join)
end
##################################################################
# Solution 3 - gsub
def real_palindrome3?(string)
  string = string.downcase
  string.gsub!(/[^a-z0-9]/, '')   # Must use gsub! not gsub
  palindrome?(string)
end
##################################################################

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false

puts real_palindrome2?('madam') == true
puts real_palindrome2?('Madam') == true           # (case does not matter)
puts real_palindrome2?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome2?('356653') == true
puts real_palindrome2?('356a653') == true
puts real_palindrome2?('123ab321') == false

puts real_palindrome3?('madam') == true
puts real_palindrome3?('Madam') == true           # (case does not matter)
puts real_palindrome3?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome3?('356653') == true
puts real_palindrome3?('356a653') == true
puts real_palindrome3?('123ab321') == false

##################################################################

# L.S. Solution
def real_palindrome4?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end
