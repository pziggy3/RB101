vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(array)
  vehicle_count = {}

  array.uniq.each do |vehicle|
    vehicle_count[vehicle] = array.count(vehicle)
  end
  
  vehicle_count.each do |element, count|
    puts "#{element} => #{count}"
  end
end
# Lastly, to print the desired output, we call #each on the newly created hash, which lets us pass the keys and values as block parameters.
# Then, inside of the block, we invoke #puts to print each key-value pair.




count_occurrences(vehicles)
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2


# originallty used uniq.count instead of uniq.each but it worked anyway
# Enumerable#count - If a block is given, it counts the number of elements yielding a true value. ---- setting a hash is always truthy
# 7:29
