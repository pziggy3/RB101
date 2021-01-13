def initialize_lights(number_of_lights)
  lights = {} 
  1.upto(number_of_lights) { |num| lights[num] = 'off' }
  lights
end
# have to use 1.upto(number_of_lights), can't use (1..number_of_lights)

def on_lights(light_hash)
  light_hash.select { |_, state| state == "on" }.keys
end

def toggle_lights(n)
  lights = initialize_lights(n)
  1.upto(n) do |num|
    lights.each do |position, state|
      if position % num == 0 
        lights[position] = (state == 'on') ? 'off' : lights[position] = 'on'
      end
    end
  end
  on_lights(lights)
end

p toggle_lights(5)
p toggle_lights(10)

# 13:55 but prob a few minutes more 


