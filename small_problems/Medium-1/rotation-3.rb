def rotate_rightmost_digits(number, n)
  array = number.to_s.chars
  array[-n..-1] = rotate_array2(array[-n..-1])    # replace the last n elements with the values to the right of the equal sign"
  array.join.to_i
end

def rotate_array2(array)
  array[1..-1] + [array[0]]    # array[0] must be in brackets
end

def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

p max_rotation(735291)