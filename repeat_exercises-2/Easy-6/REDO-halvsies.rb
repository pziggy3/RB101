def halvsies(array)
  middle = array.size / 2
  first_half = array[0, middle] if array.size.even?
  first_half = array[0, middle+1] if array.size.odd?
  second_half = array[middle+1..-1] if array.size.odd?
  second_half = array[middle..-1] if array.size.even?

  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]

# 16:46

############################################################

# L.S. Solution
def halvsies2(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

########################################################3
# using Enumerable#each_slice which divides array into size of argument
# DOESNT WORK for LAST 2 CASES

def halvsies3(array)
  half_size = (array.size / 2.0).ceil   # have to use 2.0 to get a float # (2.5), which can become 3 with `ceil`
  array.each_slice(half_size).to_a
end

p halvsies3([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies3([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]

p halvsies3([5])
p halvsies3([5]) == [[5], []]
p halvsies3([])
p halvsies3([]) == [[], []]