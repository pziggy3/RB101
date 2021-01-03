# Select the element out of the array if its index is a fibonacci number.

def fib_index_select(array)
  nth = array.size
  prev_fibo = 1
  next_fibo = 1
  fibo = 0
  fibo_array = [1]

  3.upto(nth) do
    fibo = prev_fibo + next_fibo
    fibo_array << fibo
    prev_fibo = next_fibo
    next_fibo = fibo
  end

  array.select do |element| 
    index_of_element = array.index(element)
    fibo_array.include?(index_of_element)
  end
end
p fib_index_select([1, 2, 3, 4, 5, 6]) 
p fib_index_select(('a'..'z').to_a) 
