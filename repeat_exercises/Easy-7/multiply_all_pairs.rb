# Write a method that takes two Array arguments in which each Array contains a list of numbers,
# and returns a new Array that contains the product of every pair of numbers that can be formed between the elements of the two Arrays.
# The results should be sorted by increasing value.

########################################################################

# L.S. Solution 1
def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

########################################################################

# L.S. Solution 2
def multiply_all_pairs2(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end

p multiply_all_pairs2([2, 4], [4, 3, 1, 2])
# array_1.product(array_2) => [[2, 4], [2, 3], [2, 1], [2, 2], [4, 4], [4, 3], [4, 1], [4, 2]]
# array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort => [2, 4, 4, 6, 8, 8, 12, 16]

