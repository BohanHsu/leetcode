# Given an array of strings, return all groups of strings that are anagrams.
# Note: All inputs will be in lower-case.

# @param {String[]} strs
# @return {String[]}
def anagrams(strs)
  h = {}
  results = []
  strs.each do |str|
    hash_code = str_hash_func str
    h[hash_code] = [] if h[hash_code].nil?
    h[hash_code] << str
  end
  
  h.each do |k, v|
    #results << v unless v.empty?
    results += v if v.length > 1
  end

  results
end

def str_hash_func(str)
  str = str.chars.sort.join ""
  str.each_byte.inject(0) do |memo, obj|
    memo * 26 + (obj - 96)
  end
end
