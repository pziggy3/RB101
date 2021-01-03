def average(array)
  array.reduce { |sum, num| sum + num } / array.size
  # array.reduce(:+) / array.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# Time: 52.8 sec