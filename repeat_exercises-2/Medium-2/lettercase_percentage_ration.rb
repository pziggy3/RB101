# Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters,
# one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither. 

def letter_percentages(string)
  counts = {}
  characters = string.chars
  total = characters.length
  counts[:lowercase] = (characters.count { |char| char =~ /[a-z]/ }.to_f / total) * 100
  counts[:uppercase] = (characters.count { |char| char =~ /[A-Z]/ }.to_f / total) * 100
  counts[:neither] = (characters.count { |char| char =~ /[^A-Za-z]/ }.to_f / total) * 100

  counts
end

p letter_percentages('abCdef 123')
p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }