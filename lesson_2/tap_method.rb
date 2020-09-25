array = [1, 2, 3]
mapped_array = array.map { |num| num + 1 }
p mapped_array

# Calling object == mapped_array == [1, 2, 3]
# tap method passes the CALLING OBJECT into a BLOCK, then RETURNS that object 

# printing the object inside that block
mapped_array.tap { |value| p value}

mapped_and_tapped = mapped_array.tap { |value| p 'hello'}
mapped_and_tapped

# Another use is to debug intermediate objects in method chains
(1..10)                 .tap { |x| p x }
 .to_a                  .tap { |x| p x }
 .select {|x| x.even? } .tap { |x| p x }
 .map {|x| x*x }        .tap { |x| p x }