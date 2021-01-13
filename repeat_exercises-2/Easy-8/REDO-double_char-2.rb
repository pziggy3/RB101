VOWELS = 'aeiou'
ALPHABET = ('a'..'z').to_a
CONSONANTS = ALPHABET.reject { |letter| VOWELS.include?(letter) }

def double_consonants(string)
  new_string = ''
  string.each_char do |char|
    if ALPHABET.include? char.downcase
      if CONSONANTS.include? char.downcase
        new_string << char << char 
      else  # vowels
        new_string << char
      end
    else
      new_string << char 
    end
  end
  new_string
end

p double_consonants('String')
p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""


# 15:10 