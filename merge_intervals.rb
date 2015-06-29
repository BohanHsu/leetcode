# Given a collection of intervals, merge all overlapping intervals.
# 
# For example,
# Given [1,3],[2,6],[8,10],[15,18],
# return [1,6],[8,10],[15,18].

# Definition for an interval.
# # class Interval
# #     attr_accessor :start, :end
# #     def initialize(s=0, e=0):
# #         @start = s
# #         @end = e
# #     end
# # end

# @param {Interval[]} intervals
# @return {Interval[]}
def merge(intervals)
  #byebug
  # can't assume that intervals is sorted
  intervals.sort! do |a, b|
    a.start <=> b.start
  end

  i = 0

  while i < intervals.length do
    j = i + 1
    while j < intervals.length do
      if intervals[j].start > intervals[i].end
        break
      else
        intervals[i].end = intervals[i].end > intervals[j].end ? intervals[i].end : intervals[j].end
        intervals.delete_at j
      end
    end
    i += 1
  end
  intervals
end
