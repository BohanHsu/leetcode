require 'minitest/autorun'
require '../next_permutation'

describe 'quick_sort!(nums, from, to)' do
  it 'should work' do
    @arr = [10, 2, 11, 15,3,5,7,17]
    arr = @arr
    quick_sort!(@arr, 0, @arr.length)
    @arr.must_equal(arr.sort)
  end
end

# 1,2,3 → 1,3,2
# 3,2,1 → 1,2,3
# 1,1,5 → 1,5,1
describe 'next_permutation(nums)' do 
  it 'should work 1' do
    @permutation = [1,2,3]
    next_perm = [1,3,2]
    next_permutation(@permutation)
    @permutation.must_equal(next_perm)
  end

  it 'should work 2' do
    @permutation = [1,1,5]
    next_perm = [1,5,1]
    next_permutation(@permutation)
    @permutation.must_equal(next_perm)
  end

  it 'should work 3' do
    @permutation = [3,2,1]
    next_perm = [1,2,3]
    next_permutation(@permutation)
    @permutation.must_equal(next_perm)
  end
end
