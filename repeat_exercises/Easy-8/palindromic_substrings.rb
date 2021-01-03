# Write a method that returns a list of all substrings of a string that are palindromic
# That is, each substring must consist of the same sequence of characters forwards as it does backwards. 
# The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.
# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.

########################################################################

def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings2(string)
  results = []
  (0..string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end

########################################################################

# My Solution
def palindromes(string)
  palindrome_array = []
  substrings2(string).each do |word|
    if word == word.reverse && word.size > 1
      palindrome_array << word
    end
  end
  palindrome_array
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

########################################################################

# L.S. Solution
def palindrome?(string)
  string == string.reverse && string.size > 1
end

def palindromes2(string)
  all_substrings = substrings2(string)
  results = []
  all_substrings.each do |substring|
    results << substring if palindrome?(substring)
  end
  results
end

########################################################################

# Further Exploration - Can you modify this method (and/or its predecessors) to ignore non-alphanumeric characters and case?
def palindrome2?(string)
  string == string.reverse && string.size > 1
end

def palindromes3(string)
  all_substrings = substrings2(string)
  results = []
  all_substrings.each do |substring|
    substring = substring.downcase.gsub(/[^0-9a-z]/i, '')
    results << substring if palindrome?(substring)
  end
  results
end 

p palindromes3('mad,am')
p palindromes('mad,am')

########################################################################

