# Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

def count_occurrences(vehicles)
  hash = {}
  vehicles.uniq.each do |vehicle|
    count = vehicles.count(vehicle)
    hash[vehicle] = count
  end
  hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end

count_occurrences(vehicles)
