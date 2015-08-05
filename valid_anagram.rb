# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.length != t.length

  h1, h2 = {}, {}
  (97..122).each do |ascii|
    h1[ascii.chr] = 0
    h2[ascii.chr] = 0
  end

  s.chars.each do |c|
    h1[c] += 1
  end

  t.chars.each do |c|
    h2[c] += 1
  end

  h1.each do |k, v|
    return false if h2[k] != v
  end

  true
end
