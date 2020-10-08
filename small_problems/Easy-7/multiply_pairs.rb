# Launch School Solution
def multiply_all_pairs(array_1, array_2)
  products = []
  array_1.each do |item_1|
    array_2.each do |item_2|
      products << item_1 * item_2
    end
  end
  products.sort
end


# More compact Launch School solution
def multiply_all_pairs2(array_1, array_2)
  array_1.product(array_2).map { |num1, num2| num1 * num2 }.sort
end