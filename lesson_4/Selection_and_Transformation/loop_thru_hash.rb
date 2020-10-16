produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(produce_hash)
  produce_keys = produce_hash.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case 'hash' is an empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_hash[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# The original argument, 'hash', is not mutated