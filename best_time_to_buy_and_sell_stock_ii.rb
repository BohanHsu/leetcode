# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  sum = 0
  (1..(prices.length - 1)).each do |i|
    sum += prices[i] - prices[i - 1] if prices[i] > prices[i - 1]
  end
  return sum
end
