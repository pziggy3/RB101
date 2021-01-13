# Given a string of integers, return the number of odd-numbered substrings that can be formed.
# For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers. 
# solve("1341") = 7

def solve(s)
  substrings = []
  s.chars.each_with_index do |outer_char, index| 
    substring = ''
    s.chars[index..-1].each { |inner_char| substrings << substring += inner_char }
  end
  substrings.map(&:to_i).select { |i| i.odd? }.count
end