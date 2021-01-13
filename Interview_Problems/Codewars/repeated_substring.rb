def f(s)
  substrings = []
  s.chars.each_with_index do |outer_char, index|
    substring = ''
    s[index..-1].chars.each { |inner_char| substrings << substring += inner_char }
  end 
  
  min_repeated_sub = substrings.uniq.select do |sub_str|
    sub_str * (s.size / sub_str.size) == s
  end.min 
  multiple = s.size / min_repeated_sub.size
  
  [min_repeated_sub, multiple]
end
# I don't need to find all substrings, the bottom solution only finds substrings starting from the first character


# Codewars Solution
def f(str)
  (1..str.size).each do |substr_size|
    substr = str[0, substr_size]
    repetitions = str.size / substr_size
    
    return [substr, repetitions] if substr * repetitions == str
  end
end