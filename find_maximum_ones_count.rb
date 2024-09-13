arr1 = [11,2,3,4,1,1,1,4,5,1,1]
i = 1

def find_max_consecutive_ones(arr1)
  menu1 = 0; big_menu=0;i=0
  while(i <= arr1.length-1) do
    if arr1[i] == 1
      menu1 += 1
    else
      big_menu = menu1 if menu1 > big_menu
      menu1 = 0  
    end
    i+=1
  end
  big_menu = menu1 if menu1 > big_menu
  big_menu
end
puts find_max_consecutive_ones(arr1)




#Alternative Solution that i have liked
# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  nums.join.split('0').map(&:length).max || 0
end