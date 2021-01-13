def solve(s)
  substring_length = 0
  longest_vowel = 0
  s.each_char do |char|
    if 'aeiou'.include?(char)
      substring_length += 1
      longest_vowel = substring_length if substring_length > longest_vowel
    else
      substring_length = 0
    end
  end
  longest_vowel
end

# 19 mins

# Codewars Solution
def solve(s)
  s.scan(/[aeiou]+/).map(&:size).max
end
# 'aehhplom'.scan(/[aeiou]+/) => ["ae", "o"]
# '+' => 1 or more of the preceding expression
# '*' => 0 or more of the preceding expression
# 'aehhplom'.scan(/[aeiou]+/).map(&:size) => [2, 1].max => 2