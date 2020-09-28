def sum(integer)
  array = integer.to_s.chars.map { |num| num.to_i }
  total = array.reduce { |sum, number| sum + number }
end

def sum2(integer)
  integer.to_s.chars.map(&:to_i).reduce(:+)
end

puts sum(23) == 5
puts sum(496) == 19
puts sum2(123_456_789) == 45


# Another Solution
def sum3(number)
  sum = 0
  str_digits = number.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

p sum3(33)