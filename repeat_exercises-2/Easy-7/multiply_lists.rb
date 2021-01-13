def multiply_list(array_1, array_2)
  zipped_array = array_1.zip(array_2)
  zipped_array.map do |sub_arr|
    sub_arr.reduce(:*)
  end
end
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

def multiply_list2(array_1, array_2)
  array_1.zip(array_2).map { |arr| arr.reduce(:*) }
end
p multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# 2:40

######################################################3

# LS solution
def multiply_list3(list_1, list_2)
  products = []
  list_1.each_with_index do |item, index|
    products << item * list_2[index]
  end
  products
end