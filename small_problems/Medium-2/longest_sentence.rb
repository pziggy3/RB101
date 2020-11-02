text = File.read('sample.txt')
sentences = text.split(/\.|\?|!/)
largest_sentence = sentences.max_by do |sentence|
  sentence.split.size
end
  
largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"