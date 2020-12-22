# Write a method named include? that takes an Array and a search value as arguments.
# This method should return true if the search value is in the array, false if it is not. 

# My Solution - DID IT THE HARD UNNECESSARY WAY
def include?(array, number)
  index = 0
  value_found = false

  loop do
    number_in_question = array[index]

    if array.include? number
      value_found = true
      break
    else
      index += 1
      break if index >= array.size
    end
  end

  value_found
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


# L.S. Solution - Harder way
def include2?(array, value)
  array.each { |element| return true if value == element }
  false
end

# L.S. Solution - Easy way
def include3?(array, value)
  !!array.find_index(value)
end
# The first method uses Array#find_index to scan the array for the first element that has the specified value. find_index returns the index number of the found element, which will always have a truthy value, or nil if no such element is present. 
# We then use !! to force the return value to true or false in accordance with the implied promise of the ? in include?.