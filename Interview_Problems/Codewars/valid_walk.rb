# My solution
def is_valid_walk(walk)
  if walk.size == 10
    if walk.count('s') ==  walk.count('n') && walk.count('e') == walk.count('w')
      return true
    else
      return false
    end
  else
    return false
  end
end

# Codewars Solution
def isValidWalk(walk)
  walk.count('w') == walk.count('e') and
  walk.count('n') == walk.count('s') and
  walk.count == 10
end