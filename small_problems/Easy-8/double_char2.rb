CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)
CONSONANTS_UPPER = CONSONANTS.map do |letter|
  letter.upcase
end

def double_consonants(string)
  result = ''
  string.each_char do |char|
    if CONSONANTS.include?(char) || CONSONANTS_UPPER.include?(char)
      result << char << char
    else
      result << char
    end
  end
  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""


# Launch School Solution - BETTER
CONSONANTS = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end