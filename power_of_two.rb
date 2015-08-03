# Given an integer, write a function to determine if it is a power of two.

# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  return false if n < 1
  return true if n == 1
  while n != 1 do
    return false if n % 2 == 1
    n = n / 2
  end
  true
end
