s = 'abc'
puts s.public_methods(false).inspect
# prints a list of all of the public methods available to the String `s`
# this includes not only those methods defined in the String class, but also methods that are inherited from Object

# public_methods(all=true) → array
# if all is false, #public_methods limits the output to just those methods in the object that called #public_methods; for our purposes, this means just the methods defined directly in the String class.