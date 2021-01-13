# return array of suspects with illegal items in their pockets
def find_suspects(pockets, allowed_items)
  return nil if pockets.values.all? { |pocket| pocket.to_a.empty? }
  if allowed_items.empty?
    return pockets.reject { |suspect, items| items.to_a.empty? }.keys.uniq
  end
  
  suspects = []
  pockets.each do |suspect, items|
    items.each { |item| suspects << suspect if !allowed_items.include?(item) }
  end
  
  return nil if suspects.empty?
  suspects.uniq
end


#######################################################################3

# Codewars solution
def find_suspects2(pockets, allowed_items)
  suspects = pockets.select { |name, items| ([*items]-allowed_items).any? }.keys
  suspects.any? ? suspects : nil
end

def find_suspects3(pockets, allowed_items)
  suspects = []
  pockets.each do |person, items|
    suspects << person unless (Array(items) - allowed_items).empty?
  end
  suspects.empty? ? nil : suspects
end