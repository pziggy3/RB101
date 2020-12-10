# REDO!!!!!!!!!!!!!!!!!

# You are given a method named spin_me that takes a string as an argument and returns a string that contains the same words, but with each word's characters reversed.
# Given the method's implementation, will the returned string be the same object as the one passed in as an argument or a different object?

################################################################################

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"


# Initial thought - Same object - each returns the same object - WRONG (sort of)

### THE METHOD RETURNS A DIFFERENT OBJECT
# 1) reverse! is mutating (same object) and each method returns the original array (same object)
# 2) But, the SPLIT method (which converts string into array) returns a new array object
# 3) When we join the array to a string, A COMPLETELY NEW STRING IS RETURNED

def spin_me2(arr)
  arr.each do |word|
    word.reverse!
  end
end


################################################################################


# However, if we rework this method to use an array argument instead of a string and we reversed each word in it by calling the same methods, then the array that was passed in as an argument and the array that was returned from the method would be the same object. 
arr = ['hello', 'world']
puts spin_me2(arr)
puts arr.object_id # 47264354160220
puts spin_me2(arr).object_id # 47264354160220