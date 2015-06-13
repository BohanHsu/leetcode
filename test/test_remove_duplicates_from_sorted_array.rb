require 'minitest/autorun'
require '../remove_duplicates_from_sorted_array'

describe 'remove_duplicates' do
  it 'should pass test1' do
    @array = [1,2,2]
    remove_duplicates(@array).must_equal(2)
    @array.must_equal([1,2])
  end

  it 'should pass test2' do
    @array = [1,2,2,2,2,4,4,4,4]
    remove_duplicates(@array).must_equal(3)
    @array.must_equal([1,2,4])
  end
end
