require 'minitest/autorun'
require '../best_time_to_buy_and_sell_stock_ii'

describe 'max_profit' do
  it 'should work' do
    prices = [1,3,2,4,5]
    max_profit(prices).must_equal 5
  end
end
