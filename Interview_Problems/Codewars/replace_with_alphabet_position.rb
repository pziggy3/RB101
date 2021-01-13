def alphabet_position(text)
  text = text.downcase.gsub(/[^A-Za-z]/, '')
  text.chars.map { |letter| letter.ord - 96 }.join(' ')
end

# codewars
def alphabet_position(text)
  text.gsub(/[^a-z]/i, '').chars.map { |c| c.downcase.ord - 96 }.join(' ')
end