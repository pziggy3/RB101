# Write a method that takes one argument, the total number of switches, and returns
# an Array that identifies which lights are on after n repetitions.

################################################################################

# My Solution
def thousand_lights(switch_number)
  arr = []
  switch_number.times { arr << true }

  2.upto(switch_number) do |n|
    index = 1
    arr.map! do |light|
      if index % n == 0
        light = (light == false) ? true : false
      end
      index += 1 
      light
    end
  end

  # Finding the indices of  all the elements that match a given condition
  matching_array = arr.each_index.select { |index| arr[index] == true }
  matching_array.map { |index| index + 1 }
end

p thousand_lights(5)
p thousand_lights(10)

################################################################################

# LS Solution
# initialize the lights hash
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers that are on
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    if position % nth == 0
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

# Run entire program for number of lights
def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
  end

  on_lights(lights)
end

p toggle_lights(1000)