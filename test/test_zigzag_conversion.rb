require 'minitest/autorun'
require '../zigzag_conversion.rb'

describe 'calculate_char_num_in_line' do
  #it 'should pass test 1' do
  #  calculate_char_num_in_line(16, 5).must_equal([2,4,4,4,2])
  #end

  it 'should pass test 1' do
    calculate_char_num_in_line(17, 5).must_equal([3,4,4,4,2])
  end
end
