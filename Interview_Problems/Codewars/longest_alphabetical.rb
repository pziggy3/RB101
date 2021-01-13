ALPHABET = ('a'..'z').to_a

def longest(s)
  longest = ''
  array = []
  s.each_char do |char| 
    if longest.empty? || ALPHABET.index(char) >= ALPHABET.index(longest[-1])
      longest << char
    else
      array << longest
      longest = '' << char
    end
    array << longest
  end
  array.max_by { |x| x.length }
end

# Codewars Splution
def longest(str)
  str.chars.slice_when { |a, b| a > b } 
     .max_by(&:size)
     .join
end

#############################################

# Example of `slice_when`
[0, 2, 3, 4, 6, 7, 9].slice_when{ |previous, current|
  current != previous + 1
}.to_a
# => [0], [2, 3, 4], [6, 7], [9]