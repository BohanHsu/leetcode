# Implement pow(x, n).

# @param {Float} x
# @param {Integer} n
# @return {Float}
def my_pow(x, n)
  return 1.0/x if n == -1
  return 1 if n == 0
  return x if n == 1
  negative = false
  if n < 0
    n = -n
    negative = true
  end

  res = my_pow(x, n/2) ** 2
  if n.odd?
    res *= x
  end
  if negative
    res  = 1 / res
  end
  res
end
