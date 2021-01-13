def negative(n)
  -(n.abs)
end

p negative(5) == -5
p negative(-3) == -3
p negative(0) == 0      # There's no such thing as -0 in ruby

# 1:08

#########################################################33

# LS Solution - more intuitive
def negative2(number)
  number > 0 ? -number : number
end
# Two choices (Either make the number negative and return it or return the already negative number) - perfect place for a ternary operation