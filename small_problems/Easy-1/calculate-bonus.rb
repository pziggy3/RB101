def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : salary = 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(2300, false) == 0