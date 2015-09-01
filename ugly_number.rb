# @param {Integer} num
# @return {Boolean}
def is_ugly(num)
  return false if num <= 0
  return true if num == 1
  [2,3,5].each do |factor|
    while num > 1 do
      if num % factor == 0
        num /= factor
      elsif factor != 5
        break
      else
        return false
      end
    end
  end
  true
end
