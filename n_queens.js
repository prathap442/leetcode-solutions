var solveNQueens = function(n){
  const board = Array(n).fill('.').map((item)=> Array(n).fill('.'))
  const solutions = [];
  backtrack(board, 0, solutions)
  return solutions
}


function backtrack(board, row, solutions) {
    if (row === board.length) {
        solutions.push(board.map((item) => {return item.join("")}));
        return;
    }
    
    const n = board.length;
    for (let col = 0; col < n; col++) {
        //if we look at here we are first traversing at the column level and check if the Q could fit into that spot or not
        if (isSafe(board, row, col)) {
            board[row][col] = "Q";
            backtrack(board, row + 1, solutions);
            board[row][col] = ".";
        }
    }
}
function isSafe(board, row, column){
  const n = board.length
  for(let i=0; i<row; i++){
    if(board[i][column] == 'Q'){
       //then we presume that the queen is already there
       return false
    }
  }

  //for checking the left diagonal of the soultion
  //for checking this we have to decreament the row and column by 1 unit and decreemanet the column by 1 unit
  for(let i=row-1,j=column-1;i>=0 && j>=0; j--,i--){
    if(board[i][j] == 'Q'){
      return false
    }
  }

  //for checking the right diagonal of the solution
  for(let i=row-1,j=column+1; (i>=0 && (j < n)); j++,i--){
    console.log(row)
    console.log(i,j)
    if(board[i][j] == 'Q'){
        return false
    }
  }
  return true
}

console.log(solveNQueens(4))