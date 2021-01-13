def print_in_box(string)
  box_length = string.length + 2
  puts "+#{'-' * box_length}+"
  puts "|#{' ' * box_length}|"
  puts "| #{string} |"
  puts "|#{' ' * box_length}|"
  puts "+#{'-' * box_length}+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')