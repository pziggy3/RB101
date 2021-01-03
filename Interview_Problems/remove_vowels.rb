# Write a method that takes an array of strings and returns an array of the same string values, except with the vowels removed.

def remove_vowels(array)
  array.map! do |word|
    word.delete('aeiou')
  end
end

p remove_vowels(['green', 'yellow', 'black', 'white']) == ['grn', 'yllw', 'blck', 'wht']
