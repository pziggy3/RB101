def prompt(argument)
  puts "==> #{argument}"
end

prompt("Enter the first number:")
first_number = gets.chomp.to_i

prompt("Enter the second number:")
second_number = gets.chomp.to_i

sum = first_number + second_number
subtraction = first_number - second_number
product = first_number * second_number
quotient = first_number / second_number
remainder = first_number % second_number
power = first_number ** second_number

prompt("#{first_number} + #{second_number} = #{sum}")
prompt("#{first_number} - #{second_number} = #{subtraction}")
prompt("#{first_number} * #{second_number} = #{product}")
prompt("#{first_number} / #{second_number} = #{quotient}")
prompt("#{first_number} % #{second_number} = #{remainder}")
prompt("#{first_number} ** #{second_number} = #{power}")
