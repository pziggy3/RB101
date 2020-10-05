# Question 1
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers


# Question 3 
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub("important", "urgent")


# Question 4
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1)

numbers = [1, 2, 3, 4, 5]
numbers.delete(1)


# Question 5 
(10..100).cover?(100)


# Question 6
famous_words = "seven years ago..."
p famous_words.prepend("Four score and ")

famous_words = "seven years ago..."
p "Four score and ".concat(famous_words)

famous_words = "seven years ago..."
p "Four score and " << famous_words



# Question 7
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

p flintstones.flatten!



# Question 8
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Hard way
p flintstones.select { |k,v| k == "Barney" }.to_a.flatten

# Easy way
# assoc() is an Hash class method which searches an element through the Hash.
flintstones.assoc("Barney")