require 'minitest/autorun'
require '../multiply_strings'

describe 'multiply' do
  it 'should work for integer' do
    n1 = 123
    n2 = 456
    multiply(n1.to_s, n2.to_s).must_equal((n1 * n2).to_s)
  end

  it 'should work for float' do
    n1 = 12.3
    n2 = 45.6
    multiply(n1.to_s, n2.to_s).must_equal((n1 * n2).to_s)
  end

  it 'should work for float 2' do
    n1 = 0.3
    n2 = 0.6
    multiply(n1.to_s, n2.to_s).must_equal((n1 * n2).to_s)
  end

  it 'should work for integer 2' do
    n1 = 9
    n2 = 9
    multiply(n1.to_s, n2.to_s).must_equal((n1 * n2).to_s)
  end

  it 'should work for integer 3' do
    n1 = 9
    n2 = 99
    multiply(n1.to_s, n2.to_s).must_equal((n1 * n2).to_s)
  end

  it 'should work for integer 3' do
    n1 = 999
    n2 = 999
    multiply(n1.to_s, n2.to_s).must_equal((n1 * n2).to_s)
  end

  it 'should work for integer 4' do
    n1 = 999
    n2 = 0
    multiply(n1.to_s, n2.to_s).must_equal((n1 * n2).to_s)
  end
end
