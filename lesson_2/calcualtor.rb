def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  # returns true if number != 0, so valid number is true if result isn't 0
  num.to_i != 0
end 
prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt("Make sure to use a valid name.")
  else
    break
  end 
end

# main loop
loop do
  # this is a block, so we have to initialize the variable outside of the loop
  # this will allow us to access "number1" outside of the loop
  number1 = ''
  loop do 
    prompt("What's the first number?")
    number1 = Kernel.gets.chomp.to_i

    if valid_number?(number1)
      break
    else
      prompt("Hmm..that doens't look like a valid number")
    end 
  end 

  number2 = ''
  loop do 
    prompt("What's the second number?")
    number2 = gets.chomp.to_i

    if valid_number?(number2)
      break 
    else 
      prompt("Hmm.. that doesn't look like a valid number.")
    end 
  end 

  prompt("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
  operator = gets.chomp

  result = case operator
          when '1'
            number1 + number2
          when '2'
            number1 - number2
          when '3'
            number1 * number2
          when '4'
            result = number1.to_f / number2.to_f
  end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using caclulator. Poopoo.")