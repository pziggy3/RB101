# My solution
def expanded_form(num)
  num_array = []
  power = num.to_s.size - 1
  num.to_s.each_char do |char|
    digit = char.to_i * (10**power)
    num_array << digit unless digit == 0
    power -= 1
  end
  num_array.join(' + ')
end

# Codewars Solution
def expanded_form(num)
  num.to_s
     .chars
     .reverse
     .map.with_index { |d, idx| d.to_i * 10**idx }
     .reject(&:zero?)
     .reverse
     .join (' + ')
end
