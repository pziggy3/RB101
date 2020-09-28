def is_odd?(integer)
  integer % 2 == 1
end

puts is_odd?(-17)
puts is_odd?(18)
puts is_odd?(0)
puts is_odd?(1)

def is_odd2?(integer)
  integer.remainder(2) == 1 || integer.remainder(2) == -1
end

puts is_odd2?(-17)
puts is_odd2?(0)
puts is_odd2?(18)
