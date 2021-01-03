# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

########################################################################

def buy_fruit(grocery_list)
  new_list = []
  grocery_list.each do |fruit|
    fruit[1].times { new_list << fruit[0] }
  end
  new_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

########################################################################

# LS Solution 1 - CLEARER
def buy_fruit2(list)
  expanded_list = []

  list.each do |item|
    fruit, quantity = item[0], item[1]      # For each subarray, we grab the quantity and the name of the fruit by using index reference 
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end

########################################################################

# LS Solution 2
def buy_fruit3(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end
# Using the block parameters to access each element of the subarrays

p buy_fruit3([["apples", 3], ["orange", 1], ["bananas", 2]])

# Note: 
# fruit * quantity => "applesapplesapples"
# [fruit] * quantity => ["apples", "apples", "apples"]




