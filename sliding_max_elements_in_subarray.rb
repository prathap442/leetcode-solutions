=begin

239. Sliding Window Maximum
Hard
Topics
Companies
Hint
You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

Return the max sliding window.

 

Example 1:

Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation: 
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
Example 2:

Input: nums = [1], k = 1
Output: [1]
 

Constraints:

1 <= nums.length <= 105
-104 <= nums[i] <= 104
1 <= k <= nums.length

=end


# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
require 'pry'
# def max_sliding_window(nums, k)
#   i=0
#   sub_arrays = []
#   dequeue_index_storer = []
#   supporter = []
#   return nums if nums.length == 1
#   while(i< nums.length-k+1) do
#     j=i
#     while(dequeue_index_storer) do
#       if dequeue_index_storer.length == 0
#         supporter << nums[j]
#         dequeue_index_storer << j
#       else
#         #remove unwanted dequeue_index_sorter that are not in the window
#         if dequeue_index_storer[0] < i
#           dequeue_index_storer.shift
#           supporter.shift
#         end
#         if supporter[0] < nums[j]
#           dequeue_index_storer = [j]
#           supporter = [nums[j]]
#         else
#           dequeue_index_storer << j
#           supporter << nums[j]
#         end 
#       end
#       j+=1
#     end
#     sub_arrays << supporter[0]
#     i+=1
#   end
#   return sub_arrays
# end


#The above solution has the time complexity of O(n*k)

#what is the alternative for it

def max_sliding_window(nums, k)
  i=0
  sub_arrays = []
  dequeue_index_storer = []
  supporter = []
  return nums if nums.length == 1
  while(i< nums.length) do
    if dequeue_index_storer.length == 0
      supporter << nums[i]
      dequeue_index_storer << i
    else
      #remove unwanted dequeue_index_sorter that are not in the window
      #puts "the i value is #{i}"
      #this condition tells from when we have to start the consideration of the 
      if  i >= k-1 && dequeue_index_storer[0] == i-k 
        dequeue_index_storer.shift
        supporter.shift
      end
      if dequeue_index_storer.length == 0
        supporter << nums[i]
        dequeue_index_storer << i
        i+=1
        sub_arrays << supporter[0] if i >= k-1
        next
      end
      if supporter[0] < nums[i]
        dequeue_index_storer = [i]
        supporter = [nums[i]]
      else
        while(dequeue_index_storer.length !=0 && supporter[-1] < nums[i])
          dequeue_index_storer.pop
          supporter.pop
        end
        dequeue_index_storer << i
        supporter << nums[i]
      end 
    end
    sub_arrays << supporter[0] if i >= k-1
    i+=1
  end
  sub_arrays
end

nums = [1,-1]
k = 1

#Input: 
#nums = [1,3,-1,-3,5,3,6,7]; k = 3
#Output: [3,3,5,5,6,7]
puts max_sliding_window(nums, k)
