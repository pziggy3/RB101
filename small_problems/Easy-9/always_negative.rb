def negative(number)
  # This doesn't work with "case number", only "case"
  case
  when number > 0
    number * -1
  else
    number
  end
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0  


# Launch School Solution
def negative2(number)
  number > 0 ? -number : number
end