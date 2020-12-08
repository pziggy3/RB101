"""
Write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise
"""

# My Solution
def xor?(operand1, operand2)
  (operand1 && !operand2) || (!operand1 && operand2)
end

# L.S. Solution
def xor2?(value1, value2)
  return true if value1! && !value2
  return true if value2 && !value1
  false
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# Situation in which boolean xor method would be useful:
# Modeling a light at the top of a flight of stairs wired in such a way that...
# the light can be turned on or off using EITHER the switch at the bottom of the stars of the switch at the top of the stairs

# Keep in mind: xor is not a short-circuit operator