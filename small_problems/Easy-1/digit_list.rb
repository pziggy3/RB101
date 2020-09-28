# Solution 1
def digit_list(integer)
  array = []
  results = integer.to_s.split('')
  results.each { |num| array << num.to_i }
  array
end

p digit_list(1234)
puts digit_list(1234) == [1, 2, 3, 4]


# Solution 2 - Brute Force
def digit_list2(number)
  digits = []
  loop do
    number, remainder = number.divmod(10)
    digits.unshift(remainder)
    break if number == 0
  end
  digits
end

p digit_list2(3456)

# Solution 3 - Idiomatic Ruby
def digit_list3(number)
  number.to_s.chars.map(&:to_i)
end