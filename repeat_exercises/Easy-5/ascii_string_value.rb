# Write a method that determines and returns the ASCII string value of a string that is passed in as an argument

# My Solution
def ascii_value(string)
  if !string.empty?
    ordinates = string.chars.map { |char| char.ord }
    ordinates.reduce { |total, value| total += value }
  else
    0
  end
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0


#####################################################
# L.S. Solution

def ascii_value2(string)
  # Have to use the enumerator method `each_char` for string
  sum = 0
  string.each_char { |char| sum += char.ord }
  sum
end

p ascii_value2('Four score') == 984
p ascii_value2('Launch School') == 1251
p ascii_value2('a') == 97
p ascii_value2('') == 0

#####################################################

# Further Exploration