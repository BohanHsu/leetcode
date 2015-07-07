require 'minitest/autorun'
require '../sudoku_solver'

describe 'solve_sudoku(board)' do
  before do
    @raw_board = 9.times.map do
      9.times.map do 
        '.'
      end
    end
    @raw_board[0][0] = '5'
    @raw_board[0][1] = '3'
    @raw_board[0][4] = '7'

    @raw_board[1][0] = '6'
    @raw_board[1][3] = '1'
    @raw_board[1][4] = '9'
    @raw_board[1][5] = '5'

    @raw_board[2][1] = '9'
    @raw_board[2][2] = '8'
    @raw_board[2][7] = '6'

    @raw_board[3][0] = '8'
    @raw_board[3][4] = '6'
    @raw_board[3][8] = '3'

    @raw_board[4][0] = '4'
    @raw_board[4][3] = '8'
    @raw_board[4][5] = '3'
    @raw_board[4][8] = '1'

    @raw_board[5][0] = '7'
    @raw_board[5][4] = '2'
    @raw_board[5][8] = '6'

    @raw_board[6][2] = '6'
    @raw_board[6][6] = '2'
    @raw_board[6][7] = '8'

    @raw_board[7][3] = '4'
    @raw_board[7][4] = '1'
    @raw_board[7][5] = '9'
    @raw_board[7][8] = '5'

    @raw_board[8][4] = '8'
    @raw_board[8][7] = '7'
    @raw_board[8][8] = '9'

    @expected_results = [
      [5,3,4,6,7,8,9,1,2],
      [6,7,2,1,9,5,3,4,8],
      [1,9,8,3,4,2,5,6,7],
      [8,5,9,7,6,1,4,2,3],
      [4,2,6,8,5,3,7,9,1],
      [7,1,3,9,2,4,8,5,6],
      [9,6,1,5,3,7,2,8,4],
      [3,4,5,2,8,6,1,7,9]
    ].map do |row|
      row.map do |i|
        i.to_s
      end
    end
  end

  #it 'should return next' do
  #  next_coordinate(@raw_board, 0, -1).must_equal([0, 2])
  #  next_coordinate(@raw_board, 0, 2).must_equal([0, 3])
  #  next_coordinate(@raw_board, 0, 3).must_equal([0, 5])
  #  next_coordinate(@raw_board, 0, 8).must_equal([1, 1])
  #  next_coordinate(@raw_board, 8, 5).must_equal([8, 6])
  #  next_coordinate(@raw_board, 8, 6).must_equal(nil)
  #end

  #it 'should return all possible' do
  #  node1 = { :i => 2, :j => 4, :val => '1'}
  #  node2 = { :i => 8, :j => 0, :val => '2', :prev => node1}
  #  node3 = { :i => 2, :j => 3, :val => '7', :prev => node2 }
  #  node4 = { :i => 2, :j => 3, :val => '7', :prev => node1 }

  #  all_possible_value(@raw_board, nil, 2, 0).must_equal([1,2].map {|i| i.to_s})
  #  all_possible_value(@raw_board, node1, 2, 0).must_equal([2].map {|i| i.to_s})
  #  all_possible_value(@raw_board, node2, 2, 0).must_equal([].map {|i| i.to_s})
  #  all_possible_value(@raw_board, node3, 2, 0).must_equal([].map {|i| i.to_s})
  #  all_possible_value(@raw_board, node4, 2, 0).must_equal([2].map {|i| i.to_s})
  #end

  #it 'should help debug' do
  #  node1 = { :i => 0, :j => 2, :val => '4'}
  #  node2 = { :i => 0, :j => 3, :val => '6', :prev => node1 }
  #  all_possible_value(@raw_board, node2, 0, 5).must_equal([2, 8].map {|i| i.to_s})
  #end

  it 'should solve soduko' do
    solve_sudoku(@raw_board).must_equal(@expected_results)
  end
end
