# You are climbing a stair case. It takes n steps to reach to the top.

# Each time you can either climb 1 or 2 steps. In how many distinct ways 
# can you climb to the top?

# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  half = n / 2
  return (0..half).map do |i|
    combinations(n - i, i)
  end.inject(0) do |memo, obj|
    memo + obj
  end
end

def combinations(a, b)
  return 1 if b == 0 || b == a
  c = a - b < b ? a - b : b
  res = c.times.inject(1) do |memo, obj|
    memo *= (a - obj)
  end
  res = c.times.inject(res) do |memo, obj|
    memo / (obj + 1)
  end
  res
end
