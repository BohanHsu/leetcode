# Determine whether an integer is a palindrome. Do this without extra space.

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  #x = -x if x < 0
  return false if x < 0
  i = 1

  while x / i > 0 do
    i *= 10
  end

  return true if i == 1

  i /= 10
  j = 10

  while i * 100 > j do
    #p "#{(x / i) % 10}, #{(x % j) / (j / 10)}"
    if (x / i) % 10 == (x % j) / (j / 10)
      i /= 10
      j *= 10
    else
      return false
    end
  end

  true
end
