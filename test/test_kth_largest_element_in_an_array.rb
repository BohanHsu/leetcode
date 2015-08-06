require 'minitest/autorun'
require '../kth_largest_element_in_an_array'

describe 'find_kth_largest(nums, k)' do
  it 'should work' do
    nums1 = 10.times.map { |i| i }
    k = 3
    expect_result = 7
    find_kth_largest(nums1, k).must_equal(expect_result)

    nums1 = 10.times.map { |i| i }.reverse
    k = 3
    expect_result = 7
    find_kth_largest(nums1, k).must_equal(expect_result)
  end

  it 'should work on corner case' do
    nums1 = [1]
    k = 1 
    expect_result = 1
    find_kth_largest(nums1, k).must_equal(expect_result)
  end

  it 'should work1' do
    nums1 = [1,1]
    k = 2
    expect_result = 1
    find_kth_largest(nums1, k).must_equal(expect_result)
  end

  it 'should work2' do
    nums1 = [2,1]
    k = 1
    expect_result = 2
    find_kth_largest(nums1, k).must_equal(expect_result)
  end
end
