# Write a method that takes an Array, and returns a new Array with the 
# of the original list in reverse order. Do not modify the original list.

########################################################################

# My Solution
def reverse(array)
  reversed_index = -1
  reversed_array = []

  array.each do |elem|
    # puts "elem: #{elem}"
    # puts "replaced with: #{array[reversed_index]}"
    reversed_array << array[reversed_index]
    # puts "new elem: #{elem}"
    reversed_index -= 1
  end

  reversed_array
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

########################################################################

def reverse2(array)
  result_array = []
  array.reverse_each { |element| result_array << element }
  result_array
end
#  reverse_each is like each, except it processes the elements in reverse order. Note that unlike each, reverse_each only applies to Arrays.

########################################################################

# Further Exploration - An even shorter solution is possible by using either inject or each_with_object. 
# ????????????????????
def reverse3(array)
  reversed_index = -1
  result = array.each_with_object([]) do |element, result|
    result << array[reversed_index]
    reversed_index -=1
  end

  result
end

p reverse3([1, 2, 3])