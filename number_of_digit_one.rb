# Given an integer n, count the total number of digit 1 appearing in all 
# non-negative integers less than or equal to n.

# For example:
# Given n = 13,
# Return 6, because digit 1 occurred in the following numbers: 1, 10, 11, 12, 13.

# @param {Integer} n
# @return {Integer}
def count_digit_one(n)
  return 0 if n < 0
  return dict n if n < 100

  hash = { 2 => dict(99) }

  m = n / 100

  i = 3
  while m > 0 do 
    hash[i] = hash[i-1] * 10 + 10 ** (i-1)
    i += 1
    m /= 10
  end

  base = n % 100
  n = n / 100
  i = 2

  sum = dict(base)

  while n > 0 do
    digit = n % 10
    n /= 10

    if digit == 1
      sum += (hash[i] + base + 1)
    elsif digit == 0

    else
      sum += (hash[i] * digit  + (10 ** i))
    end
    base += digit * 10 ** i
    i += 1
  end

  sum
end

def dict(n)
  res = nil
  case
  when n == 0
    res = 0
  when 1 <= n && n <= 9
    res = 1
  when n == 10
    res = 2
  when n == 11
    res = 4
  when 12 <= n && n <= 19
    res = n - 7
  when n == 20
    res = 12
  when 21 <= n && n <= 30
    res = 13
  when n > 30
    if n % 10 == 0
      res = n / 10 + 10
    else
      res = n / 10 + 11
    end
  end
  res
end
