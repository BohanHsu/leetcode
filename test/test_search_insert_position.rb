require 'minitest/autorun'
require '../search_insert_position'


# [1,3,5,6], 5 → 2
# [1,3,5,6], 2 → 1
# [1,3,5,6], 7 → 4
# [1,3,5,6], 0 → 0
describe 'search_insert(nums, target)' do
  it 'should pass test 1' do
    search_insert([1,3,5,6], 5).must_equal(2)
  end

  it 'should pass test 2' do
    search_insert([1,3,5,6], 2).must_equal(1)
  end

  it 'should pass test 3' do
    search_insert([1,3,5,6], 7).must_equal(4)
  end

  it 'should pass test 4' do
    search_insert([1,3,5,6], 0).must_equal(0)
  end

  it 'should pass corner case 1' do
    search_insert([], 1).must_equal(0)
  end
  
  it 'should pass corner case 2' do
    search_insert([2], 1).must_equal(0)
  end

  it 'should pass corner case 3' do
    search_insert([0], 1).must_equal(1)
  end

  it 'should work 1' do
    search_insert([1,3], 3).must_equal(1)
  end

end
