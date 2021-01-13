def nth_char(words)
  words.each_with_index.map { |word, index| word[index] }.join
end