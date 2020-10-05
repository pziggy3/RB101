def real_palindrome?(string)
  array = string.downcase.scan /\w/
  old_string = array.join("")
  new_array = []
  index = -1
  while index >= -(array.size)
    new_array << array[index]
    index -= 1
  end

  joined_array = new_array.join

  joined_array == old_string
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true           # (case does not matter)
puts real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome?('356653') == true
puts real_palindrome?('356a653') == true
puts real_palindrome?('123ab321') == false


# Launch School Solution

def real_palindrome?(string)
  # "#delete takes arguments that sort of look like regular expressions, and then deletes everything formed by the intersection of all its arguments"
  # we tell delete to delete everything that isn't a letter or digit
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end