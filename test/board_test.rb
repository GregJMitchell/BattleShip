require './lib/board'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'

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

    assert_equal true, board.valid_coordinate?('A1')
    assert_equal false, board.valid_coordinate?('A5')
  end

  def test_it_can_validate_placement
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    submarine = Ship.new('Submarine', 2)

    assert_equal true, board.valid_placement?(submarine, %w[A1 A2])
    assert_equal false, board.valid_placement?(submarine, %w[A1 A3])
    assert_equal false, board.valid_placement?(cruiser, %w[E1 E2 E3])
    assert_equal true, board.valid_placement?(cruiser, %w[A1 B1 C1])
    assert_equal false, board.valid_placement?(cruiser, %w[A2 B1 C1])
    assert_equal false, board.valid_placement?(cruiser, %w[A5 B5 C5])
    assert_equal false, board.valid_placement?(cruiser, %w[A1 B1])
  end

  def test_it_can_place_ships
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    board.place(cruiser, %w[A1 A2 A3])
    cell_1 = board.cells['A1']
    cell_2 = board.cells['A2']
    cell_3 = board.cells['A3']

    assert_equal cruiser, cell_1.ship
    assert_equal cruiser, cell_2.ship
    assert_equal cruiser, cell_3.ship
    assert_equal true, cell_3.ship == cell_2.ship
  end

  def test_ships_cannot_overlap
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    board.place(cruiser, %w[A1 A2 A3])
    submarine = Ship.new("Submarine", 2)

    assert_equal false, board.valid_placement?(submarine, %w[A1 B1])
  end

  def test_it_can_render
    board = Board.new
    cruiser = Ship.new('Cruiser', 3)
    board.place(cruiser, %w[A1 A2 A3])
    

    expected = ' 1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n'
    actual = board.render
    
    assert_equal expected, actual

    expected = ' 1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n'
    actual = board.render(true)

    assert_equal expected, actual 
  end
end
