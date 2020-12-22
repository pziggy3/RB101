# Write a method that takes a string, and then returns a hash that contains 3 entries:
# one represents the number of characters in the string that are lowercase letters,
# one the number of characters that are uppercase letters, and one the number of characters that are neither.

########################################################################

LOWERCASE_LETTERS = ('a'..'z').to_a
UPPERCASE_LETTERS = ('A'..'Z').to_a

# My Solution
def letter_case_count(string)
  letter_case_hash = {
    :lowercase => 0,
    :uppercase => 0,
    :neither => 0
  }
  string.each_char do |letter|
    if LOWERCASE_LETTERS.include? letter
      letter_case_hash[:lowercase] += 1
    elsif UPPERCASE_LETTERS.include? letter
      letter_case_hash[:uppercase] += 1
    else 
      letter_case_hash[:neither] += 1
    end    
  end
  letter_case_hash
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

########################################################################

# L.S. Solution 1
def letter_case_count2(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0}

  string.chars.each do |char|
    if UPPERCASE_LETTERS.include?(char)
      counts[:uppercase] += 1
    elsif LOWERCASE_LETTERS.include?(char)
      counts[:lowercase] += 1
    else
      counts[:neither] += 1
    end
  end

  counts
end

# L.S. Solution 2
def letter_case_count3(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end
# We first initialie an empty counts hash and then use Array#count to find the
# number of occurences of lowercase, uppercase, and all other characters.
# In the block following the block method invocation, we use the String#=~ method 
# to match each character against a pattern specified by a regular expression.
# The block will return a truthy value if there's a match, `nil` otherwise

########################################################################