# Given a string containing just the characters '(' and ')', find the length of
# the longest valid (well-formed) parentheses substring.
# For "(()", the longest valid parentheses substring is "()", which has 
# length = 2.
# Another example is ")()())", where the longest valid parentheses substring 
# is "()()", which has length = 4.

# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  stack = []
  max_len = 0
  from_index = 0
  max = nil
  from = -1

  s.chars.each_with_index do |e, i|
    case
    when e == '(' 
      stack << i
    when e == ')' 
      if stack.empty?
        from = i
      else
        stack.pop
        if stack.empty?
          from_index = from
        else
          from_index = stack.last
        end
        if i - from_index > max_len
          max_len = i - from_index
          max = [from_index + 1, i]
        end
      end
    end
  end
  #return '' if max.nil?
  #s[max.first..max.last]
  
  return 0 if max.nil?
  max.last - max.first + 1
end
