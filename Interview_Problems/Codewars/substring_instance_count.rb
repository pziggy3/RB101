# Complete the solution so that it returns the number of times the search_text is found within the full_text.

def solution(full_text, search_text)
  full_text.scan(search_text).size
end

p solution('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
p solution('aaabbbcccc', 'bbb') # should return 1