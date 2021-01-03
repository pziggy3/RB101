name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name
# What does this code print out? Think about it for a moment before continuing.

# Alice
# Bob
# This is because assignment simply changes where the variable points to (assigns a reference to a variable).
# So, on line 3, `name` now points to "Alice", but `save_name` still points to "Bob"


name = 'Bob'
save_name = name
name.upcase!
puts name, save_name
# What does this print out? Can you explain these results?

# BOB
# BOB
# Because assignment in ruby just assigns a reference to a variable, both name and `save_name` refer to the same string, 'Bob'.
# When you apply name.upcase!, which mutates `name` in place, the VALUE that `save_name` references also changes.
# Thus, both name and save_name are set equal to 'BOB'.