# Given an array nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

# For example,
# Given nums = [1,3,-1,-3,5,3,6,7], and k = 3.

# Window position                Max
# ---------------               -----
# [1  3  -1] -3  5  3  6  7       3
# 1 [3  -1  -3] 5  3  6  7       3
# 1  3 [-1  -3  5] 3  6  7       5
# 1  3  -1 [-3  5  3] 6  7       5
# 1  3  -1  -3 [5  3  6] 7       6
# 1  3  -1  -3  5 [3  6  7]      7
# Therefore, return the max sliding window as [3,3,5,5,6,7].

# Note: 
# You may assume k is always valid, ie: 1 ≤ k ≤ input array's size for non-empty array.

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sliding_window(nums, k)
  results = []
  i = 0
  dq = Deque.new
  while i < k do
    while !dq.empty? && nums[dq.peek_right] < nums[i]
      dq.pop_right
    end

    dq << i
    i += 1
  end

  while i < nums.length do
    results << nums[dq.peek_left]

    while !dq.empty? && dq.peek_left <= i - k do
      dq.pop_left
    end

    while !dq.empty? && nums[dq.peek_right] < nums[i]
      dq.pop_right
    end
    
    dq << i

    i += 1
  end

  results << nums[dq.peek_left] if !dq.empty?
  results
end

class Node
  attr_accessor :prev, :next, :val
  def initialize(prev, val)
    @prev = prev
    @val = val
    @next = nil
  end

end

class Deque
  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def <<(val)
    node = Node.new @tail, val
    if @head.nil?
      @head = node
    else
      @tail.next = node
    end
    @tail = node
    @size += 1
  end

  def peek_left
    @head.val
  end

  def peek_right
    @tail.val
  end

  def pop_left
    res = @head
    @head = @head.next
    @size -= 1
    @tail = nil if @size == 0
    res.val
  end

  def pop_right
    res = @tail
    @tail = @tail.prev
    @size -= 1
    @head = nil if @size == 0
    res.val
  end

  def empty?
    @size == 0
  end

  def to_s
    s = "["
    n = @head
    while n do
      if n.next
        s += "#{n.val},"
      else
        s += "#{n.val}"
      end
      n = n.next
    end
    s += ']'
    s
  end
end
