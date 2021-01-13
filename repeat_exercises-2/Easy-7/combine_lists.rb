def interleave(array_1, array_2)
  combined_array = []
  array_1.each_with_index do |elem, index|
    combined_array << elem << array_2[index]
  end
  combined_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# 4:02

# Further exploration - Array#zip
def interleave2(array_1, array_2)
  array_1.zip(array_2).flatten
end

p interleave2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
