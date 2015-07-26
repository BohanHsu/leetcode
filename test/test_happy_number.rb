require 'minitest/autorun'
require '../happy_number'

describe 'is_happy(n)' do
  it 'should work' do
    is_happy(1).must_equal(true)
    is_happy(19).must_equal(true)
    is_happy(20).must_equal(false)
  end
end
