# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  profits = {}

  max = 0
  min = 0
  prices.each_with_index do |price, i|
    if i == 0
      profits[[0, i]] = 0
      max = price
      min = price
    else
      max = price if price > max
      if price < min 
        max = price
        min = price
      end
      profit = max - min > profits[[0, i - 1]] ? max - min : profits[[0, i - 1]]
      profits[[0, i]] = profit if profit > profits[[0, i]]
    end
  end

  max = 0
  min = 0
  len = prices.length
  prices.reverse.each_with_index do |price, i|
    if i == 0
      profits[[len - 1 - i, len - 1]] = 0
      max = price
      min = price
    else
      min = price if price < min
      if max > price
        max = price
        min = price
      end
      profit = max - min > profits[[len - i, len - 1]] ? max - min : profits[[len - i, len - 1]]
      profits[[len - 1 - i, len - 1]] = profits if profits > profits[[len - 1 - i, len - 1]]
      end
    end
  end

  p profits

  best = 0
  (0...prices.length).each do |i|
    best = profits[0, i - 1] + profit[i, len] if profits[0, i - 1] + profit[i, len] > best
  end

  return 0
end
