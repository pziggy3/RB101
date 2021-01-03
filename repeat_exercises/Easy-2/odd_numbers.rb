# Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

########################################################################

1.upto(99) { |num| puts num if num.odd? }

########################################################################

value = 1
while value <= 99
  puts value
  value += 2
end