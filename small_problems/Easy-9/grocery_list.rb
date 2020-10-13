def buy_fruit(grocery_array)
  fruits = [] 

  grocery_array.each do |item|
    fruit = item[0]
    amount = item[1]
    amount.times do
      fruits << fruit
    end
  end

  fruits
end
p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]




# L.S. Solution 1
def buy_fruit2(list)
  expanded_list = []

  list.each do |item|
    fruit, quantity = item[0], item[1]
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end



# L.S. Solution 2
def buy_fruit3(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end
# We choose to use map in order to return a transformation of the array passed in as an argument
# Instead of doing string concatenation (fruit * quantity => "applesapplesapples") we want an array containing the required quantity of each fruit as separate strings ( [fruit] * quantity )



# L.S. Solution 3
def buy_fruit4(list)
  expanded_list = []
  
  list.each do |fruit, quantity|
    quantity.times { expanded_list << fruit }
  end
  
  expanded_list
end
p buy_fruit4([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]