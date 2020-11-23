def shout_out_to(name)
  # The String#chars method returns an array of the characters in a string, so name.chars in our example returns ['y', 'o', 'u']
  # the line below though returns ["Y", "O","U"], but 'name' is still the same
  name.chars.each { |c| c.upcase! }

  puts 'HEY ' + name
end
shout_out_to('you') # expected: 'HEY YOU'

# Corrected
def shout_out_to2(name)
  name.upcase!
  puts 'HEY ' + name
end
shout_out_to2('you') # expected: 'HEY YOU'