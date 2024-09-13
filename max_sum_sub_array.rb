=begin
2461. Maximum Sum of Distinct Subarrays With Length K
You are given an integer array nums and an integer k. Find the maximum subarray sum of all the subarrays of nums that meet the following conditions:

The length of the subarray is k, and
All the elements of the subarray are distinct.
Return the maximum subarray sum of all the subarrays that meet the conditions. If no subarray meets the conditions, return 0.

A subarray is a contiguous non-empty sequence of elements within an array.
Input: nums = [1,5,4,2,9,9], k = 3
Output: 15
Explanation: The subarrays of nums with length 3 are:
- [1,5,4] which meets the requirements and has a sum of 10.
- [5,4,2] which meets the requirements and has a sum of 11.
- [4,2,9] which meets the requirements and has a sum of 15.
- [2,9,9] which does not meet the requirements because the element 9 is repeated.
- [9,9,9] which does not meet the requirements because the element 9 is repeated.
We return 15 because it is the maximum subarray sum of all the subarrays that meet the conditions
=end

require 'pry'

def maximum_subarray_sum(nums, k)
    i = 0
    l = nums.length
    dynamizer = l-k
    highest_sum = 0
    if l < k
      return 0
    elsif l == k
      if check_if_array_has_duplicates(nums)
        return 0
      else
        return nums.inject(:+)
      end
    end
    finished_summing_array = first_finish_of_summing(nums)
    while(i<= dynamizer) do
      p = i
      m = i+k-1
      h1 = {}
      effective_sum = 0
      while(p <= m)
        if h1[nums[p]]
          puts "effective sum is nutralized to 0 as the element already exists"
          effective_sum = 'invalid'
          break
        else
          h1[nums[p]] = true
        end
        p+=1
      end
      if effective_sum == 'invalid'
        effective_sum = 0
      else
        if i-1 < 0
          effective_sum = finished_summing_array[m]
        else 
          effective_sum = finished_summing_array[m] - finished_summing_array[i-1]  
        end
      end
      puts "for i being#{i} is effective_sum:#{effective_sum}"
      if effective_sum > highest_sum
        highest_sum = effective_sum
      end
      i+=1
    end
    return highest_sum
  end
  
  def check_if_array_has_duplicates(arr1)
    h1 = {}
    contain_duplicates = false
    arr1.each do |element|
      if h1[element]
        contain_duplicates = true
        break
      else
       h1[element] = true
      end
    end
    return contain_duplicates
  end

  def first_finish_of_summing(nums)
    arr2 = []
    i = 0
    effective_sum = 0
    while(i<=nums.length-1)
      if(i == 0)
        arr2[i] = nums[i]
        effective_sum = nums[i]
      else
        arr2[i] = effective_sum + nums[i]
        effective_sum = arr2[i]
      end
      i+=1
    end
    return arr2
  end

nums = [1,2,2]
k = 2
puts maximum_subarray_sum(nums, k)