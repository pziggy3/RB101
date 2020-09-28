def average(array)
  count = 0
  result = 0

  array.each do |num|
    result += num
    count += 1
  end
  
  result / count
end

puts average([1, 6]) == 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


# Solution 2
def average2(numbers)
  total = numbers.reduce { |sum, number| sum + number}  # you can also use a symbol: numbers.reduce(:+)
  total / numbers.count
end

puts average2([1, 6])