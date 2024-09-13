var rotate = (nums, k)=>{
  let n = nums.length
  if(k > n){
    k = k%n 
  }
  if(k == 1){
    reverse(nums, 0, n-1)
    return nums
  }
  reverse(nums, 0, n-1)
  reverse(nums, 0, k-1)
  reverse(nums, k, n-1)
  return nums
}

function reverse(nums, start, end) {
    while(start < end) {
      temp = nums[start]
      nums[start] = nums[end]
      nums[end] = temp
      start++;
      end--;
    }
}

nums = [1,2]
let k = 3
console.log(rotate(nums, k))