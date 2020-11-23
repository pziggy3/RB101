a = %w(a b c d e)

puts a.fetch(7)
# outputs IndexError

puts a.fetch(7, 'beats me')
# outputs 'beats me'

puts a.fetch(7) { |index| index**2 }
# Alternatively, if a block is given it will only be executed when an invalid index is referenced.
# 49


# Fetch - it checks whether the specified element actually exists before fetching it, and raises an error if it does not exist. The second and third forms of #fetch prevent an error from occurring if the indicated element does not exist by providing a default value or a block that returns an appropriate value.