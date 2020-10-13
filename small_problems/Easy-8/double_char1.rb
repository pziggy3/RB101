def repeater(string)
  result = ''
  string.chars.each do |char|
    result << char << char
  end
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# Launch School Solution
def repeater2(string)
  result = ''
  string.each_char do |char|
    result << char << char
  end
  result
end
# used the "each_char" method instead of "chars.each" like I did