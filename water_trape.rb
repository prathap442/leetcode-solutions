
def water_trapper(arr)  
  n = arr.length
  res = 0
  puts arr.to_s
  for i in (1...n-1) do
    left = arr[i]
    right = arr[i]
    for j in (0..i-1) do
      puts arr[j]
      if arr[j] > left
        left = arr[j]
      end
    end

    for j in (i+1..n-1) do
      if arr[j] > right
        right = arr[j]
      end
    end
    puts "Now index:#{i} is present at the left max value is #{left} and the right max value is #{right}"
    res += ([left, right].min - arr[i])
  end
  res
end
arr = [3,0,0,2,0,4]
res = water_trapper(arr)
puts res
