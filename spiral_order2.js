const spiralOrder = function(matrix){
  let cols = matrix[0].length
  let rows = matrix.length
  let direction = 1
  let resultant = []
  row = 0
  col = -1

  while((rows >0) && (cols > 0)){
    
    //if the direction is 1 then traverse row values from left to right
    //if the direction is -1 then traverse row from right to the left
    for(let j=0; j<cols; j++){
        col+=direction
        resultant.push(matrix[row][col])
    }
    rows--

    //if the direction is 1 then traverse the col from top to the bottom
    //if the direction is -1 then traverse the col from bottom to the top
    for(let i=0; i<rows; i++){
        row+=direction
        resultant.push(matrix[row][col])
    }
    cols--
    direction *= -1
  }
  return resultant
}

spiralOrder([[1,2,3,4],[5,6,7,8],[9,10,11,12]])