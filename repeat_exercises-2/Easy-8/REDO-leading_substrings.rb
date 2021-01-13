def leading_substrings(string)
  characters = string.chars
  result = []
  s = ''
  index = 0

  loop do
    s += characters[index]
    result << s
    index += 1
    break if index == string.size
  end  
  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

#############################################################

# LS Solution
def leading_substrings2(string)
  result = []
  0.upto(string.size - 1) do |index| 
    result << string[0..index]      # 0..0, 0..1, 0..2
  end
  result
end

# 22 mins