var spiralOrder = function (matrix) {
    // Calculate the total number of rows and columns
    let rows = matrix.length;
    let cols = matrix[0].length;

    // Set up pointers to traverse the matrix
    let row = 0;
    let col = -1;

    // Set the initial direction to 1 for moving left to
    // right
    let direction = 1;

    // Create an array to store the elements in spiral
    // order
    const result = [];

    // Traverse the matrix in a spiral order
    while (rows > 0 && cols > 0) {
        // Move horizontally in one of two directions:
        //   1. Left to right (if direction == 1)
        //   2. Right to left (if direction == -1) Increment
        //      the col pointer to move horizontally
        for (let i = 0; i < cols; i++) {
            col += direction;
            result.push(matrix[row][col]);
        }
        rows--; //so that for the next cycle we are elminating one row form comparision

        // Move vertically in one of two directions:
        //   1. Top to bottom (if direction == 1)
        //   2. Bottom to top (if direction == -1) Increment
        //      the row pointer to move vertically
        for (let i = 0; i < rows; i++) {
            row += direction;
            result.push(matrix[row][col]);
        }
        cols--;

        // Flip the direction for the next traversal
        direction *= -1;
    }

    return result;
};


var mat = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
console.log(spiralOrder(mat))