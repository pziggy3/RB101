# Launch School Solution
def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parents -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end
# Ensures that the string's first parenthesis isn't ')' and breaks out of the iteration immediately when the parentheses become uneven
# If parens is 0 then it's balanced