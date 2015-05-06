# @param {String} s
# @return {Integer}
def title_to_number(s)
  sum = 0
  exp = 1
  s.split("").reverse.join("").each_char do |char|
    sum += dictionary(char) * exp
    exp *= 26
  end
  sum
end

def dictionary(c)
  c.ord - 64
end
