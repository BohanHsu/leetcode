require 'minitest/autorun'
require '../fraction_to_recurring_decimal'

describe 'fraction_to_decimal' do
  it 'should do with non recurring fraction' do
    fraction_to_decimal(1, 8).must_equal('0.125')
  end

  it 'should do with recurring fraction' do
    fraction_to_decimal(1, 3).must_equal('0.(3)')
  end

  it 'should do with integer' do
    fraction_to_decimal(2, 1).must_equal('2')
  end

  it 'should do with integer2' do
    fraction_to_decimal(200, 16).must_equal('12.5')
  end

  it 'should do with recurring fraction2' do
    fraction_to_decimal(1, 6).must_equal('0.1(6)')
  end

  it 'should do with recurring fraction2' do
    fraction_to_decimal(1, 90).must_equal('0.0(1)')
  end

  it 'should do with recurring fraction3' do
    fraction_to_decimal(1, 900).must_equal('0.00(1)')
  end
  
  it 'should do with recurring fraction4' do
    fraction_to_decimal(1, 99).must_equal('0.(01)')
  end

  it 'should do with numerator = 0' do 
    fraction_to_decimal(0, 99).must_equal('0')
  end

  it 'should do with negative number' do 
    fraction_to_decimal(-50, 8).must_equal('-6.25')
  end
end
