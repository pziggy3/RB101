def solution(str)
  str.chars.each_slice(2).to_a.map(&:join).map { |substr| substr.size == 1 ? substr << '_' : substr }
end

# Codewars solution
def solution str
  (str + '_').scan /../
end
# REGEX - The Dot Matches (Almost) Any Character

def solution(str)
  str << "_" if str.length.odd?
  str.chars.each_slice(2).map(&:join)
end