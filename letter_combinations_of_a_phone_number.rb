# Given a digit string, return all possible letter combinations that the number 
# could represent.
# A mapping of digit to letters (just like on the telephone buttons) is given 
# below.
#
# Input:Digit string "23"
# Output: ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
# Note:
# Although the above answer is in lexicographical order, your answer could be in
# any order you want.

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  digits = digits.chars.select do |char|
    char != '0' && char != '1'
  end
  return [] if digits.empty?
  results = []
  key_board = {
    '2' => %w(a b c),
    '3' => %w(d e f),
    '4' => %w(g h i),
    '5' => %w(j k l),
    '6' => %w(m n o),
    '7' => %w(p q r s),
    '8' => %w(t u v),
    '9' => %w(w x y z)
  }
  
  total_count = digits.inject(1) do |memo, obj|
    key_board[obj].length * memo
  end

  total_count.times do |i|
    current_count = total_count
    results << combination = digits.length.times.map do |j|
      current_count /= key_board[digits[j]].length
      k = i / current_count
      i = i % current_count
      #p "i=#{i}, j=#{j}, k=#{k}, current_count=#{current_count}"
      key_board[digits[j]][k]
    end.join("")
  end
  results
end
