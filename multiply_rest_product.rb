=begin
 Multiply the rest of the elements apart from the place where you are standaing
=end
require 'pry'
arr1 = [21,2,3,4,5]
output =  [2*3*4*5, 21*3*4*5, 21*2*4*5, 21*2*3*5, 21*2*3*4]
arr2 = [21,21*2, 21*2*3, 21*2*3*4, 21*2*3*4*5]
arr3 = [5*4*3*2*21, 5*4*3*2, 5*4*3, 5*4, 5]
def generate_left_portioned_set(arr)
  arr2 = []
  ans = 1
  arr.each do |element|
   ans = element*ans
   arr2 << ans
  end
  arr2
end


def generate_right_portioned_set(arr)
   i =  arr.length - 1
   right = []
   ans = 1
   while(i >= 0) do
    ans = arr[i] * ans
    right.push(ans)
    i-=1
   end
   right.reverse()
end
   
left = generate_left_portioned_set(arr1)
right = generate_right_portioned_set(arr1)
puts "left array is #{left}"
puts "right array is #{right}"
new_arr = []
arr_length = arr1.length
puts arr_length
i=0
while(i < arr_length) do
  if i==0
    new_arr << right[i+1]
  elsif i == arr_length-1 
    new_arr << left[i-1]
  else
    new_arr << left[i-1] * right[i+1]
  end
  i = i+1
end
puts new_arr.to_s