# My Solution
def persistence(n)
  iteration = 0
    loop do
      break if n.to_s.length == 1
      iteration += 1
      n = n.to_s.chars.map(&:to_i).reduce(:*)
    end
  iteration 
end

# Codewars Solution
def persistence(n)
  n < 10 ? 0 : 1 + persistence(n.to_s.chars.map(&:to_i).reduce(:*))
end