def swapcase(string)
  swapped_array = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase 
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  swapped_array.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'