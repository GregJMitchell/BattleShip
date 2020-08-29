require './lib/board'
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
    assert_equal [], game.player_grid
    assert_equal [], game.computer_grid
  end

  def test_



end
