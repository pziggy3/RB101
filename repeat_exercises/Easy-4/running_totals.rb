# Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.

def running_total(array)
  running_array = []
  total = 0

  array.each do |element|
    total += element
    running_array << total
  end

  running_array
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []


# L.S. Solution
def running_total2(array)
  # Remember that map if for transformation...we're transforming each element of the array
  sum = 0
  array.map { |value| sum += value }
end

# Further Exploration -  solving this problem using Enumerable#each_with_object or Enumerable#inject
def running_total3(array)
  sum = 0
  array.inject([]) do |result_array, element|
    result_array << sum += element
  end
end

puts running_total3([2, 5, 13]) == [2, 7, 20]
puts running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total3([3]) == [3]
puts running_total3([]) == []