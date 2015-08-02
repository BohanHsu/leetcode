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
    @buildings = buildings
    @arr = []
  end

  def <<(e)
    @arr << e
    @arr.sort! do |a, b|
      @buildings[b][2] - @buildings[a][2]
    end
  end

  def delete(e)
    @arr.delete e
  end

  def peek
    @arr.first
  end

  def pop
    @arr.delete_at 0
  end

  def length
    @arr.length
  end

  def empty?
    @arr.empty?
  end
end
