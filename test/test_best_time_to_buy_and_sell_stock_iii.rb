require 'minitest/autorun'
require '../best_time_to_buy_and_sell_stock_iii'

describe 'iii' do
  it 'should do dp' do
    prices = [1,3,2,4,5]
    max_profit(prices).must_equal 0
  end
end
