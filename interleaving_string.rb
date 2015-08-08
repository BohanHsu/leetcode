# Given s1, s2, s3, find whether s3 is formed by the interleaving of s1 and s2.

# For example,
# Given:
# s1 = "aabcc",
# s2 = "dbbca",

# When s3 = "aadbbcbcac", return true.
# When s3 = "aadbbbaccc", return false.

# @param {String} s1
# @param {String} s2
# @param {String} s3
# @return {Boolean}
def is_interleave(s1, s2, s3)
  return false if s1.length + s2.length != s3.length

  matrix = (s1.length + 1).times.map do
    (s2.length + 1).times.map do
      false
    end
  end

  matrix[0][0] = true

  s1.length.times do |i|
    matrix[i+1][0] = s1[i] == s3[i+0] && matrix[i][0]
  end

  (s2.length + 1).times do |j|
    matrix[0][j+1] = s2[j] == s3[0+j] && matrix[0][j]
  end

  s1.length.times do |i|
    s2.length.times do |j|
      matrix[i+1][j+1] = matrix[i][j+1] && s1[i] == s3[i+j+1] || matrix[i+1][j] && s2[j] == s3[i+j+1]
    end
  end
  
  matrix[s1.length][s2.length]
end
