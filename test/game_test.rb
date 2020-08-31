require './lib/board'
require './lib/ship'
require './lib/game'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class GameTest < Minitest::Test
  def test_it_exists
    game = Game.new
    assert_instance_of Game, game
  end

  def test_it_has_readable_attributes
    game = Game.new
    assert_equal [], game.player_shots
    assert_equal [], game.computer_shots
  end

  def test_it_can_determine_winner
    game = Game.new
    game.computer_placement

    assert_equal false, game.is_computer_winner?

  end
end
