[1, 2, 3].select do |num|
  num > 5
  'hi'
end
# select performs selection based on the truthiness of the block's return value.
# 'hi' is always truthy, Therefore select will return a new array containing all of the elements in the original array.
# => [1, 2, 3]



['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end
# If a block is given, counts the number of elements for which the block returns a true value.
# count only counts an element if the block's return value evaluates to true. This means that count considers the truthiness of the block's return value



[1, 2, 3].reject do |num|
  puts num
end
# => [1, 2, 3]
# This because puts always returns nil
# reject returns a new array containing items where the block's return value is "falsey".



['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end
# When we invoke each_with_object, we pass in an object ({} here) as an argument
# That object is then passed into the block and its updated value is returned at the end of each iteration.
# hash[value[0]] is the key of the hash, value is the value of the hash



hash = { a: 'ant', b: 'bear' }
hash.shift
# shift destructively removes the first key-value pair in hash and returns it as a two-item array



['ant', 'bear', 'caterpillar'].pop.size
# returns 11
# pop destructively removes the last element from the calling array and returns it. Second, size is being called on the return value by pop.



[1, 2, 3].any? do |num|
  puts num
  num.odd?
end
# the BLOCK'S return value ----> true (on the first iteration)
# The return value of 'any' returns true if the the block ever returns a value other than false or nil
# NOTE: any? stops iterating after the first iteration bc there's no need to evaluate the remaining items, so puts num is only invoked for the first item in the array (1)

arr = [1, 2, 3, 4, 5]
arr.take(2)
# => [1, 2]
# take(n) → array
#Returns first n elements from enum. it's a non-destructive method



{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end
# => [nil, "bear"]
# the return value of map is an array, which is the collection type that map always returns
# When none of the conditions in an if statement evaluates as true, the if statement itself returns nil. That's why we see nil as the first element in the returned array.



[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end
# => [1, nil, nil]