# Given a set of non-overlapping intervals, insert a new interval into the 
# intervals (merge if necessary).
# 
# You may assume that the intervals were initially sorted according to their 
# start times.
# 
# Example 1:
# Given intervals [1,3],[6,9], insert and merge [2,5] in as [1,5],[6,9].
# 
# Example 2:
# Given [1,2],[3,5],[6,7],[8,10],[12,16], insert and merge [4,9] in 
# as [1,2],[3,10],[12,16].
# 
# This is because the new interval [4,9] overlaps with [3,5],[6,7],[8,10].

# Definition for an interval.
# class Interval
#     attr_accessor :start, :end
#     def __init__(self, s=0, e=0):
#         @start = s
#         @end = e
#     end
# end

# @param {Interval[]} intervals
# @param {Interval} new_interval
# @return {Interval[]}
def insert(intervals, new_interval)
  return intervals << new_interval if intervals.length == 0
  st = new_interval.start
  ed = new_interval.end

  from = 0
  to = intervals.length
  i = to
  if st < intervals.first.start
    insert_s = [-1]
  elsif st > intervals.last.end
    insert_s = [intervals.length]
  else
    while to > from + 1 || i != from do
      i = (from + to) / 2
      if intervals[i].start <= st && st <= intervals[i].end
        insert_s = [i]
        break
      elsif intervals[from].start <= st && st <= intervals[from].end
        insert_s = [from]
        break
      elsif intervals[to-1].start <= st && st <= intervals[to-1].end
        insert_s = [to-1]
        break
      elsif intervals[i].end < st
        from = i
      elsif intervals[i].start > st
        to = i
      end
    end
  end
  if insert_s.nil? && intervals[from].end < st && intervals[to].start > st
    insert_s = [from, to]
  end

  from = 0
  to = intervals.length
  i = to
  if ed < intervals.first.start
    insert_e = [-1]
  elsif ed > intervals.last.end
    insert_e = [intervals.length]
  else
    while to > from + 1 || i != from do
      i = (from + to) / 2
      if intervals[i].start <= ed && ed <= intervals[i].end
        insert_e = [i]
        break
      elsif intervals[from].start <= ed && ed <= intervals[from].end
        insert_e = [from]
        break
      elsif intervals[to-1].start <= ed && ed <= intervals[to-1].end
        insert_e = [to-1]
        break
      elsif intervals[i].end < ed
        from = i
      elsif intervals[i].start > ed
        to = i
      end
    end
  end
  if insert_e.nil? && intervals[from].end < ed && intervals[to].start > st
    insert_e = [from, to]
  end

  if insert_s.length == 1 && insert_s.first != -1 && insert_s.first != intervals.length
    new_interval.start = intervals[insert_s.first].start
  end

  if insert_e.length == 1 && insert_e.first != -1 && insert_e.first != intervals.length
    new_interval.end = intervals[insert_e.first].end
  end

  insert_s << 0 if insert_s.length == 1 && insert_s.first == -1
  insert_e.insert 0, intervals.length-1 if insert_s.length == 1 && insert_s.first == -1
  (insert_s.last..insert_e.first).each do |i|
    intervals.delete_at insert_s.last
  end

  intervals.insert(insert_s.last, new_interval)
  intervals
end
