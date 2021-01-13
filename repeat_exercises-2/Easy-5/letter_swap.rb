def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(sentence)
  result = sentence.split.map do |word| 
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is')
p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# 6:46 - first solution