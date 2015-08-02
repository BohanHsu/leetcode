# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
  return [] if buildings.empty?
  outlines = []
  ks = buildings.inject([]) do |memo, obj|
    memo + obj[0..1]
  end.sort

  i = 0
  j = 0
  k_idx = 0

  prev_height = 0
  cur_height = 0
  pq = PriorityQueue.new buildings
  pq << 0

  while !(i >= buildings.length) && k_idx < ks.length do
    k = ks[k_idx]
    cur_height = 0

    while j + 1 < buildings.length && buildings[j+1][0] <= k && k < buildings[j+1][1] do
      j += 1
      pq << j
    end

    while i < buildings.length && buildings[i][1] < k do
      pq.delete i
      i += 1
    end

    while !pq.empty? && !(buildings[pq.peek][0] <= k && k < buildings[pq.peek][1]) do
      pq.pop
    end

    cur_height = pq.empty? ? 0 : buildings[pq.peek][2]

    #p "k=#{k}, i=#{i}, j=#{j}, cur_height=#{cur_height}, prev_height=#{prev_height}"

    outlines << [k, cur_height] if cur_height > prev_height
    outlines << [k, cur_height] if cur_height < prev_height

    prev_height = cur_height
    k_idx += 1
  end

  outlines
end

class PriorityQueue
  attr_accessor :arr
  def initialize(buildings)
    @size = 0
    @buildings = buildings
    @arr = (@buildings.length + 1).times.map { nil }
    @last = 0
    @deleted = {}
  end

  def get_parnet(k)
    return nil if k == 1
    k / 2
  end

  def left(k)
    return nil if k * 2 > @last
    k * 2
  end

  def right(k)
    return nil if k * 2 + 1 > @last
    k * 2 + 1
  end

  def swap_arr(i, j)
    tmp = @arr[i]
    @arr[i] = @arr[j]
    @arr[j] = tmp
  end

  def <<(e)
    @size += 1
    @deleted[e] = false
    @last += 1
    @arr[@last] = e
    k = @last

    while !get_parnet(k).nil? && @buildings[@arr[k]][2] > @buildings[@arr[get_parnet(k)]][2] do
      swap_arr(k, get_parnet(k))
      k = get_parnet(k)
    end
  end

  def delete(e)
    if @deleted[nil] || @deleted[e] == false
      @size -= 1
      @deleted[e] = true
    end
  end

  def peek
    while @size > 0 && @deleted[@arr[1]] == true do
      pop_one
      result = @arr[1]
    end
    @arr[1]
  end

  def pop
    result = pop_one
    while @deleted[result] == true do
      result = pop_one
    end
    @deleted[result] = true
    @size -= 1
    result
  end

  def pop_one
    return nil if @size == 0
    result = @arr[1]

    @arr[1] = @arr[@last]
    @arr[@last] = nil
    @last -= 1

    k = 1

    while k <= @last && ((!left(k).nil? && @buildings[@arr[k]][2] < @buildings[@arr[left(k)]][2]) || (!right(k).nil? && @buildings[@arr[k]][2] < @buildings[@arr[right(k)]][2])) do
      k_val = @buildings[@arr[k]][2]
      left_val = -1
      right_val = -1
      left_val = @buildings[@arr[left(k)]][2] if !left(k).nil?
      right_val = @buildings[@arr[right(k)]][2] if !right(k).nil?
      if k_val < left_val && k_val < right_val
        if left_val > right_val
          swap_arr(k, left(k))
          k = left(k)
        else
          swap_arr(k, right(k))
          k = right(k)
        end
      elsif k_val >= left_val && k_val < right_val
        swap_arr(k, right(k))
        k = right(k)
      elsif k_val < left_val && k_val >= right_val
        swap_arr(k, left(k))
        k = left(k)
      end
    end

    result
  end

  def length
    @size
  end

  def empty?
    @size == 0
  end
end

#class PriorityQueue
#  attr_accessor :arr
#  def initialize(buildings)
#    @buildings = buildings
#    @arr = []
#  end
#
#  def <<(e)
#    @arr << e
#    @arr.sort! do |a, b|
#      @buildings[b][2] - @buildings[a][2]
#    end
#  end
#
#  def delete(e)
#    @arr.delete e
#  end
#
#  def peek
#    @arr.first
#  end
#
#  def pop
#    @arr.delete_at 0
#  end
#
#  def length
#    @arr.length
#  end
#
#  def empty?
#    @arr.empty?
#  end
#end
