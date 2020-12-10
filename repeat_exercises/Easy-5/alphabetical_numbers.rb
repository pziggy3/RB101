# Write a method that takes an Array of Integers between 0 and 19, and returns
# an Array of those Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
# twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

################################################################################

ARRAY = %w(zero one two three four five six seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen)

# My Solution - Completed Further Exploration (using Enumerable#sort)
def alphabetic_number_sort(array)

  # create word array from numbered array
  word_array = array.map do |num|
    num = ARRAY[num]
  end

  # sort the word array
  sorted_array = word_array.sort

  # convert the sorted word array to numbers using ARRAY
  final_array = sorted_array.map do |elem|
    elem = ARRAY.index(elem)
  end

  final_array
end

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

################################################################################

# L.S. Solution

NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

def alphabetic_number_sort(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end

# Constructing a call that sorts the numbers by each number's corresponding english name

################################################################################

# Further Exploration - Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?
# ???????????????????????????????????