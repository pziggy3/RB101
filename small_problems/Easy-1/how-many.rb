def count_occurrences(array)
  occurences = {}

  array.uniq.each do |element|
    # As we iterate over each UNIQUE element, we create a new key-value pair in occurrences
    # We set the key as the element's value. The value of key is the number of occurrences
    occurences[element] = array.count(element)
  end

  occurences.each do |element, count|
    # Printing the key, value pairs in occurrences
    puts "#{element} => #{count}"
  end

  p occurences
end


vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
count_occurrences(vehicles)