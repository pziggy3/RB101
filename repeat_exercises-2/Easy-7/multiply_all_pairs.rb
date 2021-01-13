def multiply_all_pairs(array_1, array_2)
  result_array = []
  array_1.each do |num|
    array_2.each do |num2|
      result_array << [num, num2]
    end
  end
  result_array.map { |x, y| x * y }.sort    # or use .map { |arr| arr.reduce(:*) }
end


p multiply_all_pairs([2, 4], [4, 3, 1, 2])
p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]