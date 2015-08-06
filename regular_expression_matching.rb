# Implement regular expression matching with support for '.' and '*'.

# '.' Matches any single character.
# '*' Matches zero or more of the preceding element.

# The matching should cover the entire input string (not partial).

# The function prototype should be:
# bool isMatch(const char *s, const char *p)

# Some examples:
# isMatch("aa","a") → false
# isMatch("aa","aa") → true
# isMatch("aaa","aa") → false
# isMatch("aa", "a*") → true
# isMatch("aa", ".*") → true
# isMatch("ab", ".*") → true
# isMatch("aab", "c*a*b") → true

# @param {String} s
# @param {String} p
# @return {Boolean}
def is_match(s, p)
  reg = []
  i = 0
  while i < p.length do
    if i != p.length - 1
      if p[i+1] == '*'
        reg << p[i..(i+1)]
        i += 2
      else
        reg << p[i]
        i += 1
      end
    else
      reg << p[i]
      i += 1
    end
  end
  
  p = reg
  
  match = (p.length + 1).times.map do
    (s.length + 1).times.map do
      nil
    end
  end

  match[0][0] = true

  accumulated = true
  p.length.times do |i|
    if p[i].length == 1
      accumulated = false
    end
    match[i+1][0] = accumulated
  end

  acc = 0
  s.length.times do |j|
    if match[0][j] && !p[acc].nil? && p[acc].length == 2 && match?(s[j], p[acc])
      match[0][j+1] = true
    else
      match[0][j+1] = false
    end
  end

  prev_match = nil
  p.length.times do |i|
    s.length.times do |j|
      if p[i].length == 2
        prev_match = match[i+1][j] || match[i][j]
        match[i+1][j+1] = (match?(s[j], p[i]) && prev_match) || match[i][j+1]
      else
        prev_match = match[i][j]
        match[i+1][j+1] = match?(s[j], p[i]) && prev_match
      end
    end
  end

  match[p.length][s.length]

end

def match?(c, regexp)
  c == regexp[0] || regexp[0] == '.'
end
