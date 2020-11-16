"""
Print all odd numbers from 1 to 99, inclusive.
All numbers should be printed on separate lines.
"""

# My Solution
(1..99).to_a.each do |num|
  puts num if num.odd?
end

puts "\n"

# L.S. Solution
value = 1
while value <= 99
  puts value
  value += 2
end

puts "\n"

# Further Exploration
# using upto - Iterates block, passing in integer values from int up to and including anInteger.
1.upto(99) { |num| puts num if num.odd? }