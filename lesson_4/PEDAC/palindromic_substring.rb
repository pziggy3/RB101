def palindromic_substring(string)
  result = []
  starting_index = 0

  while starting_index <= string.size - 2
    num_char = 2
    while num_char <= string.size - starting_index
      word = string.slice(starting_index, num_char)
      result << word if ispalindrome?(word)
      num_char += 1
    end
    starting_index += 1
  end
  result
end

def palindromic_substring2(string)
  result = []
  starting_index = 0

  while starting_index <= string.size - 2
    result << substrings(string, starting_index)
    starting_index += 1
  end
  result
end

def ispalindrome?(word)
  word == word.reverse && word.size >= 2
end


def substrings(string, starting_index)
  result = []
  num_char = 2
  while num_char <= string.size - starting_index
    word = string.slice(starting_index, num_char)
    result << word if ispalindrome?(word)
    num_char += 1
  end
  result
end



p palindromic_substring('hello')
p palindromic_substring("supercalifragilisticexpialidocious")
p palindromic_substring("")
p palindromic_substring("abcddcbA")

p palindromic_substring2('hello')
