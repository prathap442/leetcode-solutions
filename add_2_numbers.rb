# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
require 'pry'
def add_two_numbers(l1, l2)
    l3 = [2,4,3]
    l4 = [5,6,4]
    m = l3.length-1
    z = l4.length-1
    max_iterations = m > z ? m : z
    result = []
    borrower = 0
    i=0
    (max_iterations+1).times do
      temp = 0
      if(m-i >= 0)
        temp+= l3[m-i]
      end
      if(z-i >= 0)
        temp+= l4[z-i]
      end
      temp+= borrower
      result.push(temp%10)
      borrower = temp/10
      i+=1
    end
    return result
  end


pp add_two_numbers([], [])