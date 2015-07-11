# Given a string containing just the characters '(', ')', '{', '}', '[' and ']',
# determine if the input string is valid.

# The brackets must close in the correct order, "()" and "()[]{}" are all valid
# but "(]" and "([)]" are not

# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []
  h = { ")" => "(", "]" => "[", "}" => '{' }
  s.each_char do |c|
    if h[c].nil?
      stack << c
    else
      if stack.last == h[c]
        stack.pop
      else
        return false
      end
    end
  end
  stack.empty?
end
