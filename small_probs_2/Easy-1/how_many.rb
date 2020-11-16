"""
Write a method that counts the number of occurrences of each element in a given array.
"""

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  counts = {}
  
  array.uniq.each do |v|
    counts[v] = array.count(v)
  end

  counts.each do |key, value|
    puts "#{key} => #{value}"
  end
end

count_occurrences(vehicles)