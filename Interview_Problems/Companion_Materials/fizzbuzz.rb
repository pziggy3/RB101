# Write a method that takes two arguments: the first is the starting number, and the second is the ending number. Print out all numbers between the two numbers, except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

def divisible?(multiple, number)
  multiple % number == 0
end

def fizzbuzz(start, end)
  (start..end).to_a.each do |num|
    if divisible?(num, 3) && divisible?(num, 5)
      print "FizzBuzz"
    elsif divisible?(num, 3)
      print "Fizz"
    elsif divisible?(num, 5)
      print "Buzz"
    else
      print num
    end
  end
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
