# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  max_pro = 0
  min = 1073741824
  prices.each do |price|
    min = price if price < min
    max_pro = price - min if price - min > max_pro
  end
  return max_pro
end
