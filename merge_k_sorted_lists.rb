# Merge k sorted linked lists and return it as one sorted list. Analyze and
# describe its complexity.

# Definition for singly-linked list.
# # class ListNode
# #     attr_accessor :val, :next
# #     def initialize(val)
# #         @val = val
# #         @next = nil
# #     end
# # end

# @param {ListNode[]} lists
# @return {ListNode}

def merge_k_lists(lists)
  if lists.length > 2
    half = lists.length / 2
    merge(merge_k_lists(lists[0...half]), merge_k_lists(lists[half...lists.length]))
  elsif lists.length == 2
    merge(lists[0], lists[1])
  elsif lists.length == 1
    lists[0]
  end
end

def merge(l1, l2)
  head = nil
  tail = nil
  while !l1.nil? || !l2.nil? do
    #p "l1.val=#{l1.nil? ? nil : l1.val}, l2.val=#{l2.nil? ? nil : l2.val}"
    selected = nil
    if l1.nil?
      selected = l2
      l2 = l2.next
      selected.next = nil
    elsif l2.nil?
      selected = l1
      l1 = l1.next
      selected.next = nil
    elsif l1.val < l2.val
      selected = l1
      l1 = l1.next
      selected.next = nil
    else
      selected = l2
      l2 = l2.next
      selected.next = nil
    end
    if head == nil
      head = selected
      tail = head
    else
      tail.next = selected
      tail = selected
    end
  end
  head
end

#def merge_k_lists(lists)
#  lists.inject do |memo, obj|
#    head = nil
#    tail = nil
#    l1 = memo
#    l2 = obj
#    while !l1.nil? || !l2.nil? do
#      #p "l1.val=#{l1.nil? ? nil : l1.val}, l2.val=#{l2.nil? ? nil : l2.val}"
#      selected = nil
#      if l1.nil?
#        selected = l2
#        l2 = l2.next
#        selected.next = nil
#      elsif l2.nil?
#        selected = l1
#        l1 = l1.next
#        selected.next = nil
#      elsif l1.val < l2.val
#        selected = l1
#        l1 = l1.next
#        selected.next = nil
#      else
#        selected = l2
#        l2 = l2.next
#        selected.next = nil
#      end
#      if head == nil
#        head = selected
#        tail = head
#      else
#        tail.next = selected
#        tail = selected
#      end
#    end
#    head
#  end
#end
