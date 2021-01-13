NUMBER_WORDS = %w(zero one two three four
                  five six seven eight nine
                  ten eleven twelve thirteen fourteen
                  fifteen sixteen seventeen eighteen nineteen)

# The problem is this doesn't manipulate the actual passed as an argument.
def alphabetic_number_sort(array)
  sorted_num_words = NUMBER_WORDS.sort
  sorted_num_words.map { |string_num| NUMBER_WORDS.index(string_num) }
end

def alphabetic_number_sort2(numbers)
  numbers.sort_by { |number| NUMBER_WORDS[number] }
end
# Sorts the numbers by each number's corresponding English name

p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

# 11:10