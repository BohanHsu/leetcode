require 'minitest/autorun'
require '../sudoku_solver'

describe 'solve_sudoku(board)' do
  before do
    @raw_board = [
      [5,3,0,0,7,0,0,0,0],
      [6,0,0,1,9,5,0,0,0],
      [0,9,8,0,0,0,0,6,0],
      [8,0,0,0,6,0,0,0,3],
      [4,0,0,8,0,3,0,0,1],
      [7,0,0,0,2,0,0,0,6],
      [0,6,0,0,0,0,2,8,0],
      [0,0,0,4,1,9,0,0,5],
      [0,0,0,0,8,0,0,7,9]
    ].map do |row|
      row.map do |i|
        if i == 0
          '.'
        else
          i.to_s
        end
      end
    end

    @expected_results = [
      [5,3,4,6,7,8,9,1,2],
      [6,7,2,1,9,5,3,4,8],
      [1,9,8,3,4,2,5,6,7],
      [8,5,9,7,6,1,4,2,3],
      [4,2,6,8,5,3,7,9,1],
      [7,1,3,9,2,4,8,5,6],
      [9,6,1,5,3,7,2,8,4],
      [2,8,7,4,1,9,6,3,5],
      [3,4,5,2,8,6,1,7,9]
    ].map do |row|
      row.map do |i|
        i.to_s
      end
    end.map do |row|
      row.join ""
    end
  end

  it 'should solve soduko' do
    result = solve_sudoku(@raw_board)
    result[0].must_equal(@expected_results[0])
    result[1].must_equal(@expected_results[1])
    result[2].must_equal(@expected_results[2])
    result[3].must_equal(@expected_results[3])
    result[4].must_equal(@expected_results[4])
    result[5].must_equal(@expected_results[5])
    result[6].must_equal(@expected_results[6])
    result[7].must_equal(@expected_results[7])
    result[8].must_equal(@expected_results[8])
  end

  it 'should return result' do
    board = [
      ".....7..9",
      ".4..812..",
      "...9...1.",
      "..53...72",
      "293....5.",
      ".....53..",
      "8...23...",
      "7...5..4.",
      "531.7...."]
    board.map! do |row|
      row.split //
    end
    p board

    result = solve_sudoku(board)
    p result
  end
end
