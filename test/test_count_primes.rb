require 'minitest/autorun'
require '../count_primes'

describe 'count_primes(n)' do
  it 'should return number of primes less than n' do
    count_primes(1).must_equal(0)
    count_primes(2).must_equal(0)
    count_primes(3).must_equal(1)
    count_primes(20).must_equal(8)
  end
end
