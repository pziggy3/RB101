# 1 - How would you order this array of number strings by descending numeric value?
# My initial solution
arr = ['10', '11', '9', '7', '8']
arr_sorted = arr.sort_by do |elem|
  elem.to_i
end
p arr_sorted.reverse

# Launch School Solution - BETTER
arr_sorted2 = arr.sort do |a,b|
  b.to_i <=> a.to_i
end
p arr_sorted2

# This DOESN'T work because it's comparing character by character
arr_sorted3 = arr.sort.reverse
p arr_sorted3



# 2 - How would you order this array of hashes based on the year of publication of each book, from the earliest to the latest?
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]
books_sorted = books.sort_by do |book|
  book[:published]
end
p books_sorted
# Because all the values in question are 4 characters in length, we can compare the strings without having to convert them to integers



# 3 - For each of these collection objects demonstrate how you would reference the letter 'g'.
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
p hsh2[:third].keys[0]
p hsh2[:third].key(0)
# the Hash#key method returns the key of an occurrence of a given value (in this case the value was 0)



# 4 - For each of these collection objects where the value 3 occurs, demonstrate how you would change this to 4.
arr1 = [1, [2, 3], 4]
arr1[1][1] = 4
p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] = 4
p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] = 4
p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][2] = 4
p hsh2



# 5 - Given this nested Hash: figure out the total age of just the male members of the family
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# My initial Solution
total_male_age = 0
munsters2 = munsters.each do |key, value|
  total_male_age += value['age'] if value['gender'] == 'male'
end
# => 444

# L.S. Solution
total_male_age = 0
munsters.each_value do |details|
  total_male_age += details["age"] if details["gender"] == "male"
end
p total_male_age
# "each_value" iterates through only the values of the hash



# 6 - Given this previously seen family hash, print out the name, age and gender of each family member like:
# (Name) is a (age)-year-old (male or female).
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# My initial solution
munsters.each do |key, value|
  puts "#{key} is a #{value['age']} year old #{value['gender']}"
end

# Launch School Solution
munsters.each_pair do |name, details|
  puts "#{name} is a #{details['age']} year old #{details['gender']}"
end
# Hash#each_pair has 2 block parameters


# 7 - Given this code, what would be the final values of a and b? Try to work this out without running the code.
a = 2
b = [5, 8]
arr = [a, b]
# arr = [2, [5, 8]]

arr[0] += 2
# arr = [4, [5, 8]]
# IMPORTANT - this modifies "arr" NOT "a"
# This is assigning a NEW object at index 0, so instead of containing "a" it now contains 4

arr[1][0] -= a

p arr # => [4, [3, 8]]
p a # => 2
p b # => [3, 8]



# 8 - Using the each method, write some code to output all of the vowels from the strings.
hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
vowels = 'aeiou'

# My solution
hsh.each_value do |array|
  array.each do |word|
    word.split("").each do |letter|
      if vowels.include? letter
        puts letter
      end
    end
  end
end

# Launch School Solution - better
hsh.each do |_, value|
  value.each do |str|
    str.chars.each do |char|
      puts char if vowels.include?(char)
    end
  end
end
# Use 'chars' ---- does the same thing as split("")



# 9 - Given this data structure, return a new array of the SAME STRUCTURE but with the sub arrays being ordered (alphabetically or numerically as appropriate) in descending order.
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
arr.map do |sub_array|
  sub_array.sort do |a,b|
    b <=> a   # descending order
  end
end
# => [["c", "b", "a"], [3, 2, 1], ["green", "blue", "black"]]



# 10 - Given the following data structure and without modifying the original array, use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
arr.map do |hash|
  incremented_hash = {}
  hash.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]
# 1) Here map is iterating through the array. On each iteration it is creating a new hash (incremented_hash)
# 2) then iterating through the hsh object for that iteration in order to add key-value pairs to this hash using the original keys but values incremented by 1.
# 3) The OUTER BLOCK then RETURNS this INCREMENTED_HASH to MAP which uses it to transform each element in the array.

# Other solution:
[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].each_with_object([]) do |hsh, arr|
  incremented_hash = {}
  hsh.each do |key, value|
    incremented_hash[key] = value + 1
  end
  arr << incremented_hash
end
# => [{:a=>2}, {:b=>3, :c=>4}, {:d=>5, :e=>6, :f=>7}]



# 11 - Given the following data structure use a combination of methods, including either the select or reject method, to return a new array identical in structure to the original but containing only the integers that are multiples of 3.
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end
end



# 12 - Given the following data structure, and without using the Array#to_h method, write some code that will return a hash where the key is the first item in each sub array and the value is the second item.
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}
new_hash = {}
arr.each do |sub_array|
  new_hash[sub_array[0]] = sub_array[1]
end
new_hash

# Launch School Solution
hsh = {}
arr.each do |item|
  hsh[item[0]] = item[1]
end
hsh



# 13 - Given the following data structure, return a new array containing the same sub-arrays as the original but ordered logically by only taking into consideration the odd numbers they contain.
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]
arr.sort_by do |sub_arr|
  sub_arr.select do |num|
    num.odd?
  end
end



# 14 - Given this data structure write some code to return an array containing the colors of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors should be capitalized.
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |food, details|
  if details[:type] == 'fruit'
    details[:colors].map do |color|
      color.capitalize
    end
  else
    details[:size].upcase
  end
end
# => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]
# From the problem description we know that we want to return an array where each item in the outer hash is represented by a particular value from within each nested hash, so map is a good choice of method to call on the initial hsh object.
# `map` will always return an array


# 15 - Given this data structure write some code to return an array which contains only the hashes where all the integers are even.
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
arr.select do |hash|
  hash.all? do |key, value|
    value.all? do |num|
      num.even?
    end
  end
end


# 16 - Write a method that returns one UUID when called with no parameters.
# My solution - Needlessly repetitive, doesn't take advantage of ruby's iterative methods
def uuid
  hex = ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']
  code = ''
  8.times do
    code << hex.sample
  end
  code << '-'
  4.times do
    code << hex.sample
  end
  code << '-'
  4.times do
    code << hex.sample
  end
  code << '-'
  4.times do
    code << hex.sample
  end
  code << '-'
  12.times do
    code << hex.sample
  end
  p code
end
uuid

# Launch School Solution - MUCH BETTER
def generate_UUID
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }     # translates to 8.times...4.times...etc
    uuid += '-' unless index >= sections.size - 1   # add a dash unless we've gotten to the last index of the 'sections' array (index of 4)
  end

  uuid
end
p generate_UUID