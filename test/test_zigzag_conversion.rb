require 'minitest/autorun'
require '../zigzag_conversion.rb'

describe 'calculate_char_num_in_line' do
  it 'should pass test 1' do
    calculate_char_num_in_line(16, 5).must_equal([2,4,4,4,2])
  end

  it 'should pass test 1' do
    calculate_char_num_in_line(17, 5).must_equal([3,4,4,4,2])
  end

  it 'should pass test 2' do
    calculate_char_num_in_line(18, 5).must_equal([3,5,4,4,2])
  end

  it 'should pass test 3' do
    calculate_char_num_in_line(19, 5).must_equal([3,5,5,4,2])
  end

  it 'should pass test 4' do
    calculate_char_num_in_line(20, 5).must_equal([3,5,5,5,2])
  end

  it 'should pass test 5' do
    calculate_char_num_in_line(21, 5).must_equal([3,5,5,5,3])
  end

  it 'should pass test 6' do
    calculate_char_num_in_line(22, 5).must_equal([3,5,5,6,3])
  end

  it 'should pass test 7' do
    calculate_char_num_in_line(23, 5).must_equal([3,5,6,6,3])
  end

  it 'should pass test 8' do
    calculate_char_num_in_line(24, 5).must_equal([3,6,6,6,3])
  end
  
  it 'should pass test 9' do
    calculate_char_num_in_line(25, 5).must_equal([4,6,6,6,3])
  end
end

describe 'calculate_accumulated_num_in_line' do
  it 'should pass test 1' do
    char_num_in_line = calculate_char_num_in_line(25, 5)
    char_num_in_line.must_equal([4,6,6,6,3])
    calculate_accumulated_num_in_line(char_num_in_line).must_equal([4,10,16,22,25])
  end
end

describe 'convert' do
  it 'should pass test 1' do
    s = 'aibhjqcgkpdfloen'
    num_rows = 5
    convert(s, num_rows).must_equal('abcdefghijklnopq')
  end

  it 'should pass test 2' do
    s = 'airbhjqscgkptdflouenv'
    num_rows = 5
    convert(s, num_rows).must_equal('abcdefghijklnopqrstuv')
  end

  it 'should pass test3 corner case' do
    s = ''
    num_rows = 1
    convert(s, num_rows).must_equal('')
  end
end
