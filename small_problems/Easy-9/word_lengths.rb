def word_lengths(string)
  string.split.map do |word|
    word << " #{word.length}"
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]
p word_lengths("") == []

# Launch School 2nd soution
def word_lengths2(string)
  words = string.split

  words.map do |word|
    word + ' ' + word.length.to_s
  end
end

# Launch School 3rd solution
def word_lengths3(string)
  string.split.map { |word| "#{word} #{word.length}" }
end
