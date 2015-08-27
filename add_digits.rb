# @param {Integer} num
# @return {Integer}
def add_digits(num)
  return 0 if num == 0
  remainder = num % 9
  remainder == 0 ? 9 : remainder
end

def add_digits_helper(num)
  sum = num
  while sum > 9 do
    num = sum
    sum = 0
    while num > 0 do
      sum += num % 10
      num /= 10
    end
  end
  sum
end
