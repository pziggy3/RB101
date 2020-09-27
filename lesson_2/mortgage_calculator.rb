def prompt(message)
  puts "=> #{message}"
end 

def monthly_payment(loan_amount, monthly_interest_rate, loan_duration)
  loan_amount * ((monthly_interest_rate / 100) / (1 - (1 + (monthly_interest_rate / 100))**(-loan_duration)))
end

loop do 
  prompt("Welcome to Mortgage Calculator!")
  prompt("-------------------------------")

  # Get the loan amount from the user 
  prompt("What is the loan amount?")
  prompt("Please leave out the '$' in your response.")

  loan_amount = ''
  loop do
    loan_amount = gets.chomp

    if loan_amount.empty? || loan_amount.to_f < 0
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  # Get the monthly interest rate from the user
  prompt("What is the interest rate?")
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")

  APR = ''
  loop do
    APR = gets.chomp

    if APR.empty?() || APR.to_f < 0
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  # Get the loan duration in months
  prompt("What is the loan duration (in months?)")

  loan_duration = ''
  loop do
    loan_duration = gets.chomp

    if loan_duration.empty? || loan_duration.to_i < 0
      prompt("Enter a valid number.")
    else
      break
    end
  end

  # Return the monthly payment
  loan_amount = loan_amount.to_f
  APR = APR.to_f
  loan_duration = loan_duration.to_i
  
  monthly_interest_rate = (APR / 12)
  monthly_payment = monthly_payment(loan_amount,
                                    monthly_interest_rate,
                                    loan_duration)

  prompt("\nIt looks like your monthly payment will be #{monthly_payment.round(2)}. YAY!")

  prompt("Another calculation?")
  answer = gets.chomp
  
  break unless answer.downcase.start_with?('y')
end