# My solution
def fizzbuzz(number_1, number_2)
  (number_1..number_2).each do |num|
    if num % 3 == 0
      if num % 5 == 0
        puts "FizzBuzz"
      else
        puts "Fizz"
      end
    elsif num % 5 == 0
      puts "Buzz"
    else
      puts num
    end
  end
end

fizzbuzz(1, 15)


# Launch School Solution
def fizzbuzz2(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case 
  when number % 3 == 0 && number % 5 == 0
    'Fizzbuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

# This case statement doesn't have a value next to case for comparison.
# When using a case statement in this form, we get the same functionality as if we used an if/elsif/else conditional.

fizzbuzz2(1, 15)