calculateMinimumHP = require("../dungeon_game")

module.exports["test1"] = function (test) {
  dungeon = [
    [-2, -3, 3],
    [-5, -10, 1],
    [10, 30, -5]
  ]

  test.equal(calculateMinimumHP(dungeon), 7)
  test.done()
}

module.exports["test2"] = function (test) {
  dungeon = [[1,-3,3],[0,-2,0],[-3,-3,-3]]
  test.equal(calculateMinimumHP(dungeon), 3)
  test.done()
}

module.exports["test3"] = function (test) {
  dungeon = [[0]]
  test.equal(calculateMinimumHP(dungeon), 1)
  test.done()
}

module.exports["test4"] = function (test) {
  dungeon = [[0], [1]]
  test.equal(calculateMinimumHP(dungeon), 1)
  test.done()
}

module.exports["test5"] = function (test) {
  dungeon = [[0, 1]]
  test.equal(calculateMinimumHP(dungeon), 1)
  test.done()
}
