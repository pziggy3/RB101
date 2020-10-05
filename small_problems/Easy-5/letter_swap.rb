def swap(string)
  array = string.split

  poo = []
  array.each do |word|
    # This logic can be encapsulated in its own method
    if word.size > 1
      poo << word[-1] + word[1..-2] + word[0]
    else
      poo << word
    end
  end

  poo.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'


# Launch School solution
def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap2(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

