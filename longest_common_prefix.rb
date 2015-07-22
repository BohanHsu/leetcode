# Write a function to find the longest common prefix string amongst an array 
# of strings.

class Node
  attr_accessor :val, :next
  def initialize(val)
    @val = val
  end
end

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  return "" if strs.length == 0
  return strs.first if strs.length == 1
  
  str1 = strs[0]
  str2 = strs[1]

  min_len = str1.length > str2.length ? str1.length : str2.length

  head = nil
  tail = nil
  node = nil
  prev = nil
  min_len.times do |i|
    if str1[i] == str2[i]
      node = Node.new str1[i]
      if head.nil?
        head = node
      else
        tail.next = node
      end
      tail = node
    else
      break
    end
  end


  (2...strs.length).each do |i|
    prev = nil
    node = head
    j = 0
    while j < strs[i].length do
      c = strs[i][j]
      break if node.nil?
      if c == node.val
        prev = node
        node = node.next
      else
        if prev.nil?
          head = nil
        else
          prev.next = nil
        end
        break
      end
      j += 1
    end
    
    if j == strs[i].length
      if prev.nil?
        head = nil
      else
        prev.next = nil
      end
    end
  end

  prefix = []
  node = head
  while !node.nil? do
    prefix << node.val
    node = node.next
  end
  
  prefix.join ""
end
