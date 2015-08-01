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

  while !(i >= buildings.length) && k_idx < ks.length do
    k = ks[k_idx]
    cur_height = 0

    while j + 1 < buildings.length && buildings[j+1][0] <= k && k < buildings[j+1][1] do
      j += 1
    end

    while i < buildings.length && buildings[i][1] < k do
      i += 1
    end

    cur_height = buildings[i..j].select do |building|
      building[0] <= k && k < building[1]
    end.map do |building|
      building[2]
    end.max || 0

    #p "k=#{k}, i=#{i}, j=#{j}, cur_height=#{cur_height}, prev_height=#{prev_height}"

    outlines << [k, cur_height] if cur_height > prev_height
    outlines << [k, cur_height] if cur_height < prev_height

    prev_height = cur_height
    k_idx += 1
  end

  outlines
end

class PriorityQueue
  def initialize(buildings)
    @buildings = buildings
    @arr = []
  end

  def <<(e)
    @arr << e
    @arr.sort do |a, b|
      buildings[b][2] - buildings[a][2]
    end
  end

  def delete(e)
    @arr.delete e
  end

  def peek

  end

end
