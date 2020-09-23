def find_greatest(numbers)
  saved_number = nil 

  numbers.each do |num|
    saved_number ||= num  # because saved_number is only nil once (at the beginning), num is only set to saved_number at the beginning. A ||=B assigns B to A if A is nil or false
    if saved_number >= num 
      next 
    else 
      saved_number = num 
    end 
  end 

  saved_number
end 

array = [1, 2, 3, 4, 10, 5]
puts find_greatest(array)



# write out pseudo-code (both casual and formal) that does the following:
# 1)     a method that returns the sum of two integers
# 2)     a method that takes an array of strings, and returns a string that is all those strings concatenated together
# 3)     a method that takes an array of integers, and returns a new array with every other element

# 1) casual
# Take number 1 as input from the user, and convert it to an integer 
# Take number 2 as input from the user, and convert it to an integer
# Return the sum of the two integers 

# 1) formal 
# GET number 1 --> to int 
# GET number 2 --> to int
# SET result = number1 + number2 
# PRINT result 


# 2) casual
# Take an array of strings
# Join the separate strings into a single string 
# Print the resulting string 

# 2) formal 
# START 
# SET array = ['string1', 'string2', 'string3']
# array.join 
# PRINT array 


# 3) casual
# Take an array of integers 
# Loop through the array 
# Return a new element (also an array) every other element of the array 

# 3) formal 
# START

# SET array = [int1, int2, int3]
# SET counter = 0

# WHILE counter <= length of array 
#   IF counter is odd 
#     PRINT int
#   counter += 1


