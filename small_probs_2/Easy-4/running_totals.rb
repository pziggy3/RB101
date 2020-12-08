"""
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.
"""

def running_total(array)
  new_array = []

  total = 0
  array.map do |elem|
    total += elem
    new_array << total
  end

  new_array
end

def running_total2(array)
 # Don't need array.map! because the block and method return the new array
  total = 0  
  array.map do |elem|
    total += elem
    elem = total
  end
end

# L.S. Solution
# Don't need to use map!
def running_total3(array)
  sum = 0
  array.map { |value| sum += value }
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

puts running_total2([2, 5, 13]) == [2, 7, 20]
puts running_total2([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total2([3]) == [3]
puts running_total2([]) == []

puts running_total3([2, 5, 13]) == [2, 7, 20]
puts running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total3([3]) == [3]
puts running_total3([]) == []