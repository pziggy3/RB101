# Question 1
# What do you expect to happen when the greeting variable is referenced in the last line of the code below?
if false
  greeting = “hello world”
end

p greeting

"""
greeting is nil here, and no 'undefined method or local variable' exception is thrown.
Typically, when you reference an uninitialized variable, Ruby will raise an exception, stating that it’s undefined.
However, when you initialize a local variable within an if block, even if that if block doesn’t get executed, the local variable is initialized to nil
"""


# Question 2
# What is the result of the last line in the code below?

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings


# Question 4
# Alyssa reviewed Ben's code and says "It's a good start, but you missed a few things.
# You're not returning a false condition, and you're not handling the case that there are more or fewer than 4 components to the IP address (e.g. "4.5.5" or "1.2.3.4.5" should be invalid)."
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    break unless is_an_ip_number?(word)
  end
  return true
end

# Launch School Solution
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4

  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end

  true
end

# Ben's original return true on the last line of the method can be shortened to just true. This is because Ruby returns the result of the last evaluated expression.