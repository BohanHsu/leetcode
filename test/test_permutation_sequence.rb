require 'minitest/autorun'
require '../permutation_sequence'


# "123"
# "132"
# "213"
# "231"
# "312"
# "321"
describe 'get_permutation' do
  it 'should pass test case1' do
    get_permutation(3, 1).must_equal("123")
  end

  it 'should pass test case2' do
    get_permutation(3, 2).must_equal("132")
  end

  it 'should pass test case3' do
    get_permutation(3, 4).must_equal("231")
  end

  it 'should pass test case4' do
    get_permutation(3, 6).must_equal("321")
  end

  it 'should pass test case5' do
    get_permutation(4, 2).must_equal("1243")
    get_permutation(4, 6).must_equal("1432")
  end

  it 'should pass test case4' do
    get_permutation(1, 1).must_equal("1")
  end

  it 'should pass test case5' do
    get_permutation(2, 2).must_equal("21")
  end

  it 'should pass test case6' do
    get_permutation(2, 1).must_equal("12")
  end
 
end
