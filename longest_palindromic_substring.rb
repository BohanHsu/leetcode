# Given a string S, find the longest palindromic substring in S. 
# You may assume that the maximum length of S is 1000, and there exists 
# one unique longest palindromic substring.

# @param {String} s
# @return {String}
def longest_palindrome(s)
  str = s
  j = s.length - 1
  i = 0
  s = []
  pali = (j+1).times.map { (j+1).times.map {nil} }

  (0..j).each do |x|
    (x..j).each do |y|
      s.push [x, y]
    end
  end

  max = 0

  until s.empty? do
    i = s[-1][0]
    j = s[-1][1]

    if !pali[i][j].nil?
      s.pop
      next
    end

    if i == j
      pali[i][j] = true    
    elsif i + 1 == j
      pali[i][j] = str[i] == str[j]
    else
      if pali[i+1][j-1].nil?
        s.push [i+1, j-1]
      else
        pali[i][j] = str[i] == str[j] && pali[i+1][j-1]
      end
    end
    max = j - i + 1 if pali[i][j] && max < j - i + 1
    s.pop unless pali[i][j].nil?
  end
  max
end
