def multiply_list(array_1, array_2)
  result = []
  array_1.each_with_index do |element, index|
    result << element * array_2[index]
  end
  result
end

p multiply_list([3, 5, 7], [9, 10, 11])
p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


def multiply_list_zip(array_1, array_2)
  # Still have to figure this out
  array_1.zip(array_2)
end

p multiply_list_zip([3, 5, 7], [9, 10, 11])
