def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

def spin_me(arr)
  arr.each do |word|
    word.reverse!
  end
end
# each always returns the calling object, but the object can still be mutated

arr = ['hello', 'world']
puts arr.object_id # 47264354160220
puts spin_me(arr).object_id # 47264354160220

arr = ['hello', 'world']
p arr
p spin_me(arr)