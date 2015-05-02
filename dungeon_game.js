/**
 * @param {number[][]} dungeon
 * @return {number}
 */
var calculateMinimumHP = function(dungeon) {

  var height = dungeon.length
  var width = dungeon[0].length

  var matrix = new Array(height)
  for (var i = 0; i < height; i++) {
    matrix[i] = new Array(width)
    for (var j = 0; j < width; j++) {
      matrix[i][j] = null;
    }
  }
  
  /* initialize */
  matrix[height-1][width-1] = 0 < dungeon[height-1][width-1] ? 1 : 1 - dungeon[height-1][width-1]

  for (var i = 0; i < width - 1; i++) {
    var min_at_here = matrix[height-1][width-1-i] - dungeon[height-1][width-2-i]
    matrix[height-1][width-2-i] = min_at_here <= 0 ? 1 : min_at_here
  }

  for (var j = 0; j < height - 1; j++) {
    var min_at_here = matrix[height-1-j][width-1] - dungeon[height-2-j][width-1]
    matrix[height-2-j][width-1] = min_at_here <= 0 ? 1 : min_at_here
  }

  if (height === 1 || width === 1) {
    return matrix[0][0]
  }

  var stack = []
  
  var get_hp = function (i, j) {

    if (matrix[i][j] !== null) {
      return matrix[i][j]
    }

    if (matrix[i][j+1] === null) {
      stack.push([i, j+1])
      return
    }
    
    if (matrix[i+1][j] === null) {
      stack.push([i+1, j])
      return
    }

    var min_hp_here = matrix[i][j+1] < matrix[i+1][j] ? matrix[i][j+1] : matrix[i+1][j]
    min_hp_here = -dungeon[i][j] + min_hp_here
    if (min_hp_here <= 0) {
      min_hp_here = 1
    }

    matrix[i][j] = min_hp_here

    stack.pop()
    return
  }

  stack.push([0, 0])

  while (0 !== stack.length) {
    get_hp(stack[stack.length-1][0], stack[stack.length-1][1])
  }

  return matrix[0][0]
};

module.exports = calculateMinimumHP
