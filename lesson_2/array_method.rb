def array_method(array)
  counter = 0 

  while counter < array.length
    if counter.odd?
      element = array[counter]
      new_array = [element]
      p new_array
    end
    
    counter += 1
  end 
end 

array2 = [3, 7, 9, 24, 2]
puts array_method(array2)
