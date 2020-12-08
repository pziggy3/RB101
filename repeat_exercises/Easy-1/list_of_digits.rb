# Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# Solution 1
def digit_list(number)
  number.to_s.chars.map { |num| num.to_i }
end

# Solution 2
def digit_list2(number)
  number.to_s.chars.map(&:to_i)
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

puts digit_list2(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list2(7) == [7]                     # => true
puts digit_list2(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list2(444) == [4, 4, 4]             # => true

# L.S. Solution - Brute Force
def digit_list3(number)
  array = []
  until number == 0
    number, remainder = number.divmod(10)
    array.unshift(remainder)
  end
  array
end

puts digit_list3(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list3(7) == [7]                     # => true
puts digit_list3(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list3(444) == [4, 4, 4]             # => true