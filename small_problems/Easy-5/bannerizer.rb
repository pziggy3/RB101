def print_in_box(text)
  puts '-' * (text.size + 2)
  
  count = 0
  3.times do
    if count == 1
      puts '|' + text.center(text.size) + '|'
    else
      puts '|' + '|'.rjust(text.size + 1)
    end

    count += 1
  end

  puts '-' * (text.size + 2)
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')


# Launch School solution - BETTER
def print_in_box2(message)
  horizontal_rule = "+#{'-' * (message.size + 2)}+"
  empty_line = "|#{' ' * (message.size + 2)}|"

  puts horizontal_rule
  puts empty_line
  puts "| #{message} |"
  puts empty_line
  puts horizontal_rule
end

print_in_box2('To boldly go where no one has gone before.')
print_in_box2('')