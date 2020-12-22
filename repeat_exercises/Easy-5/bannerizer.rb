# REDO!!!!!!!!!!!!!!!!!!
# Write a method that will take a short line of text, and print it within a box.

################################################################################

def print_in_box(text)
  top_and_bottom = "+#{'-' * (text.size + 2)}+"
  empty_line = "|#{' ' * (text.size + 2)}|"
  text_line = "| #{text} |"

  puts top_and_bottom
  puts empty_line
  puts text_line
  puts empty_line
  puts top_and_bottom
end

# NOTE: based on example, you can see that the top+bottom and empty lines are dependent on the text length.

print_in_box('')
print_in_box('To boldly go where no one has gone before.')



################################################################################


# Further Exploration --- Modify this method so it will truncate the message if it will
# be too wide to fit inside a standard terminal window (80 columns, including the sides of the box).

# NOT FINISHED!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
def print_in_box2(text)

  # truncate message if over 80 characters
  new_text = text
  poo = " "

  if text.size > 80
    new_text = text[0,79]
    poo = text[80, text.size - new_text.size]   # second arg doesnt matter???????
  end

  top_and_bottom = "+#{'-' * (new_text.size + 2)}+"
  empty_line = "|#{' ' * (new_text.size + 2)}|"
  text_line = "| #{new_text} |"
  poo_line = "|#{' ' * ((new_text.size - poo.size)/2)} #{poo} #{' ' *((new_text.size - poo.size)/2)} |"

  puts top_and_bottom
  puts empty_line
  puts text_line
  puts poo_line
  puts empty_line
  puts top_and_bottom
end

# print_in_box2('To boldly go where no one has gone beforeqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqweqe.')
