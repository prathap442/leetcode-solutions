/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number}
 */
var searchInsert = function(nums, target) {
  return binarySearchOperation(nums, target,0, nums.length-1)
};

function binarySearchOperation(nums,target,i,j){

  let mid = Math.floor((i+j)/2)

  if(i==j){
    if(target > nums[i])
      return i+1
    else if(target < nums[i])
      return i
  }
  else if(j < i){
    if(target > nums[i])
      return i+1
    else
      return i
  }

  if(target > nums[mid]){
    i = mid+1
    return binarySearchOperation(nums, target,i, j)
  }
  else if(target < nums[mid]){
    j = mid-1
    return binarySearchOperation(nums, target,i, j)
  }
  else{
    return mid
  }
}

//console.log(searchInsert([1,3,5,6],2))
console.log([1,3],0)
