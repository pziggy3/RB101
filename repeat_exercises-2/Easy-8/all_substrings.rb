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
# Use concat instead of <<, because << will add an array to final, which you have to flatten at the end.

p substrings('abcde')
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

# 6:48

###########################################################

# LS Solution
def substrings2(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end
  results
end