require 'pry'
arr = [0,1,2,0,1,2]
left = 0
right = arr.length-1
i = 0 
n = arr.length-1
while(i<right)
  if arr[right] == 2
    right -= 1
  end
  if arr[left] == 1
    left += 1
  end
  if arr[i] == 2
    temp = arr[i]
    arr[i] = arr[right]
    arr[right] = temp
    right -= 1
    #why has here not be done with the i+=1 becuase doing i+=1 if a 1 has been swapped at the place where we stand we have to swap it by taking one more iteration so we avoid the do of i+=1
  elsif arr[i] == 1
    temp = arr[i]
    arr[i] = arr[left]
    arr[left] = temp
    left += 1
    i+=1
  else
    i+=1
  end
  puts arr.to_s
end
puts arr.to_s
