def swapcase(string)
  # Shorter but a little more difficult to read
  characters = string.chars.map do |char|
    char == char.upcase ? char.downcase : char.upcase
  end
  characters.join
end

p swapcase('hElL3o')
p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'


# Launch School Solution
# Each character is then mapped to a new array and assigned to characters
def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end