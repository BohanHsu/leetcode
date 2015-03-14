require 'minitest/autorun'
require '../best_time_to_buy_and_sell_stock'

describe 'max_profit' do
  it 'should work' do
    max_profit([4,2,3,1]).must_equal 1
  end

  it 'should handle situation of 0' do
    max_profit([1, 1, 0]).must_equal 0
  end
end
