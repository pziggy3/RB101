# Write a method that takes a string and returns a boolean indicating if this string has a balanced set of parentheses.

def balancer(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end

p balancer("(hi") == false
p balancer("(hi)") == true
p balancer("(()) hi") == true
p balancer(")(") == false