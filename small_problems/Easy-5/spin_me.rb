def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

string = "hello world"
p string.object_id

string2 = spin_me("hello world") # "olleh dlrow"
p string2.object_id


"""
'The method will return a different object.
However, as soon as we have converted string into an array by calling split method on it, 
it is no longer possible for us to get back the original object again'
"""