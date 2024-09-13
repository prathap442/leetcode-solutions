def rotate(nums, k)
    length_of_nums = nums.length
    if k > length_of_nums
      k = k%(length_of_nums)
    end
    reverse(nums, 0, n-1)
    reverse
    return nums[length_of_nums-k..-1] + nums[0..length_of_nums-k-1]
end

#testcase1: nums = [-1,-100,3,99]; k = 3
#testcase2
nums =[1,2,3,4,5,6,7]; k=3
#Output: [5,6,7,1,2,3,4]
puts rotate(nums, k).to_s