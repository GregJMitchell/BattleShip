require './lib/board'
require './lib/ship'
require './lib/game'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    game = mock('game object 1')
    player_board = mock('player board object')
    computer_board = mock('computer board object')
    game.stubs(:player_shots).returns([])
    game.stubs(:computer_shots).returns([])
    game.stubs(:player_board).returns(player_board)
    game.stubs(:computer_board).returns(computer_board)
    game.stubs(:player_sunk_ships).returns(0)
    game.stubs(:computer_sunk_ships).returns(0)
    
    assert_equal [], game.player_shots
    assert_equal [], game.computer_shots
    assert_equal player_board, game.player_board
    assert_equal computer_board, game.computer_board
    assert_equal 0, game.player_sunk_ships
    assert_equal 0, game.computer_sunk_ships
    
  end

  def test_it_can_determine_winner
    game = Game.new
    

    assert_equal false, game.is_computer_winner?

    assert_equal false, game.is_player_winner?

    game.stubs(:is_computer_winner?).returns(true)
    game.stubs(:is_player_winner?).returns(false)


    assert_equal 'I won!', game.determine_winner
  end
end
