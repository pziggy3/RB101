ALPHA_HASH = Hash.new(0)
('a'..'z').each_with_index { |letter, index| ALPHA_HASH[letter] = index + 1 } 


def high(x)
  score_arr = x.split.map do |word|
    score = 0
    word.each_char do |char|
      score += ALPHA_HASH[char]
    end
    score
  end
  max_index = score_arr.index(score_arr.max)
  x.split[max_index]
end

# Codewars
def high(x)
  x.split.max_by { |w| score_word(w) }
end

def score_word(word)
  word.chars.inject(0) { |sum, ch| sum + (ch.ord - 96) }
end