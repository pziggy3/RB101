def center_of(string)
  if string.size.odd?
    center_index = (string.size - 1) / 2
    string[center_index]
  else
    right_middle = string.size / 2
    left_middle = right_middle - 1
    string[left_middle..right_middle]
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'

# Launch School Solution
def center_of2(string)
  center_index = string.size / 2
  if string.size.odd?
    string[center_index]
  else
    string[center_index - 1, 2]
  end
end
# The second argument in string[center_index - 1, 2] is the LENGTH of the resulting string so string[3, 2] would start at index 3 and be a length of 2 (2 characters)