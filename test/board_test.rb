require './lib/board'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new
    assert_instance_of Board, board
  end

  def test_hash_exists
    board = Board.new
    board.cells
    assert_equal 16, board.cells.keys.length
    assert_equal 16, board.cells.values.length
  end

  def test_it_can_validate_coordinates
    board = Board.new
    assert_equal true, board.valid_coordinate?("A1")
    assert_equal false, board.valid_coordinate?("A5")
  end

  def test_it_can_validate_placement
    board = Board.new
    cruiser = Ship.new("Cruiser", 3)
    submarine = Ship.new("Submarine", 2)
    assert_equal true, board.valid_placement?(submarine,["A1", "A2"])
    assert_equal false, board.valid_placement?(submarine, ["A1", "A3"])
  end
end
