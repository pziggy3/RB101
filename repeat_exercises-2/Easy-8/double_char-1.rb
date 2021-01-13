def repeater(string)
  doubled_string = ''
  string.each_char { |char| doubled_string << char << char }
  doubled_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

# 1:22