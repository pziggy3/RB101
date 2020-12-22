# REDO!!!!!!!!!!!!!!!
# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. 
# If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).


# L.S. Solution 1
# initializing a constant to contain an array of all the letters in the alphabet
ALPHABET = ('a'..'z').to_a

def cleanup(string)
  clean_chars = []

  string.chars.each do |char|   # we iterate over all the characters of the original string
    # we use a conditional statement to append a character to the clean_chars array if it is included in the alphabet, and a space otherwise
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '     # we use an unless clause to avoid using superfluous spaces in the final string
    end
  end

  clean_chars.join
end

p cleanup("---what's my +*& line?")


# L.S. Solution 2 - regex
def cleanup2(text)
  text.gsub(/[^a-z]/i, ' ').squeeze(' ')
end
# /[^a-z]/i is a regular expression that matches any character that is not an uppercase or lowercase letter
# the /i --- case insensitive
# gsub replace all characters in text that match the regular expression in the 1st argument with the value in the 2nd argument

# NOTE that in both solutions we're returning a NEW STRING OBJECT