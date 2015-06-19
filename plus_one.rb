# Given a non-negative number represented as an array of digits, plus one 
# to the number.

# The digits are stored such that the most significant digit is at the 
# head of the list.


# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  carrier = 1
  len = digits.length
  len.times do |i|
    new_carrier = (digits[len - 1 - i] + carrier) / 10
    digits[len - 1 - i] = (digits[len - 1 - i] + carrier) % 10
    carrier = new_carrier
    break if carrier == 0
  end
  if carrier == 1
    return [1] + digits 
  else
    digits
  end
end
