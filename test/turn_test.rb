require './lib/board'
require './lib/turn'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class GameTest < Minitest::Test

  def test_it_exists
    player_board = Board.new
    computer_board = Board.new
    turn = Turn.new(player_board, computer_board)
    assert_instance_of Turn, turn
  end

  def test_it_has_readable_attributes
    player_board = Board.new
    computer_board = Board.new
    turn = Turn.new(player_board, computer_board)
    assert_equal player_board, turn.player_board
    assert_equal computer_board, turn.computer_board
  end

  
end
