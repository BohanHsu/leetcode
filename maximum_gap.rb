# @param {Integer[]} nums
# @return {Integer}
def maximum_gap(nums)
  max_num = nums.max
  min_num = nums.min
  len = nums.length
  return 0 if len < 2
  if (max_num - min_num) % (len - 1)
    bucket_size = (max_num - min_num) / (len - 1)
  else
    bucket_size = (max_num - min_num) / (len - 1) + 1
  end

  bucket_size = 1 if bucket_size == 0

  bucket_nums = (max_num - min_num) / bucket_size + 1

  buckets = [].tap do |array|
    bucket_nums.times do
      array << nil
    end
  end

  nums.each do |num|
    bucket_index = (num - min_num) / bucket_size
    if buckets[bucket_index].nil?
      buckets[bucket_index] = {min: num, max: num}
    else
      buckets[bucket_index][:min] = num if buckets[bucket_index][:min] > num
      buckets[bucket_index][:max] = num if buckets[bucket_index][:max] < num
    end
  end

  buckets.select! do |bucket|
    !bucket.nil?
  end

  max_gap = 0

  buckets.each_with_index do |bucket, i|
    if i != buckets.length - 1
      bucket_next = buckets[i+1]
      max_gap = bucket_next[:min] - bucket[:max] if bucket_next[:min] - bucket[:max] > max_gap
    end
  end

  max_gap
end
