def digit_list(number)
  number_array = []
  while number != 0
    number, remainder = number.divmod(10)
    number_array.prepend(remainder)
  end
  number_array  
end

# 4:16 

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true


# idiomatic ruby
def digit_list2(number)
  number.to_s.chars.map(&:to_i)
end