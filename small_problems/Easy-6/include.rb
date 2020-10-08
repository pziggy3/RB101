def include?(array, value)
  array.each { |element| return true if value == element}
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false


# Launch School Solution (Easy Way)
def include2?(array, value)
  !!array.find_index(value)
end

# uses Array#find_index to scan the array for the first element that has the specified value.
# find_index returns the index number of the found element, which will always have a truthy value, or nil if no such element is present.
# We then use !! to force the return value to true or false in accordance with the implied promise of the ? in include?