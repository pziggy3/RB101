def swap_name(string)
  name = string.split
  name[-1] + ', ' + name[0]
end

p swap_name('Joe Roberts') == 'Roberts, Joe'

# 1:45

########################################################

# LS Solution
def swap_name2(name)
  name.split(' ').reverse.join(', ')
end