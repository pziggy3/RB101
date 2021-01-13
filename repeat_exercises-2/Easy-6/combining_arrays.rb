def merge(array_1, array_2)
  cloned_array_1 = array_1.dup
  cloned_array_1.each do |elem|
    array_2 << elem unless array_2.include? elem
  end
  array_2.flatten.sort
end

def merge2(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
p merge2([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
