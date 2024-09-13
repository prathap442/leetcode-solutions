# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
require 'pry'
def find_median_sorted_arrays(nums1, nums2)
  total_length = nums1.length+nums2.length
  return ((nums1+nums2).inject(:+)/2.0) if total_length == 2
  return (nums1+nums2).sort[1] if total_length == 3
  return (nums1+nums2)[0] if total_length == 1
  nums = []
  comparator = total_length/2
  if nums1.length == 0
    nums = nums2[0..comparator]
  elsif nums2.length == 0
    nums = nums1[0..comparator]
  else
    i=0; j=0; k=0
    while(i<=comparator) do
      if((nums1[j] != nil) && (nums2[k] != nil) && (nums1[j] < nums2[k]))
        nums << nums1[j]
        j+=1
      elsif nums2[k] != nil
        nums << nums2[k]
        k+=1
      else
        nums << nums1[j]
        j+=1
      end
      i+=1
    end
  end
  #binding.pry
  median = (total_length%2==0) ? (nums[comparator-1]+nums[comparator])/2.0 : nums[comparator]
end

puts find_median_sorted_arrays([0,0], [0,0])
puts find_median_sorted_arrays([1,2], [3,4])
puts find_median_sorted_arrays([1,2], [3,4,5])
puts find_median_sorted_arrays([], [1,2,3,4])
puts find_median_sorted_arrays([], [1,2,3,4,5])
puts find_median_sorted_arrays([1,2,3,4], [])
puts find_median_sorted_arrays([1,2,3,4,5], [])