# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
  m = 5
  sum = 0
  while n / m > 0 do
    sum += n / m
    m *= 5
  end
  sum
end
