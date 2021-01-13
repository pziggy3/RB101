def cleanup(string)
  string.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

ALPHABET = ('a'..'z').to_a

def cleanup2(string)
  clean_chars = []

  string.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end
p cleanup("---what's my +*& line?") == ' what s my line '

# 6:07