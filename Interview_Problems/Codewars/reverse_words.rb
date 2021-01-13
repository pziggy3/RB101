# MY Solution
def spin_words(string)
  string.split.map { |word| word.size >= 5 ? word.reverse : word }.join(' ')
end

# Codewars Solution
def spinWords(string)
  string.gsub(/\w{5,}/, &:reverse)
end