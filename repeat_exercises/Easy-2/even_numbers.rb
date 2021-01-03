# Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

value = 2
while value <= 99
  puts value
  value += 2
end

1.upto(99) { |num| puts num if num.even? }