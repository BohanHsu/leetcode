# Implement int sqrt(int x).
# Compute and return the square root of x.

# @param {Integer} x
# @return {Integer}
def my_sqrt(x)
  return 1 if x == 1 || x == 2 || x == 3
  return 2 if x == 4 || x == 5

  to = x / 2
  from = 0

  while to - from > 1 do
    i = (from + to) / 2
    square = i * i
    if square == x
      return i 
    elsif square < x
      from = i
    else
      to = i
    end
  end

  return to if to * to == x
  from
end
