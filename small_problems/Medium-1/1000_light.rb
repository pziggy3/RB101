# Write a method that takes one argument, the total number of switches, and returns an Array that identifies which lights are on after n repetitions.



# initialize the lights hash
# A single light is represented as a key-value pair within the hash.
# key = [number] which is the light's position out of the 1000 lights, and the value is initialized to 'off' for each light
def initialize_lights(number_of_lights)
  lights = Hash.new
  1.upto(number_of_lights) { |number| lights[number] = "off" }
  lights
end

# return list of light numbers (position) that are on
# uses '_position' as a parameter name since we don't use the parameter, but want to show what it represents
# returns the keys (the light's position) for which the state is "on" 
def on_lights(lights)
  lights.select { |_position, state| state == "on" }.keys
end

# toggle every nth light in lights hash
def toggle_every_nth_light(lights, nth)
  lights.each do |position, state|
    # For example, for the 4th iteration, every 4th light is toggled
    if position % nth == 0
      # set lights[position] (value) to "on" if state == "off" and vice versa
      lights[position] = (state == "off") ? "on" : "off"
    end
  end
end

def toggle_lights(number_of_lights)
  lights = initialize_lights(number_of_lights)
  # toggle_lights subsequently uses the 1.upto(lights.size) method call to iterate over the lights as many times as needed
  1.upto(lights.size) do |iteration_number|
    toggle_every_nth_light(lights, iteration_number)
    # It uses toggle_every_nth_light to toggle first every light, then every other (2nd) light, then every 3rd light, every 4th lightm and so on, until we have iterated over all of the lights 1000 times.
  end

  # returns list of light numbers (position) that are on
  on_lights(lights)
end

p toggle_lights(1000)
p toggle_lights(5)
p toggle_lights(10)