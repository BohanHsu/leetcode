require 'minitest/autorun'
require '../majority_element_ii'

describe 'majority_element(nums)' do
  it 'should work' do
    nums = [2,2,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9]
    majority_element(nums).must_equal([3,9])

    nums = [1,2,3,4]
    majority_element(nums).must_equal([])
  end
end
