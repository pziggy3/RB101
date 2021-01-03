# Write a method that takes a first name, a space, and a last name passed as a single String argument,
# and returns a string that contains the last name, a comma, a space, and the first name. 

########################################################################

def swap_name(name)
  name_array = name.split
  name_array[-1] + ", " + name_array[0]
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

########################################################################

# LS Solution - smarter
def swap_name2(name)
  name.split(' ')
end