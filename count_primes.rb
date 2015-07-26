# Description:
# Count the number of prime numbers less than a non-negative number, n.

# @param {Integer} n
# @return {Integer}
def count_primes(n)
  return 0 if n <= 2
  is_prime = n.times.map do
    true
  end

  is_prime[0] = false
  is_prime[1] = false

  i = 2
  while i ** 2 < n do
    if is_prime[i]
      c = i
      while c * i < n do
        is_prime[c * i] = false
        c += 1
      end
    end
    i += 1
  end

  is_prime.select do |e|
    e
  end.length
end
