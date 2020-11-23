a = [1, 4, 8, 11, 15, 19]

value = a.bsearch { |x| x > 8}
puts value # => 11


# bsearch {|x| block } → elem 
# This shows that #besearch takes only 1 argument - a block - and rteturns an element of the array to which it is applied
# The block is required, and it takes one argument