# My Solution
ALPHABET = ('a'..'z').to_a

def panagram?(string)
  count = 0
  ALPHABET.each do |letter|
    count += 1 if string.downcase.include?(letter)
  end
  count == 26 ? true : false 
end

# Codewars Solution
def panagram?(string)
  ('a'..'z').all? { |x| string.downcase.include? (x) }
end