def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end

# using the method Enumerable#find to look through each item in our array
# If that item meets some condition we return it.
# In this case, the condition we check is that that item occurs twice