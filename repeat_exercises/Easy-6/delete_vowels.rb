# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# My Solution
VOWELS = %w(a e i o u)

def remove_vowels(array)
  removed_vowels = ''

  array.join.split("").each do |letter|
    removed_vowels << letter if !VOWELS.include?(letter)
  end

  removed_vowels.split
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)


########################################################################

# L.S. Solution
def remove_vowels2(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end