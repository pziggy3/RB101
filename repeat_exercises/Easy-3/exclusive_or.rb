# Exclusive or - you need ONLY 1 of 2 conditions to be truthy
# write a function named xor that takes two arguments, and returns true if exactly one of its arguments is truthy, false otherwise

# My Solution - More complicated than need be
def xor?(arg1, arg2)
  if arg1 && !arg2
    true
  elsif !arg1 && arg2
    true
  else
    false
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false


# L.S. solution
def xor2?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end


# FURTHER EXPLORATION = situation in which a boolean xor would be useful
# modeling a light at the top of a flight of stairs wired in such a way that the light can be turned on or off using either the switch at the bottom of the stairs or the switch at the top of the stairs
# can be modeled with xor method

def light_on?(top_switch, bottom_switch)
  # Light is only one if only 1 of the 2 switches is on
  return true if top_switch && !bottom_switch
  return true if bottom_switch && !top_switch
  false
end