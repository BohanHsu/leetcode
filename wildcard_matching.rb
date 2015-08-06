# Implement wildcard pattern matching with support for '?' and '*'.
# 
# '?' Matches any single character.
# '*' Matches any sequence of characters (including the empty sequence).
# 
# The matching should cover the entire input string (not partial).
# 
# The function prototype should be:
# bool isMatch(const char *s, const char *p)
# 
# Some examples:
# isMatch("aa","a") → false
# isMatch("aa","aa") → true
# isMatch("aaa","aa") → false
# isMatch("aa", "*") → true
# isMatch("aa", "a*") → true
# isMatch("ab", "?*") → true
# isMatch("aab", "c*a*b") → false

# @param {String} s
# @param {String} p
# @return {Boolean}
#def is_match(s, p)
#  i = 0
#  j = 0
#  
#  ast_i = nil
#  ast_j = nil
#  while i <= s.length && j <= p.length do
#    return true if i == s.length && j == p.length
#    if p[j] == '*'
#      return true if j == p.length - 1
#      
#      while i < s.length do
#        if p[i] == p[j+1] || p[j+1] == '?'
#          break
#        else
#          i += 1
#        end
#      end
#
#      return false if i == s.length
#
#      i += 1
#      ast_i = i
#      ast_j = j
#      j += 2
#    elsif p[j] == '?' || s[i] == s[j]
#      i += 1
#      j += 1
#    elsif s[i] != p[j] || p[j] != '?'
#      return false if ast_i.nil?
#      i = ast_i
#      j = ast_j
#
#      while i < s.length do
#        if p[i] == p[j+1] || p[j+1] == '?'
#          break
#        else
#          i += 1
#        end
#      end
#
#      return false if i == s.length
#      
#      i += 1
#      ast_i = i
#      j += 2
#    end
#  end
#  i == s.length && j == p.length
#end

def is_match(s, p)
  m = (s.length + 1).times.map do
    (p.length + 1).times.map do
      nil
    end
  end

  m[0][0] = 0

  s.length.times do |i|
    if p[0] == '*'
      m[i+1][0] = 0
    else
      m[i+1][0] = i + 1
    end
  end

  p.length.times do |j|
    if p[j] == '*'
      m[0][j+1] = m[0][j]
    else
      m[0][j+1] = m[0][j] + 1
    end
  end
  
  s.length.times do |i|
    p.length.times do |j|
      if p[j] == '*'
        a = m[i+1][j]
      else
        a = m[i+1][j] + 1
      end

      if p[j] == '*' || p[j] == '?' || s[i] == p[j]
        b = m[i][j]
      else
        b = m[i][j] + 1
      end

      if p[j+1] == '*'
        c = m[i][j+1]
      else
        c = m[i][j+1] + 1
      end

      m[i+1][j+1] = [a,b,c].min
    end
  end

  #m.each do |r|
  #  p r
  #end
  m[s.length][p.length] == 0
end

#def is_match(s, p)
#  stack = []
#  i = 0
#  j = 0
#
#  stack << [i, j]
#  until stack.empty? do
#    i = stack.last.first
#    j = stack.pop.last
#    return true if i == s.length && j == p.length
#    if p[j] == '?'
#      if i < s.length - 1
#        stack << [i+1, j+1]
#      end
#    elsif p[j] == '*'
#      stack << [i+1, j] if i+1 <= s.length && j <= p.length
#      stack << [i+1, j+1] if i+1 <= s.length && j+1 <= p.length
#      stack << [i, j+1] if i <= s.length && j+1 <= p.length
#    elsif s[i] == p[j]
#      stack << [i+1, j+1] if i+1 <= s.length && j+1 <= p.length
#    end
#  end
#  false
#end
