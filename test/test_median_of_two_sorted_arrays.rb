require 'minitest/autorun'
require '../median_of_two_sorted_arrays'

describe 'find_median_sorted_arrays(nums1, nums2)' do
  it 'should work' do
    nums1 = [1,3,5,7]
    nums2 = [2,8,14]
    find_median_sorted_arrays(nums1, nums2).must_equal(5)
  end

  it 'should work' do
    nums1 = [1,3,5,7]
    nums2 = [8,9,14]
    find_median_sorted_arrays(nums1, nums2).must_equal(7)
  end

  it 'should work1' do
    nums1 = [1,3,5,7]
    nums2 = [2,8,14,20]
    find_median_sorted_arrays(nums1, nums2).must_equal(6)
  end

  it 'should work2' do
    nums1 = [1,2,3,4,5,6]
    nums2 = [7,8,9,10]
    find_median_sorted_arrays(nums1, nums2).must_equal(5.5)
  end

  it 'should work2' do
    nums2 = [1,2,3,4,5,6]
    nums1 = [7,8,9,10]
    find_median_sorted_arrays(nums1, nums2).must_equal(5.5)
  end

  it 'should work3' do
    nums1 = [1]
    nums2 = [2,3,4]
    find_median_sorted_arrays(nums1, nums2).must_equal(2.5)
  end

  it 'should work4' do
    nums1 = [5]
    nums2 = [1,2,3,4,6,7]
    find_median_sorted_arrays(nums1, nums2).must_equal(4)
  end

  it 'should work5' do
    nums1 = [1,7]
    nums2 = [2,3,4,5,6,8]
    find_median_sorted_arrays(nums1, nums2).must_equal(4.5)
  end

  it 'should work on corner case 1' do
    nums2 = [1]
    nums1 = []
    find_median_sorted_arrays(nums1, nums2).must_equal(1)
  end

  it 'should work on corner case 2' do
    nums1 = [1]
    nums2 = []
    find_median_sorted_arrays(nums1, nums2).must_equal(1)
  end

  it 'should work on corner case 1' do
    nums2 = [1]
    nums1 = [2]
    find_median_sorted_arrays(nums1, nums2).must_equal(1.5)
  end

  it 'should work on corner case 2' do
    nums1 = [1]
    nums2 = [2]
    find_median_sorted_arrays(nums1, nums2).must_equal(1.5)
  end

  it 'should work' do
    nums1 = [1,6,8]
    nums2 = [2,3,4,5,7,9]
    find_median_sorted_arrays(nums1, nums2).must_equal(5)
  end
end
