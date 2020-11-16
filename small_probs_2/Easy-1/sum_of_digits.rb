"""
Write a method that takes one argument, a positive integer,
and returns the sum of its digits.
"""

# My solution
def sum(integer)
  integer.to_s.chars.map(&:to_i).reduce(:+)
end

# L.S. Solution 1
def sum2(integer)
  sum = 0
  str_digits = number.to_s.chars

  str.digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45