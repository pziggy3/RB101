"""
Write a method that takes one argument, a positive integer,
and returns a list of the digits in the number.
"""

# My Solution
def digit_list(number)
  new_array = []
  number.to_s.chars.each do |char|
    new_array << char.to_i
  end
  new_array
end

# L.S. Solution 1
def digit_list2(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

# L.S. Solution 2
def digit_list3(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]            # => true