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

  def test_it_can_determine_winner
    game = Game.new
    

    assert_equal false, game.is_computer_winner?

    assert_equal false, game.is_player_winner?

    game.stubs(:is_computer_winner?).returns(true)
    game.stubs(:is_player_winner?).returns(false)


    assert_equal 'I won!', game.determine_winner
  end
end
