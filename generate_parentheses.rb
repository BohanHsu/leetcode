# Given n pairs of parentheses, write a function to generate all combinations
# of well-formed parentheses.
# For example, given n = 3, a solution set is:
# "((()))", "(()())", "(())()", "()(())", "()()()"

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  hash = {}
  hash[1] = ["()"]

  (2..n).each do |i|
    h = {}
    half = i / 2
    (1..half).each do |j|
      hash[i - j].each do |str1|
        if j == 1
          h["("+str1+")"] = true
        end
        hash[j].each do |str2|
          h[str1 + str2] = true
          h[str2 + str1] = true
        end
      end
    end
    hash[i] = [].tap do |result|
      h.each do |k, v|
        result << k
      end
    end
  end

  hash[n]
end
