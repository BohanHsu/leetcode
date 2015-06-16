# Given two words word1 and word2, find the minimum number of steps 
# required to convert word1 to word2. (each operation is counted as 
# 1 step.)
# 
# You have the following 3 operations permitted on a word:
# 
# a) Insert a character
# b) Delete a character
# c) Replace a character

# @param {String} word1
# @param {String} word2
# @return {Integer}
def min_distance(word1, word2)
  return word2.length if word1.length == 0 
  return word1.length if word2.length == 0 
  matrix = (word1.length + 1).times.map do
    (word2.length + 1).times.map do
      nil
    end
  end

  matrix[0][0] = 0
    
  word1.length.times do |i|
    matrix[i+1][0] = i + (word1[i] == word2[0] ? 0 : 1)
  end

  word2.length.times do |i|
    matrix[0][i+1] = i + (word1[0] == word2[i] ? 0 : 1)
  end

  (0..(word1.length-1)).each do |i|
    (0..(word2.length-1)).each do |j|
      matrix[i+1][j+1] = [
        matrix[i+1][j] + 1, 
        matrix[i][j+1] + 1,
        matrix[i][j] + (word1[i] == word2[j] ? 0 : 1)
      ].min
    end
  end
  matrix[word1.length][word2.length]
end
