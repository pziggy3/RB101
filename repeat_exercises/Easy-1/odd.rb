# 2) Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.

# My Solution
def is_odd?(number)
  number.abs % 2 == 1 ? true : false
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# L.S. Solution
def is_odd2?(number)
  number % 2 == 1
end


# Further Exploration
# Rewrite #is_odd? to use Integer#remainder instead of %. 

def is_odd3?(number)
  number.abs.remainder(2) == 1
end

puts is_odd3?(2)    # => false
puts is_odd3?(5)    # => true
puts is_odd3?(-17)  # => true
puts is_odd3?(-8)   # => false
puts is_odd3?(0)    # => false
puts is_odd3?(7)    # => true