print "Enter a noun: "
noun = gets.chomp

print "Enter a verb: "
verb = gets.chomp

print "Enter a adjective: "
adjective = gets.chomp

print "Enter a adverb: "
adverb = gets.chomp

print "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

# Using string interpolation here instead of concatenation makes it more readable
# and is generally considered more rubyish (especially given that it is a sentence).