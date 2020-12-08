# Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s, always starting with 1.
# The length of the string should match the given integer.

def stringy(number)
  result_string = ''
  1.upto(number) do |num|
    if num.even?
      result_string << '0'
    else
      result_string << '1'
    end
  end
  result_string
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'