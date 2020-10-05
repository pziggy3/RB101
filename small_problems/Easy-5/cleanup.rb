# Launch School solutions

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      # makes sure there isn't a repeated space in the clean_chars array
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

puts cleanup("---what's my +*& line?") == ' what s my line '


def cleanup2(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

# /[^a-z]/i is a regex that matches any character that is not an uppercase or lowercase letter
# The /i part of this expression is what makes this expression case insensitive
# ^ --- "match a single character not present in the set"
# "Note that in both our solutions we are returning a new string object. If you are unsure after reading a problem description whether you should return a new string object or the same one, that would be a great question to ask an interviewer."