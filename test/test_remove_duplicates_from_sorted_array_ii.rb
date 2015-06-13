require 'minitest/autorun'
require '../remove_duplicates_from_sorted_array_ii'

describe 'remove_duplicates' do
  it 'should pass test1' do
    @array = [1,1,1,2,2,3]
    remove_duplicates(@array).must_equal(5)
    @array.must_equal([1,1,2,2,3])
  end
end
