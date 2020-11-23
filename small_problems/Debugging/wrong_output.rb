# Original Problem
arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 


# My Solution
arr = ["9", "8", "7", "10", "11"]
sorted = arr.sort do |x, y|
    y.to_i <=> x.to_i
end

p sorted


# L.S. Solution 1
p(
  arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
)

# L.S. Solution 2
p arr.sort { |x, y| y.to_i <=> x.to_i }


############### DISCUSSION ##################
# The main reason why the output was expected was because when the `do..end` block was used, p and arr.sort 
# BIND MORE TIGHTLY due to ruby's precendence rules.
# So, you're passing the block to the return value of `p arr.sort.`

# This is like writing...
# (p arr.sort) do |x,y|
#   y.to_i <=> x.to_i
# end

# IN THIS CASDE, THE BLOCK IS IGNORED SINCE THE RETURN VALUE OF p arr.sort IS NOT A METHOD CALL.