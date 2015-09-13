require 'minitest/autorun'
require '../ugly_number_ii'
require '../ugly_number'

def brute_force(n)
  count = 1
  num = 1
  while count <= n do
    if is_ugly(num)
      count += 1
    end
    num += 1
  end
  num-1
end

describe 'brute_force(n)' do
  it 'should help debug' do
    n = 7
    expected_result = 8
    brute_force(n).must_equal(expected_result)
  end

  it 'should work' do
    ugly_numbers = [1,2,3,4,5,6,8,9,10,12,15,16]

    (1..ugly_numbers.length).each do |n|
      expected_result = ugly_numbers[n-1]
      brute_force(n).must_equal(expected_result)
    end
  end
end

describe 'nth_ugly_number(n)' do
  it 'shuold work' do
    (1...100).each do |n|
      #p "n=#{n}, nth_ugly_number(n)=#{nth_ugly_number(n)}, brute_force(n)=#{brute_force(n)}"
      nth_ugly_number(n).must_equal(brute_force(n))
    end
  end
end
