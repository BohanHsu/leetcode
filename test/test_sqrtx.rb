require 'minitest/autorun'
require '../sqrtx'

describe 'my_sqrt' do
  it 'should work with 1' do
    my_sqrt(1).must_equal(1)
  end

  it 'should work with 2' do
    my_sqrt(2).must_equal(1)
  end


  it 'should work with 4' do
    my_sqrt(4).must_equal(2)
  end

  it 'should work with 5' do
    my_sqrt(5).must_equal(2)
  end

  it 'should work with 6' do
    my_sqrt(6).must_equal(2)
  end

  it 'should work with 9' do
    my_sqrt(9).must_equal(3)
  end

  it 'should work with 256' do
    my_sqrt(256).must_equal(16)
  end

  it 'should work with 257' do
    my_sqrt(257).must_equal(16)
  end
end
