# Write a method that takes a number as an argument.
# If the argument is a positive number, return the negative of that number. 
# If the number is 0 or negative, return the original number.

########################################################################

def negative(number)
  number > 0 ? -number : number
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

########################################################################

# Further Exploration - There is an even shorter way to write this but it isn't as immediately intuitive. But it's less clear.
def negative2(number)
  -number.abs
end