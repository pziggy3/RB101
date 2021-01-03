# Write a method that takes a string, and returns a new string in which every character is doubled.

########################################################################

# My Solution
def repeater(string)
  double_string = ''
  string.each_char do |letter|
    double_string += (letter + letter)
    # double_string += letter += letter
  end
  double_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''

########################################################################

# LS Solution
def repeater2(string)
  result = ''
  string.each_char do |char|
    result << char << char 
  end
  result
end