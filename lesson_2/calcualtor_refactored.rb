LANGUAGE = 'en'

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts "=> #{message}"
end

def integer?(input)
  input.to_i.to_s == input
end

def integer2?(input)
  # using regex
  /^-?\d+$/.match(input)
end

def integer3?(input)
  # using built-in conversion method
  # Integer method will raise a TypeError if the input is not a valid integer, so you have to handle that
  # trailing 'rescue' is a "code smell" - dont fall into a habit of suppressing errors this way 
  Integer(input) rescue false
end

def float?(input)
  input.to_f.to_s == input
end

def float2?(input)
  /\d/.match(input) && /^-?\d*\.?\d*$/.match(input)
end

def float3?(input)
  Float(input) rescue false
end

def number?(input)
  integer?(input) || float?(input)  
end

def operation_to_message(op)
  word = case op
          when '1'
            'Adding'
          when '2'
            'Subtracting'
          when '3'
            'Multiplying'
          when '4'
            'Dividing'
        end
  x = "A random line of code"

  word
end

prompt('welcome')

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hello #{name}!")

# main loop
loop do
  # this is a block, so we have to initialize the variable outside of the loop
  # this will allow us to access "number1" outside of the loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets.chomp.to_i

    if integer?(number1)
      break
    else
      prompt("Hmm..that doens't look like a valid number")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = gets.chomp.to_i

    if integer?(number2)
      break
    else
      prompt("Hmm.. that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply 
    4) divide 
  MSG

  prompt(operator_prompt)

  operator = ''
  loop do
    operator = gets.chomp

    # if this array includes this operator
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result =
    case operator
    when '1'
      number1 + number2
    when '2'
      number1 - number2
    when '3'
      number1 * number2
    when '4'
      number1.to_f / number2.to_f
    end

  prompt("The result is #{result}")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using caclulator. Goodbye.")
