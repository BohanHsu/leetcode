require 'minitest/autorun'
require '../sudoku_solver'

describe 'solve_sudoku(board)' do
  it 'should work' do
    board = ["..9748...","7........",".2.1.9...","..7...24.",".64.1.59.",".98...3..","...8.3.2.","........6","...2759.."].map do |str|
      str.chars
    end

    expected_result = ["519748632","783652419","426139875","357986241","264317598","198524367","975863124","832491756","641275983"].map do |str|
      str.chars
    end

    solve_sudoku(board)
    board.must_equal(expected_result)
  end
end
