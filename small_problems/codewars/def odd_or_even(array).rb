def odd_or_even(array)
  array.inject(0,:+).even? ? "even" : "odd"
end