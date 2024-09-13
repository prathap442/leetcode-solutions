require 'pry'
# @param {Integer[][]} matrix
# @return {Void} Do not return anything, modify matrix in-place instead.
def set_zeroes(matrix)
    i=0
    row_length = matrix[0].length
    zero_index_spots_rows = []
    zero_index_spots_columns = []
    
    while(i<=matrix.length-1) do 
      j=0
      while(j<=row_length-1) do
        if matrix[i][j] == 0
           zero_index_spots_columns << j
           zero_index_spots_rows << i
        end
        j+=1
      end
      i+=1
    end
    certain_elements_to_zero(zero_index_spots_rows, zero_index_spots_columns, matrix)
 end
 
 def certain_elements_to_zero(zero_index_spots_rows, zero_index_spots_columns, matrix)
    zero_index_spots_rows.each do |row_identity|
      j=0
      while(j <= matrix[0].length-1)
        matrix[row_identity][j] = 0
        j+=1
      end
   end
   ((0..matrix.length-1).to_a - zero_index_spots_rows).each do |non_zero_i_index|
     zero_index_spots_columns.each do |column_index|
       matrix[non_zero_i_index][column_index] = 0
     end
   end
   matrix
 end

 matrix  = [[1,1,1],[1,0,1],[1,1,1]]
 puts set_zeroes(matrix)