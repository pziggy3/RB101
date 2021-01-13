# In this kata, you've to count lowercase letters in a given string and return the
# letter count in a hash with 'letter' as key and count as 'value'. The key must be
# 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

# Example:
# letterCount('arithmetics') #=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}

################################################################################

# My Solution (improved with Rubocop)
def letter_count(str)
  counts = {}
  str.chars.uniq.each do |char|
    counts[char.to_sym] = str.count(char)
  end
  # counts.sort_by { |key, _| key }.to_h
  counts
end

# Top solution
def letter_count2(str)
  str.chars.each_with_object(Hash.new(0)) { |letter, hash| hash[letter.to_sym] += 1 }
end

p letter_count('aritmetics')
p letter_count2('aritmetics')
