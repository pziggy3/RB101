# Write a method that takes a string as an argument and returns a new
# string in which every uppercase letter is replaced by its lowercase
# version, and every lowercase letter by its uppercase version.
# All other characters should be unchanged.

########################################################################

# My Solution
def swapcase(string)
  character_array = string.chars.map do |char|
    if (97..122).include?(char.ord)
      char = (char.ord-32).chr
    elsif (65..90).include?(char.ord)
      char = (char.ord+32).chr
    else
      char
    end
  end
  character_array.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

########################################################################

# L.S. Solution
def swapcase2(string)
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
# 1. We iterate through each character in the string passed into swapcase.
# 2. If the character is lowercase (/[a-z]/), we make it uppercase; if it is uppercase (/[A-Z]/), we make it lowercase. 
# 3. For all other characters, we do nothing.
# 4. Each character is then mapped to a new array and assigned to 'characters'. 
# 5. Finally, we join characters together into a new String and return that value.


