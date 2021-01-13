def divisible?(number, divisor)
  number % divisor == 0
end

def fizzbuzz_value(number)
  case 
  when divisible?(number, 3) && divisible?(number, 5)
    'FizzBuzz'
  when divisible?(number, 5)
    'Buzz'
  when divisible?(number, 3)
    'Fizz'
  else
    number
  end
end
# This case statement doesn't have a value next to case for comparison
# When using a case statement in this form, we get the same functionality as if we used an if/elsif/else conditional.
# A case statement returns the value from the last line of the matched when branch

def fizzbuzz(start, final)
  result = []
  start.upto(final) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz