# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  count = 1
  index = 0
  nums.each_with_index do |num, i|
    if nums[index] == nums[i]
      count += 1
    else
      count -= 1
    end

    if count == 0
      index = i
      count = 1
    end
  end
  nums[index]
end
