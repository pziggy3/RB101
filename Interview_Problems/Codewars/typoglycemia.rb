PUNCTUATION = "-',."
ALPHABET = ('a'..'z').to_a

def scramble_words(words)
  words.split.map do |word|
    word[1..-2] = word[1..-2].chars.sort.join
    word[0] + word[1..-2] + word[-1]
  end.join
end

# NOT FINISHED