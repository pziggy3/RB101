# dup and clone create a shallow copy of an object
# only the object that the method is called on is copied
# IMP: the objects that the other object contain (think a nested array) are NOT copied, instead they are shared

arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.map! do |char|
  char.upcase
end

arr1 # => ["a", "b", "c"]
arr2 # => ["A", "B", "C"]
# arr2 is changed but arr1 is not
# map! modifies the array, replacing each element of arr2 with a new value
# we are changing the array, NOT the elements within it, so arr1 is left unchanged



arr1 = ["a", "b", "c"]
arr2 = arr1.dup
arr2.each do |char|
  char.upcase!
end

arr1 # => ["A", "B", "C"]
arr2 # => ["A", "B", "C"]
# both arr1 and arr2 are changed
# we call the destructive upcase! method on EACH ELEMENT OF arr2
# every element of arr2 == reference to the object referenced by the corresponding element in arr1
# thus when upcase! mutates arr2, arr1 is also affected
# we change the ARRAY ELEMENTS, NOT THE ARRAY ITSELF