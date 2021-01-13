def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

def substrings(string)
  final = []
  0.upto(string.size - 1) do |index|
    leading_substrings = leading_substrings(string[index..-1])
    final.concat(leading_substrings)
  end
  final
end

def palindromes(string)
  palindromes = []
  all_substrings = substrings(string)
  all_substrings.each do |str|
    palindromes << str if str == str.reverse && str.size > 1
  end
  palindromes
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