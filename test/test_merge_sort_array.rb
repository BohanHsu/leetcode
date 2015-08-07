require 'minitest/autorun'
require '../merge_sort_array'

describe 'merge(nums1, m, nums2, n)' do
  it 'should work' do
    @n1 = [1,3,5,7,9] + 4.times.map {nil}
    @n2 = [2,4,6,8]
    merge(@n1, 5, @n2, 4)
    @n1.must_equal([1,2,3,4,5,6,7,8,9])
  end

  it 'should work in corner case' do
    @n1 = [] + 4.times.map {nil}
    @n2 = [2,4,6,8]
    merge(@n1, 0, @n2, 4)
    @n1.must_equal([2,4,6,8])

    @n1 = [2,4,6,8] + 0.times.map {nil}
    @n2 = []
    merge(@n1, 4, @n2, 0)
    @n1.must_equal([2,4,6,8])
  end

end
