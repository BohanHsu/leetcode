# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  max = nil
  prods = {}

  nums.each_with_index do |elem, i|
    prods[i] = {(i+1) => elem}
    if max.nil?
      max = elem
    else
      max = elem if max < elem
    end
  end

  (2...(nums.length)).each do |len|
    (0...(nums.length - len)).each do |i|

      prod = prods[i][i+1] * prods[i+1][i+len]
      max = prod if max < prod
      prods[i][i+len] = prod
    end
  end

  max
end
