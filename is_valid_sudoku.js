var isValidSudoku = function(board) {
  let validicity = true

  //isUniqBox
  var isUniqBox = (arr, row, col)=>{
    let st1 = new Set()
    console.log(`${arr} col:${col} row:${row}`)
    let elements_count = 0
    for(i in [0,1,2]){
      for(j in [0,1,2]){
        console.log(row-j, col-i, arr[row-j][col-i])
        if(arr[row-j][col-i] != '.'){
          elements_count++
          st1.add(arr[row-j][col-i])
        }
      }
    }
    console.log(`set place in uniq box:${JSON.stringify(st1)}`)
    return st1.size == elements_count
  }

  /*Validating col wise*/
  let gridSetBoxArray = new Array[9]
  /*Math.floor(j/3)*3, Math.floor(i/3)*/
  for(let i=0; i<9; i++){
    let s1 = new Set()
    let s2 = new Set()
    for(let j=0; j<9; j++){

      if((i%3==2) && (j%3==2)){  
        if(!(isUniqBox(board, i, j))){
          validicity = false
          console.log(`unique box validation failed at row:${i} col:${j}`)
          return validicity
        }
      }

      if(board[j][i] != '.'){
        if(!(s1.has(board[j][i]))){
          s1.add(board[j][i])
        }
        else{
          return false //col validation might have failed here
        }
      }

      if(board[i][j] != '.'){
        if(!(s2.has(board[i][j]))){
          s2.add(board[i][j])
        }
        else{
          return false //col validation might have failed here
        }
      }
    }
  }

  return validicity
};



matrix= [
  [".",".",".",".","5",".",".","1","."],
  [".","4",".","3",".",".",".",".","."],
  [".",".",".",".",".","3",".",".","1"],
  ["8",".",".",".",".",".",".","2","."],
  [".",".","2",".","7",".",".",".","."],
  [".","1","5",".",".",".",".",".","."],
  [".",".",".",".",".","2",".",".","."],
  [".","2",".","9",".",".",".",".","."],
  [".",".","4",".",".",".",".",".","."]
]
console.log(isValidSudoku(matrix))