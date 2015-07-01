require 'minitest/autorun'
require '../powxn'

describe 'my_pow' do
  it 'should work 1' do
    my_pow(3, 1).must_equal(3)
  end

  it 'should work 2' do
    my_pow(3, 2).must_equal(9)
  end

  it 'should work 3' do
    my_pow(3, 3).must_equal(27)
  end

  it 'should work 4' do
    my_pow(3.0, -3).must_equal(1.0/27)
  end

  it 'should work 5' do
    my_pow(3.0, -2).must_equal(1.0/9)
  end

  it 'should work 6' do
    my_pow(3.0, -1).must_equal(1.0/3)
  end
end
