def include?(array, value)
  array.each { |element| return true if value == element }
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# 4 minutes???

#############################################################

# LS Solution - Easy way
def include2(array, value)
  !!array.find_index(value)
end
# find_index returns the index of the number of the goun element, which will always have a truthy alue, or `nil` if not present
# !! forces return value to true or false in accordance with implied ? in include?