# L.S. Solution
BLOCKS = %w(BO GT VI XK RE LY DQ FS ZM CP JW NA HU).freeze    # Why do we need freeze?

def block_word?(word)
  word = word.upcase
  BLOCKS.none? { |block| word.count(block) >= 2 }     # none is an enumerable method - iterates thru the blocks
end
# returns true (it's a block word) if the word doesn't use two letters from the same block

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true