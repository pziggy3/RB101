ALPHABET_LOWER = ('a'..'z').to_a
ALPHABET_UPPER = ('A'..'Z').to_a

def letter_case_count(string)
  counts = { lowercase: 0, uppercase: 0, neither: 0 }
  string.split("").each do |char|
    if ALPHABET_LOWER.include? char
      counts[:lowercase] += 1
    elsif ALPHABET_UPPER.include? char
      counts[:uppercase] += 1
    else
      counts[:neither] += 1
    end
  end
  counts
end

p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }


# Launch School 2nd Solution
def letter_case_count2(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end
# we use the String#=~ method to match each character of the string against a pattern specified by a regular expression